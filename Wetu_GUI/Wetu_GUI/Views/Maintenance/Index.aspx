<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Maintenance
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.Telerik().TabStrip()
           .Name("MaintenanceTabs")
           .Items(item => 
               {
                   item.Add()
                       .Text("Species List")
                       .Content(() =>
                       {
                           %> <% Html.RenderPartial("_AnimalTypes", new ViewDataDictionary());%><%
                       });
               }) 
            .SelectedIndex(0)
            .Render();
    %>
</asp:Content>
