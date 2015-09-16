using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Wetu_Simulation
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Please enter Wetu Server URL (ex. www.wetu.co.za or localhost:51664): ");
            string URL = Console.ReadLine();
            //string URL = "localhost:51664";

            Console.WriteLine("Starting Simulation on Server: " + URL);
            Console.WriteLine("Started: " + DateTime.Now);
            Simulation simulate = new Simulation(URL);
            Console.WriteLine("Retrieved Data: " + DateTime.Now);

            Random rand = new Random();
            int next_move = 0;

            do
            {
                while (!Console.KeyAvailable)
                {
                    next_move = rand.Next(1, 1001);
                    if(next_move < 10)
                    {
                        simulate.AddCompany();
                    }
                    else
                    {
                        if((next_move >= 10) && (next_move < 20))
                        {
                            simulate.AddUser();
                        }
                        else
                        {
                            if ((next_move >= 20) && (next_move < 200))
                            {
                                simulate.AddAnimal();
                            }
                            else
                            {
                                if ((next_move >= 200) && (next_move < 300))
                                {
                                    simulate.AddTube();
                                }
                                else
                                {
                                    if ((next_move >= 300) && (next_move < 350))
                                    {
                                        simulate.AddToPublicRegistrar();
                                    }
                                    else
                                    {
                                        if ((next_move >= 350) && (next_move < 425))
                                        {
                                            simulate.CreateBirth();
                                        }
                                        else
                                        {
                                            if ((next_move >= 425) && (next_move < 980))
                                            {
                                                simulate.LogProximity();
                                            }
                                            else
                                            {
                                                simulate.LogMovement();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Thread.Sleep(100);
                }
                Console.WriteLine("Simulation ready to end, press esc again");
            } while (Console.ReadKey(true).Key != ConsoleKey.Escape);
            
  
        }
    }
}
