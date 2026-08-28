using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class CheckIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //use cookies with tourist details
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            //must check for payment
            //if not paid show message and redirect to payment 

            if (ddlBookingEvents0.SelectedIndex == -1)
            {
                lblOutput.Text = "Choose an option";
            }
            else
            {
                lblOutput.Text = "You have successfully checked in.Enjoy!";
            }
        }
    }
}