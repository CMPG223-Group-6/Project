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
    public partial class MaintainBookings : System.Web.UI.Page
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

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void lblSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooking.aspx");
        }

        protected void btnUpdBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeBooking.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteBooking.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}