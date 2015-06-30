<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminEditService.ascx.cs" Inherits="Realm.GPA.GCS.AdminEditService" %>
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

        var path = args.value[0].getAttribute("src", 2);
        txt.value = path;
        img.src = path;
    }
</script>

<h2>Edit Service</h2>

<div class="dnnForm">

    <asp:ValidationSummary runat="server" ID="valSummary" DisplayMode="BulletList" HeaderText="Please correct the following:" CssClass="dnnFormValidationSummary" ValidationGroup="edit_item" />

    <fieldset>

        <div class="dnnFormItem">
            <dnn:label id="lblName" runat="server" text="Name:" controlname="txtName" helptext="Enter the name of the service." cssclass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtName" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valName" ControlToValidate="txtName" Display="None" ErrorMessage="Name is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblDescription" runat="server" text="Description:" controlname="txtDescription" helptext="Enter the descriptin of the service." cssclass="dnnRequired" />
            <asp:TextBox runat="server" ID="txtDescription" CssClass="dnnRequired" />
            <asp:RequiredFieldValidator runat="server" ID="valDescription" ControlToValidate="txtDescription" Display="None" ErrorMessage="Description is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblLongDescription" runat="server" text="Long Description:" controlname="txtLongDescription" helptext="Enter the long descriptin of the service." cssclass="dnnRequired" />
            <dnn:texteditor runat="server" id="txtLongDescription" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblTurnaroundDays" runat="server" text="Turnaround Days:" controlname="txtTurnaroundDays" helptext="Enter the number of days for turnaround." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtTurnaroundDays" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="1" />
            <asp:RequiredFieldValidator runat="server" ID="valTurnaroundDays" ControlToValidate="txtTurnaroundDays" Display="None" ErrorMessage="Turnaround Days is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblFrequency" runat="server" text="Frequency (days):" controlname="txtFrequency" helptext="Enter the frequency in days for this service." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtFrequency" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="1" />
            <asp:RequiredFieldValidator runat="server" ID="valFrequency" ControlToValidate="txtFrequency" Display="None" ErrorMessage="Frequency is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblNumberOfVessels" runat="server" text="Number of Vessels:" controlname="txtNumberOfVessels" helptext="Enter the number vessels on the service." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtNumberOfVessels" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="1" />
            <asp:RequiredFieldValidator runat="server" ID="valNumberOfVessels" ControlToValidate="txtNumberOfVessels" Display="None" ErrorMessage="Number of Vessels is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblAvgCapacity" runat="server" text="Average Capacity:" controlname="txtAverageCapacity" helptext="Enter the average capacity of vessels on the service." CssClass="dnnRequired" />
            <telerik:RadNumericTextBox runat="server" ID="txtAvgCapacity" NumberFormat-DecimalDigits="0" CssClass="dnnRequired" MinValue="1" />
            <asp:RequiredFieldValidator runat="server" ID="valAvgCapacity" ControlToValidate="txtAvgCapacity" Display="None" ErrorMessage="Average Capacity is required" ValidationGroup="edit_item" />
        </div>

        <div class="dnnFormItem">
            <dnn:Label runat="server" ID="lblImageUrl" text="Image" controlname="txtImage" helptext="Select the image" />
            <asp:TextBox runat="server" ID="txtImageUrl" />
            <a onclick="$find('<%= doImageURL.ClientID %>').open('ImageManager', {CssClasses: []}); return false;" class="imageManager" title="Open Image Manager">Open Image Manager</a>
            <asp:RequiredFieldValidator runat="server" ID="valImageUrl" ControlToValidate="txtImageURL" ErrorMessage="ImageURL is required" Display="none" />
            <telerik:RadDialogOpener runat="server" ID="doImageURL" HandlerUrl="Telerik.Web.UI.DialogHandler.aspx" Style="display: none;" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label runat="server" ID="lblImagePreview" text="Image Preview" controlname="imgImageUrl" helptext="Preview of the selected image" />
            <asp:Image runat="server" ID="imgImageUrl" />
        </div>

        <asp:Panel runat="server" ID="pnlCarriers">
            <h3>Service Carriers</h3>
            <telerik:RadGrid ID="gvListCarriers" runat="server" AutoGenerateColumns="False" OnNeedDataSource="gvListCarriers_NeedDataSource" Width="100%" OnDeleteCommand="gvListCarriers_DeleteCommand" OnInsertCommand="gvListCarriers_InsertCommand" Skin="Metro">
                <MasterTableView DataKeyNames="id" CommandItemDisplay="Top">
                    <CommandItemSettings ShowAddNewRecordButton="true" ShowRefreshButton="false" />
                    <Columns>
                        <telerik:GridDropDownColumn HeaderText="Carrier Name" DataSourceID="ldsCarriers" DataField="id" ListTextField="name" ListValueField="id" />
                        <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this item?" ButtonType="ImageButton" CommandName="Delete" ItemStyle-Width="1%" />
                    </Columns>
                    <PagerStyle AlwaysVisible="True" Position="TopAndBottom" />
                    <EditFormSettings>
                        <EditColumn ButtonType="ImageButton" />
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlPorts">
            <h3>Service Ports</h3>
            <telerik:RadAjaxPanel runat="server" ID="rapPorts">
                <telerik:RadGrid ID="gvListPorts" runat="server" AutoGenerateColumns="False" OnNeedDataSource="gvListPorts_NeedDataSource" Width="100%" OnDeleteCommand="gvListPorts_DeleteCommand" OnUpdateCommand="gvListPorts_UpdateCommand" OnInsertCommand="gvListPorts_InsertCommand" Skin="Metro" OnRowDrop="gvListPorts_RowDrop">
                    <MasterTableView DataKeyNames="id" CommandItemDisplay="Top" EditMode="InPlace">
                        <CommandItemSettings ShowAddNewRecordButton="true" ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridDragDropColumn ItemStyle-Width="1%" DragImageUrl="~/DesktopModules/Realm.GPA.GCS/img/dragdrop.png" />
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="1%" ItemStyle-Wrap="false" />
                            <telerik:GridDropDownColumn HeaderText="Port Name" DataSourceID="ldsPorts" DataField="port_id" ListTextField="name" ListValueField="id" />
                            <telerik:GridNumericColumn HeaderText="Days to next port" DataField="days_to_next_port" NumericType="Number" DecimalDigits="0" />
                            <telerik:GridNumericColumn HeaderText="Days to Savannah" DataField="days_to_savannah" NumericType="Number" DecimalDigits="0" />
                            <telerik:GridNumericColumn HeaderText="Days from Savannah" DataField="days_from_savannah" NumericType="Number" DecimalDigits="0" />
                            <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this item?" ButtonType="ImageButton" CommandName="Delete" ItemStyle-Width="1%" />
                        </Columns>
                        <PagerStyle AlwaysVisible="True" Position="TopAndBottom" />
                        <EditFormSettings>
                            <EditColumn ButtonType="ImageButton" />
                        </EditFormSettings>
                    </MasterTableView>
                    <ClientSettings AllowRowsDragDrop="True">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                </telerik:RadGrid>
            </telerik:RadAjaxPanel>
        </asp:Panel>

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

<asp:LinqDataSource runat="server" ID="ldsCarriers" ContextTypeName="Realm.GPA.GCS.DAL.DataContext" EntityTypeName="" TableName="Realm_GPA_GCS_Carriers" OrderBy="name" Select="new (id, name)" />
<asp:LinqDataSource runat="server" ID="ldsPorts" ContextTypeName="Realm.GPA.GCS.DAL.DataContext" EntityTypeName="" TableName="Realm_GPA_GCS_Ports" OrderBy="name" Select="new (id, name)" />

