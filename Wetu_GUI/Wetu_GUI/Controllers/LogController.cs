using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wetu_GUI.Models;
using Telerik.Web.Mvc;

namespace Wetu_GUI.Controllers
{
    public class LogController : Controller
    {
        private LoggingRepository logRep = new LoggingRepository();

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogProximity(string DeviceReceivedAddress, string DeviceConnectedAddress, DateTime ConncetionStart, DateTime ConnectionEnd)
        {
            ProximityLog ins = new ProximityLog();
            ins.ProximityStarted = ConncetionStart;
            ins.ProximityEnded = ConnectionEnd;            

            //...Check if DeviceReceivedAddress is in Database
            ins.DeviceConnectedTo = logRep.GetDeviceId(DeviceReceivedAddress);
            if(ins.DeviceConnectedTo != -1)
            {
                //... Check if DeviceConnectedAddress is in Database
                ins.DeviceInProximity = logRep.GetDeviceId(DeviceConnectedAddress);
                if (ins.DeviceInProximity != -1)
                {
                    //...Check if Device is Connected to Animal
                    ins.AnimalConnectedTo = logRep.GetAnimalId(ins.DeviceConnectedTo);
                    if(ins.AnimalConnectedTo != -1)
                    {
                        //...Check if Device is Connected to Animal
                        ins.AnimalInProximity = logRep.GetAnimalId(ins.DeviceInProximity);
                        if(ins.AnimalInProximity != -1)
                        {
                            //...Log Proximity
                            if(logRep.LogProximity(ins))
                                return Content(CommonStrings.Success, "text/html");
                            else
                                return Content(CommonStrings.Error_DBFail, "text/html");
                        }
                        else
                        {
                            return Content(CommonStrings.Error_DeviceConnectedNotConnectedToAnimal, "text/html");
                        }
                    }
                    else
                    {
                        return Content(CommonStrings.Error_DeviceReceivedNotConnectedToAnimal, "text/html");
                    }
                }
                else
                {
                    return Content(CommonStrings.Error_DeviceConnected, "text/html");
                }
            }
            else
            {
                return Content(CommonStrings.Error_DeviceReceived, "text/html");
            }

            
            return Content(CommonStrings.Error, "text/html");
        }

    }
}
