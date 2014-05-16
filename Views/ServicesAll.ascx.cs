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
    public partial class ServicesAll : PortalModuleBase
    {
        private DataContext dc = new DataContext();

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                }

            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void lvServices_NeedDataSource(object sender, Telerik.Web.UI.RadListViewNeedDataSourceEventArgs e)
        {
            List<Realm_GPA_GCS_Service> list = dc.Realm_GPA_GCS_Services.OrderBy(i => i.name).ToList();
            lvServices.DataSource = list;

            lblServiceCount.Text =list.Count.ToString();
        }
    }
}