using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class Company
    {
        public int CompanyId { get; set; }

        [DisplayName("Company Name")]
        [Required(ErrorMessage = "Please enter {0}")]
        [StringLength(50, ErrorMessage = "The {0} may not be longer than {1} characters.")]
        public string Name { get; set; }

        public Guid RoleId { get; set; }
        public bool Removed { get; set; }
    }
}