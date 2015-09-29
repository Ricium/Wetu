<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<InseminationHistory>" %>
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
    <%: Html.HiddenFor(m => m.HistoryId) %>
    
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
        <%: Html.LabelFor(m => m.TubeId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.TubeId)
          //.BindTo((IEnumerable<SelectListItem>)ViewData["InseminationTubes"])
                            .DataBinding(db => db.Ajax().Select("_GetInseminationTubesAll", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.TubeId) %>
     </div>   
    <br />
</body>
</html>

