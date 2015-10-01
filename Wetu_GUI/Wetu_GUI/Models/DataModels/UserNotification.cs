using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class UserNotification
    {
        public int UserNotificationId { get; set; }
        public int UserId { get; set; }
        public int NotificationTypeId { get; set; }

        public string _Username { get; set; }
        public string _NotificationType { get; set; }

        public string API { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }

        public string _ModifiedBy { get; set; }

        public int CompanyId { get; set; }

        public string _Company { get; set; }
    }
}