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
    public class UserController : Controller
    {
        public ActionResult Users()
        {
            return View();
        }
    }
}
