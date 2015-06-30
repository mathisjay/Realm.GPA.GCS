using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using System;
using System.Linq;

namespace Realm.GPA.GCS
{
    public partial class Welcome : PortalModuleBase
    {
      
        private void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
              
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

    }
}