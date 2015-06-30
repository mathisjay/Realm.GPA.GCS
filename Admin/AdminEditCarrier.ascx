<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminEditCarrier.ascx.cs" Inherits="Realm.GPA.GCS.AdminEditCarrier" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>

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
            <dnn:label id="lbImages" runat="server" text="Images:" controlname="txtWebsiteURL" helptext="Enter the website URL for the service." />
            <div style="float: left;">

                <telerik:radgrid id="gvList" runat="server" autogeneratecolumns="False" skin="Metro" onneeddatasource="gvList_NeedDataSource" width="100%" oneditcommand="gvList_EditCommand" ondeletecommand="gvList_DeleteCommand" onitemcommand="gvList_ItemCommand">
                    <MasterTableView DataKeyNames="id" CommandItemDisplay="Top">
                        <CommandItemSettings ShowAddNewRecordButton="true" ShowRefreshButton="false"  />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="15px" ItemStyle-Wrap="false" />
                            <telerik:GridImageColumn ImageHeight="50px" DataImageUrlFields="image_url" />
                            <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this item?" ButtonType="ImageButton" CommandName="Delete" ItemStyle-Width="1%" />
                        </Columns>
                        <EditFormSettings>
                            <EditColumn ButtonType="ImageButton" />
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:radgrid>
            </div>
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
