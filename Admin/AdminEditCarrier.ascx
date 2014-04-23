<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminEditCarrier.ascx.cs" Inherits="Realm.GPA.GCS.AdminEditCarrier" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>

<script type="text/javascript">
    function ImageManagerFunction(sender, args) {
        if (!args) {
            alert('No file was selected!');
            return false;
        }

        var selectedItem = args.get_value();

        var txt = $get('<%= txtImageUrl.ClientID %>');
        var img = $get('<%= imgImageUrl.ClientID %>');

        var path = args.value.getAttribute("src", 2);
        txt.value = path;
        img.src = path;
    }
</script>

<h2>Edit Carrier</h2>

<div class="dnnForm">

    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="BulletList" HeaderText="Please correct the following:" CssClass="dnnFormValidationSummary" ValidationGroup="edit_item" />

    <fieldset>

        <div class="dnnFormItem">
            <dnn:label id="lblName" runat="server" text="Name:" controlname="txtName" helptext="Enter the name of the carrier." cssclass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtName" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valName" ControlToValidate="txtName" Display="None" ErrorMessage="Name is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblWebsiteURL" runat="server" text="Website URL:" controlname="txtWebsiteURL" helptext="Enter the website URL for the service." />
            <asp:TextBox runat="server" ID="txtWebsiteURL" />
        </div>

        <div class="dnnFormItem">
            <dnn:Label runat="server" ID="lblImageUrl" text="Image" controlname="txtImage" helptext="Select the image" />
            <asp:TextBox runat="server" ID="txtImageUrl" />
            <a onclick="$find('<%= doImageURL.ClientID %>').open('ImageManager', {CssClasses: []}); return false;" class="imageManager" title="Open Image Manager">Open Image Manager</a>
            <asp:RequiredFieldValidator runat="server" ID="valImageUrl" ControlToValidate="txtImageURL" ErrorMessage="ImageURL is required" Display="none" />
            <telerik:DialogOpener runat="server" ID="doImageURL" HandlerUrl="Telerik.Web.UI.DialogHandler.aspx" Style="display: none;" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label runat="server" ID="lblImagePreview" text="Image Preview" controlname="imgImageUrl" helptext="Preview of the selected image" />
            <asp:Image runat="server" ID="imgImageUrl" />
        </div>

    </fieldset>

    <ul class="dnnActions dnnClear">
        <li>
            <asp:LinkButton runat="server" ID="lbSave" Text="Save" CssClass="dnnPrimaryAction" OnClick="lbSave_Click" ValidationGroup="edit_item" />
        </li>
        <li>
            <asp:LinkButton runat="server" ID="lbDelete" Text="Delete" CssClass="dnnSecondaryAction" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure you want to delete this item?')" OnClick="lbDelete_Click" />
        </li>
        <li>
            <asp:HyperLink runat="server" ID="hypReturn" Text="Return" CssClass="dnnSecondaryAction" />
        </li>
    </ul>


</div>
