using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Checkout : System.Web.UI.Page
    {

        string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
        int touristID = 6;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null) // tourist session
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());

            }


            if (!IsPostBack) //uploads bookingIDs in the begin
            {

                string query = @"SELECT Booking_ID FROM BOOKING " + "WHERE Tourist_ID = @touristID";
                try
                {
                    using (SqlConnection conn = new SqlConnection(ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue(@"touristID", touristID);
                            SqlDataReader reader = cmd.ExecuteReader();

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


                loadBookings();

            }
        }

        protected void btnConfirmExit_Click(object sender, EventArgs e)
        {

            int bookingID;

            if (!int.TryParse(ddlBookingIDDetails.SelectedValue, out bookingID))
            {
                lblConfirmMessage.Text = "Please select a booking ID.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                string query = @"SELECT Checked_In, Checked_Out FROM BOOKING WHERE Booking_ID = @Booking_ID AND Tourist_ID = @Tourist_ID";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                cmd.Parameters.AddWithValue("@Tourist_ID", touristID);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (!reader.Read())
                {
                    lblConfirmMessage.Text = "Booking not found.";
                    reader.Close();
                    return;
                }

                bool checkIn;
                bool checkOut;

                if (reader["Checked_In"] != DBNull.Value)
                {
                    checkIn = Convert.ToBoolean(reader["Checked_In"]); 
                }
                else
                {
                    checkIn = false;
                }

                if (reader["Checked_Out"] != DBNull.Value)
                {
                    checkOut = Convert.ToBoolean(reader["Checked_Out"]);
                }
                else
                {
                    checkOut = false;
                }

                reader.Close();

                // Check if the tourist has checked in
                if (checkIn == false)
                {
                    lblConfirmMessage.Text = "You haven't checked in yet.";
                    return;
                }

                // Check if the tourist has already checked out
                else if (checkOut == true)
                {
                    lblConfirmMessage.Text = "You have already checked out.";
                    return;
                }

                else
                {
                    string updateQuery = @"UPDATE BOOKING SET Checked_Out = @checkedOut WHERE Booking_ID = @Booking_ID";

                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                    {
                        updateCmd.Parameters.AddWithValue("@Booking_ID", bookingID);
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

                    loadBookings();
                }
            }
        }

        protected void btnSubmitRating_Click(object sender, EventArgs e)
        {

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

            if (rating == 0)
            {
                lblResults.Text = "Please select a rating.";
            }
            else
            {
                lblResults.Text = "You rated us " + rating + " out of 5 stars.";

            }

            string Review = "";
            if(txtInputreview.Text == "")
            {
                Review = "None";
            }
            else
            {
                Review = txtInputreview.Text;
            }

            if(ddlBookingIDDetails.SelectedIndex != 0)
            {
                lblError.Text = "";
                string query = @"UPDATE BOOKING
                            SET Questionnaires = @Questionnaires
                            WHERE BOOKING_ID = @Booking_ID";


                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Booking_ID", ddlBookingIDDetails.SelectedValue);
                    cmd.Parameters.AddWithValue("@Questionnaires", Review);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

            }
            else
            {
                lblError.Text = "Please Select booking";
            }



        }

        protected void ddlBookingIDDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null) // tourist session
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());

            }

            if (ddlBookingIDDetails.SelectedIndex == 0)
            {
                loadBookings();               
                lblConfirmMessage.Text = " ";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    string sql_query = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID"; // populates the ddl with selected tourist_ID

                    SqlCommand cmd = new SqlCommand(sql_query, conn);
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingIDDetails.SelectedItem.ToString());

                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    gvTouristActivitySummary.DataSource = ds;
                    gvTouristActivitySummary.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblConfirmMessage.Text = "Database error: " + ex.Message;

                if (ddlBookingIDDetails.SelectedIndex == 0)
                {
                    loadBookings();
                }
            }


        }

        private void loadBookings() //loads initially and when you have chosen your Id
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

                        gvTouristActivitySummary.DataSource = ds;
                        gvTouristActivitySummary.DataBind();

                        conn.Close();

                    }
                }
            }
            catch (Exception ex)
            {
                lblConfirmMessage.Text = "Database error: " + ex.Message;
            }
        }

        protected void btnQuestionaire_Click(object sender, EventArgs e)
        {
            Response.Redirect("Questionnaireform.aspx");
        }
    }
}