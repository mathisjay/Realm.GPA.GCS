<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.ServiceList" CodeBehind="ServiceList.ascx.cs" %>
<%@ Register Src="~/DesktopModules/Realm.GPA.GCS/Picker.ascx" TagPrefix="uc1" TagName="Picker" %>


<div class="row">
    <div class="col-sm-3">
        <uc1:picker runat="server" id="Picker" />
    </div>
    <div class="col-sm-9">

        <h3>
            <i class="fa fa-globe"></i>&nbsp;<asp:Literal runat="server" ID="litStart" />
            to
    <asp:Literal runat="server" ID="litEnd" />&nbsp;
    <asp:Label runat="server" ID="lblDirection" />
        </h3>

        <i class="fa fa-random"></i>
        <asp:HyperLink runat="server" ID="hypSwitch" Text="Switch Direction" />

        <hr />

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
                <asp:Literal runat="server" ID="litDomesticPath" /><br />

                <span class="by-truck">Truck<br />
                    <asp:Literal runat="server" ID="litByTruck" />
                </span>
                <span class="by-rail">Rail<br />
                    <asp:Literal runat="server" ID="litByRail" />
                </span>

            </div>
        </div>

    </div>
</div>
