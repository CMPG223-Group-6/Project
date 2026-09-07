using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;


namespace Project
{
    public partial class CheckIn : System.Web.UI.Page
    {
        int touristID = 2;

        string ConnectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";


        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the Tourist ID from the session
            if (Session["Tourist_ID"] != null)
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());
            }

            // Only load the bookings when the page first opens
            if (!IsPostBack)
            {
                LoadBookingIDs();

                // Show all future bookings for this tourist
                loadBookings();

                btnpayment.Visible = false;
            }
        }


        // Loads the Booking IDs belonging to this tourist
        // Only bookings from today onwards are shown
        private void LoadBookingIDs()
        {
            string query = @"SELECT Booking_ID FROM BOOKING WHERE Tourist_ID = @touristID AND Arrive_Date >= @date ORDER BY Booking_ID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@touristID", touristID);
                        cmd.Parameters.AddWithValue("@date", DateTime.Today);

                        SqlDataReader reader = cmd.ExecuteReader();

                        // Clear the DropDownList before adding items
                        ddlBookingEvents0.Items.Clear();

                        // First item is the default option
                        ddlBookingEvents0.Items.Add("Select Booking ID");

                        while (reader.Read())
                        {
                            ddlBookingEvents0.Items.Add(
                                reader["Booking_ID"].ToString()
                            );
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;
            }
        }


        // Loads ALL future bookings belonging to the current tourist
        // This is used when the page first loads
        private void loadBookings()
        {
            string query = @"SELECT B.Booking_ID, 
                                    B.Event_ID, 
                                    ET.Event_Name, 
                                    B.Number_Tickets, 
                                    B.Arrive_Date, 
                                    B.Payment_method, 
                                    B.Payment_Amount, 
                                    B.Payment_Made, 
                                    B.Checked_In, 
                                    B.Checked_Out
                             FROM BOOKING B, EVENT E, EVENTTYPE ET
                             WHERE B.Event_ID = E.Event_ID
                             AND E.EventType_ID = ET.EventType_ID
                             AND B.Tourist_ID = @touristID
                             AND B.Arrive_Date >= @date
                             ORDER BY B.Booking_ID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@touristID", touristID);
                        cmd.Parameters.AddWithValue("@date", DateTime.Today);

                        DataSet ds = new DataSet();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(ds);

                        gvBookings.DataSource = ds;
                        gvBookings.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;
            }
        }


        // Loads ONLY the selected Booking ID into the GridView
        private void LoadSelectedBooking(int bookingID)
        {
            string query = @"SELECT B.Booking_ID, 
                                    B.Event_ID, 
                                    ET.Event_Name, 
                                    B.Number_Tickets, 
                                    B.Arrive_Date, 
                                    B.Payment_method, 
                                    B.Payment_Amount, 
                                    B.Payment_Made, 
                                    B.Checked_In, 
                                    B.Checked_Out
                             FROM BOOKING B, EVENT E, EVENTTYPE ET
                             WHERE B.Event_ID = E.Event_ID
                             AND E.EventType_ID = ET.EventType_ID
                             AND B.Tourist_ID = @touristID
                             AND B.Booking_ID = @bookingID
                             AND B.Arrive_Date >= @date";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@touristID", touristID);
                        cmd.Parameters.AddWithValue("@bookingID", bookingID);
                        cmd.Parameters.AddWithValue("@date", DateTime.Today);

                        DataSet ds = new DataSet();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(ds);

                        // Only the selected booking is displayed
                        gvBookings.DataSource = ds;
                        gvBookings.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;
            }
        }


        protected void ddlBookingEvents0_SelectedIndexChanged(object sender, EventArgs e)
        {
            // If the default option is selected,
            // show all future bookings again
            if (ddlBookingEvents0.SelectedIndex == 0)
            {
                loadBookings();

                btnpayment.Visible = false;
                lblOutput.Text = "";

                return;
            }

            int bookingID;

            // Make sure the selected value is a valid number
            if (!int.TryParse(ddlBookingEvents0.SelectedValue, out bookingID))
            {
                lblOutput.Text = "Please select a valid booking ID.";
                return;
            }

            // Load ONLY the selected booking
            LoadSelectedBooking(bookingID);

            // Reset the payment button when selecting a new booking
            btnpayment.Visible = false;

            lblOutput.Text = "";
        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {
            int bookingID;

            // Get the selected Booking ID from the DropDownList
            if (!int.TryParse(ddlBookingEvents0.SelectedValue, out bookingID))
            {
                lblOutput.Text = "Please select a booking ID.";
                return;
            }


            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string query = @"SELECT Payment_Made, 
                                        Checked_In, 
                                        Checked_Out
                                 FROM BOOKING
                                 WHERE Booking_ID = @Booking_ID
                                 AND Tourist_ID = @touristID
                                 AND Arrive_Date >= @date";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                    cmd.Parameters.AddWithValue("@touristID", touristID);
                    cmd.Parameters.AddWithValue("@date", DateTime.Today);

                    try
                    {
                        conn.Open();

                        SqlDataReader reader = cmd.ExecuteReader();

                        // Check if the booking exists
                        if (!reader.Read())
                        {
                            lblOutput.Text = "Booking not found.";
                            reader.Close();

                            // Keep showing the selected booking
                            LoadSelectedBooking(bookingID);

                            return;
                        }

                        // Get the three validation values
                        bool paymentMade = Convert.ToBoolean(reader["Payment_Made"]);
                        bool checkIn = Convert.ToBoolean(reader["Checked_In"]);
                        bool checkOut = Convert.ToBoolean(reader["Checked_Out"]);

                        reader.Close();


                        // VALIDATION 1: Payment must have been made                       
                        if (paymentMade == false)
                        {
                            lblOutput.Text = "You haven't paid for this booking.";

                            btnpayment.Visible = true;

                            // Keep ONLY the selected booking in the GridView
                            LoadSelectedBooking(bookingID);

                            return;
                        }
                                                
                        // VALIDATION 2: Booking must NOT already be checked in                        
                        if (checkIn == true)
                        {
                            lblOutput.Text = "You cannot check-in again.";

                            btnpayment.Visible = false;

                            // Keep ONLY the selected booking in the GridView
                            LoadSelectedBooking(bookingID);

                            return;
                        }
                                                
                        // VALIDATION 3: Booking must NOT already be checked out                        
                        if (checkOut == true)
                        {
                            lblOutput.Text = "You cannot check in again for a booking that has already been checked out.";

                            btnpayment.Visible = false;

                            // Keep ONLY the selected booking in the GridView
                            LoadSelectedBooking(bookingID);

                            return;
                        }
                                                
                        // Update Checked_In from false to true
                        
                        string updateQuery = @"UPDATE BOOKING SET Checked_In = @checkedIn WHERE Booking_ID = @Booking_ID AND Tourist_ID = @touristID";

                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                        {
                            updateCmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                            updateCmd.Parameters.AddWithValue("@touristID", touristID);
                            updateCmd.Parameters.AddWithValue("@checkedIn", true);

                            int rowsUpdated = updateCmd.ExecuteNonQuery();

                            if (rowsUpdated > 0)
                            {
                                lblOutput.Text = "Successful check-in.";
                                btnpayment.Visible = false;
                            }
                            else
                            {
                                lblOutput.Text = "Unsuccessful check-in.";
                            }
                        }


                        
                        // Reload ONLY the selected booking.
                        // This makes the GridView immediately show
                        // Checked_In = True.
                        LoadSelectedBooking(bookingID);
                    }
                    catch (Exception ex)
                    {
                        lblOutput.Text = "Database error: " + ex.Message;

                        // Try to keep the selected booking visible
                        LoadSelectedBooking(bookingID);
                    }
                }
            }
        }


        protected void btnpayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}
