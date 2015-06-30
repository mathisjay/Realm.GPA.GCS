using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;
using Telerik.Web.UI;


namespace Realm.GPA.GCS
{
    partial class AdminEditCarrier : PortalModuleBase
    {
        DataContext dc = new DataContext();

        public Nullable<int> _id
        {
            get
            {
                if (Request.QueryString["id"] != null)
                {
                    return Convert.ToInt32(Request.QueryString["id"]);
                }
                else if (ViewState["carrier_id"] != null && string.IsNullOrEmpty(ViewState["carrier_id"].ToString()))
                {
                    return Convert.ToInt32(ViewState["carrier_id"].ToString());
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["carrier_id"] = value;
            }
        }

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                hypReturn.NavigateUrl = EditUrl("ListCarriers");

                if (!Page.IsPostBack)
                {
                    LoadData();
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void LoadData()
        {
            try
            {
                Realm_GPA_GCS_Carrier item = dc.Realm_GPA_GCS_Carriers.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {
                    txtName.Text = item.name;
                    txtWebsiteURL.Text = item.website_url;
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void lbSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    Save();
                    Response.Redirect(EditUrl("ListCarriers"), true);
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void Save()
        {
            try
            {
                Realm_GPA_GCS_Carrier item = dc.Realm_GPA_GCS_Carriers.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();

                if (item == null)
                {
                    item = new Realm_GPA_GCS_Carrier();
                    dc.Realm_GPA_GCS_Carriers.InsertOnSubmit(item);
                }

                item.name = txtName.Text;
                item.website_url = DotNetNuke.Common.Globals.AddHTTP(txtWebsiteURL.Text);

                dc.SubmitChanges();
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void lbDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Realm_GPA_GCS_Carrier item = dc.Realm_GPA_GCS_Carriers.Where(i => i.id == _id.GetValueOrDefault()).SingleOrDefault();

                if (item != null)
                {
                    dc.Realm_GPA_GCS_Carriers.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }

                Response.Redirect(EditUrl("ListCarriers"), true);
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        protected void gvList_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                IQueryable<Realm_GPA_GCS_Carrier_Image> query = dc.Realm_GPA_GCS_Carrier_Images.Where(i => i.carrier_id == _id.GetValueOrDefault());
                gvList.DataSource = query;
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvList_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "InitInsert")
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    Save();
                    Response.Redirect(EditUrl("carrier_id", _id.GetValueOrDefault().ToString(), "EditCarrierImage"), true);
                }
            }
        }

        protected void gvList_EditCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            e.Canceled = true;
            int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
            Response.Redirect(EditUrl("id", id.ToString(), "EditCarrierImage"), true);
        }

        protected void gvList_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
            Realm_GPA_GCS_Carrier_Image item = dc.Realm_GPA_GCS_Carrier_Images.Where(i => i.id == id).FirstOrDefault();
            if (item != null)
            {
                dc.Realm_GPA_GCS_Carrier_Images.DeleteOnSubmit(item);
                dc.SubmitChanges();
            }
        }

    }
}