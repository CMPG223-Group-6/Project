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
        int touristID;
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


                 if (Session["QuestionnaireCompleted"] != null) // checks if the questionaire is completed. 
                 {
                     bool answered = (bool)Session["QuestionnaireCompleted"];

                     if (answered)
                     {
                         lblConfirmMessage.Text = "You have succesfully checked out .";

                         string bookingID = ddlBookingIDDetails.SelectedValue;

                        loadBookings();

                     }
                    else
                    {
                        lblConfirmMessage.Text = "Answer the questionannaire.";
                        btnQuestionaire.Visible = true;
                    }
                 }

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
                string query = @" SELECT * FROM BOOKING WHERE Booking_ID = @Booking_ID"; // get payment and checked in status
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Booking_ID", bookingID);
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

                bool.TryParse(reader["Checked_In"].ToString(), out checkIn);
                bool.TryParse(reader["Checked_Out"].ToString(), out checkOut);

                if (reader["Checked_In"] != DBNull.Value)
                {
                    bool.TryParse(reader["Checked_In"].ToString(), out checkIn);
                }

                if (reader["Checked_Out"] != DBNull.Value)
                {
                    bool.TryParse(reader["Checked_Out"].ToString(), out checkOut);
                }

                reader.Close();

                Session["check_in"] = checkIn;
                reader.Close();

                // Check the Checked_In Session
                if (Session["check_in"] == null || bool.TryParse(Session["check_in"].ToString(), out checkIn) == false)
                {
                    lblConfirmMessage.Text = "You haven't checked in yet.";

                    // Redirect to Check_In.aspx
                    Response.Redirect("CheckIn.aspx");

                    return;
                }
                else if (checkOut == true)
                {
                    lblConfirmMessage.Text = "You have already checked out.";
                    return;
                }
                else
                {
                    string updateQuery = @" UPDATE BOOKING SET Checked_Out = @checkedOut WHERE Booking_ID = @Booking_ID"; // updates checkin bit
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                    {
                        updateCmd.Parameters.AddWithValue("@Booking_ID", bookingID);
                        updateCmd.Parameters.AddWithValue("@checkedOut", true);
                        int rowsUpdated = updateCmd.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            lblConfirmMessage.Text = "Successfullly updated";
                        }
                        else
                        {
                            lblConfirmMessage.Text = "Unsuccessfully updated.";
                        }
                    }

                    loadBookings();
                }
            }
        }

        protected void btnSubmitRating_Click(object sender, EventArgs e)
        {

            int rating = 0;
            string rating_word = " ";

            if (rbStar1.Checked)
            {
                rating = 1;
                rating_word = "Poor";
            }
            else if (rbStar2.Checked)
            {
                rating = 2;
                rating_word = "Bad";
            }
            else if (rbStar3.Checked)
            {
                rating = 3;
                rating_word = "Average";
            }
            else if (rbStar4.Checked)
            {
                rating = 4;
                rating_word = "Good";
            }
            else if (rbStar5.Checked)
            {
                rating = 5;
                rating_word = "Great";
            }

            if (rating == 0)
            {
                lblResults.Text = "Please select a rating.";
            }
            else
            {
                lblResults.Text = "You rated us " + rating + " out of 5 stars.Your day with us was " + rating_word;
            }

        }

        protected void ddlBookingIDDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null) // tourist session
            {
                touristID = int.Parse(Session["Tourist_ID"].ToString());

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
