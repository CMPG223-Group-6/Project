using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class PaymentSummary : System.Web.UI.Page
    {
       
        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadPaymentSummary();
            }
        }

        private void LoadPaymentSummary()
        {
            if (Session["Booking_ID"] == null)
            {
                return;
            }

            int bookingID = Convert.ToInt32(Session["Booking_ID"]);

            string sql = @"SELECT B.Booking_ID, B.Tourist_ID, B.Event_ID, E.EventType_ID, B.Number_Tickets, B.Arrive_Date, B.Payment_method, B.Payment_Amount, B.Amount_Owed FROM BOOKING B INNER JOIN EVENT E ON B.Event_ID = E.Event_ID WHERE B.Booking_ID = @BookingID";

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
                            lblBookingIDOutput.Text = reader["Booking_ID"].ToString();

                            lblTouristIDOutput.Text = reader["Tourist_ID"].ToString();

                            lblEventIDOutput.Text = reader["Event_ID"].ToString();

                            lblNumTicketsOutput.Text = reader["Number_Tickets"].ToString();

                            if (reader["Arrive_Date"] != DBNull.Value)
                            {
                                lblArrivalDateOutput.Text = Convert.ToDateTime(reader["Arrive_Date"]).ToString("yyyy-MM-dd");
                            }
                            else
                            {
                                lblArrivalDateOutput.Text = "";
                            }
                            string paymentMethod = "";

                            if (reader["Payment_method"] != DBNull.Value)
                            {
                                paymentMethod = reader["Payment_method"].ToString();

                                lblPaymentMethodOutput.Text = paymentMethod;
                            }
                            else
                            {
                                lblPaymentMethodOutput.Text = "";
                            }

                            if (Session["Payment_Date"] != null)
                            {
                                lblPaymentDateOutput.Text = Session["Payment_Date"].ToString();
                            }
                            else
                            {
                                lblPaymentDateOutput.Text = "";
                            }

                            if (Session["Payment_Amount"] != null)
                            {
                                string paymentAmount = Session["Payment_Amount"].ToString();

                                if(paymentMethod == "Cash")
                                {
                                    lblTotalPaidOutput.Text = "R " + paymentAmount + " (Pay on arrival at the zoo)";
                                }
                                else
                                {
                                    lblTotalPaidOutput.Text = "R " + paymentAmount;
                                }
                            }
                            else if (reader["Payment_Amount"] != DBNull.Value)
                            {
                                decimal paymentAmount = Convert.ToDecimal(reader["Payment_Amount"]);

                                if(paymentMethod == "Cash")
                                {
                                    lblTotalPaidOutput.Text = "R " + paymentAmount.ToString("0.00") + " (Pay on arrival at the zoo)";
                                }
                                else
                                {
                                    lblTotalPaidOutput.Text = "R " + paymentAmount.ToString("0.00");
                                }
                            }
                            else
                            {
                                lblTotalPaidOutput.Text = "R 0.00";
                            }

                            LoadEventName(Convert.ToInt32(reader["Event_ID"]));
                        }
                    }
                }
            }
        }

        private void LoadEventName(int eventID)
        {
            string sql = @"SELECT ET.Event_Name FROM EVENT E INNER JOIN EVENTTYPE ET ON E.EventType_ID = ET.EventType_ID WHERE E.Event_ID = @EventID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@EventID", eventID);

                    cnn.Open();

                    using(SqlDataReader reader =  cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            lblEventNameOutput.Text = reader["Event_Name"].ToString();
                        }
                        else
                        {
                            lblEventNameOutput.Text = "Event not found";
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}