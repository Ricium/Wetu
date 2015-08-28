using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Threading;

namespace Wetu_Console_Service
{
    class Program
    {
        static void Main(string[] args)
        {
            int Sensitivity = 2;
            int SocialHistoryDays = 2;
            Setup Service = new Setup(Sensitivity,SocialHistoryDays);  

            Console.WriteLine("Welcome to Wetu's Database Polling Service");
            Service.WriteLog(LogMessages.START_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);

            Console.WriteLine("Starting Data Polling @ " + DateTime.Now.ToString());
                

            //Service.SendPushBullet("Hey there buddy, welcome to the service");
            //Service.WriteLog(LogMessages.NOTIFY, EventTypes.Information, EventCategories.NOTIFICATION_EVENT);

            Console.WriteLine("Getting Social Groups Based on Lifetime Data @ " + DateTime.Now.ToString());
            Service.WriteLog("Getting Social Groups Based on Lifetime Data", EventTypes.Information, EventCategories.DATABASE_EVENT);
            List<SocialGroup> SocialGroups = Service.GetSocialGroups();

            Console.WriteLine("Getting Social Groups Based on Data from Last " + SocialHistoryDays.ToString() + " Days @" + DateTime.Now.ToString());
            Service.WriteLog("Getting Social Groups Based on Data from Last " + SocialHistoryDays.ToString() + " Days"
                                , EventTypes.Information, EventCategories.DATABASE_EVENT);
            List<SocialGroup> SocialGroupsLast = Service.GetSocialGroupsLast();


            Console.WriteLine("Getting Animals Showing Estrous Behaviour @" + DateTime.Now.ToString());
            Service.WriteLog("Getting Animals Showing Estrous Behaviour", EventTypes.Information, EventCategories.DATABASE_EVENT);
            List<int> EstrousAnimals = Service.GetEstrousAnimals();
            Console.WriteLine(EstrousAnimals.Count.ToString() + " Animals of " + Service.Animals.Count.ToString() 
                              + " Shows Estrous Activity (Sensitivy " + Sensitivity + ") @: " + DateTime.Now.ToString());
            Service.WriteLog(EstrousAnimals.Count.ToString() + " Animals of " + Service.Animals.Count.ToString() 
                              + " Shows Estrous Activity (Sensitivy " + Sensitivity + ")", EventTypes.Information, EventCategories.DATABASE_EVENT);
            
            
            /*foreach (int animal in EstrousAnimals)
            {
                Console.WriteLine(animal.ToString());
            }*/

            Console.WriteLine("Finish Processing Data @ " + DateTime.Now.ToString());

                //...Wait
            Thread.Sleep(5000);
                //Console.ReadKey();
            Service.WriteLog(LogMessages.STOP_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);
        }
    }
}
