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
            ddlEventID.SelectedIndex = 0;
        }

        protected void btnYes_Click(object sender, EventArgs e)
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

            ddlEventID.SelectedIndex = 0;
            btnCancel.Visible = true;
            btnDelete.Visible = true;
            btnYes.Visible = false;
            btnNo.Visible = false;

            loadEvents();
        }
    }
}