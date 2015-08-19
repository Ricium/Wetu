using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class User
    {
        public int UserKey { get; set; }
        public Guid UserId { get; set; }
        public string Username { get; set; }
        public bool Removed { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}