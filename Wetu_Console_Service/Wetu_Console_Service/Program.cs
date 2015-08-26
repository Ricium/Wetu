using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;

namespace Wetu_Console_Service
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome");
            Setup Service = new Setup();      

            //Service.SendPushBullet("Hey there buddy, welcome to the service");
            //Service.WriteLog(LogMessages.NOTIFY, EventTypes.Information, EventCategories.NOTIFICATION_EVENT);

            List<SocialGroup> SocialGroups = Service.GetSocialGroups();

            /*foreach(SocialGroup group in SocialGroups)
            {
                Console.WriteLine("Social Group for Animal: " + group.AnimalId.ToString());
                foreach(int animal in group.AnimalsInGroup)
                {
                    Console.WriteLine(animal.ToString());
                }
            }

            List<SocialGroup> SocialGroupsLast = Service.GetSocialGroupsLast();
            foreach (SocialGroup group in SocialGroupsLast)
            {
                Console.WriteLine("Last Social Group for Animal: " + group.AnimalId.ToString());
                foreach (int animal in group.AnimalsInGroup)
                {
                    Console.WriteLine(animal.ToString());
                }
            }*/

            Console.WriteLine("Animals most likely in Estrous:");
            List<int> EstrousAnimals = Service.GetEstrousAnimals();
            foreach (int animal in EstrousAnimals)
            {
                Console.WriteLine(animal.ToString());
            }

                //...Wait
                Console.ReadKey();
            Service.WriteLog(LogMessages.STOP_SERVICE, EventTypes.Information, EventCategories.SERVICE_EVENT);
        }
    }
}
