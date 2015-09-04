using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class ParentView
    {
        [DisplayName("Animal ID")]
        public int AnimalId { get; set; }

        [DisplayName("Species")]
        public string _AnimalType { get; set; }

        [DisplayName("Sex")]
        public string _Sex { get; set; }
        public int SexId { get; set; }

        [DisplayName("Name")]
        public string DecriptiveName { get; set; }

        [DisplayName("Tag ID")]
        public string TagNumber { get; set; }

        [DisplayName("Birthdate")]
        [DataType(DataType.Date)]
        [DisplayFormatAttribute(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime BirthDate { get; set; }

        [DisplayName("Age")]
        public int Age { get; set; }
    }
}