using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project
{
    public partial class DeleteEvent : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
                    ddlEventID.Items.Add(reader["Event_ID"].ToString());
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
                    ddlEventTypeID.Items.Add(reader["EventType_ID"].ToString());
                }
                reader.Close();
            }
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            if(!recordExists(int.Parse(ddlEventID.SelectedItem.Text)))
            {
                lblMessage.Text = "Event ID does not exist";
                return;
            }
            lblMessage.Text = "You are about to delete the event: " + ddlEventID.Text;
            lblConfirmM.Text = "Are you sure about your decision?";
            btnCancel.Visible = false;
            btnDelete.Visible = false;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            resetEvent();   
        }

        private void resetEvent()
        {
            ddlEventID.SelectedIndex = 0;
            lblConfirmM.Text = "";
            lblMessage.Text = "";
            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnYes.Visible = false;
            btnNo.Visible = false;
        }
        private void resetEventType()
        {
            ddlEventTypeID.SelectedIndex = 0;
            lblConfirm.Text = "";
            lblETMessage.Text = "";
            btnETCancel.Visible = true;
            btnDeleteET.Visible = true;
            btnETYes.Visible = false;
            btnETNo.Visible = false;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();

                    string sql = "DELETE FROM EVENT WHERE Event_ID = @id";
                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@id", ddlEventID.Text);
                        comm.ExecuteNonQuery();
                    }

                }
                lblMessage.Text = "Event deleted successfully.";
                lblConfirmM.Visible = false;

                btnCancel.Visible = true;
                btnDelete.Visible = true;
                btnYes.Visible = false;
                btnNo.Visible = false;

                loadEvents();
            }
            catch(SqlException ex)
            {
                lblMessage.Text = ex.Message;
                lblConfirmM.Visible = false;
            }
        }

        protected void btnETYes_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();

                    string sql = "DELETE FROM EVENTTYPE WHERE EventType_ID = @id";
                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@id", ddlEventTypeID.Text);
                        comm.ExecuteNonQuery();
                    }

                }

                lblETMessage.Text = "Event Type deleted successfully.";
                lblConfirm.Visible = false;

                ddlEventTypeID.SelectedIndex = 0;
                btnETCancel.Visible = true;
                btnDeleteET.Visible = true;
                btnETYes.Visible = false;
                btnETNo.Visible = false;

                loadEvents();
            }
            catch (SqlException ex)
            {
                lblETMessage.Text = ex.Message;
                lblConfirm.Visible = false;
                btnETCancel.Visible = true;
                btnDeleteET.Visible = false;
                btnETYes.Visible = false;
                btnETNo.Visible = false;
            }
        }

        protected void btnDeleteET_Click(object sender, EventArgs e)
        {
            int id = int.Parse(ddlEventTypeID.SelectedValue);
            if (!recordETExists(id))
            {
                lblETMessage.Text = "Event Type ID does not exist";
                return;
            }

            lblETMessage.Text = "You are about to delete the event: " + ddlEventTypeID.Text;
            lblConfirm.Text = "Are you sure about your decision?";
            btnETCancel.Visible = false;
            btnDeleteET.Visible = false;
            btnETYes.Visible = true;
            btnETNo.Visible = true;
        }

        protected void btnETCancel_Click(object sender, EventArgs e)
        {
            resetEventType();
        }
    }
}