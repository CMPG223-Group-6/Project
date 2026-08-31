using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace Project
{
    public partial class CheckIn : System.Web.UI.Page
    {
        int  touristID ;

        string ConnectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null) // tourist session
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());

            }

            if (!IsPostBack) //uploads bookingIDs in the begin
            {

                string query = @"SELECT Booking_ID FROM BOOKING " +
                                "WHERE Tourist_ID = @touristID";
                try
                {
                    using (SqlConnection conn = new SqlConnection(ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue(@"touristID", touristID);
                            SqlDataReader reader = cmd.ExecuteReader();

                            ddlBookingEvents0.Items.Add("Select Booking ID");
                            while (reader.Read())
                            {
                                ddlBookingEvents0.Items.Add(reader["Booking_ID"].ToString());
                            }

                            reader.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblOutput.Text = "Database error: " + ex.Message;
                }

                loadBookings();

                btnpayment.Visible = false;
            }

        }

        private void loadBookings()
        {
            string query = @"SELECT B.Booking_ID, B.Event_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, B.Payment_method, B.Payment_Amount, B.Payment_Made, B.Checked_In, B.Checked_Out " +
                                "FROM BOOKING B, EVENT E, EVENTTYPE ET " +
                                "WHERE B.Event_ID = E.Event_ID " +
                                "AND E.EventType_ID = ET.EventType_ID " +
                                "AND B.Tourist_ID = @touristID";
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue(@"touristID", touristID);


                        DataSet ds = new DataSet();

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        adapter.SelectCommand = cmd;
                        adapter.Fill(ds);
                        gvBookings.DataSource = ds;
                        gvBookings.DataBind();

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

            int bookingID;

            if (!int.TryParse(ddlBookingEvents0.SelectedValue, out bookingID))
            {
                lblOutput.Text = "Please select a booking ID.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string query = @" SELECT * FROM BOOKING WHERE Booking_ID = @Booking_ID"; // get payment and checked in status
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
                    lblOutput.Text = "You haven't paid for this booking.";
                    btnpayment.Visible = true;
                    loadBookings();
                    return;
                }
                else if (checkIn == true) // checks checked_in
                {
                    lblOutput.Text = "You cannot check-in again.";
                    btnpayment.Visible = false;
                    loadBookings();
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
                        loadBookings();
                    }
                    


                }
            }

        }

        protected void btnpayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void ddlBookingEvents0_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    string sql_query = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID";

                    SqlCommand cmd = new SqlCommand(sql_query, conn);
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingEvents0.SelectedItem.ToString());

                    conn.Open();



                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    gvBookings.DataSource = ds;
                    gvBookings.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Database error: " + ex.Message;

            }
        }
      
    }
}
