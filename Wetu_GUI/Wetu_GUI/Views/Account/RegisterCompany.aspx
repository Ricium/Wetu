<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wetu_GUI.Models.RegisterCompanyModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Company</h2>
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
                        <fieldset>
                            <legend>Account Information</legend>
                
                            <div class="editor-label">
                                <%: Html.LabelFor(m => m.CompanyName) %>
                            </div>
                            <div class="editor-field">
                                <%: Html.TextBoxFor(m => m.CompanyName) %>
                                <%: Html.ValidationMessageFor(m => m.CompanyName) %>
                            </div>
                
                           
                        </fieldset>
                    </td>
                   
            
                <p>
                    <input type="submit" value="Register" />
                </p>
        </div>
    <% } %>
</asp:Content>
