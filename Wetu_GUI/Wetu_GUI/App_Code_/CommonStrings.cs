using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wetu_GUI
{
    public class CommonStrings
    {
        #region Transcations
        public static string GetTransaction = "GET_TRANS";
        public static string InsertTransaction = "GET_TRANS";
        public static string UpdateTransaction = "GET_TRANS";
        public static string DeleteTransaction = "GET_TRANS";
        public static string RemoveTransaction = "GET_TRANS";
        #endregion

        #region Security
        public static string GetRoleId = "usp_aspnet_RolesSelect";
        public static string InsertCompany = "usp_t_CompaniesInsert";
        public static string GetUserId = "usp_aspnet_UsersSelect";
        public static string InsertUser = "usp_t_UsersInsert";
        public static string GetCompanyId = "usp_t_CompanySelect";
        public static string GetUserNo = "usp_t_UserNoSelect";
        #endregion

        #region Animal Types
        public static string GetAnimalType = "usp_l_AnimalTypesSelect";
        public static string GetAnimalTypes = "usp_l_AnimalTypesSelectAll";
        public static string InsertAnimalType = "usp_l_AnimalTypesInsert";
        public static string UpdateAnimalType = "usp_l_AnimalTypesUpdate";
        public static string DeleteAnimalType = "usp_l_AnimalTypesDelete";
        #endregion

        #region Birth Types
        public static string GetBirthType = "usp_l_BirthTypesSelect";
        public static string GetBirthTypes = "usp_l_BirthTypesSelectAll";
        public static string InsertBirthType = "usp_l_BirthTypesInsert";
        public static string UpdateBirthType = "usp_l_BirthTypesUpdate";
        public static string DeleteBirthType = "usp_l_BirthTypesDelete";
        #endregion

        #region Device
        public static string GetDevice = "usp_t_DevicesSelect";
        public static string GetDevices = "usp_t_DevicesSelectAll";
        public static string InsertDevice = "usp_t_DevicesInsert";
        public static string UpdateDevice = "usp_t_DevicesUpdate";
        public static string DeleteDevice = "usp_t_DevicesDelete";
        #endregion
    }
}