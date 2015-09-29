using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wetu_GUI.Models;
using Telerik.Web.Mvc;

namespace Wetu_GUI.Controllers
{
    [Authorize]
    [AutoLogOffActionFilter]
    public class HerdController : Controller
    {
        private CommonRepository commonRep = new CommonRepository();
        private AnimalRepository animalRep = new AnimalRepository();
        private AIRepository aiRep = new AIRepository();

        [GridAction]
        public JsonResult _ListAnimals()
        {
            List<Animal> list = commonRep.GetAnimals();
            return Json(new GridModel(list));
        }

        [GridAction]
        public JsonResult _ListBirthHistories(int AnimalId)
        {
            List<BirthHistory> list = commonRep.GetBirthHistories(AnimalId);
            return Json(new GridModel(list));
        }

        [GridAction]
        public JsonResult _ListInseminationHistory(int AnimalId)
        {
            List<InseminationHistory> list = commonRep.GetInseminationHistories(AnimalId);
            return Json(new GridModel(list));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertAnimal(Animal ins)
        {
            ins = animalRep.InsertAnimal(ins);

            if(ins.DeviceId != 0 && ins.AnimalId != 0)
            {
                // Insert Device Link
                commonRep.LinkAnimalToDevice(ins);
            }

            return Json(new GridModel(commonRep.GetAnimals()));
        }

        [GridAction]
        public JsonResult _UpdateAnimal(Animal ins)
        {
            Animal before = animalRep.GetAnimal(ins.AnimalId);

            ins = animalRep.UpdateAnimal(ins);

            if (ins.DeviceId != 0 && ins.AnimalId != 0)
            {
                if(before.DeviceId != ins.DeviceId)
                {
                    // Insert Device Link
                    commonRep.LinkAnimalToDevice(ins);
                }                
            }
            else if(ins.DeviceId == 0)
            {
                commonRep.RemoveAnimalLinkedDevice(ins.AnimalId);
            }

            return Json(new GridModel(commonRep.GetAnimals()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveAnimal(int id)
        {

            Animal toRemove = animalRep.GetAnimal(id);
            animalRep.RemoveAnimal(toRemove);
            commonRep.RemoveAnimalLinkedDevice(id);

            return Json(new GridModel(commonRep.GetAnimals()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertBirthHistory(BirthHistory ins, int AnimalId)
        {
            ins = aiRep.InsertBirthHistory(ins);

            if ((ins.HistoryId != 0) && (ins.ChildId != 0))
            {
                AnimalRelationship father = new AnimalRelationship();
                father.ParentAnimalId = ins.MaleParentId;
                father.ChildAnimalId = ins.ChildId;
                father = animalRep.InsertAnimalRelationship(father);

                AnimalRelationship mother = new AnimalRelationship();
                mother.ParentAnimalId = ins.FemaleParentId;
                mother.ChildAnimalId = ins.ChildId;
                mother = animalRep.InsertAnimalRelationship(mother);
            }

            return Json(new GridModel(commonRep.GetBirthHistories(AnimalId)));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveBirthHistory(int id, int AnimalId)
        {
            BirthHistory toRemove = aiRep.GetBirthHistory(id);
            aiRep.RemoveBirthHistory(toRemove);

            return Json(new GridModel(commonRep.GetBirthHistories(AnimalId)));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertInsemination(InseminationHistory ins, int AnimalId)
        {
            ins.AnimalId = AnimalId;
            ins = aiRep.InsertInseminationHistory(ins);

            return Json(new GridModel(commonRep.GetInseminationHistories(AnimalId)));
        }

        public ActionResult Index()
        {
            ViewData["Companies"] = commonRep.GetCompaniesDropDown();
            ViewData["Sexes"] = commonRep.GetSexesDropDown();
            ViewData["AnimalTypes"] = commonRep.GetAnimalTypesDropDown();
            return View();
        }

        public ActionResult Tag(int id)
        {
            AnimalView ins = animalRep.GetAnimalView(id);
            ViewData["InseminationTubes"] = commonRep.GetInseminationTubesDropDown();
            return View(ins);
        }

        public ActionResult _FatherAdd(int id)
        {
            // Load Male Animals
            ViewData["MaleParents"] = commonRep.GetMaleAnimalsDropDown(id);
            AnimalRelationship ins = new AnimalRelationship(id);
            return PartialView(ins);
        }

        public ActionResult _MotherAdd(int id)
        {
            // Load Female Animals
            ViewData["FemaleParents"] = commonRep.GetFemaleAnimalsDropDown(id);
            AnimalRelationship ins = new AnimalRelationship(id);
            return PartialView(ins);
        }

        public ActionResult _AddPublic(int id)
        {
            PublicRegistrar ins = new PublicRegistrar(id);
            return PartialView(ins);
        }

        [HttpPost]
        public ActionResult _AddParent(AnimalRelationship ins)
        {
            ins = animalRep.InsertAnimalRelationship(ins);

            return RedirectToAction("Tag", new { id = ins.ChildAnimalId });
        }

        [HttpPost]
        public ActionResult _AddPublicRegistrar(PublicRegistrar ins)
        {
            ins = animalRep.InsertPublicRegistrar(ins);

            return RedirectToAction("Tag", new { id = ins.AnimalId });
        }
    }
}
