using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Simulation
{
    class URLs
    {
        public static string GetCompanies = "/Simulate/GetCompanies";
        public static string GetUsers = "/Simulate/GetUsersForCompany";
        public static string GetMaleAnimals = "/Simulate/GetMaleAnimals";
        public static string GetFemaleAnimals = "/Simulate/GetFemaleAnimals";
        public static string GetTubes = "/Simulate/GetInseminationTubes";
        public static string GetPublicRegistrar = "/Simulate/GetPublicRegistrar";
        public static string GetSpecies = "/Simulate/GetSpecies";
        public static string AddCompany = "/Simulate/AddCompanySim";
        public static string AddUser = "/Simulate/AddUserToCompany";
        public static string AddDevice = "/Simulate/AddDevice";
        public static string AddAnimal = "/Simulate/AddAnimal";
        public static string AddTube = "/Simulate/AddInseminationTube";
        public static string AddToPublic = "/Simulate/AddToPublicRegistrar";
        public static string AddBirth = "/Simulate/AddBirthScenario";
        public static string LogProximity = "/Simulate/LogProximity";
        public static string LogMovement = "/Simulate/LogMovement";
    }
}
