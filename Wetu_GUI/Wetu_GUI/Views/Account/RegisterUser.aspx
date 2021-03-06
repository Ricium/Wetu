﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wetu_GUI.Models.RegisterUserModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register User
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    - User Registration
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Account</h2>
    <p>
        Use the form below to create a new account. 
    </p>
    <p>
        Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
    </p>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <table>
                <tr>
                    <td>
                        <fieldset>
                            <legend>Account Information</legend>
                            <div class="editor-label">
                                <%: Html.LabelFor(m => m.UserName) %>
                            </div>
                            <div class="editor-field">
                                <%: Html.TextBoxFor(m => m.UserName) %>
                                <%: Html.ValidationMessageFor(m => m.UserName) %>
                            </div>
                
                            <div class="editor-label">
                                <%: Html.LabelFor(m => m.Email) %>
                            </div>
                            <div class="editor-field">
                                <%: Html.TextBoxFor(m => m.Email) %>
                                <%: Html.ValidationMessageFor(m => m.Email) %>
                            </div>
                
                            <div class="editor-label">
                                <%: Html.LabelFor(m => m.Password) %>
                            </div>
                            <div class="editor-field">
                                <%: Html.PasswordFor(m => m.Password) %>
                                <%: Html.ValidationMessageFor(m => m.Password) %>
                            </div>
                
                            <div class="editor-label">
                                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                            </div>
                            <div class="editor-field">
                                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                            </div>
                
                        </fieldset>
                    </td>
                    <td>
                        <fieldset>
                        <legend>Company Access</legend>
                            <% List<string> companies = ViewBag.Companies;
                               foreach (string company in companies)
                               {
                                   %>
                            <div class="editor-label">
                                <%: Html.Label(company.Substring(2)) %>
                            </div>
                            <div class="editor-field">
                                <input type="checkbox" class="checkbox" name="Companies" value="<%: company %>" id="<%: company %>" />
                            </div>
                              <% } %>             
                        </fieldset>
                        <fieldset>
                        <legend>Permissions</legend>
                            <% List<string> permissions = ViewBag.Permissions;
                               foreach (string permission in permissions)
                               {
                                   %>
                            <div class="editor-label">
                                <%: Html.Label(permission.Substring(2)) %>
                            </div>
                            <div class="editor-field">
                                <input type="checkbox" class="checkbox" name="Permissions" value="<%: permission %>" id="<%: permission %>" />
                            </div>
                              <% } %>             
                        </fieldset>
                    </td>
                </tr>
            </table>
            
                <p>
                    <input type="submit" value="Register" class="t-button" />
                </p>
        </div>
    <% } %>
</asp:Content>
