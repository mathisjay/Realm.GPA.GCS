<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.ServiceDetail" CodeBehind="ServiceDetail.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<h2>
    <asp:Literal runat="server" ID="litTitle" />
</h2>
<h3>
    <asp:Literal runat="server" ID="litDescrpition" />
</h3>

<ul class="nav nav-tabs">
    <li class="active"><a href="#overview" data-toggle="tab">Overview</a></li>
    <li><a href="#ports" data-toggle="tab">Service Ports</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="overview">

        <asp:Image runat="server" ID="imMap" />

        <div class="row">
            <div class="col-sm-6">
                <asp:Panel runat="server" ID="pnlPortToPort">
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <h4>
                                <asp:Literal runat="server" ID="litWorldPath" />
                            </h4>
                            <div class="btn btn-info">
                                <asp:Literal runat="server" ID="litByShip" />
                            </div>
                        </div>
                        <div class="col-sm-8 text-center">
                            <h4>
                                <asp:Literal runat="server" ID="litDomesticPath" />
                            </h4>
                            <div class="btn btn-warning">
                                <asp:Literal runat="server" ID="litByTruck" />
                            </div>
                            <div class="btn btn-default">
                                <asp:Literal runat="server" ID="litByRail" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Literal runat="server" ID="litLongDescription" />
            </div>
            <div class="col-sm-6">
                <h4>Service Summary</h4>
                <p>
                    <asp:Literal runat="server" ID="litTurnaround" />
                    <hr />
                    <asp:Literal runat="server" ID="litFrequency" />
                    <hr />
                    <asp:Literal runat="server" ID="litNumberOfVessels" />
                    <hr />
                    <asp:Literal runat="server" ID="litAverageCapacity" />
                </p>

                <asp:Repeater runat="server" ID="rptCarriers">
                    <HeaderTemplate>
                        <h4>Carriers</h4>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("name") %>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <hr />
                    </SeparatorTemplate>
                </asp:Repeater>

                <h4>Contacts</h4>
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
        <asp:GridView ID="gvListServicePorts" runat="server" Width="100%" AutoGenerateColumns="false" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Realm_GPA_GCS_Port.name" />
                <asp:BoundField DataField="days_to_next_port" HeaderText="Days To Next Port" />
                <asp:BoundField DataField="days_to_savannah" HeaderText="Days To Savannah" />
                <asp:BoundField DataField="days_from_savannah" HeaderText="Days From Savannah" />
            </Columns>
        </asp:GridView>
    </div>
</div>
