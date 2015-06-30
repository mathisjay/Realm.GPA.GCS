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
    public partial class ServiceDetail : PortalModuleBase
    {
        private DataContext dc = new DataContext();

        public string service
        {
            get
            {
                string _service = string.Empty;
                if (Request.QueryString["service"] != null)
                {
                    _service = Request.QueryString["service"].ToString();
                }
                return _service;
            }
        }

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
                }

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
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void LoadData()
        {
            if (Settings.ContainsKey("contacts"))
            {
                litContacts.Text = Server.HtmlDecode(Settings["contacts"].ToString());
            }

            Realm_GPA_GCS_Port _world_port = null;
            if (!string.IsNullOrEmpty(world_port))
            {
                _world_port = dc.Realm_GPA_GCS_Ports.Where(i => i.id == Int32.Parse(world_port)).FirstOrDefault();
            }

            Realm_GPA_GCS_US_City _us_city = null;
            if (!string.IsNullOrEmpty(us_city))
            {
                _us_city = dc.Realm_GPA_GCS_US_Cities.Where(i => i.id == Int32.Parse(us_city)).FirstOrDefault();
            }

            Realm_GPA_GCS_Service _service = null;
            if (!string.IsNullOrEmpty(service))
            {
                _service = dc.Realm_GPA_GCS_Services.Where(i => i.id == Int32.Parse(service)).FirstOrDefault();
            }

            Realm_GPA_GCS_Services_Port _service_port = null;

            StringBuilder sbTitle = new StringBuilder();
            if (direction == "inbound")
            {
                hypSwitch.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + service, "world_port=" + world_port, "us_city=" + us_city, "direction=outbound");

                if (_world_port != null)
                {
                    sbTitle.Append(_world_port.name);
                    litWorldPath.Text = "From " + _world_port.name + "<br/>to Savannah";

                    _service_port = _service.Realm_GPA_GCS_Services_Ports.Where(i => i.port_id == _world_port.id && i.days_to_savannah >= 0).FirstOrDefault();
                    if (_service_port != null)
                    {
                        if (_service_port.days_to_savannah == 1)
                        {
                            litByShip.Text = _service_port.days_to_savannah.ToString() + " day";
                        }
                        else
                        {
                            litByShip.Text = _service_port.days_to_savannah.ToString() + " days";
                        }

                    }
                }
                if (_us_city != null)
                {
                    sbTitle.Append(" to ");

                    sbTitle.Append(_us_city.name);
                    litDomesticPath.Text = "From Savanah<br/>to " + _us_city.name;

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
            }
            else //outbound
            {
                hypSwitch.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, string.Empty, "service=" + service, "world_port=" + world_port, "us_city=" + us_city);

                if (_us_city != null)
                {
                    sbTitle.Append(_us_city.name);
                    litDomesticPath.Text = "From " + _us_city.name + "<br/>to Savanah";

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
                if (_world_port != null)
                {
                    sbTitle.Append(" to ");
                    sbTitle.Append(_world_port.name);
                    litWorldPath.Text = "From Savanah<br/>to " + _world_port.name;

                    _service_port = _service.Realm_GPA_GCS_Services_Ports.Where(i => i.port_id == _world_port.id && i.days_from_savannah >= 0).FirstOrDefault();
                    if (_service_port != null)
                    {
                        if (_service_port.days_from_savannah == 1)
                        {
                            litByShip.Text = _service_port.days_from_savannah.ToString() + " day";
                        }
                        else
                        {
                            litByShip.Text = _service_port.days_from_savannah.ToString() + " days";
                        }

                    }
                }
            }
            if (_world_port != null && _us_city != null)
            {
                sbTitle.Append(" via ");
                pnlSwitch.Visible = true;
                lblDirection.Visible = true;
            }
            else
            {
                pnlSwitch.Visible = false;
                lblDirection.Visible = false;
            }

            if (_service != null)
            {
                sbTitle.Append(_service.name);

                litDescription.Text = Server.HtmlDecode(_service.description);
                imMap.ImageUrl = _service.image_url;
                litLongDescription.Text = Server.HtmlDecode(_service.long_description);
                litTurnaround.Text = _service.turnaround_days.ToString();
                litFrequency.Text = _service.frequency.ToString();
                litNumberOfVessels.Text = _service.number_of_vessels.ToString();
                litAverageCapacity.Text = _service.avg_capacity.ToString();

                rptCarriers.DataSource = _service.Realm_GPA_GCS_Services_Carriers.Select(i => i.Realm_GPA_GCS_Carrier).OrderBy(i => i.name).ToList();
                rptCarriers.DataBind();

                var list = dc.Realm_GPA_GCS_Services_Ports.Where(i => i.service_id == int.Parse(service)).OrderBy(i => i.order).Select(i => new { name = i.Realm_GPA_GCS_Port.name, days_to_next_port = i.days_to_next_port, days_to_savannah = i.days_to_savannah, days_from_savannah = i.days_from_savannah });
                gvListServicePorts.DataSource = list;
                gvListServicePorts.DataBind();
            }

            litTitle.Text = sbTitle.ToString();
            pnlPortToPort.Visible = _service_port != null;

        }
    }
}