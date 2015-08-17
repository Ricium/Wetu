using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wetu_GUI.Models;

namespace Wetu_GUI.Controllers
{
    
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC!";

            return View();
        }

        [Authorize(Roles="p_admin")]
        [AutoLogOffActionFilter]
        public ActionResult About()
        {
            return View();
        }
    }
}
