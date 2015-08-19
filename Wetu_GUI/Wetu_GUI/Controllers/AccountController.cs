using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Wetu_GUI.Models;

namespace Wetu_GUI.Controllers
{
    public class AccountController : Controller
    {
        private AccountRepository Account_Rep = new AccountRepository();
        private SecurityRepository secRep = new SecurityRepository();

        public ActionResult LogOn()
        {
            return View();
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.UserName, model.Password))
                {
                    Account_Rep.SetUserLogin(model.UserName);

                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/LogOff

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/Register

        public ActionResult RegisterCompany()
        {
            return View();
        }

        //
        // POST: /Account/Register

        [HttpPost]
        public ActionResult RegisterCompany(RegisterCompanyModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the comapny
                string rolename = "u_" + model.CompanyName;
                Roles.CreateRole(rolename);

                // Add Company to Database
                Company comp = new Company();
                comp.Name = model.CompanyName;
                comp.RoleId = secRep.GetRoleId(rolename);
                comp.Removed = false;
                comp = secRep.AddCompany(comp);

                RegisterUserModel userNew = new RegisterUserModel();
                userNew.CompanyRole = rolename;

                return RedirectToAction("RegisterUser", "Account", new { CompanyName = model.CompanyName});
            }
       

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public ActionResult RegisterUser(string CompanyName)
        {
            ViewBag.Permissions = Account_Rep.GetAllSplitRoles("p_");
            List<string> companies = new List<string>();
            companies.Add("u_" + CompanyName);
            ViewBag.Companies = companies;
            return View();
        }

        [HttpPost]
        public ActionResult RegisterUser(RegisterUserModel model, string[] Companies, string[] Permissions)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    Roles.AddUserToRoles(model.UserName, Companies);
                    Roles.AddUserToRoles(model.UserName, Permissions);
                    FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                    User newUser = new User();
                    newUser.Username = model.UserName;
                    newUser.UserId = secRep.GetUserId(model.UserName);
                    newUser = secRep.AddUser(newUser);

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [Authorize]
        public ActionResult Register()
        {
            ViewBag.Permissions = Account_Rep.GetAllSplitRoles("p_");
            
            ViewBag.Companies = Account_Rep.GetUserRoles(User.Identity.Name, "u_");
            return View();
        }

        //
        // POST: /Account/Register

        [Authorize]
        [HttpPost]
        public ActionResult Register(RegisterModel model, string[] Companies, string[] Permissions)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    Roles.AddUserToRoles(model.UserName, Companies);
                    Roles.AddUserToRoles(model.UserName, Permissions);
                    //FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);

                    User newUser = new User();
                    newUser.Username = model.UserName;
                    newUser.UserId = secRep.GetUserId(model.UserName);
                    newUser = secRep.AddUser(newUser);

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePassword

        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {

                // ChangePassword will throw an exception rather
                // than return false in certain failure scenarios.
                bool changePasswordSucceeded;
                try
                {
                    MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                    changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                }
                catch (Exception)
                {
                    changePasswordSucceeded = false;
                }

                if (changePasswordSucceeded)
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        #region Status Codes
        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion
    }
}
