using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace Proximity_Logging_Simulator
{
    class Program
    {
        static void Main(string[] args)
        {
            DataBlocks data = new DataBlocks();
            Console.WriteLine("Starting");

            int DevA = 0;
            int DevB = 1;
            string DeviceA = "";
            string DeviceB = "";
            
            while(true)
            {
                if (Console.KeyAvailable && Console.ReadKey(true).Key == ConsoleKey.Escape) break;

                DevA = data.GetRandom(-1);
                DeviceA = data.Devices[DevA];
                DevB = data.GetRandom(DevA);
                DeviceB = data.Devices[DevB];
                DateTime start = data.RandomDateTime();
                DateTime end = DateTime.Now;

                Console.WriteLine(DeviceA + " in prox. of " + DeviceB);

                using (var client = new WebClient())
                {
                    var values = new NameValueCollection();
                    values["DeviceReceivedAddress"] = DeviceA;
                    values["DeviceConnectedAddress"] = DeviceB;
                    values["ConncetionStart"] = start.ToString();
                    values["ConnectionEnd"] = end.ToString();

                    var response = client.UploadValues("http://localhost:51664/Log/LogProximity", values);

                    var responseString = Encoding.Default.GetString(response);

                    Console.WriteLine("Logged");
                }

                Console.WriteLine(DeviceB + " in prox. of " + DeviceA);

                using (var client = new WebClient())
                {
                    var values = new NameValueCollection();
                    values["DeviceReceivedAddress"] = DeviceB;
                    values["DeviceConnectedAddress"] = DeviceA;
                    values["ConncetionStart"] = start.ToString();
                    values["ConnectionEnd"] = end.ToString();

                    var response = client.UploadValues("http://localhost:51664/Log/LogProximity", values);

                    var responseString = Encoding.Default.GetString(response);

                    Console.WriteLine("Logged");
                }

                Console.WriteLine("Sleeping");
                Thread.Sleep(100);
            }

            Console.WriteLine("Exit");
        }
    }
}
