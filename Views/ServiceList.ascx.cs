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
    public partial class ServiceList : PortalModuleBase
    {
        private DataContext dc = new DataContext();

        public string direction
        {
            get
            {
                string _direction = "inbound";
                if (Request.QueryString["direction"] != null)
                {
                    _direction = Request.QueryString["direction"].ToString();
                }
                return _direction;
            }
        }

        public string world_port
        {
            get
            {
                string _world_port = string.Empty;
                if (Request.QueryString["world_port"] != null)
                {
                    _world_port = Request.QueryString["world_port"].ToString();
                }
                return _world_port;
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

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    LoadData();

                    if (direction == "inbound")
                    {
                        lblDirection.Text = "Inbound";
                        lblDirection.CssClass = "label label-primary";
                    }
                    else
                    {
                        lblDirection.Text = "Outbound";
                        lblDirection.CssClass = "label label-warning";
                    }
                }

            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void LoadData()
        {
            Realm_GPA_GCS_Port _world_port = dc.Realm_GPA_GCS_Ports.Where(i => i.id == Int32.Parse(world_port)).FirstOrDefault();
            Realm_GPA_GCS_US_City _us_city = dc.Realm_GPA_GCS_US_Cities.Where(i => i.id == Int32.Parse(us_city)).FirstOrDefault();

            if (direction == "inbound")
            {
                hypSwitch.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "world_port=" + world_port, "us_city=" + us_city, "direction=outbound");
                
                if (_world_port != null)
                {
                    litStart.Text = _world_port.name;
                    litWorldPath.Text = "Transit from " + _world_port.name + " to Savannah";

                    var results = _world_port.Realm_GPA_GCS_Services_Ports.Where(i => i.days_to_savannah > 0).Select(i => new { id = i.Realm_GPA_GCS_Service.id, name = i.Realm_GPA_GCS_Service.name, description = i.Realm_GPA_GCS_Service.description, transit_time = i.days_to_savannah }).OrderBy(i => i.transit_time).ToList();
                    rptServices.DataSource = results;
                    rptServices.DataBind();

                    pnlNoService.Visible = results.Count() == 0;
                }
                if (_us_city != null)
                {
                    litEnd.Text = _us_city.name;
                    litDomesticPath.Text = "From Savanah<br/>to " + _us_city.name;

                    if (_us_city.rail_time_to == 1)
                    {
                        litByRail.Text = _us_city.rail_time_to.ToString() + " day";
                    }
                    else
                    {
                        litByRail.Text = _us_city.rail_time_to.ToString() + " days";
                    }

                    if (_us_city.truck_time_to == 1)
                    {
                        litByTruck.Text = _us_city.truck_time_to.ToString() + " day";
                    }
                    else
                    {
                        litByTruck.Text = _us_city.truck_time_to.ToString() + " days";
                    }

                }
            }
            else
            {
                hypSwitch.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "world_port=" + world_port, "us_city=" + us_city);
                
                if (_us_city != null)
                {
                    litStart.Text = _us_city.name;
                    litDomesticPath.Text = "From " + _us_city.name + "<br/>to Savanah";

                    if (_us_city.rail_time_from == 1)
                    {
                        litByRail.Text = _us_city.rail_time_from.ToString() + " day";
                    }
                    else
                    {
                        litByRail.Text = _us_city.rail_time_from.ToString() + " days";
                    }

                    if (_us_city.truck_time_from == 1)
                    {
                        litByTruck.Text = _us_city.truck_time_from.ToString() + " day";
                    }
                    else
                    {
                        litByTruck.Text = _us_city.truck_time_from.ToString() + " days";
                    }
                }
                if (_world_port != null)
                {
                    litEnd.Text = _world_port.name;
                    litWorldPath.Text = "Transit from Savanah to " + _world_port.name;

                    var results = _world_port.Realm_GPA_GCS_Services_Ports.Where(i => i.days_from_savannah > 0).Select(i => new { id = i.Realm_GPA_GCS_Service.id, name = i.Realm_GPA_GCS_Service.name, description = i.Realm_GPA_GCS_Service.description, transit_time = i.days_from_savannah }).OrderBy(i => i.transit_time).ToList();
                    rptServices.DataSource = results;
                    rptServices.DataBind();

                    pnlNoService.Visible = results.Count() == 0;
                }
            }
        }


    }
}