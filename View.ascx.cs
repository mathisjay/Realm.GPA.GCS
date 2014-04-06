using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Client.ClientResourceManagement;
using System;
using System.Web.UI.WebControls;

namespace Realm.GPA.GCS
{
    public partial class View : PortalModuleBase, DotNetNuke.Entities.Modules.IActionable
    {
        
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                if (IsEditable)
                {
                    //Actions.Add(GetNextActionID(), "Panels Settings", ModuleActionType.AddContent, "", "", EditUrl("Config"), false, DotNetNuke.Security.SecurityAccessLevel.Edit, true, false);                    
                }
                return Actions;
            }
        }

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                IncludeStyleSheets();
                IncludeScripts();
                LoadData();
                LoadAreas();
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void LoadData()
        {
            
        }
        
        private void IncludeStyleSheets()
        {
            try
            {
                //CSS
                //ClientResourceManager.RegisterStyleSheet(this.Page, this.TemplateSourceDirectory + "/css/ekko-lightbox.min.css");
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void IncludeScripts()
        {
            try
            {                
                //JS
                ClientResourceManager.RegisterScript(this.Page, this.TemplateSourceDirectory + "/js/jquery.imagemapster.min.js");
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void StartScript()
        {
            //StringBuilder sb = new StringBuilder();

            //sb.Append("<script type='text/javascript'>");
            //sb.Append("$(document).ready(function () {");
            //sb.Append("$('#" + royalSlider.ClientID + "').royalSlider(");

            //if (Settings.Contains("options"))
            //{
            //    sb.Append(Settings["options"].ToString());
            //}

            //sb.Append(");");
            //sb.Append("});");
            //sb.Append("</script>");

            //litScript.Text = sb.ToString();
        }

        protected void imWorld_Click(object sender, System.Web.UI.WebControls.ImageMapEventArgs e)
        {

            string x = e.PostBackValue;
        }

        protected void LoadAreas()
        {
            try
            {
                for (int x = 1; x < 5; x++)
                {
                    CircleHotSpot hs = new CircleHotSpot();
                    hs.HotSpotMode = HotSpotMode.PostBack;
                    hs.Radius = x * 10;
                    hs.X = x * 10;
                    hs.Y = x * 10;
                    hs.AlternateText = (x * 100).ToString();
                    hs.PostBackValue = x.ToString();

                    imWorld.HotSpots.Add(hs);
                }
                
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

    }
}