using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;

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
                else
                {
                    return null;
                }
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
                    Realm_GPA_GCS_Carrier item = dc.Realm_GPA_GCS_Carriers.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();

                    if (item == null)
                    {
                        item = new Realm_GPA_GCS_Carrier();
                        dc.Realm_GPA_GCS_Carriers.InsertOnSubmit(item);
                    }

                    item.name = txtName.Text;
                    item.website_url = DotNetNuke.Common.Globals.AddHTTP(txtWebsiteURL.Text);

                    dc.SubmitChanges();

                    Response.Redirect(EditUrl("ListCarriers"), true);
                }
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

    }
}