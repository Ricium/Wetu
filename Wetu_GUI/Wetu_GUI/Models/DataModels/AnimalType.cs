using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class AnimalType
    {
        public int AnimalTypeId { get; set; }

        [DisplayName("Species")]
        public string Description { get; set; }
    }
}