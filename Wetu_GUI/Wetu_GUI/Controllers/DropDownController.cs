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

        public JsonResult _GetAnimalList()
        {
            return Json(commonRep.GetAnimalsDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetFemaleAnimalsList()
        {
            return Json(commonRep.GetFemaleAnimalsDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetMaleAnimalsList()
        {
            return Json(commonRep.GetMaleAnimalsDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetMaleAnimalsListFromTube(int TubeId)
        {
            if(TubeId == 0)
            {
                return Json(commonRep.GetMaleAnimalsDropDown(), JsonRequestBehavior.AllowGet);
            }
            else
            {
                AIRepository aiRep = new AIRepository();
                // List containing only 1 animal from tubeid
                return Json(aiRep.GetAnimlDropDownFromTube((int)TubeId), JsonRequestBehavior.AllowGet);  
            }
            
        }

        public JsonResult _GetInseminationTubes(int BirthTypeId)
        {
            if(BirthTypeId == 1)
            {
                return Json(commonRep.GetInseminationTubesDropDownSingle(), JsonRequestBehavior.AllowGet);
            }
            else
                if(BirthTypeId == 2)
                {
                    return Json(commonRep.GetInseminationTubesDropDown(), JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(commonRep.GetInseminationTubesDropDownWithNone(), JsonRequestBehavior.AllowGet);
                }            
        }

        public JsonResult _GetInseminationTubesAll()
        {
            return Json(commonRep.GetInseminationTubesDropDown(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult _GetNotificationTypes()
        {
            return Json(commonRep.GetNotificationTypeDropDown(), JsonRequestBehavior.AllowGet);
        }
    }
}
