<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.Picker" CodeBehind="Picker.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:radajaxpanel runat="server" id="rapMap">
    <div class="form-group">
        <span class="badge">1</span>
        <asp:Label runat="server" ID="lblWorldMap" AssociatedControlID="imWorld" Text="Select a world region" />
        <div id="divMap">
            <asp:ImageMap runat="server" ID="imWorld" ImageUrl="maps/world.png" OnClick="imWorld_Click" ClientIDMode="Static" Width="100%" Height="100%" />
        </div>
    </div>

    <div class="form-group">
        <span class="badge">2</span>
        <asp:Label runat="server" ID="lblForeignPort" AssociatedControlID="ddlForeignPort" Text="Select a port" />
        <asp:DropDownList runat="server" ID="ddlForeignPort" ClientIDMode="Static" CssClass="form-control" Enabled="false" />
    </div>

    <div class="form-group">
        <span class="badge">3</span>
        <asp:Label runat="server" ID="lblDomesticcCity" AssociatedControlID="ddlDomesticCity" Text="Select a U.S. city" />
        <asp:DropDownList runat="server" ID="ddlDomesticCity" ClientIDMode="Static" CssClass="form-control" />
    </div>

    <p>
        <asp:LinkButton runat="server" ID="lbSelect" Text="Show Services" CssClass="btn btn-primary" OnClick="lbSelect_Click" />
    </p>

    <p>
        <asp:HyperLink runat="server" ID="hypServices" Text="Show all services" /> | <asp:HyperLink runat="server" ID="hypCarriers" Text="Show all carriers" />
     </p>

    <asp:HiddenField runat="server" ID="hdnRegion" ClientIDMode="Static" />

    <telerik:RadCodeBlock runat="server" ID="rcb">
        <script>

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

            function EndRequestHandler(sender, args) {
                setupMapModule();
            }

            function setupMapModule() {

                $('#imWorld').mapster(
                    {
                        fillColor: 'fff000',
                        fillOpacity: 0.3,
                        clickNavigate: true,
                        mapKey: 'title'
                    }
                );
                var region = $('#hdnRegion');
                var region_name = region.val();

                if (region_name != '') {
                    $('#imWorld').mapster('set', true, region_name, { fillColor: '00ff00' });
                }
            }

            $(function () {
                //alert('ready');
                setupMapModule();

            });

        </script>
        <asp:Literal runat="server" ID="litScript"></asp:Literal>

    </telerik:RadCodeBlock>
</telerik:radajaxpanel>

