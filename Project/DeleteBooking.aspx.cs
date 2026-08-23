using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class DeleteBooking : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT * FROM BOOKING";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();



                adap.SelectCommand = comm;
                adap.Fill(ds, "BOOKING");

                gvBookings.DataSource = ds;
                gvBookings.DataBind();

            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            BtnDelete.Visible = false;
            btnCancel.Visible = false;

            lblDeleteMessage.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "DELETE FROM BOOKING WHERE Booking_ID = @id";
                using (SqlCommand comm = new SqlCommand(sql, conn))
                {
                    comm.Parameters.AddWithValue("@id", txtBookingID.Text);
                    comm.ExecuteNonQuery();
                }

            }

            txtBookingID.Text = "";
            BtnDelete.Visible = true;
            btnCancel.Visible = true;

            lblDeleteMessage.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;

        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            BtnDelete.Visible = true;
            btnCancel.Visible = true;

            lblDeleteMessage.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
        }
    }
}