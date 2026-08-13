using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMyBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyBookings.aspx");
        }

        protected void btnNewBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewBooking.aspx");
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelBooking.aspx");
        }

        protected void btnUpdateBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }
    }
}