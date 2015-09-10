<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<InseminationTube>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<!DOCTYPE html>
<html>
<head id="head" runat="server">
    <title>New Insemination Tube</title>
</head>
<body>
    <%: Html.ValidationSummary(false, "Please fix the following errors:") %>
    <%: Html.HiddenFor(m => m.TubeId) %>
    <%: Html.HiddenFor(m => m.CreatedDate) %>
    
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
        <%: Html.LabelFor(m => m.AnimalFromId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.AnimalFromId)
                            .DataBinding(db => db.Ajax().Select("_GetMaleAnimalsList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.AnimalFromId) %>
     </div>   
    <br />
</body>
</html>

