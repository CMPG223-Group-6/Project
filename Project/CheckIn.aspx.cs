using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class CheckIn : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["BookingID"] != null)
            {
                string touristID = Session["BookingID"].ToString();

                lblOutput.Text = touristID;
            }
            else
            {
                lblOutput.Text = "No Booking ID session found.";
            }

            string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
            string sql_query = @" SELECT * FROM BOOKING WHERE Tourist_ID = @Tourist_ID;";
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
                        gvCurrentbookings.DataSource = dt;
                        gvCurrentbookings.DataBind();

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
            //must check for payment
            //if not paid show message and redirect to payment 


            if (ddlBookingEvents0.SelectedIndex == -1)
            {
                lblOutput.Text = "Choose an option";
            }
            else
            {
                lblOutput.Text = "You have successfully checked in.Enjoy!";
            }

            int selectedbookingID = 0;
            ;

            string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
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
                    lblOutput.Text = "Tourist checked in successfully Enjoy.";
                }
                else
                {
                    lblOutput.Text = "Tourist check-in unsuccessful.";
                }
            }

            int bookingId = 0;

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {


                string query = @"SELECT Payment_Made = @Payment_Made, checkin FROM Booking WHERE Booking_ID = @Booking_Id ";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Booking_ID",bookingId);
                    cmd.Parameters.AddWithValue("@Payment_Made", true);


                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    bool payed = Convert.ToBoolean(reader["Payment_Made"]);
                    bool checkin = Convert.ToBoolean(reader["CheckedIn"]);

                    reader.Close();


                    if (payed == false)
                    {
                        lblOutput.Text =
                            "You haven't paid for this booking.";

                        // Show payment button
                        btnpayment.Visible = true;

                        return;
                    }

                }
            }
        }

        protected void ddlBookingEvents0_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["TouristID"] != null)
            {
                string touristID = Session["TouristID"].ToString();

                lblOutput.Text = touristID;
            }
            else
            {
                lblOutput.Text = "No Tourist ID session found.";
            }
        }

        protected void btnpayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}