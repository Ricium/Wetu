<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Device Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.Telerik().Grid<Device>()
       .Name("DeviceGrid")
       .DataKeys(key => key.Add(k => k.DeviceId))
       //.ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Device"))
       .Columns(column =>
       {
           column.Bound(model => model.Address);
           /*column.Command(command =>
               {
                   command.Edit().ButtonType(GridButtonType.ImageAndText).Text("Edit");
                   command.Delete().ButtonType(GridButtonType.ImageAndText).Text("Remove");
               }).Title("").Width(100);*/
       })
       .DataBinding(db => 
           {
               /*db.Ajax()
                    .Select("_ListAnimalTypes", "Maintenance")
                    .Insert("_InsertAnimalType", "Maintenance")
                    .Update("_UpdateAnimalType", "Maintenance")
                    .Delete("_RemoveAnimalType", "Maintenance");*/
           })
       .Pageable(page => page.PageSize(100))
       .Sortable()
       .Scrollable(scroll => scroll.Height(250))
       .Editable(edit => edit.Mode(GridEditMode.PopUp))
       .Render();
%>
</asp:Content>
