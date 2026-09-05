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
            txtCapacity.Attributes["Min"] = 1.ToString();
            txtAvailable.Attributes["Min"] = 1.ToString();
            txtPrice.Attributes["Min"] = 1.ToString();

            if (!IsPostBack)
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
                ddlEventID.Items.Clear();
                ddlEventID.Items.Add("Select Event ID");
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

                sql = "SELECT EventType_ID FROM EVENTTYPE";
                comm = new SqlCommand(sql, conn);

                reader = comm.ExecuteReader();

                ddlEventTypeID.Items.Clear();
                ddlEventTypeID.Items.Add("Select Event Type ID");
                while (reader.Read())
                {
                    ddlEventTypeID.Items.Add(reader.GetValue(0).ToString());
                }
                reader.Close();
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearFields();
        }

        private void clearFields()
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
                int available = int.Parse(txtAvailable.Text);
                string status = ddlSetStatus.SelectedItem.Text;

                if (available == 0)
                {
                    status = "Full";
                }

                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();
                    string sql = @"UPDATE EVENT SET EventType_ID = @eventtypeID Event_Price = @price, Max_Visitors = @capacity, Tickets_Available = @spaces, Status = @status 
                             WHERE Event_ID = @eventID";

                    SqlCommand comm = new SqlCommand(sql, conn);

                    comm.Parameters.AddWithValue("@eventID", int.Parse(ddlEventID.SelectedItem.Text));
                    comm.Parameters.AddWithValue("@price", double.Parse(txtPrice.Text));
                    comm.Parameters.AddWithValue("@capacity", int.Parse(txtCapacity.Text));
                    comm.Parameters.AddWithValue("@spaces", available);
                    comm.Parameters.AddWithValue("@status", status);
                    comm.Parameters.AddWithValue("@eventtypeID", int.Parse(ddlUpdEventTypeID.SelectedItem.Text));
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

            clearFields();
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
        private bool recordETExists(int IDCheck)
        {
            bool exists = false;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT EventType_ID FROM EVENTTYPE";

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
                        ddlUpdEventTypeID.Text = reader.GetValue(1).ToString();
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

                    loadEvents();
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnEventTypeCancel_Click(object sender, EventArgs e)
        {
            ddlEventTypeID.SelectedIndex = 0;
            txtEventType.Text = "";
            txtDesc.Text = "";
            ddlSetStatus.SelectedIndex = 0;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();
                    string sql = @"UPDATE EVENTTYPE SET Event_Name = @eventName, Event_Description = @descr 
                             WHERE EventType_ID = @eventtypeID";

                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@eventtypeID", int.Parse(ddlEventTypeID.SelectedItem.Text));
                        comm.Parameters.AddWithValue("@eventName", txtEventType.Text);
                        comm.Parameters.AddWithValue("@descr", txtDesc.Text);
                        comm.ExecuteNonQuery();
                    }
                }
                lblMessage.Text = "Event Type Updated Successfully";
                ddlEventTypeID.SelectedIndex = 0;
                txtDesc.Text = "";
                txtEventType.Text = "";
                loadEvents();
            }
            catch (SqlException ex)
            {
                lblMessage0.Text = "Error: " + ex.Message;
                lblMessage0.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ddlEventTypeID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!recordETExists(int.Parse(ddlEventTypeID.SelectedItem.Text)))
            {
                lblMessage.Text = "Event Type ID does not exist";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {

                    conn.Open();

                    string sql = "SELECT EventType_ID, Event_Name, Event_Description FROM EVENTTYPE " +
                                 "WHERE EVENTTYPE_ID = @id ";


                    SqlCommand comm = new SqlCommand(sql, conn);
                    comm.Parameters.AddWithValue("@id", ddlEventTypeID.SelectedItem.Text);
                    SqlDataReader reader = comm.ExecuteReader();

                    while (reader.Read())
                    {
                        txtEventType.Text = reader["Event_Name"].ToString();
                        txtDesc.Text = reader["Event_Description"].ToString();
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