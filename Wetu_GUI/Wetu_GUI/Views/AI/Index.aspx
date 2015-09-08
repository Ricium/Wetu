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
                                           .Columns(column =>
                                           {
                                               column.Bound(model => model.TubeId);
                                               column.Bound(model => model._FromAnimal);
                                               column.Bound(model => model.CreatedDate).Format("{0:yyyy-MM-dd @ HH:mm}");
                                               column.Bound(model => model._User);
                                               column.Bound(model => model.Used);
                                               column.Bound(model => model.Success);           
                                               column.Bound(model => model._UsedOnAnimal);
                                               column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd @ HH:mm}");           
                                               column.Bound(model => model._Company);
                                               
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListInseminationTubes", "AI");
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
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
                                           .Columns(column =>
                                           {
                                               column.Bound(m => m._BirthType);
                                               column.Bound(m => m._Child);
                                               column.Bound(m => m._MaleParent);
                                               column.Bound(m => m.TubeId);
                                               column.Bound(m => m.Success);
                                               column.Bound(model => model.ModifiedDate).Format("{0:yyyy-MM-dd @ HH:mm}");
                                               column.Bound(model => model._Company);
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListBirthHistory", "AI");
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
