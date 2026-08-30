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
     

        protected void Page_Load(object sender, EventArgs e)
        {
            // page loads data grid view nin the beginning

            if (!IsPostBack) //uploads bookingIDs in the begin
            {

                 /*string query = @"SELECT Booking_ID FROM BOOKING ";
                try
                {
                    using (SqlConnection conn = new SqlConnection(ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            
                            SqlDataReader reader = cmd.ExecuteReader();

                            ddlBookingEventsStaffcheckin.Items.Add("Select Booking ID");
                            while (reader.Read())
                            {
                                ddlBookingEventsStaffcheckin.Items.Add(reader["Booking_ID"].ToString());
                            }

                            reader.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "Database error: " + ex.Message;
                }  
                 */
            }

            
        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {

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
                SqlDataReader reader = cmd.ExecuteReader();
                if (!reader.Read())
                {
                    lblOutput.Text = "Booking not found.";
                    reader.Close();
                    return;
                }
                int paymentMadeOrdinal = reader.GetOrdinal("Payment_Made");
                int checkInOrdinal = reader.GetOrdinal("Checked_In");

                bool paymentMade = reader.IsDBNull(paymentMadeOrdinal) ? false : reader.GetBoolean(paymentMadeOrdinal);
                bool checkIn = reader.IsDBNull(checkInOrdinal) ? false : reader.GetBoolean(checkInOrdinal);

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
            //tourist session
            int touristID = 0;

            if (!int.TryParse(txtTouristID.Text, out touristID))
            {
                lblerror.Text = "Invalid tourist ID.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString)) // specifically for selected bookingID
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
                    }

                    numberOfBookings++;
                    // checks for invalid touristId's
                    if (!reader.Read())
                    {
                        lblerror.Text = "Tourist not found.";
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
                SqlDataReader reader = cmd.ExecuteReader();
                if (!reader.Read())
                {
                    lblOutput.Text = "Booking not found.";
                    reader.Close();
                    return;
                }


            }
        }
    }
}
    

