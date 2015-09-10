<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AnimalView>" %>
<%@ Import Namespace="Wetu_GUI" %>
<%@ Import Namespace="Wetu_GUI.Models" %>
<%@ Import Namespace="Wetu_GUI.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Herd Management
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    - Herd Management <%: Html.DisplayFor(m => m.TagNumber) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function FatherWindow() {
            var window = $('#ParentWindow').data('tWindow');
            
            window.title("Add Father");
            window.ajaxRequest("/Herd/_FatherAdd", { id: $('#AnimalId').val() });
            window.center();
            window.open();
        }

        function MotherWindow() {
            var window = $('#ParentWindow').data('tWindow');            
            window.title("Add Mother");
            window.ajaxRequest("/Herd/_MotherAdd", { id: $('#AnimalId').val() });
            window.center();
            window.open();
        }

        function PublicWindow() {
            var window = $('#RegistrarWindow').data('tWindow');
            window.ajaxRequest("/Herd/_AddPublic", { id: $('#AnimalId').val() });
            window.center();
            window.open();
        }
    </script>

    <% Html.Telerik().Window()
            .Name("ParentWindow")
            .Modal(true)
            .Title("Add Parent")
            .Content("<strong>Hello world!</strong>")
            .Visible(false)
            .Resizable()
            .Draggable(true)
            .Render();
    %>

    <% Html.Telerik().Window()
            .Name("RegistrarWindow")
            .Modal(true)
            .Title("Add to Public Registrar")
            .Content("<strong>Hello world!</strong>")
            .Visible(false)
            .Resizable()
            .Draggable(true)
            .Render();
    %>

    <%: Html.HiddenFor(m => m.AnimalId) %>

    <% Html.Telerik().TabStrip()
           .Name("AnimalTabs")
           .Items(item => 
               {
                   item.Add()
                       .Text("Basic Info")
                       .Content(() =>
                       {
                           %>                           
                            <table>
                                <tr>
                                    <td style="width:40%; vertical-align:top">
                                        <h1 style="text-decoration:underline; padding:0; margin:0px 0px 0px 5px;"><%: Html.DisplayFor(m => m.DecriptiveName)%> - <%: Html.DisplayFor(m => m.TagNumber)%></h1>
                                        <i style="margin:0px 0px 0px 5px;"><%: Html.DisplayFor(m => m._AnimalType) %></i>
                                    </td>
                                    <td style="width:40%; vertical-align:top">
                                        <h1 style="text-decoration:underline; padding:0; margin:0px 0px 0px 5px;">Heritage</h1>
                                    </td>
                                    <td style="vertical-align:top">
                                        <h1 style="text-decoration:underline; padding:0; margin:0px 0px 0px 5px;">System Log</h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top">
                                        <table style="padding:0; margin:0; border-style:none">
                                            <tr>
                                                <td><%: Html.LabelFor(m => m.BirthDate) %>:</td>
                                                <td><%: Html.DisplayFor(m => m.BirthDate)%></td>
                                            </tr>
                                            <tr>
                                                <td><%: Html.LabelFor(m => m.Age) %>:</td>
                                                <td><%: Html.DisplayFor(m => m.Age)%></td>
                                            </tr>
                                            <tr>
                                                <td><%: Html.LabelFor(m => m._Sex) %>:</td>
                                                <td><%: Html.DisplayFor(m => m._Sex)%></td>
                                            </tr>
                                            <tr>
                                                <td><%: Html.LabelFor(m => m._Address) %>:</td>
                                                <td><%: Html.DisplayFor(m => m._Address)%></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="vertical-align:top">
                                        <table style="padding:0; margin:0; border-style:none">
                                            <tr>
                                                <td>Father:</td>
                                                <td><% if(Model.MaleParent == null)
                                                       { %> <button id="AddFather" onclick="FatherWindow()" class="t-button">Add</button>
                                                    <% } else { %>
                                                    <%: Html.ActionLink(Model.MaleParent.DecriptiveName + " - " 
                                                                + Model.MaleParent.TagNumber, "Tag"
                                                                , new { id = Model.MaleParent.AnimalId } )%>
                                                <% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Mother:</td>
                                                <td><% if(Model.FemaleParent == null)
                                                       { %> <button id="AddMother" onclick="MotherWindow()" class="t-button">Add</button>
                                                    <% } else { %>
                                                    <%: Html.ActionLink(Model.FemaleParent.DecriptiveName + " - " 
                                                                + Model.FemaleParent.TagNumber, "Tag"
                                                                , new { id = Model.FemaleParent.AnimalId } )%>
                                                <% } %>
                                                </td>
                                            </tr>
                                            <% if(Model._Sex.Equals("Male"))
                                               { %>
                                            <tr>
                                                <td>Public Registrar:</td>
                                                <td>
                                                    <% if(Model.PublicRegistrar.Equals(""))
                                                       { %> <button id="AddPublicRegistrar" onclick="PublicWindow()" class="t-button">Add</button> 
                                                    <% } else { %>
                                                    <%: Html.DisplayFor(m => m.PublicRegistrar) %>
                                                <% } %>
                                                                                                       
                                                </td>
                                            </tr>
                                            <% } %>
                                        </table>
                                    </td>
                                    <td style="vertical-align:top"> 
                                        <table style="padding:0; margin:0; border-style:none">
                                            <tr>
                                                <td><%: Html.LabelFor(m => m.CreatedDate) %>:</td>
                                                <td><%: Html.DisplayFor(m => m.CreatedDate)%></td>
                                            </tr>
                                            <tr>
                                                <td><%: Html.LabelFor(m => m.ModifiedDate) %>:</td>
                                                <td><%: Html.DisplayFor(m => m.ModifiedDate)%></td>
                                            </tr>
                                            <tr>
                                                <td><%: Html.LabelFor(m => m._ModifiedBy) %>:</td>
                                                <td><%: Html.DisplayFor(m => m._ModifiedBy)%></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>                                
                           <%
                       });
                       
                   item.Add()
                       .Text("Relationships")
                       .Content(() =>
                       {
                           %> 
                                <table>
                                    <tr>
                                        <td style="width:20%; vertical-align:top">
                                            <fieldset style="border:solid 1px #fff">
                                                <legend>Social Group</legend>
                                                <table style="padding:5px; margin-top:10px;  border-style:none">
                                                    <% if(Model.LifetimeSocialGroup.Count > 0)
                                                       { %>
                                                    <tr>
                                                        <td>Most Contact</td>
                                                        <td><%: Html.ActionLink(Model.LifetimeSocialGroup[0].DecriptiveName + " - " 
                                                                + Model.LifetimeSocialGroup[0].TagNumber, "Tag"
                                                                , new { id = Model.LifetimeSocialGroup[0].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.LifetimeSocialGroup.Count > 1)
                                                       { %>
                                                    <tr>
                                                        <td>Second</td>
                                                        <td><%: Html.ActionLink(Model.LifetimeSocialGroup[1].DecriptiveName + " - " 
                                                                + Model.LifetimeSocialGroup[1].TagNumber, "Tag"
                                                                , new { id = Model.LifetimeSocialGroup[1].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.LifetimeSocialGroup.Count > 2)
                                                       { %>
                                                    <tr>
                                                        <td>Third</td>
                                                        <td><%: Html.ActionLink(Model.LifetimeSocialGroup[2].DecriptiveName + " - " 
                                                                + Model.LifetimeSocialGroup[2].TagNumber, "Tag"
                                                                , new { id = Model.LifetimeSocialGroup[2].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.LifetimeSocialGroup.Count > 3)
                                                       { %>
                                                    <tr>
                                                        <td>Forth</td>
                                                        <td><%: Html.ActionLink(Model.LifetimeSocialGroup[3].DecriptiveName + " - " 
                                                                + Model.LifetimeSocialGroup[3].TagNumber, "Tag"
                                                                , new { id = Model.LifetimeSocialGroup[3].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.LifetimeSocialGroup.Count > 4)
                                                       { %>
                                                    <tr>
                                                        <td>Fifth</td>
                                                        <td><%: Html.ActionLink(Model.LifetimeSocialGroup[4].DecriptiveName + " - " 
                                                                + Model.LifetimeSocialGroup[4].TagNumber, "Tag"
                                                                , new { id = Model.LifetimeSocialGroup[4].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                </table>
                                            </fieldset>                                              
                                        </td>
                                        <td style="width:20%; vertical-align:top">
                                            <fieldset style="border:solid 1px #fff">
                                                <legend>Last Social Group</legend>
                                                <table style="padding:5px; margin-top:10px;  border-style:none">
                                                     <% if(Model.RecentSocialGroup.Count > 0)
                                                       { %>
                                                    <tr>
                                                        <td>Most Contact</td>
                                                        <td><%: Html.ActionLink(Model.RecentSocialGroup[0].DecriptiveName + " - " 
                                                                + Model.RecentSocialGroup[0].TagNumber, "Tag"
                                                                , new { id = Model.RecentSocialGroup[0].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.RecentSocialGroup.Count > 1)
                                                       { %>
                                                    <tr>
                                                        <td>Second</td>
                                                        <td><%: Html.ActionLink(Model.RecentSocialGroup[1].DecriptiveName + " - " 
                                                                + Model.RecentSocialGroup[1].TagNumber, "Tag"
                                                                , new { id = Model.RecentSocialGroup[1].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.RecentSocialGroup.Count > 2)
                                                       { %>
                                                    <tr>
                                                        <td>Third</td>
                                                        <td><%: Html.ActionLink(Model.RecentSocialGroup[2].DecriptiveName + " - " 
                                                                + Model.RecentSocialGroup[2].TagNumber, "Tag"
                                                                , new { id = Model.RecentSocialGroup[2].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.RecentSocialGroup.Count > 3)
                                                       { %>
                                                    <tr>
                                                        <td>Forth</td>
                                                        <td><%: Html.ActionLink(Model.RecentSocialGroup[3].DecriptiveName + " - " 
                                                                + Model.RecentSocialGroup[3].TagNumber, "Tag"
                                                                , new { id = Model.RecentSocialGroup[3].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                    <% if(Model.RecentSocialGroup.Count > 4)
                                                       { %>
                                                    <tr>
                                                        <td>Fifth</td>
                                                        <td><%: Html.ActionLink(Model.RecentSocialGroup[4].DecriptiveName + " - " 
                                                                + Model.RecentSocialGroup[4].TagNumber, "Tag"
                                                                , new { id = Model.RecentSocialGroup[4].AnimalId } )%></td>
                                                    </tr>
                                                    <% } %>
                                                </table>
                                            </fieldset> 
                                        </td>
                                        <td style="width:30%; vertical-align:top">
                                            <fieldset style="border:solid 1px #fff">
                                                <legend>Interactions</legend>
                                                <table style="padding:5px; margin-top:10px;  border-style:none">
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.AverageNumberInteractions) %></td>
                                                        <td><%: Html.DisplayFor(m => m.AverageNumberInteractions) %> interactions</td> 
                                                    </tr>
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.RecentNumberInteractions) %></td>
                                                        <td><%: Html.DisplayFor(m => m.RecentNumberInteractions) %> interactions</td> 
                                                    </tr>
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.AverageLengthInteractions) %></td>
                                                        <td><%: Html.DisplayFor(m => m.AverageLengthInteractions) %> seconds</td> 
                                                    </tr>                                                    
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.RecentLengthInteractions) %></td>
                                                        <td><%: Html.DisplayFor(m => m.RecentLengthInteractions) %> seconds</td> 
                                                    </tr>
                                                </table>
                                            </fieldset> 
                                        </td>

                                        <% if(Model._Sex.Equals("Female")) {%>
                                        <td style="vertical-align:top">
                                            <fieldset style="border:solid 1px #fff">
                                                <legend>Estrous Behaviour</legend>
                                                <table style="padding:5px; margin-top:10px;  border-style:none">
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.ChangeSocial) %></td>
                                                        <td><% if(Model.ChangeSocial)
                                                               { %>
                                                                Yes
                                                            <% } else { %>
                                                                No
                                                            <% } %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.ChangeInteractions) %></td>
                                                        <td><% if (Model.ChangeInteractions)
                                                               { %>
                                                                Yes
                                                            <% } else { %>
                                                                No
                                                            <% } %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.ChangeLengthInteractions) %></td>
                                                        <td><% if (Model.ChangeLengthInteractions)
                                                               { %>
                                                                Yes
                                                            <% } else { %>
                                                                No
                                                            <% } %>
                                                        </td> 
                                                    </tr>
                                                    <tr>
                                                        <td><%: Html.LabelFor(m => m.ShowingEstrousBehaviour) %></td>
                                                        <td><% if(Model.ShowingEstrousBehaviour)
                                                               { %>
                                                                Yes
                                                            <% } else { %>
                                                                No
                                                            <% } %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset> 
                                        </td>
                                        <% } %>
                                    </tr>
                                </table>
                           <%
                       });
                       
                       item.Add()
                       .Text("Family Tree")
                       .Content(() =>
                       {
                           %> 
                                <table>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>Generation 0</td>
                                                </tr>
                                                <tr>
                                                     <td>Current: <%: Html.ActionLink(Model.Family.AnimalId.ToString(), "Tag", new { id = Model.Family.AnimalId } )%></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>Generation 1</td>
                                                </tr>
                                                <tr>
                                                    <td>Father: <%: Html.ActionLink(Model.Family.MaleParentId.ToString(), "Tag", new { id = Model.Family.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother: <%: Html.ActionLink(Model.Family.FemaleParentId.ToString(), "Tag", new { id = Model.Family.FemaleParentId } )%></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>Generation 2</td>
                                                </tr>
                                                <tr>
                                                    <td>Father's Father:  <%: Html.ActionLink(Model.Family.FatherParents.MaleParentId.ToString(), "Tag", new { id = Model.Family.FatherParents.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Father's Mother: <%: Html.ActionLink(Model.Family.FatherParents.FemaleParentId.ToString(), "Tag", new { id = Model.Family.FatherParents.FemaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother's Father: <%: Html.ActionLink(Model.Family.MotherParents.MaleParentId.ToString(), "Tag", new { id = Model.Family.MotherParents.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother's Mother: <%: Html.ActionLink(Model.Family.MotherParents.FemaleParentId.ToString(), "Tag", new { id = Model.Family.MotherParents.FemaleParentId } )%></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>Generation 3</td>
                                                </tr>
                                                <tr>
                                                    <td>Father's father's Father: <%: Html.ActionLink(Model.Family.FatherParents.FatherParents.MaleParentId.ToString(), "Tag", new { id = Model.Family.FatherParents.FatherParents.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Father's father's Mother: <%: Html.ActionLink(Model.Family.FatherParents.FatherParents.FemaleParentId.ToString(), "Tag", new { id = Model.Family.FatherParents.FatherParents.FemaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Father's mother's Father: <%: Html.ActionLink(Model.Family.FatherParents.MotherParents.MaleParentId.ToString(), "Tag", new { id = Model.Family.FatherParents.MotherParents.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Father's mother's Mother: <%: Html.ActionLink(Model.Family.FatherParents.MotherParents.FemaleParentId.ToString(), "Tag", new { id = Model.Family.FatherParents.MotherParents.FemaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother's father's Father: <%: Html.ActionLink(Model.Family.MotherParents.FatherParents.MaleParentId.ToString(), "Tag", new { id = Model.Family.MotherParents.FatherParents.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother's father's Mother: <%: Html.ActionLink(Model.Family.MotherParents.FatherParents.FemaleParentId.ToString(), "Tag", new { id = Model.Family.MotherParents.FatherParents.FemaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother's mother's Father: <%: Html.ActionLink(Model.Family.MotherParents.MotherParents.MaleParentId.ToString(), "Tag", new { id = Model.Family.MotherParents.MotherParents.MaleParentId } )%></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother's mother's Mother: <%: Html.ActionLink(Model.Family.MotherParents.MotherParents.FemaleParentId.ToString(), "Tag", new { id = Model.Family.MotherParents.MotherParents.FemaleParentId } )%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                           <%
                       });

                   if (Model._Sex.Equals("Female"))
                   {
                       item.Add()
                       .Text("Birthing History")
                       .Content(() =>
                       {
                           %> 
                                <% Html.Telerik().Grid<BirthHistory>()
                                           .Name("BirthHistoryGrid")
                                           .DataKeys(key =>
                                           {
                                               key.Add(k => k.HistoryId);
                                               key.Add(k => k.FemaleParentId);
                                           })
                                           .ToolBar(command => command.Insert().ButtonType(GridButtonType.ImageAndText).Text("Add Birth"))
                                           .Columns(column =>
                                           {
                                               column.Bound(m => m._BirthType);
                                               column.Bound(m => m._Child).ClientTemplate("<a href=../Tag/<#= ChildId #>><#= _Child #></a>");
                                               column.Bound(m => m._MaleParent).ClientTemplate("<a href=../Tag/<#= MaleParentId #>><#= _MaleParent #></a>");
                                               column.Bound(m => m.TubeId);
                                               column.Bound(m => m.Success);

                                               column.Command(command =>
                                               {
                                                   command.Delete().ButtonType(GridButtonType.Image).Text("Remove");
                                               }).Title("").Width(100);
                                           })
                                           .DataBinding(db =>
                                               {
                                                   db.Ajax()
                                                        .Select("_ListBirthHistories", "Herd", new { AnimalId = Model.AnimalId })
                                                        .Insert("_InsertBirthHistory", "Herd", new { AnimalId = Model.AnimalId })
                                                        .Delete("_RemoveBirthHistory", "Herd", new { AnimalId = Model.AnimalId });
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
                                           .Editable(edit => edit.Mode(GridEditMode.PopUp))
                                           .Render();
                            %>
                           <%
                       });
                       
                       item.Add()
                       .Text("Artificial Insemination")
                       .Content(() =>
                       {
                           %> 
                                <% Html.Telerik().Grid<InseminationHistory>()
                                           .Name("InseminationHistoryGrid")
                                           .Columns(column =>
                                           {
                                               column.Bound(m => m.TubeId);
                                               column.Bound(m => m._AnimalName).ClientTemplate("<a href=../Tag/<#= AnimalId #>><#= _AnimalName #></a>");
                                               column.Bound(m => m.ModifiedDate).Format("{0:yyyy-MM-dd}"); 
                                               column.Bound(m => m._Username);
                                           })
                                           .DataBinding(db => 
                                               {
                                                   db.Ajax()
                                                        .Select("_ListInseminationHistory", "Herd", new { AnimalId = Model.AnimalId });
                                               })
                                           .Pageable(page => page.PageSize(100))
                                           .Sortable()
                                           .Scrollable(scroll => scroll.Height(250))
                                           .Render();
                            %>
                           <%
                       });
                   }
    
               }) 
            .SelectedIndex(0)
            .Effects(ef => ef.Expand().OpenDuration(500).CloseDuration(500))
            .Render();
    %>
</asp:Content>
