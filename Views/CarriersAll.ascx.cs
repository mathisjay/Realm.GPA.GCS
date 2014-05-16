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
using System.Data;

namespace Realm.GPA.GCS
{
    public partial class CarriersAll : PortalModuleBase
    {
        private DataContext dc = new DataContext();

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    LoadData();
                }

            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void LoadData()
        {
            List<Realm_GPA_GCS_Carrier> list = dc.Realm_GPA_GCS_Carriers.OrderBy(i => i.name).ToList();
            rptCarriers.DataSource = list;
            rptCarriers.DataBind();

            lblCarrierCount.Text = list.Count.ToString();
        }


        protected void rptCarriers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
            {
                Repeater rptServices = (Repeater)item.FindControl("rptServices");
                Realm_GPA_GCS_Carrier carrier = (Realm_GPA_GCS_Carrier)item.DataItem;
                List<Realm_GPA_GCS_Service> list = carrier.Realm_GPA_GCS_Services_Carriers.Select(i => i.Realm_GPA_GCS_Service).ToList();
                rptServices.DataSource = list;
                rptServices.DataBind();
            }
        }
    }
}