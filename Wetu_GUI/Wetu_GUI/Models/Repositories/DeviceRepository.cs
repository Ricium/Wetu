using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Wetu_GUI.Models
{
    public class DeviceRepository
    {
        public Device GetDevice(int DeviceId)
        {
            Device ins = new Device();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", DeviceId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.DeviceId = Convert.ToInt32(drI["DeviceId"]);
                    ins.Address = drI["Address"].ToString();
                    ins.CreatedDate = Convert.ToDateTime(drI["CreatedDate"]);
                    ins.CompanyId = Convert.ToInt32(drI["CompanyId"]);
                    ins.ModifiedBy = Convert.ToInt32(drI["ModifiedBy"]);
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.Removed = Convert.ToBoolean(drI["Removed"]);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public Device InsertDevice(Device ins)
        {
            Device ReturnObject = new Device();
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
                cmdI.CommandText = CommonStrings.InsertDevice;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Address", ins.Address);
                cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now); 
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now); 
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy); 
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false); 
                ins.DeviceId = (int)cmdI.ExecuteScalar();

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

        public Device InsertDeviceSim(Device ins)
        {
            Device ReturnObject = new Device();
            //int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];

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
                cmdI.CommandText = CommonStrings.InsertDevice;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Address", ins.Address);
                cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.DeviceId = (int)cmdI.ExecuteScalar();

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

        public Device UpdateDevice(Device ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);
            cmdI.Parameters.AddWithValue("@Address", ins.Address);
            cmdI.Parameters.AddWithValue("@CreatedDate", ins.CreatedDate);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", false); 

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public void RemoveDevice(Device ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);
            cmdI.Parameters.AddWithValue("@Address", ins.Address);
            cmdI.Parameters.AddWithValue("@CreatedDate", ins.CreatedDate);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", true);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public void DeleteDevice(int DeviceId)
        {
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.DeleteDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", DeviceId);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }
    }
}