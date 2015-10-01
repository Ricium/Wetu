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
    public class AIController : Controller
    {
        private CommonRepository commonRep = new CommonRepository();
        private AIRepository aiRep = new AIRepository();
        private AnimalRepository animalRep = new AnimalRepository();

        [GridAction]
        public JsonResult _ListInseminationTubes()
        {
            List<InseminationTube> list = commonRep.GetInseminationTubes();
            return Json(new GridModel(list));
        }

        [GridAction]
        public JsonResult _ListBirthHistory()
        {
            List<BirthHistory> list = commonRep.GetBirthHistories();
            return Json(new GridModel(list));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertTube(InseminationTube ins)
        {
            ins = aiRep.InsertTube(ins);
            return Json(new GridModel(commonRep.GetInseminationTubes()));
        }

        [GridAction]
        public JsonResult _UpdateTube(InseminationTube ins)
        {
            ins = aiRep.UpdateTube(ins);

            return Json(new GridModel(commonRep.GetInseminationTubes()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveTube(int id)
        {

            InseminationTube toRemove = aiRep.GetInseminationTube(id);
            aiRep.RemoveTube(toRemove);

            return Json(new GridModel(commonRep.GetInseminationTubes()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertBirthHistory(BirthHistory ins)
        {
            ins = aiRep.InsertBirthHistory(ins);

            if((ins.HistoryId != 0) && (ins.ChildId != 0))
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

            return Json(new GridModel(commonRep.GetBirthHistories()));
        }

        [GridAction]
        public JsonResult _UpdateBirthHistory(BirthHistory ins)
        {
            ins = aiRep.UpdateBirthHistory(ins);

            return Json(new GridModel(commonRep.GetBirthHistories()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveBirthHistory(int id)
        {
            BirthHistory toRemove = aiRep.GetBirthHistory(id);
            aiRep.RemoveBirthHistory(toRemove);

            return Json(new GridModel(commonRep.GetBirthHistories()));
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
