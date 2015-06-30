<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.CarrierImages" CodeBehind="CarrierImages.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="row">
    <asp:Repeater runat="server" ID="rptCarriers">
        <ItemTemplate>
            <a data-title='<%# Eval("Realm_GPA_GCS_Carrier.name") %>' data-toggle="lightbox" href='<%# Eval("image_url") %>' class="col-sm-3">
                <img src='<%# Eval("image_url") %>' class="img-responsive" />
            </a>
        </ItemTemplate>
    </asp:Repeater>
</div>

<script>
    $(document).delegate('*[data-toggle="lightbox"]', 'click', function (event) { event.preventDefault(); $(this).ekkoLightbox(); });
</script>
