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

        #region Other
        public static string GetSexes = "usp_l_SexesSelectAll";
        #endregion

        #region Device
        public static string GetDevice = "usp_t_DevicesSelect";
        public static string GetDevices = "usp_t_DevicesSelectAll";
        public static string InsertDevice = "usp_t_DevicesInsert";
        public static string UpdateDevice = "usp_t_DevicesUpdate";
        public static string DeleteDevice = "usp_t_DevicesDelete";
        public static string GetDeviceDropDown = "usp_t_DevicesSelectDropDown";
        public static string GetMaleAnimalsDropDown = "view_SelectMaleAnimals";
        public static string GetFemaleAnimalsDropDown = "view_SelectFemaleAnimals";
        #endregion

        #region Animal
        public static string GetAnimal = "usp_t_AnimalsSelect";
        public static string GetAnimals = "usp_t_AnimalsSelectAll";
        public static string InsertAnimal = "usp_t_AnimalsInsert";
        public static string UpdateAnimal = "usp_t_AnimalsUpdate";
        public static string DeleteAnimal = "usp_t_AnimalsDelete";
        public static string LinkAnimalDevice = "usp_a_DeviceLinksInsert";
        public static string UnlinkAnimalDevice = "usp_a_DeviceLinksDelete";
        public static string InsertAnimalRelationship = "usp_t_RelationshipsInsert";
        public static string GetAnimalRelationships = "usp_t_RelationshipsSelectFromChild";
        #endregion

        #region Logging
        public static string GetDeviceIdFromAddress = "usp_t_DeviceSelectFromAddress";
        public static string GetAnimalIdFromDevice = "usp_t_AnimalSelectFromDeviceId";
        public static string InsertProximityLog = "usp_t_ProximityInsert";
        public static string GetProximityLog = "usp_t_ProximitySelectAll";
        public static string GetMovementLog = "usp_t_MovementSelectAll";
        public static string InsertMovementLog = "usp_t_MovementInsert";
        #endregion

        #region Artificial Insemination
        public static string GetInseminationTubes = "usp_t_SpermbankSelectAll";
        public static string GetBirthHistories = "usp_t_BirthHistorySelectAll";
        public static string GetBirthHistoryForAnimal = "usp_t_BirthHistorySelectPerAnimal";
        #endregion

        #region Web Return Codes
        public static string Success = "1";
        public static string Error_DeviceReceived = "2";
        public static string Error_DeviceConnected = "3";
        public static string Error_Parameters = "4";
        public static string Error_DBFail = "5";
        public static string Error_DeviceReceivedNotConnectedToAnimal = "6";
        public static string Error_DeviceConnectedNotConnectedToAnimal = "7";
        public static string Error = "-1";

        public static string Error_Invaild_DeviceAddress = "8";
        public static string Error_AnimalNotConnectedToDevice = "9";
        #endregion

        #region Alternative Selects
        public static string GetAllUsers = "usp_t_UsersSelectAll";
        public static string GetUsername = "usp_t_UsersSelect";
        #endregion

        #region Animal View
        public static string GetAnimalView = "view_t_AnimalsSelect";
        public static string GetAnimalSocialGroupLifetime = "view_t_AnimalsSelectSocialGroup";
        public static string GetAnimalSocialGroupRecent = "view_t_AnimalsSelectSocialGroupTime";
        public static string GetAnimalInteractions = "view_t_AnimalSelectInteractions";
        #endregion
    }
}