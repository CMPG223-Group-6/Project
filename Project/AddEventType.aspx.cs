using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AddEventType : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            txtPrice.Attributes["Min"] = 1.ToString();
            txtCapacity.Attributes["Min"] = 1.ToString();
            loadData();
        }

        private void loadData()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT * FROM EVENTTYPE";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();

                ddlEventTypeID.Items.Add("Select Event Type ID");
                while (reader.Read())
                {
                    ddlEventTypeID.Items.Add(reader.GetValue(0).ToString());
                }

                reader.Close();

                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();

                adap.SelectCommand = comm;
                adap.Fill(ds, "EVENTTYPE");

                gvEventTypes.DataSource = ds;
                gvEventTypes.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int capacity = int.Parse(txtCapacity.Text);
                decimal price = decimal.Parse(txtPrice.Text);
                if (price >= 0 && capacity >= 0)
                {
                    using (SqlConnection conn = new SqlConnection(conStr))
                    {
                        conn.Open();

                        string sql = "INSERT INTO Event (EventType_ID, Event_Price, Max_Visitors, Tickets_Available, Status)" +
                                     "VALUES (@eventTypeID, @price, @capacity, @available, @status)";
                        using (SqlCommand comm = new SqlCommand(sql, conn))
                        {
                            comm.Parameters.AddWithValue("@eventTypeID", ddlEventTypeID.SelectedItem.Text);
                            comm.Parameters.AddWithValue("@price", price);
                            comm.Parameters.AddWithValue("@capacity", capacity);

                            if (ddlSetStatus.SelectedItem.Text != "Full")
                            {
                                comm.Parameters.AddWithValue("@available", capacity);
                            }
                            else
                            {
                                comm.Parameters.AddWithValue("@available", 0);
                            }
                            comm.Parameters.AddWithValue("@status", ddlSetStatus.SelectedItem.Text);
                            comm.ExecuteNonQuery();
                        }

                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Event Added Succesfully";
                    }
                    txtCapacity.Text = "";
                    txtPrice.Text = "";
                    ddlEventTypeID.SelectedIndex = 0;
                    ddlSetStatus.SelectedIndex = 0;
                    loadData();
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please enter a valid price and capacity";
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void txtEventType_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtCapacity.Text = "";
            txtPrice.Text = "";
            ddlEventTypeID.SelectedIndex = 0;
            ddlSetStatus.SelectedIndex = 0;
            txtEventNameDisplay.Text = "";
        }

        protected void txtCapacity_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvEventTypes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlEventTypeID_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT Event_Name FROM EVENTTYPE WHERE EventType_ID = @eventTypeID";

                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@eventTypeID", ddlEventTypeID.SelectedItem.Text);

                SqlDataReader reader = comm.ExecuteReader();

                while(reader.Read())
                {
                    txtEventNameDisplay.Text = reader["Event_Name"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnCancelEventType_Click(object sender, EventArgs e)
        {
            txtEventName.Text = "";
            txtEventDesc.Text = "";
        }

        protected void btnEventTypeAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtEventName.Text;
                string description = txtEventDesc.Text;
                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();

                    string sql = "INSERT INTO EVENTTYPE (Event_Name, Event_Description)" +
                                 "VALUES (@name, @desc)";
                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@name", name);
                        comm.Parameters.AddWithValue("@desc", description);
                        comm.ExecuteNonQuery();
                    }

                    lblEventMessage.ForeColor = System.Drawing.Color.Green;
                    lblEventMessage.Text = "Event Type Added Succesfully";
                }
                txtEventDesc.Text = "";
                txtEventName.Text = "";
                loadData();
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}