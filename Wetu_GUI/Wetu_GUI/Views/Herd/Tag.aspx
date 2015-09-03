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

        function SubmitParentForm() {
            var parentForm = $('#ParentForm').serialize();
            
            $.ajax(
            {
                url: '/Herd/_AddParent',
                type: "POST",
                data: parentForm,
                dataType: "json",                
                success: function (data) {
                    alert("Good");
                },
                error: function (data) {
                    alert(data);
                }
            });

            var window = $('#ParentWindow').data('tWindow');
            window.close();
            location.reload();
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
                                                       { %> <button id="AddFather" onclick="FatherWindow()">Add</button>
                                                    <% } else { %>
                                                    Luke I am your Father
                                                    <% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Mother:</td>
                                                <td><% if(Model.FemaleParent == null)
                                                       { %> <button id="AddMother" onclick="MotherWindow()">Add</button>
                                                    <% } else { %>
                                                    Luke I am your Mother
                                                    <% } %>
                                                </td>
                                            </tr>
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
                                    </tr>
                                </table>
                           <%
                       });
               }) 
            .SelectedIndex(0)
            .Effects(ef => ef.Expand().OpenDuration(500).CloseDuration(500))
            .Render();
    %>
</asp:Content>
