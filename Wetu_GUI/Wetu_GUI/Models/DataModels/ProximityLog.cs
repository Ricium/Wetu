using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

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

        [DisplayName("Log Date")]
        public DateTime LogDate { get; set; }

        [DisplayName("Connceted To")]
        public string _AnimalConnectedTo { get; set; }

        [DisplayName("In Proximity")]
        public string _AnimalInProximity { get; set; }

        [DisplayName("Connceted Address")]
        public string _DeviceConnectedTo { get; set; }

        [DisplayName("In Proximity Address")]
        public string _DeviceInProximity { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }

        [DisplayName("Time Connected (s)")]
        public double SecondsConnected { get; set; }
    }
}