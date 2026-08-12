using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class BookEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelProgress_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            lblInfo0.Visible = true;
            lblConfirmation.Visible = true;
            btnDone.Visible = true;
        }
    }
}