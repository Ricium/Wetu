using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Data.SqlClient;

namespace Proximity_Logging_Simulator
{
    class Program
    {
        static void Main(string[] args)
        {
            
            DatabaseConnection dbConn = new DatabaseConnection();            

            Console.WriteLine("Starting");
            Random rnd = new Random();

            int DevA = 0;
            int DevB = 1;
            string DeviceA = "";
            string DeviceB = "";
            int RandComp = 0;

            while (true)
            {
                if (Console.KeyAvailable && Console.ReadKey(true).Key == ConsoleKey.Escape) break;

                List<Company> companies = new List<Company>();
                using (var con = dbConn.SqlConn())
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("exec usp_t_GetAllCompanies", con))
                    {
                        using (var drI = cmd.ExecuteReader())
                        {
                            while (drI.Read())
                            {
                                companies.Add(new Company(Convert.ToInt32(drI["CompanyId"])));
                            }
                        }
                    }
                }

                RandComp = rnd.Next(0, companies.Count); ;

                if (companies[RandComp].Devices.Count >= 2)
                {

                    DevA = companies[RandComp].GetRandom(-1);
                    DeviceA = companies[RandComp].Devices[DevA];
                    DevB = companies[RandComp].GetRandom(DevA);
                    DeviceB = companies[RandComp].Devices[DevB];
                    DateTime start = companies[RandComp].RandomDateTime();
                    DateTime end = companies[RandComp].RandomDateTime(start);

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
                }

                Console.WriteLine("Waiting");
                Thread.Sleep(50);
            }

            Console.WriteLine("Exit");
        }
    }
}
