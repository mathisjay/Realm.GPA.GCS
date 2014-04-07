<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminEditUSCity.ascx.cs" Inherits="Realm.GPA.GCS.AdminEditUSCity" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>

<h2>Edit US City</h2>

<div class="dnnForm">

    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="BulletList" HeaderText="Please correct the following:" CssClass="dnnFormValidationSummary" ValidationGroup="edit_item" />

    <fieldset>

        <div class="dnnFormItem">
            <dnn:label id="lblName" runat="server" text="Name:" controlname="txtName" helptext="Enter the name of the port." CssClass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtName" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valName" ControlToValidate="txtName" Display="None" ErrorMessage="Name is required" ValidationGroup="edit_item" />
        </div>
        
        <div class="dnnFormItem">
            <dnn:label id="lblTruckTimeFrom" runat="server" text="Truck Time From:" controlname="txtTruckTimeFrom" helptext="Enter the truck time form Savannah for this city." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtTruckTimeFrom" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="0" />
            <asp:RequiredFieldValidator runat="server" ID="valTruckTimeFrom" ControlToValidate="txtTruckTimeFrom" Display="None" ErrorMessage="Truck Time From is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblTruckTimeTo" runat="server" text="Truck Time To:" controlname="txtTruckTimeTo" helptext="Enter the truck time to Savannah for this city." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtTruckTimeTo" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="0" />
            <asp:RequiredFieldValidator runat="server" ID="valTruckTimeTo" ControlToValidate="txtTruckTimeTo" Display="None" ErrorMessage="Truck Time To is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblRailTimeFrom" runat="server" text="Rail Time From:" controlname="txtRailTimeFrom" helptext="Enter the rail time from Savannah for this cicty." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtRailTimeFrom" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="0" />
            <asp:RequiredFieldValidator runat="server" ID="valRailTimeFrom" ControlToValidate="txtRailTimeFrom" Display="None" ErrorMessage="Rail Time From is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblRailTimeTo" runat="server" text="Rail Time To:" controlname="txtRailTimeTo" helptext="Enter the rail time to Savannah from this city." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtRailTimeTo" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="0" />
            <asp:RequiredFieldValidator runat="server" ID="valRailTimeTo" ControlToValidate="txtRailTimeTo" Display="None" ErrorMessage="Rail Time To is required" ValidationGroup="edit_item" />
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
