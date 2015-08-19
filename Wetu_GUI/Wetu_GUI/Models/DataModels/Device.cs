﻿using System;
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
        [Required(ErrorMessage="The Device Address is Required")]
        [StringLength(16, ErrorMessage="The Address can not be longer than 16 characters")]
        [MinLength(16,ErrorMessage="The Address should be 16 characters long")]
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
        public int CompanyId { get; set; }

        public int ModifiedBy { get; set; }
        
        public bool Removed { get; set; }
    }
}