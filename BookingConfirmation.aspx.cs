using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class BookingConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Event_Name"] != null)
            {
                lblEventNameDisplay.Text = Session["Event_Name"].ToString();
            }
            if(Session["Date"] != null)
            {
                lblDateDisplay.Text = Session["Date"].ToString();
            }
            if(Session["PriceOfEvent"] != null)
            {
                lblEventP.Text = Session["PriceOfEvent"].ToString();
            }
            if(Session["NumberOfTickets"] != null)
            {
                lblNumTicketsDisplay.Text = Session["NumberOfTickets"].ToString();
            }
            if(Session["TotalAmount"] != null)
            {
                lblAmountToPay.Text = Session["TotalAmount"].ToString();
            }
            if (Session["name"] != null && Session["surname"] != null)
            {
                lblNameDisplay0.Text = Session["name"] + " " + Session["surname"];
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void btnDone2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}