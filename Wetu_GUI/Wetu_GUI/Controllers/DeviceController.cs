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
    public class DeviceController : Controller
    {
        private CommonRepository commonRep = new CommonRepository();
        private DeviceRepository deviceRep = new DeviceRepository();

        [GridAction]
        public ActionResult _ListDevices()
        {
            List<Device> list = commonRep.GetDevices();
            return View(new GridModel(list));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertDevice(Device ins)
        {
            ins = deviceRep.InsertDevice(ins);
            return Json(new GridModel(commonRep.GetDevices()));
        }

        [GridAction]
        public JsonResult _UpdateDevice(Device ins)
        {
            ins = deviceRep.UpdateDevice(ins);
            return Json(new GridModel(commonRep.GetDevices()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveDevice(int id)
        {
            Device toRemove = deviceRep.GetDevice(id);
            deviceRep.RemoveDevice(toRemove);

            return Json(new GridModel(commonRep.GetDevices()));
        }

        public ActionResult Index()
        {
            ViewData["Companies"] = commonRep.GetCompaniesDropDown();
            return View();
        }

    }
}
