<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.Welcome" CodeBehind="Welcome.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/DesktopModules/Realm.GPA.GCS/Picker.ascx" TagPrefix="uc1" TagName="Picker" %>


<div class="row">
    <div class="col-sm-12">
        <h2>Inbound, Outbound, and All Around</h2>
        <p>
            Use our interactive Global Carrier Services tool to find the inbound and outbound days in transit to and from Savannah for major carriers, as well as road and rail times for major inland U.S. hubs. Now you can easily choose your carrier and plan schedules based on reliable data for a more predictable time to market.
        </p>
    </div>
</div>


<div class="row">
    <div class="col-sm-12">
        <uc1:picker runat="server" id="Picker" />
    </div>
</div>
