using Project;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;
using static System.Net.Mime.MediaTypeNames;

namespace Project
{
    public partial class Checkout : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";

        int touristID;


        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the Tourist ID from the session
            if (Session["Tourist_ID"] != null)
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());
            }


            // Only do this when the page first loads
            if (!IsPostBack)
            {
                // Load all Booking IDs belonging to this tourist
                // that are today or in the future
                LoadBookingIDs();

                // On page load, only show bookings that have already
                // been checked in
                loadBookings();

                
            }
        }        
        // LOAD BOOKING IDs INTO THE DROPDOWNLIST       
        // This loads all bookings belonging to the current tourist
        // that are from today onwards.
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

                        // Clear the DDL before adding the booking IDs
                        ddlBookingIDDetails.Items.Clear();

                        // Add the default option
                        ddlBookingIDDetails.Items.Add("Select Booking ID");

                        while (reader.Read())
                        {
                            ddlBookingIDDetails.Items.Add(reader["Booking_ID"].ToString());
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                lblConfirmMessage.Text = "Database error: " + ex.Message;
            }
        }
                
        // LOAD BOOKINGS INTO THE GRIDVIEW        
        // When the page first loads, this method shows ONLY bookings
        // where Checked_In is true.
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
                             ORDER BY B.Booking_ID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@touristID", touristID);

                        DataSet ds = new DataSet();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(ds);

                        gvTouristActivitySummary.DataSource = ds;
                        gvTouristActivitySummary.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblConfirmMessage.Text = "Database error: " + ex.Message;
            }
        }


        // LOAD ONLY THE SELECTED BOOKING INTO THE GRIDVIEW        
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
                             AND B.Booking_ID = @bookingID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@touristID", touristID);
                        cmd.Parameters.AddWithValue("@bookingID", bookingID);

                        DataSet ds = new DataSet();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(ds);

                        // Show ONLY the selected booking
                        gvTouristActivitySummary.DataSource = ds;
                        gvTouristActivitySummary.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblConfirmMessage.Text = "Database error: " + ex.Message;
            }
        }             
        
        protected void btnConfirmExit_Click(object sender, EventArgs e)
        {
            int bookingID;

            // Make sure a Booking ID was selected
            if (!int.TryParse(ddlBookingIDDetails.SelectedValue, out bookingID))
            {
                lblConfirmMessage.Text = "Select a booking ID.";
                return;
            }


            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string query = @"SELECT Checked_In, Checked_Out FROM BOOKING WHERE Booking_ID = @Booking_ID AND Tourist_ID = @Tourist_ID";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                cmd.Parameters.AddWithValue("@Tourist_ID", touristID);

                try
                {
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    // Check if booking exists
                    if (!reader.Read())
                    {
                        lblConfirmMessage.Text = "Booking not found.";
                        reader.Close();

                        // Keep the selected booking visible
                        LoadSelectedBooking(bookingID);

                        return;
                    }
                    // Get Checked_In value
                    bool checkIn = false;

                    if (reader["Checked_In"] != DBNull.Value)
                    {
                        checkIn = Convert.ToBoolean(reader["Checked_In"]);
                    }
                    // Get Checked_Out value
                    bool checkOut = false;

                    if (reader["Checked_Out"] != DBNull.Value)
                    {
                        checkOut = Convert.ToBoolean(reader["Checked_Out"]);
                    }

                    reader.Close();
                                       
                    // The tourist must have checked in first                    
                    if (checkIn == false)
                    {
                        lblConfirmMessage.Text = "You haven't checked in yet.";

                        // Keep the selected booking visible
                        LoadSelectedBooking(bookingID);

                        return;
                    }
                    
                    // The tourist cannot check out twice                    
                    if (checkOut == true)
                    {
                        lblConfirmMessage.Text = "You have already checked out.";

                        // Keep the selected booking visible
                        LoadSelectedBooking(bookingID);

                        return;
                    }
                                        
                    // Update Checked_Out from false to true
                    
                    string updateQuery = @"UPDATE BOOKING SET Checked_Out = @checkedOut WHERE Booking_ID = @Booking_ID AND Tourist_ID = @Tourist_ID";

                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                    {
                        updateCmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                        updateCmd.Parameters.AddWithValue("@Tourist_ID", touristID);
                        updateCmd.Parameters.AddWithValue("@checkedOut", true);

                        int rowsUpdated = updateCmd.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            lblConfirmMessage.Text = "Successful Check out";
                        }
                        else
                        {
                            lblConfirmMessage.Text = "Unsuccessful Check out";
                        }
                    }
                    
                    // loadBookings() would show all checked-in bookings.                    
                    LoadSelectedBooking(bookingID);

                }
                catch (Exception ex)
                {
                    lblConfirmMessage.Text = "Database error: " + ex.Message;

                    // Keep the selected booking visible if an error occurs
                    LoadSelectedBooking(bookingID);
                }
            }
        }
                
        // RATING AND REVIEW SUBMIT BUTTON
        
        protected void btnSubmitRating_Click(object sender, EventArgs e)
        {
            int bookingID;                     
            
            // A Booking ID must be selected first           
            if (!int.TryParse(ddlBookingIDDetails.SelectedValue, out bookingID))
            {
                lblError.Text = "Select a booking ID.";
                lblResults.Text = "";

                return;
            }
            
            // CHECK WHETHER THE BOOKING HAS BEEN CHECKED OUT            
            bool checkedOut = false;

            string checkOutQuery = @"SELECT Checked_Out FROM BOOKING WHERE Booking_ID = @Booking_ID AND Tourist_ID = @Tourist_ID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(checkOutQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                        cmd.Parameters.AddWithValue("@Tourist_ID", touristID);

                        object result = cmd.ExecuteScalar();

                        if (result == null)
                        {
                            lblError.Text = "Booking not found.";
                            return;
                        }

                        if (result != DBNull.Value)
                        {
                            checkedOut = Convert.ToBoolean(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Database error: " + ex.Message;
                return;
            }

            // Tourist must check out before rating/reviewing
            
            if (checkedOut == false)
            {
                lblError.Text = "You must check out before you can submit a rating or review.";
                return;
            }
                       
            // GET THE RATING
            
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
                        
            // A rating must be selected
            
            if (rating == 0)
            {
                lblResults.Text = "Please select a rating.";
                return;
            }
            // Tell the tourist which rating they selected
            lblResults.Text = "You rated us " + rating + " out of 5 stars.";

            // GET THE REVIEW           
            string Review;

            if (string.IsNullOrWhiteSpace(txtInputreview.Text))
            {
                // If no review was entered, save "None"
                Review = "None";
            }
            else
            {
                // Save the review entered by the tourist
                Review = txtInputreview.Text.Trim();
            }

            // SAVE THE REVIEW TO THE DATABASE            
            string query = @"UPDATE BOOKING SET Questionnaires = @Questionnaires WHERE Booking_ID = @Booking_ID AND Tourist_ID = @Tourist_ID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                        cmd.Parameters.AddWithValue("@Tourist_ID", touristID);
                        cmd.Parameters.AddWithValue("@Questionnaires", Review);

                        int rowsUpdated = cmd.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            lblError.ForeColor = System.Drawing.Color.Black;                        
                            lblError.Text = "Rating and review submitted successfully.";
                        }
                        else
                        {
                            lblError.ForeColor = System.Drawing.Color.Black;
                            lblError.Text = "The rating and review could not be saved.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Database error: " + ex.Message;
            }


            // Clear the rating controls after submitting
            rbStar1.Checked = false;
            rbStar2.Checked = false;
            rbStar3.Checked = false;
            rbStar4.Checked = false;
            rbStar5.Checked = false;
            lblResults.Text = " ";
            txtInputreview.Text = "";
        }
       
        // DROPDOWNLIST SELECTION CHANGED       
        protected void ddlBookingIDDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get Tourist ID from session again
            if (Session["Tourist_ID"] != null)
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());
            }


            // If the default option is selected
            if (ddlBookingIDDetails.SelectedIndex == 0)
            {
                // Show the normal page-load GridView
                // which contains only checked-in bookings
                loadBookings();

                lblConfirmMessage.Text = "";
                lblError.Text = "";
                              
                return;
            }

            int bookingID;

            // Make sure the selected value is a valid Booking ID
            if (!int.TryParse(ddlBookingIDDetails.SelectedValue, out bookingID))
            {
                lblConfirmMessage.Text = "Please select a valid booking ID.";
                return;
            }
                      
            // Load ONLY the selected Booking ID.            
            LoadSelectedBooking(bookingID);

            // Check whether this booking has already been checked out
            // so we can control the optional section.
            string query = @"SELECT Checked_Out FROM BOOKING WHERE Booking_ID = @Booking_ID AND Tourist_ID = @Tourist_ID";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                        cmd.Parameters.AddWithValue("@Tourist_ID", touristID);

                        object result = cmd.ExecuteScalar();

                        if (result != null && result != DBNull.Value)
                        {
                            bool checkedOut = Convert.ToBoolean(result);

                        }
                       
                    }
                }
            }
            catch (Exception ex)
            {
                lblConfirmMessage.Text = "Database error: " + ex.Message;
               
            }
        }       
    }
}
