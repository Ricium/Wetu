﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Data Logs
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    - Data Logs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.Telerik().TabStrip()
           .Name("LogTabs")
           .Items(item => 
               {
                   item.Add()
                       .Text("Proximity Log")
                       .Content(() =>
                       {
                           %>
                           <% Html.Telerik().Grid<ProximityLog>()
                                           .Name("ProximityGrid")
                                           .Columns(column =>
                                           {
                                               //column.Bound(model => model.ProximityId);
                                               column.Bound(model => model._AnimalConnectedTo);
                                               column.Bound(model => model._DeviceConnectedTo);
                                               column.Bound(model => model._AnimalInProximity);           
                                               column.Bound(model => model._DeviceInProximity);           
                                               column.Bound(model => model.SecondsConnected);
                                               column.Bound(model => model.LogDate).Format("{0:yyyy-MM-dd @ HH:mm}");
                                               column.Bound(model => model._Company);
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListProximityLog", "Log");
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
                                           .Render();
                        %><%
                       });
                       
                   item.Add()
                       .Text("Movement Log")
                       .Content(() =>
                       {
                           %> 
                           <% Html.Telerik().Grid<MovementLog>()
                                           .Name("MovementGrid")
                                           .Columns(column =>
                                           {
                                               //column.Bound(model => model.MovementId);
                                               column.Bound(model => model._AnimalName);
                                               column.Bound(model => model._DeviceAddress);
                                               column.Bound(model => model._Axis);            
                                               column.Bound(model => model.LogDate).Format("{0:yyyy-MM-dd @ HH:mm}");
                                               column.Bound(model => model._Company);
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListMovementLog", "Log");
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
                                           .Render();
                            %><%
                       });
             }) 
           .SelectedIndex(0)
           .Effects(ef => ef.Expand().OpenDuration(500).CloseDuration(500))
           .Render();%>
</asp:Content>
