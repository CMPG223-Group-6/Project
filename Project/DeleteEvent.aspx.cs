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
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT e.*, et.* FROM Event e, EVENTTYPE et";

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
                adap.Fill(ds,"EVENT");

                gvEvents.DataSource = ds;
                gvEvents.DataBind();

            }
        }

        
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "You are about to delete the event: " + ddlEventID.Text;
            lblConfirmM.Text = "Are you sure about your decision?";
            btnCancel.Visible = false;
            btnDelete.Visible = false;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainEventsTypes.aspx");
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
        }
    }
}