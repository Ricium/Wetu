using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using System.Web;

namespace Wetu_GUI.Models
{

    public class ChangePasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [System.Web.Mvc.Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class LogOnModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email address")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.Web.Mvc.Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class RegisterCompanyModel
    {
        [Required]
        [Display(Name = "Company Name")]
        public string CompanyName { get; set; }
    }

    public class RegisterUserModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email address")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.Web.Mvc.Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
        public string CompanyRole { get; set; }
    }

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

            foreach(string company in companies)
            {
                ReturnList.Add(secRep.GetCompanyId(company));
            }

            return ReturnList;
        }

    }
}
