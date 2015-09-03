<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<AnimalRelationship>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<% using (Html.BeginForm(new { id = "ParentForm", name = "ParentForm" }))
   {%>
<%: Html.HiddenFor(m => m.AnimalId)%>
<%: Html.Telerik().DropDownListFor(m => m.ParentAnimalId).BindTo((IEnumerable<SelectListItem>)ViewData["MaleParents"])%>
<button type="button" onclick="SubmitParentForm()">Add Father</button>
<% } %>
