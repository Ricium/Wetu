using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class PublicRegistrar
    {
        public PublicRegistrar() { }

        public PublicRegistrar(int _AnimalId)
        {
            this.AnimalId = _AnimalId;
        }

        public int PublicId { get; set; }
        public int AnimalId { get; set; }
        public string RegistrationNumber { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }
        public bool Removed { get; set; }
    }
}