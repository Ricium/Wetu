using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class InseminationTube
    {
        [DisplayName("Tube")]
        public int TubeId { get; set; }
        public int AnimalFromId { get; set; }

        [DisplayName("Used")]
        public bool Used { get; set; }

        [DisplayName("Successful Birth")]
        public bool Success { get; set; }

        public int CompanyId { get; set; }

        [DisplayName("Modified Date")]
        public DateTime ModifiedDate { get; set; }

        [DisplayName("Date Added")]
        public DateTime CreatedDate { get; set; }
        public int ModifiedBy { get; set; }

        public int AnimalUsedId { get; set; }

        [DisplayName("From")]
        public string _FromAnimal { get; set; }

        [DisplayName("Inseminated")]
        public string _UsedOnAnimal { get; set; }

        [DisplayName("Modified By")]
        public string _User { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }
    }
}