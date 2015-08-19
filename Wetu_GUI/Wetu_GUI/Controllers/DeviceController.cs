using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Wetu_GUI.Controllers
{
    [Authorize]
    [AutoLogOffActionFilter]
    public class DeviceController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

    }
}
