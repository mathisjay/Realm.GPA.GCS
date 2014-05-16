<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.ServicesAll" CodeBehind="ServicesAll.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<h3>
    <i class="fa fa-globe"></i>&nbsp;All Services
    <asp:Label runat="server" ID="lblServiceCount" CssClass="badge" />
</h3>

<hr />

<div class="row">
    <div class="col-sm-12">

        <telerik:radajaxpanel runat="server" id="rap">
            <telerik:RadListView runat="server" ID="lvServices" OnNeedDataSource="lvServices_NeedDataSource" >
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-3">
                            <asp:HyperLink runat="server" ID="hypName" CssClass="btn btn-default" Text='<%# Eval("name") %>' NavigateUrl='<%# DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + Eval("id").ToString()) %>' />
                        </div>
                        <div class="col-sm-9">
                            <asp:Literal ID="litDescription" runat="server" Text='<%# Eval("description") %>' />
                            <br />
                            <asp:HyperLink ID="hypReadMore" runat="server" Text="more info >" NavigateUrl='<%# DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + Eval("id").ToString()) %>' />
                        </div>
                    </div>
                    <hr />
                </ItemTemplate>
            </telerik:RadListView>
        </telerik:radajaxpanel>
    </div>
</div>
