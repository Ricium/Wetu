using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Wetu_GUI.Models
{
    public class AnimalRepository
    {
        public Animal GetAnimal(int AnimalId)
        {
            Animal ins = new Animal();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimal;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", AnimalId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                    ins.AnimalTypeId = Convert.ToInt32(drI["AnimalTypeId"]);
                    ins.BirthDate = Convert.ToDateTime(drI["Birthdate"]);
                    ins.CreatedDate = Convert.ToDateTime(drI["CreatedDate"]);
                    ins.CompanyId = Convert.ToInt32(drI["CompanyId"]);
                    ins.DecriptiveName = drI["DecriptiveName"].ToString();
                    ins.ModifiedBy = Convert.ToInt32(drI["ModifiedBy"]);
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.Removed = Convert.ToBoolean(drI["Removed"]);
                    ins.SexId = Convert.ToInt32(drI["SexId"]);
                    ins.TagNumber = drI["TagNumber"].ToString();
                    ins._AnimalType = drI["Species"].ToString();
                    ins._Company = drI["Company"].ToString();
                    ins._ModifiedBy = drI["Username"].ToString();
                    ins._Sex = drI["Sex"].ToString();
                    ins.DeviceId = Convert.ToInt32(drI["DeviceId"]);
                    ins._Address = drI["DeviceAddress"].ToString();
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public Animal InsertAnimal(Animal ins)
        {
            Animal ReturnObject = new Animal();
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();

            SqlCommand cmdI = con.CreateCommand();
            SqlTransaction trx = con.BeginTransaction(CommonStrings.InsertTransaction);

            cmdI.Connection = con;
            cmdI.Transaction = trx;

            try
            {
                cmdI.Parameters.Clear();
                cmdI.CommandText = CommonStrings.InsertAnimal;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalTypeId", ins.AnimalTypeId);
                cmdI.Parameters.AddWithValue("@SexId", ins.SexId);
                cmdI.Parameters.AddWithValue("@DecriptiveName", ins.DecriptiveName);
                cmdI.Parameters.AddWithValue("@TagNumber", ins.TagNumber);
                cmdI.Parameters.AddWithValue("@BirthDate", ins.BirthDate);
                cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.AnimalId = (int)cmdI.ExecuteScalar();

                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null) trx.Rollback();
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }

                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }

            return ins;
        }

        public Animal UpdateAnimal(Animal ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateAnimal;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
            cmdI.Parameters.AddWithValue("@AnimalTypeId", ins.AnimalTypeId);
            cmdI.Parameters.AddWithValue("@SexId", ins.SexId);
            cmdI.Parameters.AddWithValue("@DecriptiveName", ins.DecriptiveName);
            cmdI.Parameters.AddWithValue("@TagNumber", ins.TagNumber);
            cmdI.Parameters.AddWithValue("@BirthDate", ins.BirthDate);
            cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", false);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public void RemoveAnimal(Animal ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateAnimal;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
            cmdI.Parameters.AddWithValue("@AnimalTypeId", ins.AnimalTypeId);
            cmdI.Parameters.AddWithValue("@SexId", ins.SexId);
            cmdI.Parameters.AddWithValue("@DecriptiveName", ins.DecriptiveName);
            cmdI.Parameters.AddWithValue("@TagNumber", ins.TagNumber);
            cmdI.Parameters.AddWithValue("@BirthDate", ins.BirthDate);
            cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", true);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public void DeleteAnimal(int AnimalId)
        {
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.DeleteAnimal;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", AnimalId);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }
    }
}