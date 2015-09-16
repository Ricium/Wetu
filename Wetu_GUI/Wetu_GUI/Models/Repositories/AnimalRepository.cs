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

        public AnimalView GetAnimalView(int AnimalId)
        {
            AnimalView ins = new AnimalView();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalView;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", AnimalId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                    ins.BirthDate = Convert.ToDateTime(drI["Birthdate"]);
                    ins.CreatedDate = Convert.ToDateTime(drI["CreatedDate"]);
                    ins.DecriptiveName = drI["DecriptiveName"].ToString();
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.TagNumber = drI["TagNumber"].ToString();
                    ins._AnimalType = drI["Species"].ToString();
                    ins._Company = drI["Company"].ToString();
                    ins._ModifiedBy = drI["Username"].ToString();
                    ins._Sex = drI["Sex"].ToString();
                    ins._Address = drI["DeviceAddress"].ToString();
                    ins.PublicRegistrar = drI["PublicRegistrarNumber"].ToString();
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            DateTime EndDate = DateTime.Now;
            DateTime StartDate = EndDate.AddDays(-2);

            ins.LifetimeSocialGroup = GetAnimalSocialGroup(ins.AnimalId);
            ins.RecentSocialGroup = GetAnimalSocialGroup(ins.AnimalId, StartDate, EndDate);

            ins = GetAnimalInteractions(ins);
            ins = IsAnimalShowingEstrousBehaviour(ins, 2, 5, 5);

            ins.Age = DateTime.Today.Year - ins.BirthDate.Year;
            if (ins.BirthDate > DateTime.Today.AddYears(-ins.Age)) ins.Age--;

            ins.FemaleParent = GetMotherChildRelationship(ins.AnimalId);
            ins.MaleParent = GetFatherChildRelationship(ins.AnimalId);

            ins.Family = GetFamilyTree(ins.AnimalId, 5, 0);

            return ins;
        }

        public List<SocialGroup> GetAnimalSocialGroup(int AnimalId)
        {
            List<SocialGroup> ReturnList = new List<SocialGroup>();
            SocialGroup ins;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalSocialGroupLifetime;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", AnimalId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new SocialGroup();
                    ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                    ins._Address = drI["DeviceAddress"].ToString();
                    ins.DecriptiveName = drI["DecriptiveName"].ToString();
                    ins.TagNumber = drI["TagNumber"].ToString();
                    ins._Sex = drI["Sex"].ToString();
                    ins._Address = drI["DeviceAddress"].ToString();
                    ReturnList.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnList;
        }

        public List<SocialGroup> GetAnimalSocialGroup(int AnimalId, DateTime StartDate, DateTime EndDate)
        {
            List<SocialGroup> ReturnList = new List<SocialGroup>();
            SocialGroup ins;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalSocialGroupRecent;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", AnimalId);
            cmdI.Parameters.AddWithValue("@StartDate", StartDate);
            cmdI.Parameters.AddWithValue("@EndDate", EndDate);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new SocialGroup();
                    ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                    ins._Address = drI["DeviceAddress"].ToString();
                    ins.DecriptiveName = drI["DecriptiveName"].ToString();
                    ins.TagNumber = drI["TagNumber"].ToString();
                    ins._Sex = drI["Sex"].ToString();
                    ins._Address = drI["DeviceAddress"].ToString();
                    ReturnList.Add(ins);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            return ReturnList;
        }

        public AnimalView GetAnimalInteractions(AnimalView ins)
        {
            DateTime EndDate = DateTime.Now;
            DateTime StartDate = EndDate.AddHours(-2);

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalInteractions;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
            cmdI.Parameters.AddWithValue("@StartDate", StartDate);
            cmdI.Parameters.AddWithValue("@EndDate", EndDate);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.AverageNumberInteractions = Math.Ceiling(Convert.ToDouble(drI["AverageInteractionsPerDay"]) / 24);
                    ins.AverageLengthInteractions = Math.Ceiling(Convert.ToDouble(drI["AverageInteractionTimePerDay"]) /24);
                    ins.RecentNumberInteractions = Convert.ToInt32(drI["RecentInteractions"]);
                    ins.RecentLengthInteractions = Convert.ToDouble(drI["RecentInteractionsTime"]);
                }
            }

            cmdI.Connection.Close();
            con.Dispose();
            return ins;
        }

        public AnimalView IsAnimalShowingEstrousBehaviour(AnimalView ins, int SocialSensitivity, int InteractionSensitivity, int InteractionTimeSensitivity)
        {
            bool socialset = false;
            bool countset = false;
            bool timeset = false;

            ins.ChangeSocial = false;
            ins.ChangeInteractions = false;
            ins.ChangeLengthInteractions = false;

            List<int> SameSocialAnimals = ins.LifetimeSocialGroup.Select(x => x.AnimalId).Intersect(ins.RecentSocialGroup.Select(x => x.AnimalId)).ToList();
            if (SameSocialAnimals.Count <= (ins.LifetimeSocialGroup.Count - SocialSensitivity))
            {
                socialset = true;
                ins.ChangeSocial = true;
            }

            if (ins.RecentNumberInteractions >= InteractionSensitivity * ins.AverageNumberInteractions)
            {
                countset = true;
                ins.ChangeInteractions = true;
            }

            if (ins.RecentLengthInteractions >= InteractionTimeSensitivity * ins.AverageLengthInteractions)
            {
                timeset = true;
                ins.ChangeLengthInteractions = true;
            }

            if((socialset && timeset) || (socialset && countset) || (countset && timeset))
            {
                ins.ShowingEstrousBehaviour = true;
            }


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

        public Animal InsertAnimalSim(Animal ins)
        {
            Animal ReturnObject = new Animal();
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
                cmdI.CommandText = CommonStrings.InsertAnimal;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalTypeId", ins.AnimalTypeId);
                cmdI.Parameters.AddWithValue("@SexId", ins.SexId);
                cmdI.Parameters.AddWithValue("@DecriptiveName", ins.DecriptiveName);
                cmdI.Parameters.AddWithValue("@TagNumber", ins.TagNumber);
                cmdI.Parameters.AddWithValue("@BirthDate", DateTime.Today);
                cmdI.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
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

        public AnimalRelationship InsertAnimalRelationship(AnimalRelationship ins)
        {
            AnimalRelationship ReturnObject = new AnimalRelationship();
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
                cmdI.CommandText = CommonStrings.InsertAnimalRelationship;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ParentId", ins.ParentAnimalId);
                cmdI.Parameters.AddWithValue("@ChildId", ins.ChildAnimalId);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
                cmdI.Parameters.AddWithValue("@Removed", false);

                ins.RelationshipId = (int)cmdI.ExecuteScalar();

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

        public AnimalRelationship InsertAnimalRelationshipSim(AnimalRelationship ins)
        {
            AnimalRelationship ReturnObject = new AnimalRelationship();

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
                cmdI.CommandText = CommonStrings.InsertAnimalRelationship;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ParentId", ins.ParentAnimalId);
                cmdI.Parameters.AddWithValue("@ChildId", ins.ChildAnimalId);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModiefiedDate);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
                cmdI.Parameters.AddWithValue("@Removed", false);

                ins.RelationshipId = (int)cmdI.ExecuteScalar();

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

        public ParentView GetFatherChildRelationship(int ChildId)
        {
            ParentView ins = new ParentView();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalRelationships;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@ChildId", ChildId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    if (drI["Sex"].ToString().Equals("Male"))
                    {
                        ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                        ins.DecriptiveName = drI["DecriptiveName"].ToString();
                        ins.TagNumber = drI["TagNumber"].ToString();
                        ins._AnimalType = drI["Species"].ToString();
                        ins._Sex = drI["Sex"].ToString();
                    }                    
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            if (ins.AnimalId == 0)
            {
                return null;
            }
            else
            {
                return ins;
            }  
        }

        public ParentView GetMotherChildRelationship(int ChildId)
        {
            ParentView ins = new ParentView();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            cmdI.Parameters.Clear();
            cmdI.CommandText = CommonStrings.GetAnimalRelationships;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@ChildId", ChildId);
            cmdI.Connection.Open();

            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    if (drI["Sex"].ToString().Equals("Female"))
                    {
                        ins.AnimalId = Convert.ToInt32(drI["AnimalId"]);
                        ins.DecriptiveName = drI["DecriptiveName"].ToString();
                        ins.TagNumber = drI["TagNumber"].ToString();
                        ins._AnimalType = drI["Species"].ToString();
                        ins._Sex = drI["Sex"].ToString();
                    }
                }
            }

            cmdI.Connection.Close();
            con.Dispose();

            if(ins.AnimalId == 0)
            {
                return null;
            }
            else
            {
                return ins;
            }            
        }

        public FamilyTree GetFamilyTree(int AnimalId, int Depth, int CurrentLevel)
        {
            FamilyTree ins = new FamilyTree();
            ins.AnimalId = AnimalId;
            ins.Level = CurrentLevel;

            //...Get Father
            ParentView Father = GetFatherChildRelationship(AnimalId);
            
            //...Get Mother
            ParentView Mother = GetMotherChildRelationship(AnimalId);
                        

            if(CurrentLevel <= Depth)
            {
                if (Father == null)
                {
                    ins.MaleParentId = 0;
                }
                else
                {
                    ins.MaleParentId = Father.AnimalId;
                }

                ins.FatherParents = GetFamilyTree(ins.MaleParentId, Depth, ++CurrentLevel);

                if (Mother == null)
                {
                    ins.FemaleParentId = 0;
                }
                else
                {
                    ins.FemaleParentId = Mother.AnimalId;
                }

                ins.MotherParents = GetFamilyTree(ins.FemaleParentId, Depth, ++CurrentLevel);                
            }
            else
            {
                ins.FatherParents = new FamilyTree();
                ins.MotherParents = new FamilyTree();
            }

            return ins;
        }

        public PublicRegistrar InsertPublicRegistrar(PublicRegistrar ins)
        {
            PublicRegistrar ReturnObject = new PublicRegistrar();
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
                cmdI.CommandText = CommonStrings.InsertPublicRegistrar;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
                cmdI.Parameters.AddWithValue("@RegistrationNumber", ins.RegistrationNumber);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.PublicId = (int)cmdI.ExecuteScalar();

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

        public PublicRegistrar InsertPublicRegistrarSim(PublicRegistrar ins)
        {
            PublicRegistrar ReturnObject = new PublicRegistrar();

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
                cmdI.CommandText = CommonStrings.InsertPublicRegistrar;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AnimalId", ins.AnimalId);
                cmdI.Parameters.AddWithValue("@RegistrationNumber", ins.RegistrationNumber);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);
                cmdI.Parameters.AddWithValue("@ModifiedBy", ins.ModifiedBy);
                cmdI.Parameters.AddWithValue("@Removed", false);
                ins.PublicId = (int)cmdI.ExecuteScalar();

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