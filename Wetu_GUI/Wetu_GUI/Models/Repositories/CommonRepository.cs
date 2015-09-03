using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace Wetu_GUI.Models
{
    public class CommonRepository
    {
        #region Grid Selects
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

        public List<Device> GetDevices()
        {
            List<Device> ReturnObject = new List<Device>();
            Device ins;

            DataBaseConnection dbConn = new DataBaseConnection();

            List<int> companies = (List<int>)HttpContext.Current.Session["CompanyIds"];

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetDevices + " @Companies", con))
                {
                    var table = new DataTable();
                    table.Columns.Add("Item", typeof(int));

                    foreach (int item in companies)
                        table.Rows.Add(item);

                    var pList = new SqlParameter("@Companies", SqlDbType.Structured);
                    pList.TypeName = "dbo.IntList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new Device();
                            ins.DeviceId = Convert.ToInt32(drI["DeviceId"]);
                            ins.Address = drI["Address"].ToString();
                            ins.CreatedDate = Convert.ToDateTime(drI["CreatedDate"]);
                            ins.CompanyId = Convert.ToInt32(drI["CompanyId"]);
                            ins.ModifiedBy = Convert.ToInt32(drI["ModifiedBy"]);
                            ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                            ins.Removed = Convert.ToBoolean(drI["Removed"]);
                            ins._Company = drI["CompanyName"].ToString();
                            ins._ModifiedBy = drI["Username"].ToString();
                            ReturnObject.Add(ins);
                        }
                    }
                }
            }

            return ReturnObject;
        }

        public List<Animal> GetAnimals()
        {
            List<Animal> ReturnObject = new List<Animal>();
            Animal ins;

            DataBaseConnection dbConn = new DataBaseConnection();

            List<int> companies = (List<int>)HttpContext.Current.Session["CompanyIds"];

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetAnimals + " @Companies", con))
                {
                    var table = new DataTable();
                    table.Columns.Add("Item", typeof(int));

                    foreach (int item in companies)
                        table.Rows.Add(item);

                    var pList = new SqlParameter("@Companies", SqlDbType.Structured);
                    pList.TypeName = "dbo.IntList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new Animal();
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
                            ReturnObject.Add(ins);
                        }
                    }
                }
            }

            return ReturnObject;
        }

        public List<ProximityLog> GetProximityLog()
        {
            List<ProximityLog> ReturnObject = new List<ProximityLog>();
            ProximityLog ins;

            DataBaseConnection dbConn = new DataBaseConnection();

            List<int> companies = (List<int>)HttpContext.Current.Session["CompanyIds"];

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetProximityLog + " @Companies", con))
                {
                    var table = new DataTable();
                    table.Columns.Add("Item", typeof(int));

                    foreach (int item in companies)
                        table.Rows.Add(item);

                    var pList = new SqlParameter("@Companies", SqlDbType.Structured);
                    pList.TypeName = "dbo.IntList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new ProximityLog();
                            ins.ProximityId = Convert.ToInt32(drI["ProximityId"]);
                            ins.AnimalConnectedTo = Convert.ToInt32(drI["AnimalConnectedTo"]);
                            ins.AnimalInProximity = Convert.ToInt32(drI["AnimalInProximity"]);
                            ins.DeviceConnectedTo = Convert.ToInt32(drI["DeviceConnectedTo"]);
                            ins.DeviceInProximity = Convert.ToInt32(drI["DeviceInProximity"]);
                            ins.LogDate = Convert.ToDateTime(drI["LogDate"]);
                            ins.ProximityEnded = Convert.ToDateTime(drI["ProximityEnded"]);
                            ins.ProximityStarted = Convert.ToDateTime(drI["ProximityStarted"]);
                            ins._AnimalConnectedTo = drI["AnimalA"].ToString();
                            ins._AnimalInProximity = drI["AnimalB"].ToString();
                            ins._Company = drI["Company"].ToString();
                            ins._DeviceConnectedTo = drI["DeviceA"].ToString();
                            ins._DeviceInProximity = drI["DeviceB"].ToString();

                            ins.SecondsConnected = Math.Round((ins.ProximityEnded - ins.ProximityStarted).TotalSeconds,2);
                            ReturnObject.Add(ins);
                        }
                    }
                }
            }

            return ReturnObject;
        }
        #endregion

        #region Drop Down Lists
        public List<SelectListItem> GetCompaniesDropDown()
        {
            List<string> companyNames = (List<string>)HttpContext.Current.Session["Companies"];
            List<int> companyIds = (List<int>)HttpContext.Current.Session["CompanyIds"];

            List<SelectListItem> ReturnList = new List<SelectListItem>();
            
            for(int i=0; i<companyIds.Count; i++)
            {
                var item = new SelectListItem();
                item.Text = companyNames[i];
                item.Value = companyIds[i].ToString();
                ReturnList.Add(item);
            }

            return ReturnList;
        }

        public List<SelectListItem> GetAnimalTypesDropDown()
        {
            List<SelectListItem> ReturnObject = new List<SelectListItem>();
            SelectListItem ins;

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
                    ins = new SelectListItem();
                    ins.Value = drI["AnimalTypeId"].ToString();
                    ins.Text = drI["Description"].ToString();
                    ReturnObject.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnObject;
        }

        public List<SelectListItem> GetBirthTypesDropDown()
        {
            List<SelectListItem> ReturnObject = new List<SelectListItem>();
            SelectListItem ins;

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
                    ins = new SelectListItem();
                    ins.Value = drI["BirthTypeId"].ToString();
                    ins.Text = drI["Description"].ToString();
                    ReturnObject.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnObject;
        }

        public List<SelectListItem> GetSexesDropDown()
        {
            List<SelectListItem> ReturnObject = new List<SelectListItem>();
            SelectListItem ins;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetSexes;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new SelectListItem();
                    ins.Value = drI["SexId"].ToString();
                    ins.Text = drI["Description"].ToString();
                    ReturnObject.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnObject;
        }

        public List<SelectListItem> GetDevicesDropDown()
        {
            List<SelectListItem> ReturnObject = new List<SelectListItem>();
            SelectListItem ins;

            var none = new SelectListItem();
            none.Text = "Not Connected";
            none.Value = "0";
            ReturnObject.Add(none);

            DataBaseConnection dbConn = new DataBaseConnection();

            List<int> companies = (List<int>)HttpContext.Current.Session["CompanyIds"];

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetDeviceDropDown + " @Companies", con))
                {
                    var table = new DataTable();
                    table.Columns.Add("Item", typeof(int));

                    foreach (int item in companies)
                        table.Rows.Add(item);

                    var pList = new SqlParameter("@Companies", SqlDbType.Structured);
                    pList.TypeName = "dbo.IntList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new SelectListItem();
                            ins.Text = drI["Address"].ToString();
                            ins.Value = drI["DeviceId"].ToString();
                            ReturnObject.Add(ins);
                        }
                    }
                }
            }

            return ReturnObject;
        }

        public List<SelectListItem> GetMaleAnimalsDropDown()
        {
            List<SelectListItem> ReturnObject = new List<SelectListItem>();
            SelectListItem ins;

            DataBaseConnection dbConn = new DataBaseConnection();

            List<int> companies = (List<int>)HttpContext.Current.Session["CompanyIds"];

            using (var con = dbConn.SqlConn())
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + CommonStrings.GetMaleAnimalsDropDown + " @Companies", con))
                {
                    var table = new DataTable();
                    table.Columns.Add("Item", typeof(int));

                    foreach (int item in companies)
                        table.Rows.Add(item);

                    var pList = new SqlParameter("@Companies", SqlDbType.Structured);
                    pList.TypeName = "dbo.IntList";
                    pList.Value = table;

                    cmd.Parameters.Add(pList);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new SelectListItem();
                            ins.Text = drI["DropDownName"].ToString();
                            ins.Value = drI["AnimalId"].ToString();
                            ReturnObject.Add(ins);
                        }
                    }
                }
            }

            return ReturnObject;
        }
        #endregion

        #region Associative Table Functions
        public void LinkAnimalToDevice(Animal ins)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.LinkAnimalDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
            cmdI.Parameters.AddWithValue("@IsCurrent", true);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public void LinkAnimalToDeviceSim(Animal ins)
        {
            //int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.LinkAnimalDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
            cmdI.Parameters.AddWithValue("@IsCurrent", true);
            cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }

        public void RemoveAnimalLinkedDevice(int AnimalId)
        {
            int ModifiedBy = (int)HttpContext.Current.Session["UserNo"];
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.UnlinkAnimalDevice;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", AnimalId);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();
            con.Dispose();
        }
        #endregion

        #region Alternative Selects
        public List<string> GetAllUserKeys()
        {
            List<string> userkeys = new List<string>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAllUsers;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    userkeys.Add(drI["UserKey"].ToString());
                }
            }

            cmdI.Connection.Close();
            con.Dispose();
            

            return userkeys;
        }

        public List<string> GetAllUsernames()
        {
            List<string> usernames = new List<string>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAllUsers;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    usernames.Add(drI["Username"].ToString());
                }
            }

            cmdI.Connection.Close();
            con.Dispose();


            return usernames;
        }
        #endregion
    }
}