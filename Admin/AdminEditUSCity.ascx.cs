using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;

namespace Realm.GPA.GCS
{
    partial class AdminEditUSCity : PortalModuleBase
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
                Realm_GPA_GCS_US_City item = dc.Realm_GPA_GCS_US_Cities.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {

                    txtName.Text = item.name;
                    txtTruckTimeFrom.Text = item.truck_time_from.ToString();
                    txtTruckTimeTo.Text = item.truck_time_to.ToString();
                    txtRailTimeFrom.Text = item.rail_time_from.ToString();
                    txtRailTimeTo.Text = item.rail_time_to.ToString();
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
                    Realm_GPA_GCS_US_City item = dc.Realm_GPA_GCS_US_Cities.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();

                    if (item == null)
                    {
                        item = new Realm_GPA_GCS_US_City();
                        dc.Realm_GPA_GCS_US_Cities.InsertOnSubmit(item);
                    }

                    item.name = txtName.Text;
                    item.truck_time_from = int.Parse(txtTruckTimeFrom.Text);
                    item.truck_time_to = int.Parse(txtTruckTimeTo.Text);
                    item.rail_time_from = int.Parse(txtRailTimeFrom.Text);
                    item.rail_time_to = int.Parse(txtRailTimeTo.Text);

                    dc.SubmitChanges();

                    Response.Redirect(EditUrl("ListUSCities"), true);
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
                Realm_GPA_GCS_US_City item = dc.Realm_GPA_GCS_US_Cities.Where(i => i.id == _id.GetValueOrDefault()).SingleOrDefault();

                if (item != null)
                {
                    dc.Realm_GPA_GCS_US_Cities.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }

                Response.Redirect(EditUrl("ListUSCities"), true);
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
    }
}