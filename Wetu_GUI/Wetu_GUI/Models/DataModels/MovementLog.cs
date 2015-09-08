using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class MovementLog
    {
        public int MovementId { get; set; }
        public int AnimalId { get; set; }
        public int DeviceId { get; set; }
        public int AxisId { get; set; }

        [DisplayName("Log Date")]
        public DateTime LogDate { get; set; }

        [DisplayName("Animal")]
        public string _AnimalName { get; set; }

        [DisplayName("Device Address")]
        public string _DeviceAddress { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }

        [DisplayName("Movement Axis")]
        public string _Axis { get; set; }
    }
}