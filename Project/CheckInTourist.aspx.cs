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
       

        protected void Page_Load(object sender, EventArgs e)
        {

            string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
            string sql_query = @" SELECT * FROM BOOKING";
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(sql_query, conn))
                    {
                        SqlCommand cmd = new SqlCommand(sql_query, conn);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        DataTable dt = new DataTable();
                        reader.Close();

                        adapter.Fill(dt);
                        gvBookingsStaffside.DataSource = dt;
                        gvBookingsStaffside.DataBind();

                        conn.Close();

                    }

                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;
            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            int selectedbookingID = 0;
            

            string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    string query = @"UPDATE BOOKING SET Checked_In = @checkIn WHERE Booking_ID = @Booking_ID";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Booking_ID", selectedbookingID);
                    cmd.Parameters.AddWithValue("@checkIn", true);

                    conn.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblOutput.Text = "Tourist checked in successfully.";
                    }
                    else
                    {
                        lblOutput.Text = "Tourist check-in unsuccessful.";
                    }
                }

                int bookingId = 0;

                using (SqlConnection con = new SqlConnection(ConnectionString))
                {


                    string query = @"SELECT Payment_Made, Checked_In FROM Booking WHERE Booking_ID = @Booking_Id ";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Booking_ID", bookingId);


                        con.Open();

                        SqlDataReader reader = cmd.ExecuteReader();
                        bool payed = Convert.ToBoolean(reader["payed"]);
                        bool checkin = Convert.ToBoolean(reader["checkin"]);

                        reader.Close();


                        if (payed == false)
                        {
                            lblOutput.Text =
                                "You haven't paid for this booking.";

                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Check-in unsuccessful: " + ex.Message;
            }

            if (ddlBookingEventsStaffcheckin.SelectedIndex == -1)
            {
                lblOutput.Text = "Choose an option";
            }
            else
            {
                lblOutput.Text = "You have successfully checked in.Enjoy!";
            }
        }


        protected void btnEnter_Click(object sender, EventArgs e)
        {
            
            int touristID;

            if (!int.TryParse(txtTouristID.Text, out touristID))
            {
                lblerror.Text = "Invalid tourist ID.";
                return;
            }

            string ConnectionString = @"Data Source=localhost;Initial Catalog=zims.db; Integrated Security=True";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
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

                    reader.Close();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    adapter.Fill(dt);

                    gvBookingsStaffside.DataSource = dt;
                    gvBookingsStaffside.DataBind();

                    if (numberOfBookings == 0)
                    {
                        lblOutput.Text = "No bookings found for this Tourist ID.";
                    }
                    else
                    {
                        lblOutput.Text = "Number of bookings found: " + numberOfBookings;
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;

            } 
        }

        protected void ddlBookingEventsStaffcheckin_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedBookingID;

            if (int.TryParse(
                ddlBookingEventsStaffcheckin.SelectedValue,out selectedBookingID))
            {
                LoadSelectedBooking(selectedBookingID);
            }
        }
        private void LoadSelectedBooking(int selectedBookingID)
        {
            string ConnectionString = @"Data Source=localhost;Initial Catalog=zims.db; Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string sql_query = @" SELECT * FROM BOOKING WHERE Booking_ID = @Booking_ID";

                SqlCommand cmd = new SqlCommand(sql_query, conn);

                cmd.Parameters.AddWithValue("@Booking_ID", selectedBookingID);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                adapter.Fill(dt);

                gvBookingsStaffside.DataSource = dt;
                gvBookingsStaffside.DataBind();
            }
        }
    }
    
}
