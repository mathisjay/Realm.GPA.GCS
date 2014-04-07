﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminListCarriers.ascx.cs" Inherits="Realm.GPA.GCS.AdminListCarriers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<h2>Carrier List</h2>

<telerik:radajaxpanel runat="server" id="rap">
    <telerik:RadGrid ID="gvList" runat="server" AutoGenerateColumns="False" Skin="Metro"
        OnNeedDataSource="gvList_NeedDataSource" Width="100%" OnEditCommand="gvList_EditCommand" OnDeleteCommand="gvList_DeleteCommand">
        <MasterTableView DataKeyNames="id">
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="15px" ItemStyle-Wrap="false" />
                <telerik:GridBoundColumn HeaderText="Name" DataField="name" />                
                <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this item?" ButtonType="ImageButton" CommandName="Delete" ItemStyle-Width="1%" />
            </Columns>
            <EditFormSettings>
                <EditColumn ButtonType="ImageButton" />
            </EditFormSettings>
            <PagerStyle AlwaysVisible="True" Position="TopAndBottom" />
        </MasterTableView>        
    </telerik:RadGrid>
</telerik:radajaxpanel>

<ul class="dnnActions dnnClear">
    <li>
        <asp:LinkButton runat="server" ID="lbAdd" Text="Add Item" OnClick="lbAdd_Click" CssClass="dnnPrimaryAction" />
    </li>
    <li>
        <asp:LinkButton runat="server" ID="lbReturn" Text="Return" CssClass="dnnSecondaryAction" OnClick="lbReturn_Click" />
    </li>
</ul>