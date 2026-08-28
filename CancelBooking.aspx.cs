using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Cancel : System.Web.UI.Page
    {
        int Tourist_ID; 
        private int TicketsAvailable = 0;
        private string StatusOfEvent = "";
        private int numberTicketsBooked = 0;
        private int maxOfVisitors = 0;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDataBooking(Tourist_ID);
                BookingIDsToDropDownList();

                if (Session["Tourist_ID"] != null)
                {
                    Tourist_ID = int.Parse(Session["Tourist_ID"].ToString());
                }
            }
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            lblDeleteInfo.Visible = true;
            lblQuestion.Visible = true;

            btnCancelProgress.Visible = true;
            btnProceed.Visible = true;
        }

        protected void btnCancelProgress_Click(object sender, EventArgs e)
        {
            lblDeleteInfo.Visible = false;
            lblQuestion.Visible = false;

            btnCancelProgress.Visible = false;
            btnProceed.Visible = false;
        }
        public void LoadDataBooking(int Tourist_ID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT B.Booking_ID, B.Event_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, B.Questionnaires, B.Payment_Method, B.Payment_Amount, B.Payment_Made
                              FROM BOOKING B, EVENT E, EVENTTYPE ET
                              WHERE B.Event_ID = E.Event_ID
                              AND E.EventType_ID = ET.EventType_ID
                              AND B.Tourist_ID = @Tourist_ID
                              AND B.Arrive_Date >= @Today";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Tourist_ID", Tourist_ID);
                    cmd.Parameters.AddWithValue("@Today", DateTime.Today);

                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap.SelectCommand = cmd;
                    adap.Fill(ds, "BOOKING");

                    gdvDisplayEvents.DataSource = ds;
                    gdvDisplayEvents.DataBind();
                }

                conn.Close();
            }
        }
        private int EventID()
        {
            int eventID = 0;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT B.Event_ID, B.Number_Tickets, E.Tickets_Available
                     FROM BOOKING B, EVENT E
                     WHERE B.Event_ID = E.Event_ID
                     AND B.Booking_ID = @bookingID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookingID", (ddrlBookingID.SelectedValue));
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        eventID = Convert.ToInt32(reader["Event_ID"]);
                    }
                }
            }

            return eventID;
        }
        //Read from database to drop down list - where Tourists bookings are greater than today
        private void BookingIDsToDropDownList()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Booking_ID " +
                             "FROM BOOKING " +
                             "WHERE Arrive_Date >= @Today " +
                             "AND Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    cmd.Parameters.AddWithValue("@Today", DateTime.Today);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ddrlBookingID.Items.Add(new ListItem(reader["Booking_ID"].ToString(), reader["Booking_ID"].ToString()));
                    }
                }
            }
        }

        protected void ddrlBookingID_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT B.Booking_ID, B.Event_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, B.Questionnaires, B.Payment_Method, B.Payment_Amount, B.Payment_Made
                              FROM BOOKING B, EVENT E, EVENTTYPE ET
                              WHERE B.Event_ID = E.Event_ID
                              AND E.EventType_ID = ET.EventType_ID
                              AND B.Booking_ID = @bookingID
                              AND B.Tourist_ID = @Tourist_ID";
                

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookingID",ddrlBookingID.SelectedValue);
                    cmd.Parameters.AddWithValue("@Tourist_ID", Tourist_ID);

                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap.SelectCommand = cmd;
                    adap.Fill(ds, "BOOKING");

                    gdvDisplayEvents.DataSource = ds;
                    gdvDisplayEvents.DataBind();
                }

                conn.Close();
            }
        }
        private void AvailabilityOfEvent()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT E.Tickets_Available, E.Status, E.Max_Visitors, B.Number_Tickets
                             FROM EVENT E, BOOKING B
                             WHERE B.Event_ID = E.Event_ID " +
                             "AND B.Booking_ID = @bookingID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookingID", ddrlBookingID.SelectedValue);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        TicketsAvailable = int.Parse(reader["Tickets_Available"].ToString());
                        StatusOfEvent = reader["Status"].ToString();
                        maxOfVisitors = int.Parse(reader["Max_Visitors"].ToString());
                        numberTicketsBooked = int.Parse(reader["Number_Tickets"].ToString());
                    }
                }
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            AvailabilityOfEvent();
            TicketsAvailable = TicketsAvailable + numberTicketsBooked;
            if(TicketsAvailable < maxOfVisitors)
            {
                StatusOfEvent = "Active";
            }

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"DELETE FROM BOOKING
                              WHERE Booking_ID = @bookingID
                              AND Tourist_ID = @touristID
                           
                              UPDATE E SET E.Tickets_Available = @ticketsAvailable, E.Status = @status
                              FROM EVENT
                              WHERE E.Event_ID = @eventID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookingID", ddrlBookingID.SelectedValue);
                    cmd.Parameters.AddWithValue("@eventID", EventID());
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    cmd.Parameters.AddWithValue("@ticketsAvailable", TicketsAvailable);
                    cmd.Parameters.AddWithValue("@status", StatusOfEvent);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadDataBooking(Tourist_ID);
            BookingIDsToDropDownList();

            lblConfirmation.Text = "Your Selected Booking has been successfully deleted.";

            //Clear everything after deleting
            lblDeleteInfo.Visible = false;
            lblQuestion.Visible = false;

            btnCancelProgress.Visible = false;
            btnProceed.Visible = false;
            ddrlBookingID.SelectedIndex = 0;
        }
    }
}