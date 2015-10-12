using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Console_Service
{
    public class Interaction
    {
        public Interaction()
        {
        }

        public Interaction(int _AnimalId, int _NumberOfInteractions, int _TotalSecondsConnected)
        {
            this.AnimalId = _AnimalId;
            this.NumberOfInteractions = _NumberOfInteractions;
            this.TotalSecondsConnected = _TotalSecondsConnected;
            this.AverageConnectionTime = (double)this.TotalSecondsConnected / (double)this.NumberOfInteractions;
        }

        public int AnimalId { get; set; }
        public int NumberOfInteractions { get; set; }
        public int TotalSecondsConnected { get; set; }
        public double AverageConnectionTime { get; set; }
    }
}
