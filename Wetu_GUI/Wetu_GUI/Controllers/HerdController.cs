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

        [GridAction]
        public JsonResult _ListAnimals()
        {
            List<Animal> list = commonRep.GetAnimals();
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
            return PartialView();
        }

        [HttpPost]
        public ActionResult _AddParent(AnimalRelationship ins)
        {
            ins = animalRep.InsertAnimalRelationship(ins);

            return RedirectToAction("Tag", new { id = ins.ChildAnimalId });
        }

    }
}
