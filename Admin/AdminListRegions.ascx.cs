﻿using System;
using System.Collections.Generic;
using System.Linq;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;
using Telerik.Web.UI;

namespace Realm.GPA.GCS
{
    partial class AdminListRegions : PortalModuleBase
    {
        DataContext dc = new DataContext();

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
        }

        protected void lbAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(EditUrl("EditRegion"), true);
        }

        protected void gvList_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                IQueryable<Realm_GPA_GCS_Region> query = dc.Realm_GPA_GCS_Regions.OrderBy(i => i.name);
                gvList.DataSource = query;
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvList_EditCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            e.Canceled = true;
            int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
            Response.Redirect(EditUrl("id", id.ToString(), "EditRegion"), true);
        }

        protected void gvList_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
            Realm_GPA_GCS_Region item = dc.Realm_GPA_GCS_Regions.Where(i => i.id == id).FirstOrDefault();
            if (item != null)
            {
                dc.Realm_GPA_GCS_Regions.DeleteOnSubmit(item);
                dc.SubmitChanges();
            }
        }

        protected void lbReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL());
        }
    }
}
