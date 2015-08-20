<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Animal>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<!DOCTYPE html>
<html>
<head id="head" runat="server">
    <title>New Animal</title>
</head>
<body>
    <%: Html.ValidationSummary(false, "Please fix the following errors:") %>
    <%: Html.HiddenFor(m => m.AnimalId) %>
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
        <%: Html.LabelFor(m => m.DeviceId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.DeviceId)
                            .DataBinding(db => db.Ajax().Select("_GetDeviceList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.CompanyId) %>
     </div>

     <div class="editor-label">
        <%: Html.LabelFor(m => m.DecriptiveName) %>
     </div>
     <div class="editor-field">
         <%: Html.TextBoxFor(m => m.DecriptiveName) %>
         <br />
         <%: Html.ValidationMessageFor(m => m.DecriptiveName) %>
     </div>

    <div class="editor-label">
        <%: Html.LabelFor(m => m.TagNumber) %>
     </div>
     <div class="editor-field">
         <%: Html.TextBoxFor(m => m.TagNumber) %>
         <br />
         <%: Html.ValidationMessageFor(m => m.TagNumber) %>
     </div>

    <div class="editor-label">
        <%: Html.LabelFor(m => m.SexId) %>
     </div>
     <div class="editor-field">
         <%: Html.Telerik().DropDownListFor(m => m.SexId)
                            .DataBinding(db => db.Ajax().Select("_GetSexList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.SexId) %>
     </div>

    <div class="editor-label">
        <%: Html.LabelFor(m => m.AnimalTypeId) %>
     </div>
     <div class="editor-field">
         <%: Html.Telerik().DropDownListFor(m => m.AnimalTypeId)
                            .DataBinding(db => db.Ajax().Select("_GetAnimalTypeList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.AnimalTypeId) %>
     </div>

    <div class="editor-label">
        <%: Html.LabelFor(m => m.BirthDate) %>
     </div>
     <div class="editor-field">
         <%: Html.Telerik().DatePickerFor(m => m.BirthDate)%>
         <br />
         <%: Html.ValidationMessageFor(m => m.BirthDate) %>
     </div>
    
    <br />
</body>
</html>

