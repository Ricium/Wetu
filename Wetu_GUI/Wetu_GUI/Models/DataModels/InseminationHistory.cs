using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class InseminationHistory
    {
        public int HistoryId { get; set; }
        public int CompanyId { get; set; }

        [DisplayName("Animal ID")]
        public int AnimalId { get; set; }

        [DisplayName("Tube")]
        public int TubeId { get; set; }

        [DisplayName("Modified Date")]
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }

        [DisplayName("Tube From")]
        public string _AnimalName { get; set; }

        [DisplayName("Modified By")]
        public string _Username { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }
    }
}