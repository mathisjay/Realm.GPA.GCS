<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminEditPort.ascx.cs" Inherits="Realm.GPA.GCS.AdminEditPort" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>

<h2>Edit Port</h2>

<div class="dnnForm">

    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="BulletList" HeaderText="Please correct the following:" CssClass="dnnFormValidationSummary" ValidationGroup="edit_item" />

    <fieldset>

        <div class="dnnFormItem">
            <dnn:label id="lblName" runat="server" text="Port Name:" controlname="txtName" helptext="Enter the name of the port." CssClass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtName" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valName" ControlToValidate="txtName" Display="None" ErrorMessage="Port Name is required" ValidationGroup="edit_item" />
            <asp:CustomValidator runat="server" ID="valNameDuplicate" ControlToValidate="txtName" Display="None" ErrorMessage="There is already a port with that name" ValidationGroup="edit_item" OnServerValidate="valNameDuplicate_ServerValidate" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblRegion" runat="server" text="Region:" controlname="ddlRegion" helptext="Select the world region for this port." CssClass="dnnRequired" />
            <asp:DropDownList runat="server" ID="ddlRegion" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valRegion" ControlToValidate="ddlRegion" Display="None" ErrorMessage="Region is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblCountry" runat="server" text="Country:" controlname="txtCountry" helptext="Enter the name of the country." cssclass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtCountry" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valCountry" ControlToValidate="txtCountry" Display="None" ErrorMessage="Country is required" ValidationGroup="edit_item" />            
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
