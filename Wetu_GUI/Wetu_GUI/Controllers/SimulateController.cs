using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Wetu_GUI.Models;

namespace Wetu_GUI.Controllers
{
    public class SimulateController : Controller
    {
        private SecurityRepository secRep = new SecurityRepository();
        private AccountRepository accRep = new AccountRepository();
        private CommonRepository comRep = new CommonRepository();
        private DeviceRepository devRep = new DeviceRepository();
        private AnimalRepository aniRep = new AnimalRepository();
        private SimulateRepository simRep = new SimulateRepository();
        private AIRepository aiRep = new AIRepository();
        private LoggingRepository logRep = new LoggingRepository();

        #region Old Sim
        [HttpPost]
        public ActionResult AddCompany(string CompanyName)
        {
            // Attempt to register the comapny
            string rolename = "u_" + CompanyName;
            Roles.CreateRole(rolename);

            // Add Company to Database
            Company comp = new Company();
            comp.Name = CompanyName;
            comp.RoleId = secRep.GetRoleId(rolename);
            comp.Removed = false;
            comp = secRep.AddCompany(comp);

            if(comp.CompanyId == 0)
            {
                return Content("Fail Company", "text/html");
            }
            else
            {
                return Content("Success Company", "text/html");
            }
        }

        [HttpPost]
        public ActionResult AddUser(string Username, string Password, string CompanyName)
        {
            // Attempt to register the user
            MembershipCreateStatus createStatus;
            Membership.CreateUser(Username, Password, "rm.awsum.extra@gmail.com", null, null, true, null, out createStatus);

            if (createStatus == MembershipCreateStatus.Success)
            {
                string[] companies = { "u_" + CompanyName };
                string[] permissions = { "p_admin" };
                Roles.AddUserToRoles(Username, companies);
                Roles.AddUserToRoles(Username, permissions);

                User newUser = new User();
                newUser.Username = Username;
                newUser.UserId = secRep.GetUserId(Username);
                newUser = secRep.AddUser(newUser);

                if (newUser.UserKey == 0)
                {
                    return Content("Fail User", "text/html");
                }
                else
                {
                    return Content("Success User", "text/html");
                }
            }
            else
            {
                return Content("Fail User", "text/html");
            }
        }      

        [HttpPost]
        public JsonResult GetKeys()
        {
            List<string> Userkeys = comRep.GetAllUserKeys();

           return Json(Userkeys, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetCompany(int Userkey)
        {
            string Username = secRep.GetUsername(Userkey);
            List<string> companies = accRep.GetUserRoles(Username, "u_");
            List<int> companyno = new List<int>();
            foreach(string company in companies)
            {
                companyno.Add(secRep.GetCompanyId(company.Substring(2)));
            }

            return Json(companyno, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult InsertDevice(string Address, int CompanyId, int UserKey)
        {
            Device dev = new Device();
            dev.Address = Address;
            dev.CompanyId = CompanyId;
            dev.ModifiedBy = UserKey;
            dev = devRep.InsertDeviceSim(dev);

            return Content(dev.DeviceId.ToString(), "text/html");         
        }

        [HttpPost]
        public ActionResult InsertAnimal(string Name, string Tag, int DeviceId, int CompanyId, int UserKey)
        {
            Animal ani = new Animal();
            ani.DecriptiveName = Name;
            ani.TagNumber = Tag;
            ani.ModifiedBy = UserKey;
            ani.CompanyId = CompanyId;
            ani.DeviceId = DeviceId;

            ani = aniRep.InsertAnimalSim(ani);

            if (ani.DeviceId != 0 && ani.AnimalId != 0)
            {
                comRep.LinkAnimalToDeviceSim(ani);
                return Content(ani.AnimalId.ToString(), "text/html");
            }
            else
            {
                return Content("Fail Animal", "text/html");
            }            
        }
        #endregion

        #region System Simulation
        [HttpPost]
        public JsonResult GetCompanies(string Auth)
        {
            List<int> companies = accRep.GetCompanyIds();
            return Json(companies, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetUsersForCompany(int CompanyId)
        {
            List<int> users = accRep.GetUsers(CompanyId);
            return Json(users, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetMaleAnimals(int CompanyId)
        {
            List<AnimalSim> animals = simRep.GetAnimals(CompanyId, 1);
            return Json(animals, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetFemaleAnimals(int CompanyId)
        {
            List<AnimalSim> animals = simRep.GetAnimals(CompanyId, 2);
            return Json(animals, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetInseminationTubes(int CompanyId)
        {
            List<TubeSim> tubes = simRep.GetTubes(CompanyId);
            return Json(tubes, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetPublicRegistrar(string Auth)
        {
            List<int> publicreg = simRep.GetPublicRegistrar();
            return Json(publicreg, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSpecies(string Auth)
        {
            List<SpeciesSim> species = simRep.GetSpeciesList();
            return Json(species, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddCompanySim(string CompanyName)
        {
            // Attempt to register the comapny
            string rolename = "u_" + CompanyName;
            Roles.CreateRole(rolename);

            // Add Company to Database
            Company comp = new Company();
            comp.Name = CompanyName;
            comp.RoleId = secRep.GetRoleId(rolename);
            comp.Removed = false;
            comp = secRep.AddCompany(comp);

            return Json(comp.CompanyId, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddUserToCompany(string Username, string Password, int CompanyId)
        {
            // Attempt to register the user
            MembershipCreateStatus createStatus;
            Membership.CreateUser(Username, Password, "rm.awsum.extra@gmail.com", null, null, true, null, out createStatus);

            string CompanyName = secRep.GetCompanyName(CompanyId);

            if (createStatus == MembershipCreateStatus.Success)
            {
                string[] companies = { CompanyName };
                string[] permissions = { "p_admin" };
                Roles.AddUserToRoles(Username, companies);
                Roles.AddUserToRoles(Username, permissions);

                User newUser = new User();
                newUser.Username = Username;
                newUser.UserId = secRep.GetUserId(Username);
                newUser = secRep.AddUser(newUser);

                return Json(newUser.UserKey, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult AddAnimal(string Name, string Tag, int DeviceId, int SexId, int Species, int CompanyId, int UserKey, DateTime ModifiedDate)
        {
            Animal ani = new Animal();
            ani.DecriptiveName = Name;
            ani.TagNumber = Tag;
            ani.ModifiedBy = UserKey;
            ani.CompanyId = CompanyId;
            ani.DeviceId = DeviceId;
            ani.SexId = SexId;
            ani.AnimalTypeId = Species;
            ani.ModifiedDate = ModifiedDate;

            ani = aniRep.InsertAnimalSim(ani);

            if (ani.DeviceId != 0 && ani.AnimalId != 0)
            {
                comRep.LinkAnimalToDeviceSim(ani);
                return Json(ani.AnimalId, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult AddDevice(string Address, int CompanyId, int UserKey, DateTime ModifiedDate)
        {
            Device dev = new Device();
            dev.Address = Address;
            dev.CompanyId = CompanyId;
            dev.ModifiedBy = UserKey;
            dev.ModifiedDate = ModifiedDate;
            dev = devRep.InsertDeviceSim(dev);

            return Json(dev.DeviceId, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddInseminationTube(int AnimalId, int CompanyId, int UserKey, DateTime ModifiedDate)
        {
            InseminationTube tube = new InseminationTube();
            tube.AnimalFromId = AnimalId;
            tube.CompanyId = CompanyId;
            tube.ModifiedBy = UserKey;
            tube.ModifiedDate = ModifiedDate;

            tube = aiRep.InsertTubeSim(tube);

            return Json(tube.TubeId, JsonRequestBehavior.AllowGet);
        }
        
        [HttpPost]
        public JsonResult AddToPublicRegistrar(int AnimalId, string RegNo, int UserKey, DateTime ModifiedDate)
        {
            PublicRegistrar pub = new PublicRegistrar();
            pub.AnimalId = AnimalId;
            pub.RegistrationNumber = RegNo;
            pub.ModifiedBy = UserKey;
            pub.ModifiedDate = ModifiedDate;

            pub = aniRep.InsertPublicRegistrarSim(pub);

            return Json(pub.PublicId, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddBirthScenario(int FemaleId, int MaleId, int ChildId, int TubeId, int BirthTypeId, int Success, int CompanyId, int UserKey, DateTime ModifiedDate)
        {
            //...Check if Tube was used
            if(TubeId != 0)
            {
                //...Tube was used, save history record
                InseminationHistory insem = new InseminationHistory();
                insem.AnimalId = FemaleId;
                insem.TubeId = TubeId;
                insem.CompanyId = CompanyId;
                insem.ModifiedBy = UserKey;
                insem.ModifiedDate = ModifiedDate.AddDays(-274);

                insem = aiRep.InsertInseminationHistorySim(insem);

                if(insem.HistoryId == 0)
                {
                    return Json(insem.HistoryId, JsonRequestBehavior.AllowGet);
                }
            }

            //...Insert Birth History
            BirthHistory birth = new BirthHistory();
            birth.BirthTypeId = BirthTypeId;
            birth.ChildId = ChildId;
            birth.CompanyId = CompanyId;
            birth.FemaleParentId = FemaleId;
            birth.MaleParentId = MaleId;
            birth.ModifiedBy = UserKey;
            birth.Success = (Success == 1) ? true : false;
            birth.TubeId = TubeId;
            birth.ModifiedDate = ModifiedDate;

            birth = aiRep.InsertBirthHistorySim(birth);

            if ((birth.HistoryId != 0) && (birth.ChildId != 0))
            {
                AnimalRelationship father = new AnimalRelationship();
                father.ParentAnimalId = birth.MaleParentId;
                father.ChildAnimalId = birth.ChildId;
                father.ModiefiedDate = ModifiedDate;
                father.ModifiedBy = UserKey;
                father = aniRep.InsertAnimalRelationshipSim(father);

                AnimalRelationship mother = new AnimalRelationship();
                mother.ParentAnimalId = birth.FemaleParentId;
                mother.ChildAnimalId = birth.ChildId;
                mother.ModiefiedDate = ModifiedDate;
                mother.ModifiedBy = UserKey;
                mother = aniRep.InsertAnimalRelationshipSim(mother);
            }

            return Json(birth.HistoryId, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult LogProximity(string DeviceReceivedAddress, string DeviceConnectedAddress, DateTime ConncetionStart, DateTime ConnectionEnd)
        {
            ProximityLog ins = new ProximityLog();
            ins.ProximityStarted = ConncetionStart;
            ins.ProximityEnded = ConnectionEnd;

            //...Check if DeviceReceivedAddress is in Database
            ins.DeviceConnectedTo = logRep.GetDeviceId(DeviceReceivedAddress);
            if (ins.DeviceConnectedTo != -1)
            {
                //... Check if DeviceConnectedAddress is in Database
                ins.DeviceInProximity = logRep.GetDeviceId(DeviceConnectedAddress);
                if (ins.DeviceInProximity != -1)
                {
                    //...Check if Device is Connected to Animal
                    ins.AnimalConnectedTo = logRep.GetAnimalId(ins.DeviceConnectedTo);
                    if (ins.AnimalConnectedTo != -1)
                    {
                        //...Check if Device is Connected to Animal
                        ins.AnimalInProximity = logRep.GetAnimalId(ins.DeviceInProximity);
                        if (ins.AnimalInProximity != -1)
                        {
                            //...Log Proximity
                            if (logRep.LogProximity(ins))
                                return Json(CommonStrings.Success, JsonRequestBehavior.AllowGet);
                            else
                                return Json(CommonStrings.Error_DBFail, JsonRequestBehavior.AllowGet);
                        }
                        else
                        {
                            return Json(CommonStrings.Error_DeviceConnectedNotConnectedToAnimal, JsonRequestBehavior.AllowGet);
                        }
                    }
                    else
                    {
                        return Json(CommonStrings.Error_DeviceReceivedNotConnectedToAnimal, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json(CommonStrings.Error_DeviceConnected, JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                return Json(CommonStrings.Error_DeviceReceived, JsonRequestBehavior.AllowGet);
            }

            return Json(CommonStrings.Error, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult LogMovement(string DeviceAddress, int Axis, DateTime ModifiedDate)
        {
            MovementLog ins = new MovementLog();
            ins.AxisId = Axis;
            ins.LogDate = ModifiedDate;

            //...Check if DeviceAddress is in Database
            ins.DeviceId = logRep.GetDeviceId(DeviceAddress);
            if (ins.DeviceId != -1)
            {
                //...Check if Device is Connected to Animal
                ins.AnimalId = logRep.GetAnimalId(ins.DeviceId);
                if (ins.AnimalId != -1)
                {
                    //...Log Proximity
                    if (logRep.LogMovement(ins))
                        return Json(CommonStrings.Success, JsonRequestBehavior.AllowGet);
                    else
                        return Json(CommonStrings.Error_DBFail, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(CommonStrings.Error_AnimalNotConnectedToDevice, JsonRequestBehavior.AllowGet);
                }

            }
            else
            {
                return Json(CommonStrings.Error_Invaild_DeviceAddress, JsonRequestBehavior.AllowGet);
            }

            return Json(CommonStrings.Error, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}
