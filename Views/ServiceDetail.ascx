<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.ServiceDetail" CodeBehind="ServiceDetail.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<h3>
    <i class="fa fa-globe"></i>&nbsp;<asp:Literal runat="server" ID="litTitle" />
    &nbsp;
    <asp:Label runat="server" ID="lblDirection" />
</h3>

<asp:Panel runat="server" ID="pnlSwitch">
    <i class="fa fa-random"></i>
    <asp:HyperLink runat="server" ID="hypSwitch" Text="Switch Direction" />
</asp:Panel>

<hr />

<h4>
    <asp:Literal runat="server" ID="litDescription" />
</h4>

<ul class="nav nav-tabs">
    <li class="active"><a href="#overview" data-toggle="tab">Overview</a></li>
    <li><a href="#ports" data-toggle="tab">Service Ports</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="overview">

        <asp:Image runat="server" ID="imMap" CssClass="img-responsive" />

        <div class="row" style="padding: 20px 0;">
            <div class="col-sm-6">
                <asp:Panel runat="server" ID="pnlPortToPort">
                    <div class="row" style="margin-bottom: 20px;">
                        <div class="col-sm-4 text-center">
                            <strong>
                                <asp:Literal runat="server" ID="litWorldPath" />
                            </strong>
                            <div>
                                <span class="by-ship">Ship<br />
                                    <asp:Literal runat="server" ID="litByShip" />
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-8 text-center" style="border-left: solid 1px #ccc;">
                            <strong>
                                <asp:Literal runat="server" ID="litDomesticPath" />
                            </strong>
                            <div>
                                <span class="by-truck">Truck<br />
                                    <asp:Literal runat="server" ID="litByTruck" />
                                </span>
                                <span class="by-rail">Rail<br />
                                    <asp:Literal runat="server" ID="litByRail" />
                                </span>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Literal runat="server" ID="litLongDescription" />
            </div>
            <div class="col-sm-6">
                <h5><i class="fa fa-info-circle"></i>&nbsp;Service Summary</h5>
                <ul class="service-summary">
                    <li>
                        <strong>
                            <asp:Literal runat="server" ID="litTurnaround" /></strong> day turnaround
                    </li>
                    <li>
                        <strong>
                            <asp:Literal runat="server" ID="litFrequency" /></strong> day service
                    </li>
                    <li>
                        <strong>
                            <asp:Literal runat="server" ID="litNumberOfVessels" /></strong> Vessels
                    </li>
                    <li>
                        <strong>
                            <asp:Literal runat="server" ID="litAverageCapacity" /></strong> avg. TEU capacity per vessel
                    </li>
                </ul>

                <hr />

                <asp:Repeater runat="server" ID="rptCarriers">
                    <HeaderTemplate>
                        <h5><i class="fa fa-anchor"></i>&nbsp;Carriers</h5>
                        <ul class="carriers">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <strong>
                                <asp:HyperLink runat="server" ID="hypCarrier" NavigateUrl='<%# Eval("website_url") %>' Text='<%# Eval("name") %>' Target="_blank" />
                            </strong>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>

                <hr />

                <h5><i class="fa fa-users"></i>&nbsp;Contacts</h5>

                <strong>GPA Carrier Sales</strong>
                <p>
                    <strong>Savannah</strong><br />
                    George Hern<br />
                    Senior Director of Trade Development Carrier & Non Container Sales<br />
                    912-964-3824 | <a href="mailto:ghearn@gaports.com">ghern@gaports.com</a>
                </p>

                <strong>GPA Beneficial Cargo Owner Sales</strong>
                <p>
                    <strong>Savannah</strong><br />
                    Chris Logan<br />
                    Senior Director of Trade Development Beneficial Cargo Owner Sales<br />
                    912-963-6995 | <a href="mailto:clogan@gaports.com">clogan@gaports.com</a>
                </p>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="ports">
        <asp:GridView ID="gvListServicePorts" runat="server" Width="100%" AutoGenerateColumns="false" GridLines="None" CssClass="service-ports">
            <Columns>
                <asp:BoundField DataField="name" />
                <asp:BoundField DataField="days_to_next_port" HeaderText="Days To Next Port" HeaderStyle-CssClass="days-to-next-port" ItemStyle-CssClass="days-to-next-port" />
                <asp:BoundField DataField="days_to_savannah" HeaderText="Days To Savannah" HeaderStyle-CssClass="days-to" ItemStyle-CssClass="days-to" />
                <asp:BoundField DataField="days_from_savannah" HeaderText="Days From Savannah" HeaderStyle-CssClass="days-from" ItemStyle-CssClass="days-from" />
            </Columns>
        </asp:GridView>
    </div>
</div>
