﻿using System;
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
    partial class AdminEditService : PortalModuleBase
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
                hypReturn.NavigateUrl = EditUrl("ListServices");
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
            imageManagerParameters.ViewPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/maps" };
            imageManagerParameters.UploadPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/maps" };
            imageManagerParameters.DeletePaths = new string[] { "/DesktopModules/Realm.GPA.GCS/maps" };
            imageManagerParameters.MaxUploadFileSize = 5000000;

            DialogDefinition imageManager = new DialogDefinition(typeof(ImageManagerDialog), imageManagerParameters);
            imageManager.ClientCallbackFunction = "ImageManagerFunction";
            imageManager.Width = Unit.Pixel(694);
            imageManager.Height = Unit.Pixel(440);

            doImageURL.DialogDefinitions.Add("ImageManager", imageManager);

            FileManagerDialogParameters imageEditorParameters = new FileManagerDialogParameters();
            imageEditorParameters.ViewPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/maps" };
            imageEditorParameters.UploadPaths = new string[] { "/DesktopModules/Realm.GPA.GCS/maps" };
            imageEditorParameters.DeletePaths = new string[] { "/DesktopModules/Realm.GPA.GCS/maps" };
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
                Realm_GPA_GCS_Service item = dc.Realm_GPA_GCS_Services.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {
                    txtName.Text = item.name;
                    txtDescription.Text = item.description;
                    txtLongDescription.Text = item.long_description;
                    txtAvgCapacity.Text = item.avg_capacity.ToString();
                    txtNumberOfVessels.Text = item.number_of_vessels.ToString();
                    txtTurnaroundDays.Text = item.turnaround_days.ToString();
                    txtFrequency.Text = item.frequency.ToString();
                    txtImageUrl.Text = item.image_url;
                    if (!string.IsNullOrEmpty(item.image_url))
                    {
                        imgImageUrl.ImageUrl = item.image_url;
                    }

                    pnlCarriers.Visible = true;
                    pnlPorts.Visible = true;
                }
                else
                {
                    pnlCarriers.Visible = false;
                    pnlPorts.Visible = false;
                    lbSave.Text = "Create";
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
                    bool newRecord = false;
                    Realm_GPA_GCS_Service item = dc.Realm_GPA_GCS_Services.Where(i => i.id == _id.GetValueOrDefault()).FirstOrDefault();
                    if (item == null)
                    {
                        item = new Realm_GPA_GCS_Service();
                        dc.Realm_GPA_GCS_Services.InsertOnSubmit(item);
                        newRecord = true;
                    }

                    item.name = txtName.Text;
                    item.description = txtDescription.Text;
                    item.long_description = txtLongDescription.Text;

                    if (!string.IsNullOrEmpty(txtAvgCapacity.Text))
                    {
                        item.avg_capacity = int.Parse(txtAvgCapacity.Text);
                    }
                    if (!string.IsNullOrEmpty(txtNumberOfVessels.Text))
                    {
                        item.number_of_vessels = int.Parse(txtNumberOfVessels.Text);
                    }
                    if (!string.IsNullOrEmpty(txtTurnaroundDays.Text))
                    {
                        item.turnaround_days = int.Parse(txtTurnaroundDays.Text);
                    }
                    item.frequency = int.Parse(txtFrequency.Text);
                    item.image_url = txtImageUrl.Text;

                    dc.SubmitChanges();

                    if (newRecord)
                    {
                        Response.Redirect(EditUrl("id", item.id.ToString(), "EditService"), true);
                    }
                    else
                    {
                        Response.Redirect(EditUrl("ListServices"), true);
                    }

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
                Realm_GPA_GCS_Service item = dc.Realm_GPA_GCS_Services.Where(i => i.id == _id.GetValueOrDefault()).SingleOrDefault();

                if (item != null)
                {
                    dc.Realm_GPA_GCS_Services.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }

                Response.Redirect(EditUrl("ListServices"), true);
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvListCarriers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                IQueryable<Realm_GPA_GCS_Carrier> query = dc.Realm_GPA_GCS_Services_Carriers.Where(i => i.service_id == _id.GetValueOrDefault()).Select(i => i.Realm_GPA_GCS_Carrier).OrderBy(i => i.name);
                gvListCarriers.DataSource = query;
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        //protected void gvList_EditCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        //{
        //    e.Canceled = true;
        //    int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
        //    Response.Redirect(EditUrl("id", id.ToString(), "EditCarrier"), true);
        //}

        protected void gvListCarriers_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            try
            {
                int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
                Realm_GPA_GCS_Services_Carrier item = dc.Realm_GPA_GCS_Services_Carriers.Where(i => i.carrier_id == id && i.service_id == _id.GetValueOrDefault()).FirstOrDefault();
                if (item != null)
                {
                    dc.Realm_GPA_GCS_Services_Carriers.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvListCarriers_InsertCommand(object sender, GridCommandEventArgs e)
        {
            try
            {

                GridEditableItem gei = ((GridEditableItem)e.Item);

                Realm_GPA_GCS_Services_Carrier item = new Realm_GPA_GCS_Services_Carrier();
                dc.Realm_GPA_GCS_Services_Carriers.InsertOnSubmit(item);
                item.service_id = _id.GetValueOrDefault();

                Hashtable values = new Hashtable();
                gei.ExtractValues(values);
                item.carrier_id = int.Parse(values["id"].ToString());

                //prevent for duplicate
                Realm_GPA_GCS_Services_Carrier duplicate = dc.Realm_GPA_GCS_Services_Carriers.Where(i => i.service_id == item.service_id && i.carrier_id == item.carrier_id).FirstOrDefault();
                if (duplicate == null)
                {
                    dc.SubmitChanges();
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }



        protected void gvListPorts_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            try
            {
                IQueryable<Realm_GPA_GCS_Services_Port> query = dc.Realm_GPA_GCS_Services_Ports.Where(i => i.service_id == _id.GetValueOrDefault()).OrderBy(i => i.order);
                gvListPorts.DataSource = query;
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvListPorts_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            try
            {
                int id = (int)((GridDataItem)e.Item).GetDataKeyValue("id");
                Realm_GPA_GCS_Services_Port item = dc.Realm_GPA_GCS_Services_Ports.Where(i => i.id == id).FirstOrDefault();
                if (item != null)
                {
                    dc.Realm_GPA_GCS_Services_Ports.DeleteOnSubmit(item);
                    dc.SubmitChanges();
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvListPorts_InsertCommand(object sender, GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem gei = ((GridEditableItem)e.Item);

                Realm_GPA_GCS_Services_Port item = new Realm_GPA_GCS_Services_Port();
                dc.Realm_GPA_GCS_Services_Ports.InsertOnSubmit(item);
                item.service_id = _id.GetValueOrDefault();
                List<Realm_GPA_GCS_Services_Port> items = dc.Realm_GPA_GCS_Services_Ports.Where(i => i.service_id == _id.GetValueOrDefault()).ToList();
                if (items.Count > 0)
                {
                    item.order = items.Max(i => i.order) + 1;
                }
                else
                {
                    item.order = 0;
                }


                Hashtable values = new Hashtable();
                gei.ExtractValues(values);
                item.port_id = int.Parse(values["port_id"].ToString());
                if (values["days_to_savannah"] != null)
                {
                    item.days_to_savannah = int.Parse(values["days_to_savannah"].ToString());
                }
                if (values["days_from_savannah"] != null)
                {
                    item.days_from_savannah = int.Parse(values["days_from_savannah"].ToString());
                }

                if (values["days_to_next_port"] != null)
                {
                    item.days_to_next_port = int.Parse(values["days_to_next_port"].ToString());
                }

                dc.SubmitChanges();
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvListPorts_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            try
            {
                GridEditableItem gei = ((GridEditableItem)e.Item);

                int id = (int)gei.GetDataKeyValue("id");

                Realm_GPA_GCS_Services_Port item = dc.Realm_GPA_GCS_Services_Ports.Where(i => i.id == id).FirstOrDefault();
                if (item != null)
                {
                    gei.UpdateValues(item);
                }

                dc.SubmitChanges();
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void gvListPorts_RowDrop(object sender, Telerik.Web.UI.GridDragDropEventArgs e)
        {
            if (e.DestDataItem != null && e.DestDataItem.OwnerGridID == gvListPorts.ClientID)
            {
                List<Realm_GPA_GCS_Services_Port> items = dc.Realm_GPA_GCS_Services_Ports.Where(i => i.service_id == _id.GetValueOrDefault()).ToList();
                int destID = (int)e.DestDataItem.GetDataKeyValue("id");
                Realm_GPA_GCS_Services_Port destItem = items.Where(i => i.id == destID).SingleOrDefault();

                int dragID = (int)e.DraggedItems[0].GetDataKeyValue("id");
                Realm_GPA_GCS_Services_Port dragItem = items.Where(i => i.id == dragID).SingleOrDefault();

                if (e.DropPosition == GridItemDropPosition.Above)
                {
                    List<Realm_GPA_GCS_Services_Port> moveItems = items.Where(i => i.order >= destItem.order && i.id != dragItem.id).ToList();
                    dragItem.order = destItem.order;
                    foreach (Realm_GPA_GCS_Services_Port item in moveItems)
                    {
                        item.order = item.order + 1;
                    }
                }
                if (e.DropPosition == GridItemDropPosition.Below)
                {
                    List<Realm_GPA_GCS_Services_Port> moveItems = items.Where(i => i.order > destItem.order && i.id != dragItem.id).ToList();
                    dragItem.order = destItem.order + 1;
                    foreach (Realm_GPA_GCS_Services_Port item in moveItems)
                    {
                        item.order = item.order + 1;
                    }
                }

                //reorder
                items = items.OrderBy(i => i.order).ToList();
                for (int x = 0; x < items.Count; x++)
                {
                    items[x].order = x + 1;
                }

                dc.SubmitChanges();
                gvListPorts.Rebind();
            }
        }


    }
}