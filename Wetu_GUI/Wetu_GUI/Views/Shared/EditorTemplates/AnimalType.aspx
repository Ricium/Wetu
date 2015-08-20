<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<AnimalType>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<!DOCTYPE html>
<html>
<head id="head" runat="server">
    <title>Species</title>
</head>
<body>
    <%: Html.ValidationSummary(false, "Please fix the following errors:")  %>
    <%: Html.HiddenFor(m => m.AnimalTypeId) %>
     <div class="editor-label">
        <%: Html.LabelFor(m => m.Description) %>
     </div>
     <div class="editor-field">
         <%: Html.TextBoxFor(m => m.Description) %>
         <br />
         <%: Html.ValidationMessageFor(m => m.Description) %>
     </div>
    <br />
</body>
</html>

