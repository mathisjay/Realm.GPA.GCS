using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using Realm.GPA.GCS.DAL;
using Telerik.Web.UI;
using Telerik.Web.UI.Editor.DialogControls;


namespace Realm.GPA.GCS
{
    partial class AdminEditCarrierImage : PortalModuleBase
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

        public Nullable<int> _carrier_id
        {
            get
            {
                if
                    (Request.QueryString["carrier_id"] != null)
                {
                    return Convert.ToInt32(Request.QueryString["carrier_id"]);
                }
                else if (ViewState["carrier_id"] != null && !string.IsNullOrEmpty(ViewState["carrier_id"].ToString()))
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
                SetUpImageManagers();

                if (!Page.IsPostBack)
                {
                    LoadData();
                }
                hypReturn.NavigateUrl = EditUrl("id", _carrier_id.GetValueOrDefault().ToString(), "EditCarrier");
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
                Realm_GPA_GCS_Carrier_Image item = dc.Realm_GPA_GCS_Carrier_Images.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {
                    _carrier_id = item.carrier_id;
                    txtImageUrl.Text = item.image_url;
                    imgImageUrl.ImageUrl = item.image_url;
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
                    Realm_GPA_GCS_Carrier_Image item = dc.Realm_GPA_GCS_Carrier_Images.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();

                    if (item == null)
                    {
                        item = new Realm_GPA_GCS_Carrier_Image();
                        item.carrier_id = _carrier_id.GetValueOrDefault();
                        dc.Realm_GPA_GCS_Carrier_Images.InsertOnSubmit(item);
                    }

                    item.image_url = txtImageUrl.Text;

                    dc.SubmitChanges();

                    Response.Redirect(EditUrl("id", _carrier_id.GetValueOrDefault().ToString(), "EditCarrier"), true);
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
                Realm_GPA_GCS_Carrier_Image item = dc.Realm_GPA_GCS_Carrier_Images.Where(i => i.id == _id.GetValueOrDefault()).SingleOrDefault();

                if (item != null)
                {
                    dc.Realm_GPA_GCS_Carrier_Images.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }

                Response.Redirect(EditUrl("id", _carrier_id.GetValueOrDefault().ToString(), "EditCarrier"), true);
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

    }
}