﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Notifications
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    - Notifications
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.Telerik().TabStrip()
           .Name("NotifyTabs")
           .Items(item => 
               {
                   item.Add()
                       .Text("Notifcation Log")
                       .Content(() =>
                       {
                            Html.Telerik().Grid<NotificationMessage>()
                                       .Name("NotificationGrid")
                                       .DataKeys(key => key.Add(k => k.NotificationType))
                                       .Columns(column =>
                                       {
                                           column.Bound(model => model.NotificationType);
                                           column.Bound(model => model.Message);
                                           column.Bound(model => model.UserNotified);
                                           column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd}");
                                           column.Bound(model => model.NotificationAPI);
                                           column.Bound(model => model.Company);
                                       })
                                       .DataBinding(db => 
                                           {
                                               db.Ajax()
                                                    .Select("_ListNotifications", "Notification");
                                           })
                                       .Pageable(page => page.PageSize(100))
                                       .Sortable()
                                       .Scrollable(scroll => scroll.Height(250))
                                       .Render();
                                
                       });

                   item.Add()
                       .Text("Settings")
                       .Content(() =>
                       {
                            Html.Telerik().Grid<UserNotification>()
                                       .Name("SettingsGrid")
                                       .DataKeys(key => key.Add(k => k.UserNotificationId))
                                       .ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Notification Method"))
                                       .Columns(column =>
                                       {
                                           column.Bound(model => model._NotificationType);
                                           column.Bound(model => model.API);
                                           column.Bound(model => model._Username);
                                           column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd}");
                                           column.Bound(model => model._ModifiedBy);
                                           column.Bound(model => model._Company);
                                           column.Command(command =>
                                               {
                                                   command.Edit().ButtonType(GridButtonType.Image).Text("Edit");
                                                   command.Delete().ButtonType(GridButtonType.Image).Text("Remove");
                                               }).Title("").Width(125);
                                       })
                                       .DataBinding(db => 
                                           {
                                               db.Ajax()
                                                    .Select("_ListUserNotifications", "Notification")
                                                    .Insert("_InsertUserNotification", "Notification")
                                                    .Update("_UpdateUserNotification", "Notification")
                                                    .Delete("_RemoveUserNotification", "Notification");
                                           })
                                       .Pageable(page => page.PageSize(100))
                                       .Sortable()
                                       .Scrollable(scroll => scroll.Height(250))
                                       .Editable(edit => edit.Mode(GridEditMode.PopUp))
                                       .Render();
                               
                       });
               })
            .SelectedIndex(0)
            .Effects(ef => ef.Expand().OpenDuration(500).CloseDuration(500))
            .Render();
    %>


</asp:Content>
