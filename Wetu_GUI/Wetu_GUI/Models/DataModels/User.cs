using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class User
    {
        public int UserKey { get; set; }
        public Guid UserId { get; set; }

        [DisplayName("User name")]
        [Required(ErrorMessage = "Please enter {0}")]
        [StringLength(50, ErrorMessage = "The {0} may not be longer than {1} characters.")]
        public string Username { get; set; }

        public bool Removed { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}