using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Client.ClientResourceManagement;
using System;
using System.Web.UI.WebControls;
using Realm.GPA.GCS.DAL;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Realm.GPA.GCS
{
    public partial class View : PortalModuleBase, DotNetNuke.Entities.Modules.IActionable
    {
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

        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                if (IsEditable)
                {
                    Actions.Add(GetNextActionID(), "Edit Regions", ModuleActionType.AddContent, "", "", EditUrl("ListRegions"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Ports", ModuleActionType.AddContent, "", "", EditUrl("ListPorts"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit US Cities", ModuleActionType.AddContent, "", "", EditUrl("ListUSCities"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Services", ModuleActionType.AddContent, "", "", EditUrl("ListServices"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Carriers", ModuleActionType.AddContent, "", "", EditUrl("ListCarriers"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                }
                return Actions;
            }
        }

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                IncludeStyleSheets();
                IncludeScripts();

                if (!Page.IsPostBack)
                {
                    LoadData();
                    LoadRegionHotSpots();
                    LoadRegionPorts(null);
                    LoadUSCities();
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void LoadData()
        {

        }

        private void IncludeStyleSheets()
        {
            try
            {
                //CSS
                //ClientResourceManager.RegisterStyleSheet(this.Page, this.TemplateSourceDirectory + "/css/ekko-lightbox.min.css");
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
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void AddSelectRegionScript(string key)
        {
            StringBuilder sb = new StringBuilder();

            if (!string.IsNullOrEmpty(key))
            {
                sb.Append("<script>");
                sb.Append("$(function () {");
                sb.Append("$('#imWorld').mapster('set',true, '" + key + "');");
                sb.Append("});");
                sb.Append("</script>");
            }

            litScript.Text = sb.ToString();
        }

        protected void imWorld_Click(object sender, System.Web.UI.WebControls.ImageMapEventArgs e)
        {
            _selectedRegion = int.Parse(e.PostBackValue);
            Realm_GPA_GCS_Region region = dc.Realm_GPA_GCS_Regions.Where(i => i.id == _selectedRegion && i.domestic == false).FirstOrDefault();
            if (region != null)
            {
                AddSelectRegionScript(region.name);
            }
            else
            {
                AddSelectRegionScript(string.Empty);
            }
            LoadRegionPorts(region);
        }



        protected void LoadRegionPorts(Realm_GPA_GCS_Region region)
        {
            try
            {
                if (region != null)
                {
                    ddlForeignPort.DataSource = region.Realm_GPA_GCS_Ports.OrderBy(i => i.name);
                    ddlForeignPort.DataTextField = "name";
                    ddlForeignPort.DataValueField = "id";
                    ddlForeignPort.DataBind();

                    ddlForeignPort.Items.Insert(0, new ListItem("Select a port within " + region.name, string.Empty));
                    ddlForeignPort.Enabled = true;
                }
                else
                {
                    ddlForeignPort.Enabled = false;
                    ddlForeignPort.Items.Clear();
                    ddlForeignPort.Items.Add(new ListItem("Select a world region", string.Empty));
                    ddlForeignPort.Enabled = false;
                }
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

            }
        }

    }
}