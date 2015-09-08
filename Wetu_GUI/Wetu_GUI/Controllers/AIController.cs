using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wetu_GUI.Models;
using Telerik.Web.Mvc;

namespace Wetu_GUI.Controllers
{
    public class AIController : Controller
    {
        private CommonRepository commonRep = new CommonRepository();

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

        public ActionResult Index()
        {
            return View();
        }

    }
}
