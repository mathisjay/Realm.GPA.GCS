using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;

namespace Realm.GPA.GCS
{
    partial class AdminEditRegion : PortalModuleBase
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
                hypReturn.NavigateUrl = EditUrl("ListRegions");

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
                Realm_GPA_GCS_Region item = dc.Realm_GPA_GCS_Regions.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {
                    txtName.Text = item.name;
                    txtX.Text = item.x.ToString();
                    txtY.Text = item.y.ToString();
                    txtRadius.Text = item.radius.ToString();
                    cbDomestic.Checked = item.domestic;
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
                    Realm_GPA_GCS_Region item = dc.Realm_GPA_GCS_Regions.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();

                    if (item == null)
                    {
                        item = new Realm_GPA_GCS_Region();
                        dc.Realm_GPA_GCS_Regions.InsertOnSubmit(item);
                    }

                    item.name = txtName.Text;
                    item.x = int.Parse(txtX.Text);
                    item.y = int.Parse(txtY.Text);
                    item.radius = int.Parse(txtRadius.Text);
                    item.domestic = cbDomestic.Checked;

                    dc.SubmitChanges();

                    Response.Redirect(EditUrl("ListRegions"), true);
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
                Realm_GPA_GCS_Region item = dc.Realm_GPA_GCS_Regions.Where(i => i.id == _id.GetValueOrDefault()).SingleOrDefault();

                if (item != null)
                {
                    dc.Realm_GPA_GCS_Regions.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }

                Response.Redirect(EditUrl("ListRegions"), true);
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void valNameDuplicate_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            Realm_GPA_GCS_Region item = dc.Realm_GPA_GCS_Regions.Where(i => i.name == txtName.Text).FirstOrDefault();
            args.IsValid = (item == null);
        }

    }
}