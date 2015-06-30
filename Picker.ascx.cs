using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Client.ClientResourceManagement;
using System;
using System.Web.UI.WebControls;
using Realm.GPA.GCS.DAL;
using System.Collections.Generic;
using System.Linq;

namespace Realm.GPA.GCS
{
    public partial class Picker : PortalModuleBase
    {

        public Nullable<int> world_port
        {
            get
            {
                if (Request.QueryString["world_port"] != null)
                {
                    return int.Parse(Request.QueryString["world_port"].ToString());
                }
                else
                {
                    return null;
                }
            }
        }

        public string us_city
        {
            get
            {
                string _us_city = string.Empty;
                if (Request.QueryString["us_city"] != null)
                {
                    _us_city = Request.QueryString["us_city"].ToString();
                }
                return _us_city;
            }
        }

        DataContext dc = new DataContext();

        public int _selectedRegion
        {
            get
            {
                if (ViewState["_selectedRegion"] != null)
                {
                    return int.Parse(ViewState["_selectedRegion"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["_selectedRegion"] = value;
            }
        }

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                IncludeScripts();

                if (!Page.IsPostBack)
                {
                    LoadRegionHotSpots();
                    LoadRegionPorts(null);
                    LoadUSCities();

                    CheckSelection();

                    hypServices.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "services=all");
                    hypCarriers.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "carriers=all");
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void IncludeScripts()
        {
            try
            {
                //JS
                ClientResourceManager.RegisterScript(this.Page, this.TemplateSourceDirectory + "/js/jquery.imagemapster.js");
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void LoadRegionHotSpots()
        {
            try
            {
                List<Realm_GPA_GCS_Region> list = dc.Realm_GPA_GCS_Regions.ToList();

                foreach (Realm_GPA_GCS_Region item in list)
                {
                    if (!item.domestic)
                    {
                        CircleHotSpot hs = new CircleHotSpot();
                        hs.X = item.x;
                        hs.Y = item.y;

                        hs.Radius = item.radius;
                        hs.AlternateText = item.name;
                        hs.PostBackValue = item.id.ToString();

                        hs.HotSpotMode = HotSpotMode.PostBack;

                        imWorld.HotSpots.Add(hs);
                    }
                }

            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void imWorld_Click(object sender, System.Web.UI.WebControls.ImageMapEventArgs e)
        {
            _selectedRegion = int.Parse(e.PostBackValue);
            Realm_GPA_GCS_Region region = dc.Realm_GPA_GCS_Regions.Where(i => i.id == _selectedRegion).FirstOrDefault();
            if (region != null)
            {
                hdnRegion.Value = region.name;
                ddlForeignPort.Focus();
            }
            else
            {
                hdnRegion.Value = string.Empty;
            }
            LoadRegionPorts(region);
        }

        protected void LoadRegionPorts(Realm_GPA_GCS_Region region)
        {
            try
            {
                if (region != null)
                {
                    ddlForeignPort.DataSource = region.Realm_GPA_GCS_Ports.Select(i => new { name = i.country + ", " + i.name, id = i.id }).OrderBy(i => i.name);
                    ddlForeignPort.DataTextField = "name";
                    ddlForeignPort.DataValueField = "id";
                    ddlForeignPort.DataBind();

                    ddlForeignPort.Items.Insert(0, new ListItem("Select a port within the " + region.name + " region", string.Empty));
                    ddlForeignPort.Enabled = true;
                }
                else
                {
                    ddlForeignPort.Enabled = false;
                    ddlForeignPort.Items.Clear();
                    ddlForeignPort.Items.Add(new ListItem("Select a world region", string.Empty));
                    ddlForeignPort.Enabled = false;
                }
                CheckReady();
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void LoadUSCities()
        {
            try
            {
                List<Realm_GPA_GCS_US_City> list = dc.Realm_GPA_GCS_US_Cities.OrderBy(i => i.name).ToList();

                ddlDomesticCity.DataSource = list;
                ddlDomesticCity.DataTextField = "name";
                ddlDomesticCity.DataValueField = "id";
                ddlDomesticCity.DataBind();

                ddlDomesticCity.Items.Insert(0, new ListItem("Select a U.S. City", string.Empty));
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void lbSelect_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlForeignPort.SelectedValue) && !string.IsNullOrEmpty(ddlDomesticCity.SelectedValue))
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "world_port=" + ddlForeignPort.SelectedValue, "us_city=" + ddlDomesticCity.SelectedValue));
            }
        }

        private void CheckSelection()
        {
            if (!string.IsNullOrEmpty(us_city))
            {
                ListItem liUSCity = ddlDomesticCity.Items.FindByValue(us_city);
                if (liUSCity != null)
                {
                    ddlDomesticCity.ClearSelection();
                    liUSCity.Selected = true;
                }
            }

            if (world_port.HasValue)
            {
                Realm_GPA_GCS_Port port = dc.Realm_GPA_GCS_Ports.Where(i => i.id == world_port.GetValueOrDefault()).FirstOrDefault();
                if (port != null)
                {
                    string region = port.Realm_GPA_GCS_Region.name;
                    hdnRegion.Value = region;

                    LoadRegionPorts(port.Realm_GPA_GCS_Region);

                    ListItem liPort = ddlForeignPort.Items.FindByValue(port.id.ToString());
                    if (liPort != null)
                    {
                        ddlForeignPort.ClearSelection();
                        liPort.Selected = true;
                    }
                }
            }

            CheckReady();
        }

        protected void lbClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId));
        }

        protected void ddlForeignPort_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckReady();
        }

        protected void ddlDomesticCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckReady();
        }

        private void CheckReady()
        {
            lbSelect.Enabled = !string.IsNullOrEmpty(ddlForeignPort.SelectedValue) && !string.IsNullOrEmpty(ddlDomesticCity.SelectedValue);
            lbClear.Visible = lbSelect.Enabled;
        }
    }
}