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
        protected void Page_Load(object sender, EventArgs e)
        {
 
                if (!IsPostBack)
                {

                    LoadBookings();
       
                    DisplayTouristSummary();
                }


        }

        protected void btnConfirmExit_Click(object sender, EventArgs e)
        {

            if (ddlBookingIDDetails.SelectedIndex == -1)
            {
                lblConfirmMessage.Text = "Choose an option";
            }
            else
            {
                Response.Redirect("QuestionnaireForm.aspx");
            }

           
        }

        private void LoadBookings()
        {
            string connectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Booking_ID FROM BOOKING ORDER BY Booking_ID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                ddlBookingIDDetails.DataSource = dt;
                ddlBookingIDDetails.DataTextField = "Booking_ID";
                ddlBookingIDDetails.DataValueField = "Booking_ID";
                ddlBookingIDDetails.DataBind();
            }
        }


        private void DisplayTouristSummary()
        {
            string ConnectionString = @"Data Source= localhost;Initial Catalog=zims.db;Integrated Security=True";
            string sql_query = @" SELECT Booking_ID, Checked_In, Checked_Out FROM BOOKING";
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
                        gvTouristActivitySummary.DataSource = dt;
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

        }
    }
}
