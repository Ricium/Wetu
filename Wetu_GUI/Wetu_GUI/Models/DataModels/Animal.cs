using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class Animal
    {
        [DisplayName("Animal ID")]
        public int AnimalId { get; set; }

        [DisplayName("Species")]
        [Required(ErrorMessage = "Please select {0}")]
        [Range(1, int.MaxValue, ErrorMessage = "Please select {0}")]
        public int AnimalTypeId { get; set; }

        [DisplayName("Sex")]
        [Required(ErrorMessage = "Please select {0}")]
        [Range(1, int.MaxValue, ErrorMessage = "Please select {0}")]
        public int SexId { get; set; }

        [DisplayName("Species")]
        public string _AnimalType { get; set; }

        [DisplayName("Sex")]
        public string _Sex { get; set; }

        [DisplayName("Name")]
        [StringLength(50, ErrorMessage = "The {0} may not be longer than {1} characters.")]
        public string DecriptiveName { get; set; }

        [DisplayName("Tag ID")]
        [StringLength(5, ErrorMessage = "The {0} may not be longer than {1} characters.")]
        public string TagNumber { get; set; }

        [DisplayName("Birthdate")]
        [Required(ErrorMessage="{0} is required")]
        public DateTime BirthDate { get; set; }

        [DisplayName("Date Added")]
        public DateTime CreatedDate { get; set; }

        [DisplayName("Last Modified")]
        public DateTime ModifiedDate { get; set; }

        public int ModifiedBy { get; set; }
        
        [DisplayName("Modified By")]
        public string _ModifiedBy { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }

        [DisplayName("Company")]
        [Required(ErrorMessage = "Please select the owner company")]
        [Range(1, int.MaxValue, ErrorMessage = "Please select the owner company")]
        public int CompanyId { get; set; }

        public bool Removed { get; set; }

        [DisplayName("Device Address")]
        public int DeviceId { get; set; }

        [DisplayName("Device Address")]
        public string _Address { get; set; }
    }
}