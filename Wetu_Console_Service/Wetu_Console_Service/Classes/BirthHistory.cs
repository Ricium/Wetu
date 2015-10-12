using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Console_Service
{
    class BirthHistory
    {
        public bool WasNatural { get; set; }            //...BirthType
        public int FatherId { get; set; }
        public int TubeUsed { get; set; }
        public bool Success { get; set; }
        public DateTime BirthDate { get; set; }
        public string MaleTag { get; set; }
    }
}
