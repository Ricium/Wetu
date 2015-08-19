<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<nav>
    <ul id="menu">
        <li><%: Html.ActionLink("Home", "Index", "Home")%></li>
        
        <%
    if (Request.IsAuthenticated) {
%>  
        <li><%: Html.ActionLink("Herd", "Index", "Herd")%></li>
        <li><%: Html.ActionLink("Devices", "Index", "Device")%></li>
        <li><%: Html.ActionLink("Users", "Index", "User")%></li>
        <li><%: Html.ActionLink("Maintenance", "Index", "Maintenance")%></li>
        <li><%: Html.ActionLink("Log Off: " + Page.User.Identity.Name, "LogOff", "Account") %></li>
<%
    }
    else {
%>      <li><%: Html.ActionLink("About", "About", "Home")%></li>
        <li><%: Html.ActionLink("Register Company", "RegisterCompany", "Account") %></li>
        <li><%: Html.ActionLink("Log On", "LogOn", "Account") %></li>
<%
    }
%>
    </ul>
</nav>
