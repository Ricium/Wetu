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
    }
}