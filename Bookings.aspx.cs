using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Project
{
    public partial class Bookings : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            if (Session["Tourist_FirstName"] != null && Session["Tourist_LastName"] != null)
            {
                lblNameDisplay.Text = Session["Tourist_FirstName"] + " " + Session["Tourist_LastName"];
            }
           
        }

        protected void btnMyBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyBookings.aspx");
        }

        protected void btnNewBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewBooking.aspx");
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelBooking.aspx");
        }

        protected void btnUpdateBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using(SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT E.Event_ID, ET.Event_Name, E.Event_Price, E.Max_Visitors, E.Tickets_Available, E.Status " + 
                             "FROM Event E, EventType ET " +
                             "WHERE E.EventType_ID = ET.EventType_ID " + 
                                   "AND ET.Event_Name = @EventName";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@EventName", txtSearch.Text);

                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap.SelectCommand = cmd;
                    adap.Fill(ds, "EVENT");

                    gdvDisplayEvents.DataSource = ds;
                    gdvDisplayEvents.DataBind();
                }
            }
        }

        public void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT E.Event_ID, ET.Event_Name, E.Event_Price, E.Max_Visitors, E.Tickets_Available
                               FROM EVENT E, EVENTTYPE ET
                               WHERE E.EventType_ID = ET.EventType_ID";


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

        protected void btnReload_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadData();
        }

        protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}