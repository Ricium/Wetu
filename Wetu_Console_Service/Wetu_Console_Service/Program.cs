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
            //...Set Data Senisitivity
            int Sensitivity = 2;
            int SocialHistoryDays = 2;
            int InteractionSensitivity = 5;
            int InteractionTimeSensitivity = 2;

            Console.WriteLine("-----------------------------------------------------");
            Console.WriteLine("Project Wetu: Estrous Behaviour Processor");
            Console.WriteLine("-----------------------------------------------------");

            DateTime Start = DateTime.Now;

            Console.WriteLine("Starting Data Polling @ " + Start.ToString());

            Setup Service = new Setup(Sensitivity, SocialHistoryDays, InteractionSensitivity, InteractionTimeSensitivity);
            Service.WriteLog(LogMessages.START_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);
           
            List<SocialGroup> SocialGroups = Service.GetSocialGroups();
            List<SocialGroup> SocialGroupsLast = Service.GetSocialGroupsLast();

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

            Console.WriteLine("-----------------------------------------------------");
            Console.WriteLine("Notifying Users");
            Console.WriteLine("-----------------------------------------------------");

            if(MostLikeyEstrous.Count > 0)
            {
                ManagementService manage;
                foreach(int animal in MostLikeyEstrous)
                {
                    manage = new ManagementService(animal);
                    string Message = manage.ManageAnimal();
                    Console.WriteLine(Message);

                    //...Notify
                    Service.SendNotifications(animal, Message, NotificationTitles.ESTROUS_MESSAGE);
                }

                Service.WriteLog(LogMessages.NOTIFY, EventTypes.Information, EventCategories.NOTIFICATION_EVENT);
            }
            else
            {
                Console.WriteLine("No Animals show Estrous Behaviour");
            }

            DateTime End = DateTime.Now;
            double Dif = (End - Start).TotalSeconds;

            Console.WriteLine("-----------------------------------------------------");
            Console.WriteLine("Finish Processing Data @ " + End.ToString());
            Console.WriteLine("Total Processing Time: " + Dif.ToString() + " Seconds");
            Console.WriteLine("-----------------------------------------------------");

            

            Console.ReadKey();
            Service.WriteLog(LogMessages.STOP_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);
        }
    }
}
