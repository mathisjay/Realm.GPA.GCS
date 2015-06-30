using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace Realm.GPA.GCS
{
    partial class AdminEditPort : PortalModuleBase
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
                hypReturn.NavigateUrl = EditUrl("ListPorts");

                if (!Page.IsPostBack)
                {
                    LoadRegions();
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
                Realm_GPA_GCS_Port item = dc.Realm_GPA_GCS_Ports.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {
                    txtName.Text = item.name;

                    ListItem liRegion = ddlRegion.Items.FindByValue(item.region_id.ToString());
                    if (liRegion != null)
                    {
                        ddlRegion.ClearSelection();
                        liRegion.Selected = true;
                    }

                    txtCountry.Text = item.country;
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
                    Realm_GPA_GCS_Port item = dc.Realm_GPA_GCS_Ports.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();

                    if (item == null)
                    {
                        item = new Realm_GPA_GCS_Port();
                        dc.Realm_GPA_GCS_Ports.InsertOnSubmit(item);
                    }

                    item.name = txtName.Text;
                    if (!string.IsNullOrEmpty(ddlRegion.SelectedValue))
                    {
                        item.region_id = int.Parse(ddlRegion.SelectedValue);
                    }
                    item.country = txtCountry.Text;

                    dc.SubmitChanges();

                    Response.Redirect(EditUrl("ListPorts"), true);
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
                Realm_GPA_GCS_Port item = dc.Realm_GPA_GCS_Ports.Where(i => i.id == _id.GetValueOrDefault()).SingleOrDefault();

                if (item != null)
                {
                    dc.Realm_GPA_GCS_Ports.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }

                Response.Redirect(EditUrl("ListPorts"), true);
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void valNameDuplicate_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = true;

            Realm_GPA_GCS_Port item = dc.Realm_GPA_GCS_Ports.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
            Realm_GPA_GCS_Port duplicate = dc.Realm_GPA_GCS_Ports.Where(i => i.name == txtName.Text).FirstOrDefault();

            if (item == null && duplicate != null)
            {
                args.IsValid = false;
            }
            if (item != null && duplicate != null & item.id != duplicate.id)
            {
                args.IsValid = false;
            }
        }

        protected void LoadRegions()
        {
            try
            {
                List<Realm_GPA_GCS_Region> list = dc.Realm_GPA_GCS_Regions.OrderBy(i => i.name).ToList();

                ddlRegion.DataSource = list;
                ddlRegion.DataTextField = "name";
                ddlRegion.DataValueField = "id";
                ddlRegion.DataBind();

                ddlRegion.Items.Insert(0, new ListItem("Select a region", string.Empty));

            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

    }
}