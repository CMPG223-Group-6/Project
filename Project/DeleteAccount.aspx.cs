using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Project
{
    public partial class DeleteAccount : System.Web.UI.Page
    {
        int Tourist_ID;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
 
            if (Session["Tourist_ID"] != null)
            {
                Tourist_ID = int.Parse(Session["Tourist_ID"].ToString());
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {

        }

        protected void btnProceed_Click1(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                //Update Booking and Event tables
                string sql = @"DELETE FROM TOURIST WHERE Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("default.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }
    }
}