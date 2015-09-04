<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<AnimalRelationship>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<% using (Html.BeginForm("_AddParent", "Herd", FormMethod.Post))
   {%>
<%: Html.HiddenFor(m => m.ChildAnimalId)%>
<%: Html.Telerik().DropDownListFor(m => m.ParentAnimalId).BindTo((IEnumerable<SelectListItem>)ViewData["MaleParents"])%>
<button type="submit">Add Father</button>
<% } %>
