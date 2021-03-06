﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<nav>
    <ul id="menu">
        <%
            if ((Request.IsAuthenticated) && (HttpContext.Current.Session["CompanyIds"] != null)) {
%>      <li><%: Html.ActionLink("Home", "Home", "Home")%></li>
        <li><%: Html.ActionLink("Herd", "Index", "Herd")%></li>
        <li><%: Html.ActionLink("Devices", "Index", "Device")%></li>
        <li><%: Html.ActionLink("Users", "Index", "User")%></li>
        <li><%: Html.ActionLink("Data Logs", "Index", "Log")%></li>
        <li><%: Html.ActionLink("Notifications", "Index", "Notification")%></li>
        <li><%: Html.ActionLink("Artificial Insemination", "Index", "AI")%></li>
        <li><%: Html.ActionLink("Maintenance", "Index", "Maintenance")%></li>
        <li><%: Html.ActionLink("Log Off: " + Page.User.Identity.Name, "LogOff", "Account") %></li>
<%
    }
    else {        
%>      <li><%: Html.ActionLink("Home", "Index", "Home")%></li>
        <li><%: Html.ActionLink("About", "About", "Home")%></li>
        <li><%: Html.ActionLink("Register Company", "RegisterCompany", "Account") %></li>
        <li><%: Html.ActionLink("Log On", "LogOn", "Account") %></li>
<%
    }
%>
    </ul>
</nav>
