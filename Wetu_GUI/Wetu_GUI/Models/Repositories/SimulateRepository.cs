using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Wetu_GUI.Models
{
    public class AnimalSim
    {
        public int AnimalId { get; set; }
        public string DeviceAddress { get; set; }
    }

    public class TubeSim
    {
        public int AnimalId { get; set; }
        public int TubeId { get; set; }
    }

    public class SpeciesSim
    {
        public int SpeciesId { get; set; }
        public string SpeciesName { get; set; }
    }

    public class SimulateRepository
    {
        public List<AnimalSim> GetAnimals(int CompanyId, int SexId)
        {
            List<AnimalSim> ReturnObject = new List<AnimalSim>();
            AnimalSim ins;

            DataBaseConnection dbConn = new DataBaseConnection();

                using (var con = dbConn.SqlConn())
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.SimAnimals + " @CompanyId, @SexId", con))
                    {
                        cmd.Parameters.AddWithValue("@CompanyId", CompanyId);
                        cmd.Parameters.AddWithValue("@SexId", SexId);

                        using (var drI = cmd.ExecuteReader())
                        {
                            while (drI.Read())
                            {
                                ins = new AnimalSim();
                                ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                                ins.DeviceAddress = drI["DeviceAddress"].ToString();
                                ReturnObject.Add(ins);
                            }
                        }
                    }
                
            }

            return ReturnObject;
        }

        public List<TubeSim> GetTubes(int CompanyId)
        {
            List<TubeSim> ReturnObject = new List<TubeSim>();
            TubeSim ins;

            DataBaseConnection dbConn = new DataBaseConnection();

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.SimTubes + " @CompanyId", con))
                {
                    cmd.Parameters.AddWithValue("@CompanyId", CompanyId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new TubeSim();
                            ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                            ins.TubeId = Convert.ToInt32(drI["TubeId"]);
                            ReturnObject.Add(ins);
                        }
                    }
                }

            }

            return ReturnObject;
        }

        public List<int> GetPublicRegistrar()
        {
            List<int> ReturnObject = new List<int>();

            DataBaseConnection dbConn = new DataBaseConnection();

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetPublicRegistrar, con))
                {

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ReturnObject.Add(Convert.ToInt32(drI["AnimalId"]));
                        }
                    }
                }

            }

            return ReturnObject;
        }

        public List<SpeciesSim> GetSpeciesList()
        {
            List<SpeciesSim> ReturnObject = new List<SpeciesSim>();
            SpeciesSim ins;

            DataBaseConnection dbConn = new DataBaseConnection();

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetAnimalTypes, con))
                {

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new SpeciesSim();
                            ins.SpeciesId = Convert.ToInt32(drI["AnimalTypeId"]);
                            ins.SpeciesName = drI["Description"].ToString();
                            ReturnObject.Add(ins);
                        }
                    }
                }

            }

            return ReturnObject;
        }
    }
}