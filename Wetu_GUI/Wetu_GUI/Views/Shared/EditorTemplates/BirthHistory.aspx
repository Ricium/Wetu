<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<BirthHistory>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<!DOCTYPE html>
<html>
<head id="head" runat="server">
    <title>New Birth</title>
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
        <%: Html.LabelFor(m => m.BirthTypeId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.BirthTypeId)
                            .DataBinding(db => db.Ajax().Select("_GetBirthTypeList", "DropDown")).CascadeTo("TubeId")
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.BirthTypeId) %>
     </div>   

    <div class="editor-label">
        <%: Html.LabelFor(m => m.TubeId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.TubeId)
                            .DataBinding(db => db.Ajax().Select("_GetInseminationTubes", "DropDown")).CascadeTo("MaleParentId")
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.TubeId) %>
     </div>  

    <div class="editor-label">
        <%: Html.LabelFor(m => m.MaleParentId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.MaleParentId)
                            .DataBinding(db => db.Ajax().Select("_GetMaleAnimalsListFromTube", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.MaleParentId) %>
     </div> 

    <div class="editor-label">
        <%: Html.LabelFor(m => m.FemaleParentId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.FemaleParentId)
                            .DataBinding(db => db.Ajax().Select("_GetFemaleAnimalsList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.FemaleParentId) %>
     </div> 

    <div class="editor-label">
        <%: Html.LabelFor(m => m.ChildId) %>
     </div>
     <div class="editor-field">
          <%: Html.Telerik().DropDownListFor(m => m.ChildId)
                            .DataBinding(db => db.Ajax().Select("_GetAnimalList", "DropDown"))
                            .HtmlAttributes(new { style = "width: 350px" })%>
         <br />
         <%: Html.ValidationMessageFor(m => m.ChildId) %>
     </div> 

    <div class="editor-label">
        <%: Html.LabelFor(m => m.Success) %>
     </div>
     <div class="editor-field">
          <%: Html.CheckBoxFor(m => m.Success)%>
         <br />
         <%: Html.ValidationMessageFor(m => m.Success) %>
     </div> 
    <br />
</body>
</html>

