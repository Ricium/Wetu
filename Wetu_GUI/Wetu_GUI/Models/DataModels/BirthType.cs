using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class BirthType
    {
        public int BirthTypeId { get; set; }

        [DisplayName("Birth Type")]
        public string Description { get; set; }
    }
}