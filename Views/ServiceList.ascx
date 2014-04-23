<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.ServiceList" CodeBehind="ServiceList.ascx.cs" %>

<asp:HyperLink runat="server" ID="hypSwitch" Text="Switch Direction" />
<h2>
    <asp:Literal runat="server" ID="litStart" />
    to
    <asp:Literal runat="server" ID="litEnd" />
</h2>

<div class="row">
    <div class="col-sm-9">
        <asp:Literal runat="server" ID="litWorldPath" />
        <asp:Repeater runat="server" ID="rptServices">
            <ItemTemplate>
                <div class="row">
                    <div class="col-sm-3">
                        <asp:HyperLink runat="server" ID="hypName" CssClass="btn btn-default" Text='<%# Eval("name") %>' NavigateUrl='<%# DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + Eval("id").ToString(), "world_port="+ world_port , "us_city=" + us_city, "direction=" + direction ) %>' />
                    </div>
                    <div class="col-sm-6">
                        <asp:Literal ID="litDescription" runat="server" Text='<%# Eval("description") %>' />
                        <br />
                        <asp:HyperLink ID="hypReadMore" runat="server" Text="more info >" NavigateUrl='<%# DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + Eval("id").ToString(), "world_port="+ world_port , "us_city=" + us_city, "direction=" + direction ) %>' />
                    </div>
                    <div class="col-sm-3">
                        <span class="badge">
                            <asp:Literal ID="litTransitTime" runat="server" Text='<%# Eval("transit_time") %>' />
                            days
                        </span>
                    </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>
        <asp:Panel runat="server" ID="pnlNoService" CssClass="alert alert-warning">
            <strong>No services available for this port.</strong>
        </asp:Panel>
    </div>
    <div class="col-sm-3">
        <asp:Literal runat="server" ID="litDomesticPath" />
        <div class="btn btn-warning">
            <asp:Literal runat="server" ID="litByTruck" />
        </div>
        <div class="btn btn-info">
            <asp:Literal runat="server" ID="litByRail" />
        </div>
    </div>
</div>
