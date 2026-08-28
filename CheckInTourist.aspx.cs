using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class CheckInTourist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fill in person booking id
            // ddl shows bookings
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            //if person cant be found take to maintain tourist and create a new profile
            //gridview shows bookings

            if (ddlBookingEventsStaffcheckin.SelectedIndex == -1)
            {
                lblOutput.Text = "Choose an option";
            }
            else
            {
                lblOutput.Text = "You have successfully checked in.Enjoy!";
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}
        