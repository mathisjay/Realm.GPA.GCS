using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Exceptions;
using System;
using System.Linq;

namespace Realm.GPA.GCS
{
    public partial class ViewDispatch : PortalModuleBase, DotNetNuke.Entities.Modules.IActionable
    {
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                if (IsEditable)
                {
                    Actions.Add(GetNextActionID(), "Edit Regions", ModuleActionType.AddContent, "", "", EditUrl("ListRegions"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Ports", ModuleActionType.AddContent, "", "", EditUrl("ListPorts"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit US Cities", ModuleActionType.AddContent, "", "", EditUrl("ListUSCity"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Services", ModuleActionType.AddContent, "", "", EditUrl("ListServices"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Carriers", ModuleActionType.AddContent, "", "", EditUrl("ListCarriers"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                    Actions.Add(GetNextActionID(), "Edit Contacts", ModuleActionType.AddContent, "", "", EditUrl("EditContacts"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);
                }
                return Actions;
            }
        }


        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                PortalModuleBase portalModule = null;

                string controlPath = this.TemplateSourceDirectory + "/views/Welcome.ascx";

                if (Request.QueryString["world_port"] != null && Request.QueryString["us_city"] != null && Request.QueryString["service"] == null)
                {
                    controlPath = this.TemplateSourceDirectory + "/views/ServiceList.ascx";
                }

                if (Request.QueryString["service"] != null)
                {
                    controlPath = this.TemplateSourceDirectory + "/views/ServiceDetail.ascx";
                }

                if (Request.QueryString["services"] != null)
                {
                    controlPath = this.TemplateSourceDirectory + "/views/ServicesAll.ascx";
                }

                if (Request.QueryString["carriers"] != null)
                {
                    controlPath = this.TemplateSourceDirectory + "/views/CarriersAll.ascx";
                }

                portalModule = (PortalModuleBase)LoadControl(controlPath);

                if (portalModule != null)
                {
                    //portalModule.ModuleContext.Configuration = this.ModuleContext.Configuration;
                    portalModule.ID = System.IO.Path.GetFileNameWithoutExtension(controlPath);
                    this.Controls.Add(portalModule);
                }

            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

    }
}