<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<% Html.Telerik().Grid<AnimalType>()
       .Name("AnimalTypesGrid")
       .DataKeys(key => key.Add(k => k.AnimalTypeId))
       .ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Species"))
       .Columns(column =>
       {
           column.Bound(model => model.Description);
           column.Command(command =>
               {
                   command.Edit().ButtonType(GridButtonType.ImageAndText).Text("Edit");
                   command.Delete().ButtonType(GridButtonType.ImageAndText).Text("Remove");
               }).Title("").Width(100);
       })
       .DataBinding(db => 
           {
               db.Ajax()
                    .Select("_ListAnimalTypes", "Maintenance")
                    .Insert("_InsertAnimalType", "Maintenance")
                    .Update("_UpdateAnimalType", "Maintenance")
                    .Delete("_RemoveAnimalType", "Maintenance");
           })
       .Pageable(page => page.PageSize(100))
       .Sortable()
       .Scrollable(scroll => scroll.Height(250))
       .Editable(edit => edit.Mode(GridEditMode.PopUp))
       .Render();
%>

