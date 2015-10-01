<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<UserNotification>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<!DOCTYPE html>
<html>
<head id="head" runat="server">
    <title>New Notification Method</title>
</head>
<body>
    <%: Html.ValidationSummary(false, "Please fix the following errors:") %>
    <%: Html.HiddenFor(m => m.UserNotificationId) %>
    
    <div class="editor-label">
        <%: Html.LabelFor(m => m.CompanyId) %>
     </div>
     <div class="editor-field">
         <%: Html.Telerik().DropDownListFor(m => m.CompanyId)
                            .DataBinding(db => db.Ajax().Select("_GetCompanyList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.CompanyId) %>
     </div>

    <div class="editor-label">
        <%: Html.LabelFor(m => m.NotificationTypeId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.NotificationTypeId)
                            .DataBinding(db => db.Ajax().Select("_GetNotificationTypes", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.NotificationTypeId) %>
     </div>

     <div class="editor-label">
        <%: Html.LabelFor(m => m.API) %>
     </div>
     <div class="editor-field">
         <%: Html.TextBoxFor(m => m.API) %>
         <br />
         <%: Html.ValidationMessageFor(m => m.API) %>
     </div>    
    <br />
</body>
</html>

