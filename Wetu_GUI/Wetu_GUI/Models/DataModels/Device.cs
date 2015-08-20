using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class Device
    {
        [DisplayName("Device ID")]
        public int DeviceId { get; set; }

        [DisplayName("Address")]
        [Required(ErrorMessage="The {0} is Required")]
        [StringLength(16, ErrorMessage="The {0} can not be longer than {1} characters")]
        [MinLength(16,ErrorMessage="The {0} should be {1} characters long")]
        public string Address { get; set; }

        [DisplayName("Date Added")]
        public DateTime CreatedDate { get; set; }

        [DisplayName("Last Modified")]
        public DateTime ModifiedDate { get; set; }

        [DisplayName("Modified By")]
        public string _ModifiedBy { get; set; }

        [DisplayName("Company")]        
        public string _Company { get; set; }

        [DisplayName("Company")]
        [Required(ErrorMessage = "Please select the owner company")]
        [Range(1, int.MaxValue, ErrorMessage = "Please select the owner company")]
        public int CompanyId { get; set; }

        public int ModifiedBy { get; set; }
        
        public bool Removed { get; set; }
    }
}