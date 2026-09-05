using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Payment : System.Web.UI.Page
    {

        private int touristID;

        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null)
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());
            }

            if (!IsPostBack)
            {
                LoadBookingIDs();

                lblOutput.Visible = false;
            }
        }

        private void LoadBookingIDs()
        {
            string sql = @"SELECT Booking_ID FROM BOOKING WHERE TOURIST_ID = @Touristid AND Payment_Made = 0";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    cmd.Parameters.AddWithValue("@Touristid", touristID);
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlBookingID.Items.Clear();

                        ddlBookingID.Items.Add(new ListItem("-- Select Booking ID --", ""));

                        while(reader.Read())
                        {
                            ddlBookingID.Items.Add(new ListItem(reader["Booking_ID"].ToString(), reader["Booking_ID"].ToString()));
                        }
                    }
                }
            }
        }

        private void ClearBookingDetails()
        {
            txtEventID.Text = "";
            txtTouristID.Text = "";
            txtNumberTickets.Text = "";
            txtArrivalDate.Text = "";
            txtAmount.Text = "";
            txtTax.Text = "";
            txtTotalAmount.Text = "";
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            lblOutput.Visible = false;

            lblOutput.Text = "";

            if(ddlBookingID.SelectedValue == "")
            {
                ClearBookingDetails();

                return;
            }

            Session["Booking_ID"] = ddlBookingID.SelectedValue;

            Session["Payment_Method"] = ddlPaymentMethod.SelectedValue;

            Session["Payment_Date"] = txtPaymentDate.Text;

            Session["Payment_Amount"] = txtTotalAmount.Text;

            Session["Event_ID"] = txtEventID.Text;

            Session["Tourist_ID"] = txtTouristID.Text;

            if(ddlPaymentMethod.SelectedValue == "Cash")
            {
                int bookingID = Convert.ToInt32(ddlBookingID.SelectedValue);

                string sql = @"UPDATE BOOKING SET Payment_method = @PaymentMethod, Payment_Made = 0 WHERE Booking_ID = @BookingID";

                using(SqlConnection cnn = new SqlConnection(connectionString))
                {
                    using(SqlCommand cmd = new SqlCommand(sql, cnn))
                    {
                        cmd.Parameters.AddWithValue("@PaymentMethod", "Cash");

                        cmd.Parameters.AddWithValue("@BookingID", bookingID);

                        cnn.Open();

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("PaymentSummary.aspx");

                return;
            }

            if (ddlPaymentMethod.SelectedValue == "Credit Card" || ddlPaymentMethod.SelectedValue == "Debit Card")
            {
                Response.Redirect("CardDetails.aspx");

                return;
            }
        }

        protected void ddlBookingID_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblOutput.Visible = false;

            lblOutput.Text = "";

            if (ddlBookingID.SelectedValue == "")
            {
                ClearBookingDetails();

                return;
            }

            int bookingID = Convert.ToInt32(ddlBookingID.SelectedValue);

            string sql = @"SELECT Booking_ID, Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Payment_Amount, Amount_Owed FROM BOOKING WHERE Booking_ID = @BookingID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    cnn.Open();

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            txtEventID.Text = reader["Event_ID"].ToString();

                            txtTouristID.Text = reader["Tourist_ID"].ToString();

                            txtNumberTickets.Text = reader["Number_Tickets"].ToString();

                            if (reader["Arrive_Date"] != DBNull.Value)
                            {
                                txtArrivalDate.Text = Convert.ToDateTime(reader["Arrive_Date"]).ToString("yyyy-MM-dd");
                            }
                            else
                            {
                                txtArrivalDate.Text = "";
                            }

                            decimal paymentAmount = 0;

                            if (reader["Payment_Amount"] != DBNull.Value)
                            {
                                paymentAmount = Convert.ToDecimal(reader["Payment_Amount"]);
                            }

                            decimal amountOwed = 0;

                            if (reader["Amount_Owed"] != DBNull.Value)
                            {
                                amountOwed = Convert.ToDecimal(reader["Amount_Owed"]);
                            }

                            decimal amountToPay;

                            if(amountOwed > 0)
                            {
                                amountToPay = amountOwed;

                                lblOutput.Text = "This booking has an outstanding amount of R" + amountOwed.ToString("0.00") + ".";

                                lblOutput.Visible = true;
                            }
                            else
                            {
                                amountToPay = paymentAmount;
                            }

                            decimal amountBeforeTax = amountToPay / 1.15m;

                            decimal tax = amountToPay - amountBeforeTax;

                            decimal totalAmount = amountToPay;

                            txtAmount.Text = amountBeforeTax.ToString("0.00");

                            txtTax.Text = tax.ToString("0.00");

                            txtTotalAmount.Text = totalAmount.ToString("0.00");
                        }
                    }
                }
            }
        }
    }
}