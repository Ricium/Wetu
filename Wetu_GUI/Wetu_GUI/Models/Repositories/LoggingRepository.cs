using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Wetu_GUI.Models
{
    public class LoggingRepository
    {
        public int GetDeviceId(string DeviceAddress)
        {
            int DeviceId = -1;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetDeviceIdFromAddress;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@Address", DeviceAddress);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    DeviceId = Convert.ToInt32(drI["DeviceId"]);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return DeviceId;
        }

        public int GetAnimalId(int DeviceId)
        {
            int AnimalId = -1;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalIdFromDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", DeviceId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    AnimalId = Convert.ToInt32(drI["AnimalId"]);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return AnimalId;
        }

        public bool LogProximity(ProximityLog ins)
        {
            bool success = false;

            ProximityLog ReturnObject = new ProximityLog();

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
                cmdI.CommandText = CommonStrings.InsertProximityLog;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@DeviceConnectedTo", ins.DeviceConnectedTo); 
                cmdI.Parameters.AddWithValue("@DeviceInProximity", ins.DeviceInProximity);
                cmdI.Parameters.AddWithValue("@AnimalConnectedTo", ins.AnimalConnectedTo);
                cmdI.Parameters.AddWithValue("@AnimalInProximity", ins.AnimalInProximity);
                cmdI.Parameters.AddWithValue("@ProximityStarted", ins.ProximityStarted);
                cmdI.Parameters.AddWithValue("@ProximityEnded", ins.ProximityEnded);
                cmdI.Parameters.AddWithValue("@LogDate", DateTime.Now);

                ins.ProximityId = (int)cmdI.ExecuteScalar();

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

            if (ins.ProximityId != 0)
                success = true;

            return success;
        }

        public bool LogMovement(MovementLog ins)
        {
            bool success = false;

            MovementLog ReturnObject = new MovementLog();

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
                cmdI.CommandText = CommonStrings.InsertMovementLog;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
                cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);
                cmdI.Parameters.AddWithValue("@AxisId", ins.AxisId);
                cmdI.Parameters.AddWithValue("@LogDate", DateTime.Now);

                ins.MovementId = (int)cmdI.ExecuteScalar();

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

            if (ins.MovementId != 0)
                success = true;

            return success;
        }
    }
}