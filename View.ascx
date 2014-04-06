<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.View" CodeBehind="View.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadAjaxPanel runat="server" ID="rapMap">

    <div id="divMap">
        <asp:ImageMap runat="server" ID="imWorld" ImageUrl="img/world.png" OnClick="imWorld_Click" ClientIDMode="Static" Width="100%" Height="100%">
        </asp:ImageMap>
    </div>

</telerik:RadAjaxPanel>

<script>

    $(function ($) {
        var setupMap = function () {
            $('#imWorld').mapster(
                {
                    fillColor: 'ff0000',
                    fillOpacity: 0.3,
                    clickNavigate: true,
                    mapKey: 'title',
                    areas: [{
                        key: '300',
                        selected: true,
                        isDeselectable: false
                    }]
                }
            );
        };
        setupMap();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            setupMap();
        });
    });
</script>

