using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Wetu_GUI.Models
{
    public class CommonRepository
    {       
        public List<AnimalType> GetAnimalTypes()
        {
            List<AnimalType> ReturnObject = new List<AnimalType>();
            AnimalType ins;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalTypes;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new AnimalType();
                    ins.AnimalTypeId = Convert.ToInt32(drI["AnimalTypeId"]);
                    ins.Description = drI["Description"].ToString();
                    ReturnObject.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnObject;
        }

        public List<BirthType> GetBirthTypes()
        {
            List<BirthType> ReturnObject = new List<BirthType>();
            BirthType ins;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetBirthTypes;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new BirthType();
                    ins.BirthTypeId = Convert.ToInt32(drI["BirthTypeId"]);
                    ins.Description = drI["Description"].ToString();
                    ReturnObject.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnObject;
        }
    }
}