using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class FamilyTree
    {
        public int AnimalId { get; set; }
        public int MaleParentId { get; set; }
        public int FemaleParentId { get; set; }
        public int Level { get; set; }
        public FamilyTree FatherParents { get; set; }
        public FamilyTree MotherParents { get; set; }
    }
}