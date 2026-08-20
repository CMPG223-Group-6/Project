using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check for name everthing's good
        }

        protected void btnConfirmExit_Click(object sender, EventArgs e)
        {
            if (ddlBookingIDDetails.SelectedIndex == -1)
            {
                lblConfirmMessage.Text = "Choose an option";
            }
            else
            {
                lblConfirmMessage.Text = "You have successfully checked out of Zims.Have a good day";
            }
            
        }

        protected void btnSubmitRating_Click(object sender, EventArgs e)
        {             
            int rating = 0;

            if (rbStar1.Checked)
            {
                rating = 1;
            }
            else if (rbStar2.Checked)
            {
                rating = 2;
            }
            else if (rbStar3.Checked)
            {
                rating = 3;
            }
            else if (rbStar4.Checked)
            {
                rating = 4;
            }
            else if (rbStar5.Checked)
            {
                rating = 5;
            }

            if (rating == 0)
            {
                lblResults.Text = "Please select a rating.";
            }
            else
            {
                lblResults.Text = "You rated us " + rating + " out of 5 stars.";
            }
        }
    }
}
