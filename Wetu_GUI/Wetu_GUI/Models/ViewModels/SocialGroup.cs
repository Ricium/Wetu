using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class SocialGroup
    {
        [DisplayName("Animal ID")]
        public int AnimalId { get; set; }

        [DisplayName("Sex")]
        public string _Sex { get; set; }

        [DisplayName("Name")]
        public string DecriptiveName { get; set; }

        [DisplayName("Tag ID")]
        public string TagNumber { get; set; }

        [DisplayName("Device Address")]
        public string _Address { get; set; }
    }
}