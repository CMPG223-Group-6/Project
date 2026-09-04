using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class CheckInTourist : System.Web.UI.Page
    {
        string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
        int touristID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // page loads data grid view in the beginning

            if (!IsPostBack)
            {
                string query = @"SELECT B.Booking_ID, B.Event_ID, B.Tourist_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, B.Payment_method, B.Payment_Amount, B.Payment_Made, B.Checked_In, B.Checked_Out                          
                            
                     FROM BOOKING B, EVENT E, EVENTTYPE ET
                     WHERE B.Event_ID = E.Event_ID
                     AND E.EventType_ID = ET.EventType_ID";
                     

                try
                {
                    using (SqlConnection conn = new SqlConnection(ConnectionString))
                    {
                        conn.Open();

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@touristID", touristID);

                            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                            DataSet ds = new DataSet();

                            adapter.Fill(ds);

                            gvBookingsStaffside.DataSource = ds;
                            gvBookingsStaffside.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "Database error: " + ex.Message;
                }
            }
        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {

            int bookingID;

            if (!int.TryParse(ddlBookingEventsStaffcheckin.SelectedValue, out bookingID)) // select number in ddl
            {
                lblOutput.Text = "Select a booking ID.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string query = @" SELECT * FROM BOOKING WHERE Booking_ID = @Booking_ID"; // get all of the booking id details
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (!reader.Read())
                {
                    lblOutput.Text = "Booking not found.";
                    reader.Close();
                    return;
                }

                int paymentMadeOrdinal = reader.GetOrdinal("Payment_Made");
                int checkInOrdinal = reader.GetOrdinal("Checked_In");

                bool paymentMade = true;
                bool checkIn = false;

                if (!reader.IsDBNull(paymentMadeOrdinal))
                {
                    bool.TryParse(reader["Payment_Made"].ToString(), out paymentMade);
                }

                if (!reader.IsDBNull(checkInOrdinal))
                {
                    bool.TryParse(reader["Checked_In"].ToString(), out checkIn);
                }

                reader.Close();

                if (paymentMade == false) // checks payment made
                {
                    lblOutput.Text = "You haven't paid for this booking.Please go back to payments";
                    return;
                }
                else if (checkIn == true) // checks checked_in
                {
                    lblOutput.Text = "You cannot check-in again.";
                    return;
                }
                else
                {
                    string updateQuery = @" UPDATE BOOKING SET Checked_In = @checkedIn WHERE Booking_ID = @Booking_ID"; // updates checkin bit
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                    {
                        updateCmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                        updateCmd.Parameters.AddWithValue("@checkedIn", true);
                        int rowsUpdated = updateCmd.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            lblOutput.Text = "Successful check-in.";
                        }
                        else
                        {
                            lblOutput.Text = "Unsuccessful check-in.";
                        }
                    }
                }
            }
        }


        protected void btnEnter_Click(object sender, EventArgs e)
        {
            //tourist text input
            int touristID = int.Parse(txtTouristID.Text);

            if (touristID <= 0)
            {
                lblOutput.Text = "Enter a tourist ID.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString)) // checks if we have the tourist in the database
                {
                    string query = @"SELECT COUNT(*) FROM BOOKING WHERE Tourist_ID = @Tourist_ID";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Tourist_ID", touristID);

                    conn.Open();

                    // Counts how many records have this Tourist ID
                    int touristExists = Convert.ToInt32(cmd.ExecuteScalar());

                    // Check if Tourist ID exists
                    if (touristExists <= 0)
                    {
                        lblOutput.Text = "Tourist ID does not exist";
                        return;
                    }

                }
                    
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;
            }
           
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString)) //  loads specific selected bookingID in the gridview
                {
                    string sql_query = @"SELECT * FROM BOOKING WHERE Tourist_ID = @Tourist_ID";

                    SqlCommand cmd = new SqlCommand(sql_query, conn);
                    cmd.Parameters.AddWithValue("@Tourist_ID", touristID);

                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlBookingEventsStaffcheckin.Items.Clear();
                    int numberOfBookings = 0;

                    while (reader.Read())
                    {
                        ddlBookingEventsStaffcheckin.Items.Add(reader.GetValue(0).ToString());
                        numberOfBookings++;
                    }

                    reader.Close();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    gvBookingsStaffside.DataSource = ds;
                    gvBookingsStaffside.DataBind();

                    numberOfBookings = numberOfBookings++;
                    lblOutput.Text = " Number of bookings found: " + numberOfBookings;
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;

            }
           
        }

        protected void ddlBookingEventsStaffcheckin_SelectedIndexChanged(object sender, EventArgs e)
        {

            try  // populates ddl from bookings table
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    string sql_query = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID";

                    SqlCommand cmd = new SqlCommand(sql_query, conn);
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingEventsStaffcheckin.SelectedItem.Text);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    gvBookingsStaffside.DataSource = ds;
                    gvBookingsStaffside.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;

            }
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            //only display the selected booking Id with a successful checkin bit
            int bookingID;

            if (!int.TryParse(ddlBookingEventsStaffcheckin.SelectedValue, out bookingID)) // select number in ddl
            {
                lblOutput.Text = "Please select a booking ID.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string query = @" SELECT * FROM BOOKING WHERE Booking_ID = @Booking_ID"; // get all of the booking id details
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                conn.Open();
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adap.Fill(ds);

                gvBookingsStaffside.DataSource = ds;
                gvBookingsStaffside.DataBind();



            }
        }

        protected void txtTouristID_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
    

