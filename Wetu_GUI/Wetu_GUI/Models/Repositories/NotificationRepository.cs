using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Wetu_GUI.Models
{
    public class NotificationRepository
    {
        public UserNotification GetUserNotification(int UserNotificationId)
        {
            UserNotification ReturnObject = new UserNotification();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetUserNotification;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@UserNotificationId", UserNotificationId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ReturnObject.UserNotificationId = Convert.ToInt32(drI["UserNotificationId"]);
                    ReturnObject.API = drI["API"].ToString();
                    ReturnObject.ModifiedBy = Convert.ToInt32(drI["ModifiedBy"]);
                    ReturnObject.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ReturnObject.CompanyId = Convert.ToInt32(drI["CompanyId"]);
                    ReturnObject.NotificationTypeId = Convert.ToInt32(drI["NotificationType"]);
                    ReturnObject.UserId = Convert.ToInt32(drI["UserId"]);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnObject;
        }

        public UserNotification InsertUserNotification(UserNotification ins)
        {
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
                cmdI.CommandText = CommonStrings.InsertUserNotifications;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@UserId", ModifiedBy);
                cmdI.Parameters.AddWithValue("@NotificationType", ins.NotificationTypeId); 
                cmdI.Parameters.AddWithValue("@API", ins.API); 
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now); 
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy); 
                cmdI.Parameters.AddWithValue("@Removed", 0); 
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId); 
                ins.UserNotificationId = (int)cmdI.ExecuteScalar();

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

        public UserNotification UpdateUserNotification(UserNotification ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateUserNotifications;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@UserNotificationId", ins.UserNotificationId);
            cmdI.Parameters.AddWithValue("@UserId", ModifiedBy);
            cmdI.Parameters.AddWithValue("@NotificationType", ins.NotificationTypeId);
            cmdI.Parameters.AddWithValue("@API", ins.API);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@Removed", 0);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId); 

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public void RemoveUserNotification(UserNotification ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateUserNotifications;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@UserNotificationId", ins.UserNotificationId);
            cmdI.Parameters.AddWithValue("@UserId", ModifiedBy);
            cmdI.Parameters.AddWithValue("@NotificationType", ins.NotificationTypeId);
            cmdI.Parameters.AddWithValue("@API", ins.API);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@Removed", 1);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId); 

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public void DeleteUserNotification(int UserNotificationId)
        {
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.DeleteUserNotifications;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@UserNotificationId", UserNotificationId);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }
    }
}