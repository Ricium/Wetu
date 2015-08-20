<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Herd Management
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    - Herd Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% Html.Telerik().Grid<Animal>()
       .Name("AnimalGrid")
       .DataKeys(key => key.Add(k => k.AnimalId))
       .ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Animal"))
       .Columns(column =>
       {
           column.Bound(model => model.AnimalId);
           column.Bound(model => model.DecriptiveName);
           column.Bound(model => model.TagNumber);
           column.Bound(model => model._Address);
           column.Bound(model => model._Sex);
           column.Bound(model => model._AnimalType);
           column.Bound(model => model.BirthDate).Format("{0:yyyy-MM-dd}");
           column.Bound(model => model.CreatedDate).Format("{0:yyyy-MM-dd}");
           column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd}");
           column.Bound(model => model._ModifiedBy);
           column.Bound(model => model._Company);
           column.Command(command =>
               {
                   command.Edit().ButtonType(GridButtonType.Image).Text("Edit");
                   command.Delete().ButtonType(GridButtonType.Image).Text("Remove");
               }).Title("").Width(90);
       })
       .DataBinding(db => 
           {
               db.Ajax()
                    .Select("_ListAnimals", "Herd")
                    .Insert("_InsertAnimal", "Herd")
                    .Update("_UpdateAnimal", "Herd")
                    .Delete("_RemoveAnimal", "Herd");
           })
       .Pageable(page => page.PageSize(100))
       .Sortable()
       .Scrollable(scroll => scroll.Height(250))
       .Editable(edit => edit.Mode(GridEditMode.PopUp))
       .Render();
%>
</asp:Content>
