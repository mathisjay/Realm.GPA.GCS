<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.CarriersAll" CodeBehind="CarriersAll.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<h3>
    <i class="fa fa-anchor"></i>&nbsp;All Carriers
    <asp:Label runat="server" ID="lblCarrierCount" CssClass="badge" />
</h3>

<hr />

<div class="row">
    <div class="col-sm-12">

        <asp:Repeater runat="server" ID="rptCarriers" OnItemDataBound="rptCarriers_ItemDataBound">
            <ItemTemplate>
                <asp:HyperLink ID="hypCarrier" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("website_url") %>' Target="_blank" />
                <asp:Repeater runat="server" ID="rptServices">
                    <HeaderTemplate>
                        <div>
                            <strong>Carrier Services</strong>
                            <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="hypService" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + Eval("id").ToString()) %>' />
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>

    </div>
</div>
