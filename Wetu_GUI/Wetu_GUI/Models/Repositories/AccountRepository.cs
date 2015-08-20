using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using System.Web;

namespace Wetu_GUI.Models
{
    public class AccountRepository
    {
        public void SetUserLogin(string Username)
        {
            List<string> Permissions = SplitRoles(Username, "p_");
            List<string> Companies = SplitRoles(Username, "u_");

            HttpContext.Current.Session["Username"] = Username;
            HttpContext.Current.Session["Permissions"] = Permissions;
            HttpContext.Current.Session["Companies"] = Companies;
            HttpContext.Current.Session["CompanyIds"] = GetCompanyIds(Companies);
            HttpContext.Current.Session["UserNo"] = GetUserNo(Username);
        }

        private List<string> SplitRoles(string Username, string split_char)
        {
            List<string> Role_Split = new List<string>();

            string[] roles = Roles.GetRolesForUser(Username);

            foreach (string role in roles)
            {
                if (role.StartsWith(split_char))
                {
                    Role_Split.Add(role.Substring(2));
                }
            }

            return Role_Split;
        }

        public List<string> GetAllSplitRoles(string split_char)
        {
            List<string> Role_Split = new List<string>();

            string[] roles = Roles.GetAllRoles();

            foreach (string role in roles)
            {
                if (role.StartsWith(split_char))
                {
                    Role_Split.Add(role);
                }
            }

            Role_Split.Sort();

            return Role_Split;
        }

        public List<string> GetUserRoles(string Username, string split_char)
        {
            List<string> Role_Split = new List<string>();

            string[] roles = Roles.GetRolesForUser(Username);

            foreach (string role in roles)
            {
                if (role.StartsWith(split_char))
                {
                    Role_Split.Add(role);
                }
            }

            return Role_Split;
        }

        public List<int> GetCompanyIds(List<string> companies)
        {
            SecurityRepository secRep = new SecurityRepository();
            List<int> ReturnList = new List<int>();

            foreach (string company in companies)
            {
                ReturnList.Add(secRep.GetCompanyId(company));
            }

            return ReturnList;
        }

        public int GetUserNo(string Username)
        {
            SecurityRepository secRep = new SecurityRepository();
            return secRep.GetUserNo(Username);
        }

    }
}