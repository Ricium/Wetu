using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wetu_GUI.Models;
using Telerik.Web.Mvc;

namespace Wetu_GUI.Controllers
{
    public class DropDownController : Controller
    {
        private CommonRepository commonRep = new CommonRepository();

        public JsonResult _GetDeviceList()
        {
            return Json(commonRep.GetDevicesDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetCompanyList()
        {
            return Json(commonRep.GetCompaniesDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetAnimalTypeList()
        {
            return Json(commonRep.GetAnimalTypesDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetSexList()
        {
            return Json(commonRep.GetSexesDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetBirthTypeList()
        {
            return Json(commonRep.GetBirthTypesDropDown(), JsonRequestBehavior.AllowGet);
        }

    }
}
