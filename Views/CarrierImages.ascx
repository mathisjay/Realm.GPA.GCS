<%@ Control Language="C#" AutoEventWireup="true" Explicit="True" Inherits="Realm.GPA.GCS.CarrierImages" CodeBehind="CarrierImages.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="row">
    <asp:Repeater runat="server" ID="rptCarriers">
        <ItemTemplate>
            <a data-title='<%# Eval("name") %>' data-toggle="lightbox" href='<%# Eval("image_url") %>' class="col-sm-3">
                <img src='<%# Eval("image_url") %>' class="img-responsive" />
            </a>
        </ItemTemplate>
    </asp:Repeater>
</div>

<script>
    $(document).delegate('*[data-toggle="lightbox"]', 'click', function (event) { event.preventDefault(); $(this).ekkoLightbox(); });
</script>

<div class="row sustainability">
    <div class="col-sm-12">
        <a href="http://www.gaports.com/About/Sustainability/PreservingNature.aspx">
            <h2>Rapid Routes <em class="icon-angle-right"></em></h2>
        </a>
    </div>
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-6 col-lg-5 inline-tile left">
                <img alt="" src="http://www.gaports.com/portals/2/About/Sustainability/MainPage_Wetlands.jpg" class="img-responsive">
            </div>
            <div class="col-sm-6 col-lg-5 inline-tile right">
                <div class="tilebutton bright-blue">
                    <div class="tilebutton-table">
                        <a href="http://www.gaports.com/About/Sustainability/PreservingNature.aspx" class="tilebutton-table-cell gpa-icon-jump">Fastest to Memphis on the Eastern Seaboard <em class="icon-angle-right"></em></a>
                    </div>
                </div>
                <div class="tilebutton white">
                    <div class="tilebutton-table">
                        <div class="tilebutton-table-cell">
                            New Highway 307 overpass and six-track expansion improve efficiency and help cut round-trip transit to Atlanta by six hours. 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row sustainability">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-5 col-lg-4 inline-tile left">
                <div class="tilebutton green">
                    <div class="tilebutton-table">
                        <a href="http://www.gaports.com/About/Sustainability/ReducingEmissions.aspx" class="tilebutton-table-cell gpa-icon-jump">Fastest to market&nbsp;<em class="icon-angle-right"></em></a>
                    </div>
                </div>
                <div class="tilebutton white">
                    <div class="tilebutton-table">
                        <div class="tilebutton-table-cell">
                            Two, state-of-the-art on-dock intermodal ramps.
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-7 col-lg-8 inline-tile right">
                <img alt="" src="http://www.gaports.com/portals/2/About/Sustainability/MainPage_Emissions.jpg" class="img-responsive">
            </div>
        </div>
    </div>
</div>
<div class="row sustainability">
    <div class="col-sm-12">
        <a href="http://www.gaports.com/About/Sustainability/CommunityOperations.aspx">
            <h2>Cordele Inland Port <em class="icon-angle-right"></em></h2>
        </a>
    </div>
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-5 col-lg-4 inline-tile left">
                <img alt="" src="http://www.gaports.com/portals/2/About/Sustainability/MainPage_Community.jpg" class="img-responsive">
            </div>
            <div class="col-sm-7 col-lg-6 inline-tile right">
                <div class="tilebutton blue">
                    <div class="tilebutton-table">
                        <a href="http://www.gaports.com/About/Sustainability/CommunityOperations.aspx" class="tilebutton-table-cell gpa-icon-jump">Direct route to Garden City Terminal&nbsp;<em class="icon-angle-right"></em></a>
                    </div>
                </div>
                <div class="tilebutton white">
                    <div class="tilebutton-table">
                        <div class="tilebutton-table-cell">
                            A better option for Southwest Georgia, Southern Alabama, and Western Florida.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
