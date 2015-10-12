using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Console_Service
{
    public class InteractionLog
    {
        public InteractionLog()
        {
            this.Interactions = new List<Interaction>();
        }

        public InteractionLog(int _AnimalId)
        {
            this.AnimalId = _AnimalId;
            this.Interactions = new List<Interaction>();
        }

        public int AnimalId { get; set; }
        public List<Interaction> Interactions { get; set; }
    }
}
