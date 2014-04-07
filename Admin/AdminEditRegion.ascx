<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminEditRegion.ascx.cs" Inherits="Realm.GPA.GCS.AdminEditRegion" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>

<h2>Edit Region</h2>

<div class="dnnForm">

    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="BulletList" HeaderText="Please correct the following:" CssClass="dnnFormValidationSummary" ValidationGroup="edit_item" />

    <fieldset>

        <div class="dnnFormItem">
            <dnn:label id="lblName" runat="server" text="Name:" controlname="txtName" helptext="Enter the name of the port." CssClass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtName" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valName" ControlToValidate="txtName" Display="None" ErrorMessage="Name is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblX" runat="server" text="X Coord:" controlname="txtX" helptext="Enter the X coord of the region." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtX" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="0" />
            <asp:RequiredFieldValidator runat="server" ID="valX" ControlToValidate="txtX" Display="None" ErrorMessage="X Coord is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblY" runat="server" text="Y Coord:" controlname="txtY" helptext="Enter the Y coord of the region." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtY" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="0" />
            <asp:RequiredFieldValidator runat="server" ID="valY" ControlToValidate="txtY" Display="None" ErrorMessage="Y Coord is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblRadius" runat="server" text="Radius:" controlname="txtRadius" helptext="Enter the radius of the region." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtRadius" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="1" />
            <asp:RequiredFieldValidator runat="server" ID="valRadius" ControlToValidate="txtRadius" Display="None" ErrorMessage="Radius is required" ValidationGroup="edit_item" />
        </div>           
        
        <div class="dnnFormItem">
            <dnn:label id="lblDomestic" runat="server" text="Domestic:" controlname="cbDomestic" helptext="Check to indicate the region is domestic" CssClass="dnnRequired" />
            <asp:checkbox runat="server" ID="cbDomestic" CssClass="dnnRequired" />            
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
