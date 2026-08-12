using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ProcessPayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dateSelected = Calendar1.SelectedDate;

            if (dateSelected == DateTime.MinValue)
            {
                lblDateErrorMessage.Text = "Please select a date!";
                return;
            }

            if (dateSelected <= DateTime.Today)
            {
                lblDateErrorMessage.Text = "Please select a date in the future!";
                return;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}