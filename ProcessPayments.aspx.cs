using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ProcessPayments : System.Web.UI.Page
    {

        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadBookingIDs();

                LoadAllBookings();

                lblPaymentProcessedOutput.Visible = false;
            }
        }

        private void LoadBookingIDs()
        {
            string sql = @"SELECT Booking_ID FROM BOOKING ORDER BY Booking_ID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlBookingID.Items.Clear();

                        ddlBookingID.Items.Add(new ListItem("-- Select Booking ID --"));

                        while(reader.Read())
                        {
                            ddlBookingID.Items.Add(new ListItem(reader["Booking_ID"].ToString(), reader["Booking_ID"].ToString()));
                        }
                    }
                }
            }
        }

        private void LoadAllBookings()
        {
            string sql = @"SELECT Booking_ID, Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Questionnaires, Payment_method, Payment_Amount, Amount_Owed, Payment_Made, Checked_In, Checked_Out FROM BOOKING ORDER BY Booking_ID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        GridView1.DataSource = reader;

                        GridView1.DataBind();
                    }
                }
            }
        }

        private void LoadSelectedBooking(int bookingID)
        {
            string sql = @"SELECT Booking_ID, Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Questionnaires, Payment_method, Payment_Amount, Amount_Owed, Payment_Made, Checked_In, Checked_Out FROM BOOKING WHERE Booking_ID = @BookingID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    cnn.Open();

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        GridView1.DataSource = reader;

                        GridView1.DataBind();
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
            txtPaymentMethod.Text = "";
            txtPaymentAmount.Text = "";
            lblPaymentProcessedOutput.Text = "";
            lblPaymentProcessedOutput.Visible = false;
        }

        private void LoadBookingDetails(int bookingID)
        {
            string sql = @"SELECT Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Questionnaires, Payment_method, Payment_Amount, Amount_Owed, Payment_Made, Checked_In, Checked_Out FROM BOOKING WHERE Booking_ID = @BookingID";

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    cnn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            if (reader["Event_ID"] != DBNull.Value)
                            {
                                txtEventID.Text = reader["Event_ID"].ToString();
                            }
                            else
                            {
                                txtEventID.Text = "";
                            }

                            if (reader["Tourist_ID"] != DBNull.Value)
                            {
                                txtTouristID.Text = reader["Tourist_ID"].ToString();
                            }
                            else
                            {
                                txtTouristID.Text = "";
                            }

                            if (reader["Number_Tickets"] != DBNull.Value)
                            {
                                txtNumberTickets.Text = reader["Number_Tickets"].ToString();
                            }
                            else
                            {
                                txtNumberTickets.Text = "";
                            }

                            if (reader["Arrive_Date"] != DBNull.Value)
                            {
                                txtArrivalDate.Text = Convert.ToDateTime(reader["Arrive_Date"]).ToString("yyyy-MM-dd");
                            }
                            else
                            {
                                txtArrivalDate.Text = "";
                            }

                            if (reader["Payment_Method"] != DBNull.Value)
                            {
                                txtPaymentMethod.Text = reader["Payment_Method"].ToString();
                            }
                            else
                            {
                                txtPaymentMethod.Text = "";
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

                            decimal amountToDisplay;

                            if(amountOwed > 0)
                            {
                                amountToDisplay = amountOwed;
                            }
                            else
                            {
                                amountToDisplay = paymentAmount;
                            }

                            txtPaymentAmount.Text = "R " + amountToDisplay.ToString("0.00");
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnProcessPayment_Click(object sender, EventArgs e)
        {
            lblPaymentProcessedOutput.Visible = false;

            lblPaymentProcessedOutput.Text = "";

            int bookingID = Convert.ToInt32(ddlBookingID.SelectedValue);

            string sql = @"SELECT Payment_method, Payment_Made FROM BOOKING WHERE Booking_ID = @BookingID";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    cnn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            bool paymentMade = false;

                            if (reader["Payment_Made"] != DBNull.Value)
                            {
                                paymentMade = Convert.ToBoolean(reader["Payment_Made"]);
                            }

                            string paymentMethod = "";

                            if (reader["Payment_method"] != DBNull.Value)
                            {
                                paymentMethod = reader["Payment_Method"].ToString();
                            }

                            if (paymentMade)
                            {
                                lblPaymentProcessedOutput.Text = "Payment has already been processed"; //When the tourist paid with Cash/Credit Card/Debit Card and Payment_Made is true.

                                lblPaymentProcessedOutput.Visible = true;

                                return;
                            }

                            if (paymentMethod != "Cash")
                            {
                                lblPaymentProcessedOutput.Text = "Payment cannot be processed."; //When the tourist choose to pay with Credit Card/Debit Card but the Payment_Made is false.

                                lblPaymentProcessedOutput.Visible = true;

                                return;
                            }
                        }
                    }
                }
            }

            string sql2 = @"UPDATE BOOKING SET Payment_Made = 1, Amount_Owed = 0 WHERE Booking_ID = @BookingID";

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql2, cnn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    cnn.Open();

                    cmd.ExecuteNonQuery();
                }
            }

            lblPaymentProcessedOutput.Text = "Payment processed successfully"; //When the tourist choose to pay with Cash but the Payment_Made is false.

            lblPaymentProcessedOutput.Visible = true;

            LoadBookingDetails(bookingID);

            LoadSelectedBooking(bookingID);

        }

        protected void ddlBookingID_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblPaymentProcessedOutput.Visible = false;

            lblPaymentProcessedOutput.Text = "";

            if(ddlBookingID.SelectedValue == "")
            {
                ClearBookingDetails();

                LoadAllBookings();

                return;
            }

            int bookingID = Convert.ToInt32(ddlBookingID.SelectedValue);

            LoadBookingDetails(bookingID);

            LoadSelectedBooking(bookingID);
        }
    }
}