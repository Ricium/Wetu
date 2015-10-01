using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class NotificationMessage
    {
        public string Message { get; set; }
        public string UserNotified { get; set; }
        public string NotificationType { get; set; }
        public string NotificationAPI { get; set; }
        public string Company { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}