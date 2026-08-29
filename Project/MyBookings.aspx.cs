using System;
using System.Collections.Generic;
using System.Data;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Project
{
    public partial class MyBookings : System.Web.UI.Page
    {
        int Tourist_ID;
        string surname;
        string name;
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null)
            {
                Tourist_ID = int.Parse(Session["Tourist_ID"].ToString());
            }
            if (Session["Tourist_LastName"] != null)
            {
                surname = Session["Tourist_LastName"].ToString();
            }
            if (Session["Tourist_FirstName"] != null)
            {
                name = Session["Tourist_FirstName"].ToString();
            }
            if (!IsPostBack)
            {
                //Load all the data the tourist booked to grid view 
                LoadDataBooking(Tourist_ID);
            }

            lblNameDisplay.Text = name + " " + surname;
        }

        protected void btnAvailableEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }

        protected void btnNewBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewBooking.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelBooking.aspx");
        }

        public void LoadDataBooking(int Tourist_ID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT B.Booking_ID, B.Event_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, 
                              B.Questionnaires, B.Payment_Method, B.Payment_Amount, B.Payment_Made
                              FROM BOOKING B, EVENT E, EVENTTYPE ET
                              WHERE B.Event_ID = E.Event_ID
                              AND E.EventType_ID = ET.EventType_ID
                              AND B.Tourist_ID = @Tourist_ID
                              ORDER BY B.Arrive_Date ASC"; 

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
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
    }
}