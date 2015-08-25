using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proximity_Logging_Simulator
{
    public class DataBlocks
    {
        public DataBlocks()
        {
            this.Devices = new List<string>();
            this.Devices.Add("40BF8A9E");
            this.Devices.Add("40BF8B3D");
            this.Devices.Add("40BDBA4F");
            this.Devices.Add("40C053F6");
            this.Devices.Add("40BF8A90");
            this.Devices.Add("40BF8A91");
            this.Devices.Add("40BF8A92");
            this.Devices.Add("40BF8A93");
            this.Devices.Add("40BF8A94");
            this.Devices.Add("40BF8A95");
            this.Devices.Add("40BF8A96");
            this.Devices.Add("40BF8A97");
            this.Devices.Add("40BF8A98");
            this.Devices.Add("40BF8A99");
            this.Devices.Add("40BF8A9A");
            this.Devices.Add("40BF8A9B");
            this.Devices.Add("40BF8A9C");
            this.Devices.Add("40BF8A9D");
            this.Devices.Add("40BF8A9F");
            this.Devices.Add("40BF8AA0");
        }

        public int GetRandom(int NotEquals)
        {
            Random rnd = new Random();
            int val = rnd.Next(0, this.Devices.Count); 

            while(val == NotEquals)
            {
                val = rnd.Next(0, this.Devices.Count);
            }

            return val;
        }

        public DateTime RandomDateTime()
        {
            Random rnd = new Random();
            int interval = rnd.Next(0, 3);
            int amount = rnd.Next(1, 100);

            switch (interval)
            {
                case 0: return DateTime.Now.AddSeconds(-1 * amount);
                case 1: return DateTime.Now.AddMinutes(-1 * amount);
                case 2: return DateTime.Now.AddHours(-1 * amount);
                default: return DateTime.Now;
            }
        }

        public List<string> Devices { get; set; }
    }
}
