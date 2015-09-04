using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Wetu_GUI.Models
{
    public class AnimalView 
    {
        [DisplayName("Animal ID")]
        public int AnimalId { get; set; }

        [DisplayName("Species")]
        public string _AnimalType { get; set; }

        [DisplayName("Sex")]
        public string _Sex { get; set; }

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

        [DisplayName("Date Added")]
        [DataType(DataType.Date)]
        [DisplayFormatAttribute(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime CreatedDate { get; set; }

        [DisplayName("Last Modified")]
        [DataType(DataType.Date)]
        [DisplayFormatAttribute(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime ModifiedDate { get; set; }

        [DisplayName("Modified By")]
        public string _ModifiedBy { get; set; }

        [DisplayName("Company")]
        public string _Company { get; set; }

        [DisplayName("Device Address")]
        public string _Address { get; set; }

        public ParentView MaleParent { get; set; }
        public ParentView FemaleParent { get; set; }

        public FamilyTree Family { get; set; }

        public List<SocialGroup> LifetimeSocialGroup { get; set; }
        public List<SocialGroup> RecentSocialGroup { get; set; }

        [DisplayName("Average Interactions per Hour")]
        public double AverageNumberInteractions { get; set; }

        [DisplayName("Average Length Interactions per Hour")]
        public double AverageLengthInteractions { get; set; }

        [DisplayName("Number of Interaction in last 3 Hours")]
        public int RecentNumberInteractions { get; set; }

        [DisplayName("Length of Interaction in last 3 Hours")]
        public double RecentLengthInteractions { get; set; }

        [DisplayName("Currently showing estrous behaviour")]
        public bool ShowingEstrousBehaviour { get; set; }

        [DisplayName("Changes in Social Group")]
        public bool ChangeSocial { get; set; }

        [DisplayName("Changes in Number of Interactions")]
        public bool ChangeInteractions { get; set; }

        [DisplayName("Changes in Length of Interactions")]
        public bool ChangeLengthInteractions { get; set; }
    }

}