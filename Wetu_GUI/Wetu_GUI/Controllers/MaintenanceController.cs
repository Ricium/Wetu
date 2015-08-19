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
    public class MaintenanceController : Controller
    {
        private CommonRepository commonRep = new CommonRepository();
        private AnimalTypeRepository animaltypeRep = new AnimalTypeRepository();
        private BirthTypeRepository birthtypeRep = new BirthTypeRepository();

        #region Animal Types
        [GridAction]
        public ActionResult _ListAnimalTypes()
        {
            List<AnimalType> list = commonRep.GetAnimalTypes();
            return View(new GridModel(list));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertAnimalType(AnimalType ins)
        {
            ins = animaltypeRep.InsertAnimalType(ins);
            return Json(new GridModel(commonRep.GetAnimalTypes()));
        }

        [GridAction]
        public JsonResult _UpdateAnimalType(AnimalType ins)
        {
            ins = animaltypeRep.UpdateAnimalType(ins);
            return Json(new GridModel(commonRep.GetAnimalTypes()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveAnimalType(int id)
        {
            animaltypeRep.DeleteAnimalType(id);
            return Json(new GridModel(commonRep.GetAnimalTypes()));
        }

        public ActionResult _AnimalTypes()
        {
            return PartialView();
        }
        #endregion

        #region Birth Types
        [GridAction]
        public ActionResult _ListBirthTypes()
        {
            List<BirthType> list = commonRep.GetBirthTypes();
            return View(new GridModel(list));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertBirthType(BirthType ins)
        {
            ins = birthtypeRep.InsertBirthType(ins);
            return Json(new GridModel(commonRep.GetBirthTypes()));
        }

        [GridAction]
        public JsonResult _UpdateBirthType(BirthType ins)
        {
            ins = birthtypeRep.UpdateBirthType(ins);
            return Json(new GridModel(commonRep.GetBirthTypes()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveBirthType(int id)
        {
            birthtypeRep.DeleteBirthType(id);
            return Json(new GridModel(commonRep.GetBirthTypes()));
        }

        public ActionResult _BirthTypes()
        {
            return PartialView();
        }
        #endregion

        public ActionResult Index()
        {
            return View();
        }

        
    }
}
