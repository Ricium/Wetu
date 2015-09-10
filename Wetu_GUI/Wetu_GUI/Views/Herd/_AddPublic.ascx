<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PublicRegistrar>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<% using (Html.BeginForm("_AddPublicRegistrar", "Herd", FormMethod.Post))
   {%>
<%: Html.HiddenFor(m => m.AnimalId)%>
<%: Html.TextBoxFor(m => m.RegistrationNumber) %>
<br />
<button type="submit">Add to Public Registrar</button>
<% } %>
