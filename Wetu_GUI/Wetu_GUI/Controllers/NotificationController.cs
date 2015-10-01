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
    public class NotificationController : Controller
    {
        private NotificationRepository notifyRep = new NotificationRepository();
        private CommonRepository commonRep = new CommonRepository();

        [GridAction]
        public JsonResult _ListUserNotifications()
        {
            List<UserNotification> list = commonRep.GetUserNotifications();
            return Json(new GridModel(list));
        }

        [GridAction]
        public JsonResult _ListNotifications()
        {
            List<NotificationMessage> list = commonRep.GetNotifications();
            return Json(new GridModel(list));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _InsertUserNotification(UserNotification ins)
        {
            ins = notifyRep.InsertUserNotification(ins);

            return Json(new GridModel(commonRep.GetUserNotifications()));
        }

        [GridAction]
        public JsonResult _UpdateUserNotification(UserNotification ins)
        {
            ins = notifyRep.UpdateUserNotification(ins);
            return Json(new GridModel(commonRep.GetUserNotifications()));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public JsonResult _RemoveUserNotification(int id)
        {

            UserNotification toRemove = notifyRep.GetUserNotification(id);
            notifyRep.RemoveUserNotification(toRemove);

            return Json(new GridModel(commonRep.GetUserNotifications()));
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
