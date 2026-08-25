using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAvailableEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }

        protected void btnNewBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookEvent.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelBooking.aspx");
        }
    }
}