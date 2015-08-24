using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace Wetu_Console_Service
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Adding connection string");
            string conString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            int DeviceId = -1;

            

            SqlConnection sqlConn = new SqlConnection(conString);

            using (var con = sqlConn)
            {
                Console.WriteLine("Opening Connection");
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec usp_t_DeviceSelectFromAddress @Address", con))
                {

                    cmd.Parameters.AddWithValue("@Address", "40BF8A9E");

                    Console.WriteLine("Reading Database");
                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            DeviceId = Convert.ToInt32(drI["DeviceId"]);
                        }
                    }
                    Console.WriteLine("Done Reading Database");
                }
            }

            Console.WriteLine("Results Gained: " + DeviceId.ToString());


            Console.WriteLine("Closing Connection");
            sqlConn.Close();

            //...Wait
            Console.ReadKey();
        }
    }
}
