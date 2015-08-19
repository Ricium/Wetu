using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class DeviceView
    {
        [DisplayName("Device ID")]
        public int DeviceId { get; set; }

        [DisplayName("Address")]
        public string Address { get; set; }

        [DisplayName("Date Added")]
        public DateTime CreatedDate { get; set; }

        [DisplayName("Last Modified")]
        public DateTime ModifiedDate { get; set; }

        [DisplayName("Modified By")]
        public string ModifiedBy { get; set; }

        [DisplayName("Company")]
        public string Company { get; set; }
    }
}