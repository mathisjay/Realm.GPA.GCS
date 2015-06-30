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
    public partial class CarrierImages : PortalModuleBase
    {
        public Nullable<int> _service_id
        {
            get
            {
                if (Request.QueryString["service"] != null)
                {
                    return Convert.ToInt32(Request.QueryString["service"]);
                }
                else
                {
                    return null;
                }
            }

        }
        private DataContext dc = new DataContext();

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                IncludeScripts();
                IncludeStyles();

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
            List<Realm_GPA_GCS_Carrier_Image> list = dc.Realm_GPA_GCS_Carrier_Images.ToList();

            if (_service_id.HasValue)
            {
                List<int> carriers = dc.Realm_GPA_GCS_Services_Carriers.Where(i => i.service_id == _service_id.GetValueOrDefault()).Select(i => i.Realm_GPA_GCS_Carrier.id).ToList();
                list = list.Where(i => carriers.Contains(i.carrier_id)).ToList();
            }

            list = list.OrderBy(i => Guid.NewGuid()).Take(4).ToList();

            rptCarriers.DataSource = list;
            rptCarriers.DataBind();
        }

        private void IncludeScripts()
        {
            try
            {
                //JS
                ClientResourceManager.RegisterScript(this.Page, "/DesktopModules/Realm.GPA.GCS/js/ekko-lightbox.js");
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void IncludeStyles()
        {
            try
            {
                //CSS
                ClientResourceManager.RegisterStyleSheet(this.Page, "/DesktopModules/Realm.GPA.GCS/styles/ekko-lightbox.css");
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }


    }
}