using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class UserNotification
    {
        public int UserNotificationId { get; set; }
        public int UserId { get; set; }

        [DisplayName("Notification Type")]
        public int NotificationTypeId { get; set; }

        [DisplayName("User")]
        public string _Username { get; set; }

        [DisplayName("Notification Type")]
        public string _NotificationType { get; set; }

        [DisplayName("Address")]
        [Required(ErrorMessage = "The {0} is Required.")]
        [StringLength(500, ErrorMessage = "The {0} may not be longer than {1} characters.")]
        public string API { get; set; }

        [DisplayName("Modified Date")]
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }

        [DisplayName("Updated By")]
        public string _ModifiedBy { get; set; }

        [DisplayName("Company")]
        public int CompanyId { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }
    }
}