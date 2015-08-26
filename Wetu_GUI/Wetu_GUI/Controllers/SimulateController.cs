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
    }
}
