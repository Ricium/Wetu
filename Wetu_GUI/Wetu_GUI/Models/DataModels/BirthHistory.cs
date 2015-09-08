using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class BirthHistory
    {
        public int HistoryId { get; set; }
        public int BirthTypeId { get; set; }
        public int FemaleParentId { get; set; }
        public int MaleParentId { get; set; }
        public int ChildId { get; set; }

        [DisplayName("Tube Used")]
        public int TubeId { get; set; }

        [DisplayName("Modified Date")]
        public DateTime ModifiedDate { get; set; }

        public int ModifiedBy { get; set; }
        public int CompanyId { get; set; }

        [DisplayName("Success")]
        public bool Success { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }

        [DisplayName("Modified By")]
        public string _User { get; set; }

        [DisplayName("Father")]
        public string _MaleParent { get; set; }

        [DisplayName("Mother")]
        public string _FemaleParent { get; set; }

        [DisplayName("Child")]
        public string _Child { get; set; }

        [DisplayName("Birth Type")]
        public string _BirthType { get; set; }
    }
}