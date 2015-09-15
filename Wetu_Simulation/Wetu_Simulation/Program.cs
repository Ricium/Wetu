using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Simulation
{
    class Program
    {
        static void Main(string[] args)
        {
            //Console.Write("Please enter Wetu Server URL (ex. www.wetu.co.za or localhost:51664): ");
            //string URL = Console.ReadLine();
            string URL = "localhost:51664";

            Console.WriteLine("Starting Simulation on Server: " + URL);
            Console.WriteLine("Starting Simulation: " + DateTime.Now);
            Simulation simulate = new Simulation(URL);
            Console.WriteLine("Retrieved Data: " + DateTime.Now);

            simulate.AddAnimal();

            Console.ReadLine();
        }
    }
}
