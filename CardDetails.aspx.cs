using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class CardDetails : System.Web.UI.Page
    {

        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Payment_Amount"] != null)
                {
                    txtAmountPay.Text = Session["Payment_Amount"].ToString();
                }
                else
                {
                    txtAmountPay.Text = "0.00";
                }
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if(!Page.IsValid)
            {
                return;
            }

            if(Session["Booking_ID"] == null)
            {
                return;
            }

            if(Session["Payment_Method"] == null)
            {
                return;
            }

            int bookingID = Convert.ToInt32(Session["Booking_ID"]);

            string paymentMethod = Session["Payment_Method"].ToString();

            string sql = @"UPDATE BOOKING SET Payment_Made = 1, Amount_Owed = 0, Payment_method = @PaymentMethod WHERE Booking_ID = @BookingID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                    cnn.Open();

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("PaymentSummary.aspx");
        }

        protected void txtCVV_TextChanged(object sender, EventArgs e)
        {

        }
    }
}