using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class MaintainBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void lblSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooking.aspx");
        }

        protected void btnUpdBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteBooking.aspx");
        }
    }
}