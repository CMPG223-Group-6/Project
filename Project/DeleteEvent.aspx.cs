using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class DeleteEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "You are about to delete the event: " + ddlEventID.Text;
            lblConfirmM.Text = "Are you sure about your decision?";
            btnCancel.Visible = false;
            btnDelete.Visible = false;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainEventsTypes.aspx");
        }
    }
}