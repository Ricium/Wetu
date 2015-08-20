using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class ProximityLog
    {  
        public int ProximityId { get; set; }
        public int DeviceConnectedTo { get; set; }
        public int DeviceInProximity { get; set; }
        public int AnimalConnectedTo { get; set; }
        public int AnimalInProximity { get; set; }
        public DateTime ProximityStarted { get; set; }
        public DateTime ProximityEnded { get; set; }
        public DateTime LogDate { get; set; }
    }
}