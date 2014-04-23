using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;
using Telerik.Web.UI;
using Telerik.Web.UI.Editor.DialogControls;
using System;
using System.Linq;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;
using Telerik.Web.UI;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Telerik.Web.UI.Editor.DialogControls;


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
                SetUpImageManagers();

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

        private void SetUpImageManagers()
        {

            FileManagerDialogParameters imageManagerParameters = new FileManagerDialogParameters();
            imageManagerParameters.ViewPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/carriers" };
            imageManagerParameters.UploadPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/carriers" };
            imageManagerParameters.DeletePaths = new string[] { "/DesktopModules/Realm.GPA.GCS/carriers" };
            imageManagerParameters.MaxUploadFileSize = 5000000;

            DialogDefinition imageManager = new DialogDefinition(typeof(ImageManagerDialog), imageManagerParameters);
            imageManager.ClientCallbackFunction = "ImageManagerFunction";
            imageManager.Width = Unit.Pixel(694);
            imageManager.Height = Unit.Pixel(440);

            doImageURL.DialogDefinitions.Add("ImageManager", imageManager);

            FileManagerDialogParameters imageEditorParameters = new FileManagerDialogParameters();
            imageEditorParameters.ViewPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/carriers" };
            imageEditorParameters.UploadPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/carriers" };
            imageEditorParameters.DeletePaths = new string[] { "/DesktopModules/Realm.GPA.GCS/carriers" };
            imageEditorParameters.MaxUploadFileSize = 5000000;

            DialogDefinition imageEditor = new DialogDefinition(typeof(ImageEditorDialog), imageEditorParameters);
            imageEditor.Width = Unit.Pixel(832);
            imageEditor.Height = Unit.Pixel(520);

            doImageURL.DialogDefinitions.Add("ImageEditor", imageEditor);

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