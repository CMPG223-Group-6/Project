using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Project
{
    public partial class MyOverview : System.Web.UI.Page
    {
        int Tourist_ID;
        string surname;
        string name;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();

            //Clear and Reloads booking details
            lblBookedDisplay.Text = "";
            lblDisplayVisits.Text = "";
            lblDisplaySpent.Text = "";

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

            lblNameDisplay.Text = name + " " + surname;
            lblNameDisplay0.Text = "Welcome back, " + name + " " + surname;

            //Total booking of tourist
            lblBookedDisplay.Text = GetBookingCount(Tourist_ID).ToString();
            //Total Visits of tourist
            lblDisplayVisits.Text =  GetCheckInCount(Tourist_ID).ToString();
            //Total amount spent by tourist
            lblDisplaySpent.Text = GetTotalAmountSpent(Tourist_ID).ToString();
        }

        protected void gdvDisplayEvents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT E.Event_ID, ET.Event_Name, E.Event_Price, E.Max_Visitors, E.Tickets_Available, E.Status
                               FROM EVENT E, EVENTTYPE ET
                               WHERE E.EventType_ID = ET.EventType_ID
                               AND E.Status LIKE '%ctive%'";


                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap.SelectCommand = cmd;
                    adap.Fill(ds, "EVENT");

                    gdvDisplayEvents.DataSource = ds;
                    gdvDisplayEvents.DataBind();
                }

                conn.Close();
            }
        }

        private int GetBookingCount(int touristID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT COUNT(*) FROM BOOKING WHERE Tourist_ID = @touristID" +
                             " AND Arrive_Date >= @Today" +
                             " AND Checked_In = 0";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", touristID);
                    cmd.Parameters.AddWithValue("@Today", DateTime.Today);
                    return (int)cmd.ExecuteScalar();
                }
            }
        }

        private int GetCheckInCount(int touristID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT COUNT(*) FROM BOOKING " +
                             "WHERE Tourist_ID = @touristID " +
                             "AND Checked_In = 1";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", touristID);
                    return (int)cmd.ExecuteScalar();
                }
            }
        }
        private decimal GetTotalAmountSpent(int touristID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT SUM(Payment_Amount)" +
                             "FROM BOOKING WHERE Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", touristID);
                    object result = cmd.ExecuteScalar();
                    return result != DBNull.Value ? Convert.ToInt32(result) : 0;
                }
            }
        }

        protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}