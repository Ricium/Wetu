<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Artificial Insemination
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    - Artificial Insemination
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.Telerik().TabStrip()
           .Name("TubeTab")
           .Items(item => 
               {
                   item.Add()
                       .Text("Insemination Tubes")                       
                       .Content(() =>
                       {
                           %>
                           <% Html.Telerik().Grid<InseminationTube>()
                                           .Name("TubeGrid")
                                           .DataKeys(key => key.Add(k => k.TubeId))
                                           .ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Insemination Tube"))
                                           .Columns(column =>
                                           {
                                               column.Bound(model => model.TubeId);
                                               column.Bound(model => model._FromAnimal).ClientTemplate("<a href=../Herd/Tag/<#= AnimalFromId #>><#= _FromAnimal #></a>");
                                               column.Bound(model => model.CreatedDate).Format("{0:yyyy-MM-dd @ HH:mm}");
                                               column.Bound(model => model._User);
                                               column.Bound(model => model.Used);
                                               column.Bound(model => model.Success);
                                               column.Bound(model => model._UsedOnAnimal).ClientTemplate("<a href=../Herd/Tag/<#= AnimalUsedId #>><#= _UsedOnAnimal #></a>");
                                               column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd @ HH:mm}");           
                                               column.Bound(model => model._Company);
                                               column.Command(command =>
                                               {
                                                   command.Edit().ButtonType(GridButtonType.Image).Text("Edit");
                                                   command.Delete().ButtonType(GridButtonType.Image).Text("Remove");
                                               }).Title("").Width(100);
                                               
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListInseminationTubes", "AI")
                                                        .Insert("_InsertTube", "AI")
                                                        .Update("_UpdateTube", "AI")
                                                        .Delete("_RemoveTube", "AI");
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
                                           .Editable(edit => edit.Mode(GridEditMode.PopUp))
                                           .Render();
                        %><%
                       });
                       
                   item.Add()
                       .Text("Birth History")
                       .Content(() =>
                       {
                           %> 
                           <% Html.Telerik().Grid<BirthHistory>()
                                           .Name("HistoryGrid")
                                           .DataKeys(key => key.Add(k => k.HistoryId))
                                           .ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Birth"))
                                           .Columns(column =>
                                           {
                                               column.Bound(m => m._BirthType);
                                               column.Bound(m => m._FemaleParent).ClientTemplate("<a href=../Herd/Tag/<#= FemaleParentId #>><#= _FemaleParent #></a>");
                                               column.Bound(m => m._Child).ClientTemplate("<a href=../Herd/Tag/<#= ChildId #>><#= _Child #></a>");
                                               column.Bound(m => m._MaleParent).ClientTemplate("<a href=../Herd/Tag/<#= MaleParentId #>><#= _MaleParent #></a>");
                                               column.Bound(m => m.TubeId);
                                               column.Bound(m => m.Success);
                                               column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd @ HH:mm}");
                                               column.Bound(model => model._Company);

                                               column.Command(command =>
                                               {
                                                   command.Edit().ButtonType(GridButtonType.Image).Text("Edit");
                                                   command.Delete().ButtonType(GridButtonType.Image).Text("Remove");
                                               }).Title("").Width(100);
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListBirthHistory", "AI")
                                                        .Insert("_InsertBirthHistory", "AI")
                                                        .Update("_UpdateBirthHistory", "AI")
                                                        .Delete("_RemoveBirthHistory", "AI");
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
                                           .Editable(edit => edit.Mode(GridEditMode.PopUp))
                                           .Render();
                            %><%
                       });
             }) 
           .SelectedIndex(0)
           .Effects(ef => ef.Expand().OpenDuration(500).CloseDuration(500))
           .Render();%>
</asp:Content>
