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
            int InteractionSensitivity = 5;
            int InteractionTimeSensitivity = 2;

            Console.WriteLine("Welcome to Wetu's Database Polling Service");
            Console.WriteLine("Starting Data Polling @ " + DateTime.Now.ToString());
            

            Setup Service = new Setup(Sensitivity, SocialHistoryDays, InteractionSensitivity, InteractionTimeSensitivity);
            Service.WriteLog(LogMessages.START_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);
            
            

            
                

            //Service.SendPushBullet("Hey there buddy, welcome to the service");
            //Service.WriteLog(LogMessages.NOTIFY, EventTypes.Information, EventCategories.NOTIFICATION_EVENT);

            //Console.WriteLine("Getting Social Groups Based on Lifetime Data @ " + DateTime.Now.ToString());
           // Service.WriteLog("Getting Social Groups Based on Lifetime Data", EventTypes.Information, EventCategories.DATABASE_EVENT);
            List<SocialGroup> SocialGroups = Service.GetSocialGroups();

            //Console.WriteLine("Getting Social Groups Based on Data from Last " + SocialHistoryDays.ToString() + " Days @" + DateTime.Now.ToString());
            //Service.WriteLog("Getting Social Groups Based on Data from Last " + SocialHistoryDays.ToString() + " Days"
                               // , EventTypes.Information, EventCategories.DATABASE_EVENT);
            List<SocialGroup> SocialGroupsLast = Service.GetSocialGroupsLast();


           // Console.WriteLine("Getting Animals Showing Estrous Behaviour @" + DateTime.Now.ToString());
           // Service.WriteLog("Getting Animals Showing Estrous Behaviour", EventTypes.Information, EventCategories.DATABASE_EVENT);

            Console.WriteLine("-----------------------------------------------------");
            Console.WriteLine("Animals showing Estrous Behaviour");
            Console.WriteLine("-----------------------------------------------------");
           
            List<int> EstrousAnimals = Service.GetEstrousAnimals();
            Console.WriteLine(EstrousAnimals.Count.ToString() + " Animals of " + Service.Animals.Count.ToString() 
                              + " based on Social Groups @ " + DateTime.Now.ToString());            

            List<InteractionCount> InteractionCounts = Service.GetInteractionCounts();
            Console.WriteLine(InteractionCounts.Count.ToString() + " Animals of " + Service.Animals.Count.ToString()
                              + " based on Number of Interactions @ " + DateTime.Now.ToString());

            List<InteractionCount> InteractionTimes = Service.GetInteractionTimes();
            Console.WriteLine(InteractionTimes.Count.ToString() + " Animals of " + Service.Animals.Count.ToString()
                              + " based on Length of Interactions @ " + DateTime.Now.ToString());

            List<int> MostLikeyEstrous = Service.GetAnimalsShowingEstrousBehaviour();
            Console.WriteLine(MostLikeyEstrous.Count.ToString() + " Animals of " + Service.Animals.Count.ToString()
                              + " Shows Estrous Activity  @ " + DateTime.Now.ToString());

            Service.WriteLog(MostLikeyEstrous.Count.ToString() + " Animals of " + Service.Animals.Count.ToString()
                              + " Shows Estrous Activity", EventTypes.Information, EventCategories.DATABASE_EVENT);

            Random rand = new Random();
            int index = rand.Next(0,MostLikeyEstrous.Count);

            Service.SendPushBullet("AnimalID: " + MostLikeyEstrous[index].ToString() + " shows Estrous Behaviour", NotificationTitles.ESTROUS_MESSAGE);
            Service.WriteLog(LogMessages.NOTIFY, EventTypes.Information, EventCategories.NOTIFICATION_EVENT);

            /*foreach (int animal in EstrousAnimals)
            {
                Console.WriteLine(animal.ToString());
             * Service.WriteLog(EstrousAnimals.Count.ToString() + " Animals of " + Service.Animals.Count.ToString() 
                              + " Shows Estrous Activity (Sensitivy " + Sensitivity + ")", EventTypes.Information, EventCategories.DATABASE_EVENT);
            }*/

            Console.WriteLine("Finish Processing Data @ " + DateTime.Now.ToString());

                //...Wait
            //Thread.Sleep(10000);
            Console.ReadKey();
            Service.WriteLog(LogMessages.STOP_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);
        }
    }
}
