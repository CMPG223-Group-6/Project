using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ChangeEventType : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadEvents();
            }
            
        }

        public void loadEvents()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {

                conn.Open();

                string sql = "SELECT e.Event_ID, e.EVENTTYPE_ID, et.Event_Name, et.Event_Description, e.Event_Price, e.Max_Visitors, " +
                             "e.Tickets_Available, e.Status FROM EVENT e, EVENTTYPE et " +
                             "WHERE e.EVENTTYPE_ID = et.EVENTTYPE_ID ";


                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();

                while (reader.Read())
                {
                    ddlEventID.Items.Add(reader.GetValue(0).ToString());
                }
                reader.Close();

                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();



                adap.SelectCommand = comm;
                adap.Fill(ds);

                gvEvents.DataSource = ds;
                gvEvents.DataBind();

            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ddlEventID.SelectedIndex = 0;
            ddlSetStatus.SelectedIndex = 0;
            txtEventType.Text = "";
            txtDesc.Text = "";
            txtPrice.Text = "";
            txtCapacity.Text = "";
            txtAvailable.Text = "";
        }

        protected void txtEventType_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int eventTypeID = getEventTypeID(int.Parse(ddlEventID.SelectedItem.Text));
                if (eventTypeID == 0)
                {
                    lblMessage.Text = "Please select Event first";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();
                    string sql = @"UPDATE EVENT SET Event_Price = @price, Max_Visitors = @capacity, Tickets_Available = @spaces, Status = @status 
                             WHERE Event_ID = @eventID 

                             UPDATE EVENTTYPE SET Event_Name = @eventName, Event_Description = @descr 
                             WHERE EventType_ID = @eventtypeID";

                    SqlCommand comm = new SqlCommand(sql, conn);

                    comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                    comm.Parameters.AddWithValue("@price", double.Parse(txtPrice.Text));
                    comm.Parameters.AddWithValue("@capacity", int.Parse(txtCapacity.Text));
                    comm.Parameters.AddWithValue("@spaces", int.Parse(txtAvailable.Text));
                    comm.Parameters.AddWithValue("@status", ddlSetStatus.SelectedItem.Text);
                    comm.Parameters.AddWithValue("@eventtypeID", eventTypeID);
                    comm.Parameters.AddWithValue("@eventName", txtEventType.Text);
                    comm.Parameters.AddWithValue("@descr", txtDesc.Text);
                    comm.ExecuteNonQuery();
                }

                loadEvents();
            }
            catch(SqlException ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {

            
        }

        private bool recordExists(int IDCheck)
        {
            bool exists = false;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT Event_ID FROM EVENT";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();

                while (reader.Read())
                {
                    int ID = (int)reader.GetValue(0);
                    if (ID == IDCheck)
                    {
                        exists = true;
                    }
                }
            }

            return exists;
        }

        private int getEventTypeID(int eventID)
        {

            int eventTypeID = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT EVENTTYPE_ID FROM EVENT WHERE Event_ID = @eventID";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@eventID", eventID);
                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    eventTypeID = int.Parse(reader.GetValue(0).ToString());
                }
                reader.Close();
            }
            return eventTypeID;
        }

        protected void ddlEventID_SelectedIndexChanged(object sender, EventArgs e)
        {

            if(!recordExists(int.Parse(ddlEventID.SelectedItem.Text)))
            {
                lblMessage.Text = "Event ID does not exist";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {

                    conn.Open();

                    string sql = "SELECT e.Event_ID, e.EVENTTYPE_ID, et.Event_Name, et.Event_Description, e.Event_Price, e.Max_Visitors, " +
                                 "e.Tickets_Available, e.Status FROM EVENT e, EVENTTYPE et " +
                                 "WHERE e.Event_ID = @id " +
                                 "AND e.EVENTTYPE_ID = et.EVENTTYPE_ID ";


                    SqlCommand comm = new SqlCommand(sql, conn);
                    comm.Parameters.AddWithValue("@id", ddlEventID.SelectedItem.Text);
                    SqlDataReader reader = comm.ExecuteReader();

                    string status = "";
                    while (reader.Read())
                    {
                        ddlEventID.Text = (reader.GetValue(0).ToString());
                        txtEventType.Text = reader.GetValue(2).ToString();
                        txtDesc.Text = reader.GetValue(3).ToString();
                        txtPrice.Text = reader.GetValue(4).ToString();
                        txtCapacity.Text = reader.GetValue(5).ToString();
                        txtAvailable.Text = reader.GetValue(6).ToString();

                        status = ddlSetStatus.Text = reader.GetValue(7).ToString();

                        if (status == "Active")
                        {
                            ddlSetStatus.SelectedIndex = 0;
                        }
                        else if (status == "Inactive")
                        {
                            ddlSetStatus.SelectedIndex = 1;
                        }
                        else if (status == "Full")
                        {
                            ddlSetStatus.SelectedIndex = 2;
                        }
                    }
                    reader.Close();
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}