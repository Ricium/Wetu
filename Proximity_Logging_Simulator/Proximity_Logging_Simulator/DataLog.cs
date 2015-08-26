using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proximity_Logging_Simulator
{
    public class Company
    {
        public Company(int _CompanyId)
        {
            this.CompanyId = _CompanyId;
            GetDevices();
        }

        public int GetRandom(int NotEquals)
        {
            Random rnd = new Random();
            int val = rnd.Next(0, this.Devices.Count); 

            while(val == NotEquals)
            {
                val = rnd.Next(0, this.Devices.Count);
            }

            return val;
        }

        public DateTime RandomDateTime()
        {
            Random rnd = new Random();
            int interval = rnd.Next(0, 8);
            int amount = rnd.Next(1, 100);
            int days = rnd.Next(0, 31);

            switch (interval)
            {
                case 0: return DateTime.Now.AddSeconds(-1 * amount).AddDays(-1 *days);
                case 1: return DateTime.Now.AddMinutes(-1 * amount).AddDays(-1* days);
                case 2: return DateTime.Now.AddHours(-1 * (int)(interval/2)+1);
                case 3: return DateTime.Now.AddSeconds(-1 * amount);
                case 4: return DateTime.Now.AddMinutes(-1 * amount);
                case 5: return DateTime.Now;
                case 6: return DateTime.Now.AddSeconds(-15);
                case 7: return DateTime.Now.AddDays(-1 * days);
                default: return DateTime.Now;
            }
        }

        public DateTime RandomDateTime(DateTime Start)
        {
            Random rnd = new Random();
            int interval = rnd.Next(0, 3);
            int amount = rnd.Next(1, 100);

            switch (interval)
            {
                case 0: return Start.AddSeconds(amount);
                case 1: return Start.AddMinutes(amount);
                case 2: return Start.AddHours((int)(interval / 2) + 1);
                default: return Start.AddSeconds(10);
            }
        }

        public void GetDevices()
        {
            this.Devices = new List<string>();

            DatabaseConnection dbConn = new DatabaseConnection();

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec usp_t_DevicesSelectByCompany @CompanyId", con))
                {
                    

                    cmd.Parameters.AddWithValue("@CompanyId", this.CompanyId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            this.Devices.Add(drI["Address"].ToString());
                        }
                    }
                }
            }
        }

        public List<string> Devices { get; set; }
        public int CompanyId { get; set; }
    }
}
