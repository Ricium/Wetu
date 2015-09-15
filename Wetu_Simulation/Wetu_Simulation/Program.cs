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
            Console.Write("Please enter Wetu Server URL (ex. www.wetu.co.za or localhost:51664): ");
            string URL = Console.ReadLine();

            Simulation simulate = new Simulation(URL);

            int [] PublicRegistrar = {};
            List<Company> WetuSystem = new List<Company>();

            //...Get Current Companies
            int[] Companies = simulate.GetCompanies();

            //...Set Each Companies Data
            Company ins;
            for(int i=0; i<Companies.Length; i++)
            {
                ins = new Company(i);
                WetuSystem.Add(ins);
            }
        }
    }
}
