using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace Wetu_GUI.Models
{
    public class AIRepository
    {
        public InseminationTube GetInseminationTube(int TubeId)
        {
            InseminationTube ins = new InseminationTube();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetInseminationTube;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@TubeId", TubeId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.TubeId = Convert.ToInt32(drI["TubeId"]);
                    ins.AnimalFromId = Convert.ToInt32(drI["AnimalId"]);
                    ins.CreatedDate = Convert.ToDateTime(drI["CreatedDate"]);
                    ins.CompanyId = Convert.ToInt32(drI["CompanyId"]);
                    ins.ModifiedBy = Convert.ToInt32(drI["ModifiedBy"]);
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins._FromAnimal = drI["Animal"].ToString();
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public InseminationTube InsertTube(InseminationTube ins)
        {
            InseminationTube ReturnObject = new InseminationTube();
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
                cmdI.CommandText = CommonStrings.InsertInseminationTube;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalFromId);
                cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.TubeId = (int)cmdI.ExecuteScalar();

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

        public InseminationTube InsertTubeSim(InseminationTube ins)
        {
            InseminationTube ReturnObject = new InseminationTube();

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
                cmdI.CommandText = CommonStrings.InsertInseminationTube;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalFromId);
                cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.TubeId = (int)cmdI.ExecuteScalar();

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

        public InseminationTube UpdateTube(InseminationTube ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateInseminationTube;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalFromId);
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

        public void RemoveTube(InseminationTube ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateInseminationTube;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalFromId);
            cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", true);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public BirthHistory GetBirthHistory(int HistoryId)
        {
            BirthHistory ins = new BirthHistory();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetBirthHistory;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@HistoryId", HistoryId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.TubeId = Convert.ToInt32(drI["TubeId"]);
                    ins.MaleParentId = Convert.ToInt32(drI["MaleParentId"]);
                    ins.FemaleParentId = Convert.ToInt32(drI["FemaleParentId"]);
                    ins.ChildId = Convert.ToInt32(drI["ChildId"]);
                    ins.CompanyId = Convert.ToInt32(drI["CompanyId"]);
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.ModifiedBy = Convert.ToInt32(drI["ModifiedBy"]);
                    ins._User = drI["Username"].ToString();
                    ins._Company = drI["Company"].ToString();
                    ins.Success = Convert.ToBoolean(drI["Success"]);
                    ins._MaleParent = drI["_MaleParent"].ToString();
                    ins._FemaleParent = drI["_FemaleParent"].ToString();
                    ins._Child = drI["_Child"].ToString();
                    ins.BirthTypeId = Convert.ToInt32(drI["BirthTypeId"]);
                    ins.HistoryId = Convert.ToInt32(drI["HistoryId"]);
                    ins._BirthType = drI["BirthType"].ToString();
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public BirthHistory InsertBirthHistory(BirthHistory ins)
        {
            BirthHistory ReturnObject = new BirthHistory();
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
                cmdI.CommandText = CommonStrings.InsertBirthHistory;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@BirthTypeId", ins.BirthTypeId);
                cmdI.Parameters.AddWithValue("@FemaleParentId", ins.FemaleParentId);
                cmdI.Parameters.AddWithValue("@MaleParentId", ins.MaleParentId);

                if(ins.ChildId == 0)
                {
                    cmdI.Parameters.AddWithValue("@ChildId", DBNull.Value);
                }
                else
                {
                    cmdI.Parameters.AddWithValue("@ChildId", ins.ChildId);
                }

                if (ins.TubeId == 0)
                {
                    cmdI.Parameters.AddWithValue("@TubeId", DBNull.Value);
                }
                else
                {
                    cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
                }

                cmdI.Parameters.AddWithValue("@Success", ins.Success);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.HistoryId = (int)cmdI.ExecuteScalar();

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

        public BirthHistory InsertBirthHistorySim(BirthHistory ins)
        {
            BirthHistory ReturnObject = new BirthHistory();

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
                cmdI.CommandText = CommonStrings.InsertBirthHistory;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@BirthTypeId", ins.BirthTypeId);
                cmdI.Parameters.AddWithValue("@FemaleParentId", ins.FemaleParentId);
                cmdI.Parameters.AddWithValue("@MaleParentId", ins.MaleParentId);

                if (ins.ChildId == 0)
                {
                    cmdI.Parameters.AddWithValue("@ChildId", DBNull.Value);
                }
                else
                {
                    cmdI.Parameters.AddWithValue("@ChildId", ins.ChildId);
                }

                if (ins.TubeId == 0)
                {
                    cmdI.Parameters.AddWithValue("@TubeId", DBNull.Value);
                }
                else
                {
                    cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
                }

                cmdI.Parameters.AddWithValue("@Success", ins.Success);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.HistoryId = (int)cmdI.ExecuteScalar();

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

        public BirthHistory UpdateBirthHistory(BirthHistory ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateBirthHistory;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@HistoryId", ins.HistoryId);
            cmdI.Parameters.AddWithValue("@BirthTypeId", ins.BirthTypeId);
            cmdI.Parameters.AddWithValue("@FemaleParentId", ins.FemaleParentId);
            cmdI.Parameters.AddWithValue("@MaleParentId", ins.MaleParentId);
            if (ins.ChildId == 0)
            {
                cmdI.Parameters.AddWithValue("@ChildId", DBNull.Value);
            }
            else
            {
                cmdI.Parameters.AddWithValue("@ChildId", ins.ChildId);
            }

            if (ins.TubeId == 0)
            {
                cmdI.Parameters.AddWithValue("@TubeId", DBNull.Value);
            }
            else
            {
                cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
            }
            cmdI.Parameters.AddWithValue("@Success", ins.Success);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", false);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();

            return ins;
        }

        public void RemoveBirthHistory(BirthHistory ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UpdateBirthHistory;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@HistoryId", ins.HistoryId);
            cmdI.Parameters.AddWithValue("@BirthTypeId", ins.BirthTypeId);
            cmdI.Parameters.AddWithValue("@FemaleParentId", ins.FemaleParentId);
            cmdI.Parameters.AddWithValue("@MaleParentId", ins.MaleParentId);
            if (ins.ChildId == 0)
            {
                cmdI.Parameters.AddWithValue("@ChildId", DBNull.Value);
            }
            else
            {
                cmdI.Parameters.AddWithValue("@ChildId", ins.ChildId);
            }

            if (ins.TubeId == 0)
            {
                cmdI.Parameters.AddWithValue("@TubeId", DBNull.Value);
            }
            else
            {
                cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
            }
            cmdI.Parameters.AddWithValue("@Success", ins.Success);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
            cmdI.Parameters.AddWithValue("@Removed", true);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public List<SelectListItem> GetAnimlDropDownFromTube(int TubeId)
        {
            List<SelectListItem> ReturnObject = new List<SelectListItem>();

            InseminationTube tube = GetInseminationTube(TubeId);

            SelectListItem ins = new SelectListItem();
            ins.Text = tube._FromAnimal;
            ins.Value = tube.AnimalFromId.ToString();
            ins.Selected = true;
            ReturnObject.Add(ins);

            return ReturnObject;
        }

        public InseminationHistory InsertInseminationHistory(InseminationHistory ins)
        {
            InseminationHistory ReturnObject = new InseminationHistory();
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
                cmdI.CommandText = CommonStrings.InsertInseminationHistory;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
                cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                ins.HistoryId = (int)cmdI.ExecuteScalar();

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

        public InseminationHistory InsertInseminationHistorySim(InseminationHistory ins)
        {
            InseminationHistory ReturnObject = new InseminationHistory();

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
                cmdI.CommandText = CommonStrings.InsertInseminationHistory;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
                cmdI.Parameters.AddWithValue("@TubeId", ins.TubeId);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
                cmdI.Parameters.AddWithValue("@CompanyId", ins.CompanyId);
                ins.HistoryId = (int)cmdI.ExecuteScalar();

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
    }
}