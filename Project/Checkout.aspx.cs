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
            /*
            if (ddlBookingIDDetails.SelectedIndex == -1)
            {
                lblConfirmMessage.Text = "Choose an option";
            }
            else
            {
                lblConfirmMessage.Text = "You have successfully checked out of Zims.Have a good day";
            }
            */
            
        }

        protected void btnSubmitRating_Click(object sender, EventArgs e)
        {     
            /*
            int rating = 0;
            string rating_word = " ";

            if (rbStar1.Checked)
            {
                rating = 1;
                rating_word = "Poor";
            }
            else if (rbStar2.Checked)
            {
                rating = 2;
                rating_word = "Bad";
            }
            else if (rbStar3.Checked)
            {
                rating = 3;
                rating_word = "Average";
            }
            else if (rbStar4.Checked)
            {
                rating = 4;
                rating_word = "Good";
            }
            else if (rbStar5.Checked)
            {
                rating = 5;
                rating_word = "Great";
            }

            if (rating == 0)
            {
                lblResults.Text = "Please select a rating.";
            }
            else
            {
                lblResults.Text = "You rated us " + rating + " out of 5 stars.Your day with us was " + rating_word ;
            }
            */
        }
    }
}
