using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class AnimalRelationship
    {
        public AnimalRelationship()
        {

        }

        public AnimalRelationship(int _ChildAnimalId)
        {
            this.ChildAnimalId = _ChildAnimalId;
        }

        public int RelationshipId { get; set; }
        public int ChildAnimalId { get; set; }
        public int ParentAnimalId { get; set; }
    }
}