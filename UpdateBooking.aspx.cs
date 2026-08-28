using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class UpdateBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            lblConfirmation.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            lblConfirmation.Visible = true;
        }
    }
}