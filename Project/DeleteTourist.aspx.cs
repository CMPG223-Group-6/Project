using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Project
{
    public partial class DeleteTourist : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;
        SqlDataAdapter ap;
        SqlDataReader reader;
        string ConString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTourists(); 
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            int TouristID = int.Parse(txtDeleteTouristID.Text);

            using(conn = new SqlConnection(ConString))
            {
                string sql = "DELETE FROM Tourist WHERE Tourist_ID = @TouristID";
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@TouristID", TouristID);
                conn.Open();
                cmd.ExecuteNonQuery();
                LoadTourists();
                lblDeleteMessage.Text = "Tourist deleted successfully!";
            }
        }
        private void LoadTourists()
        {
            using (conn = new SqlConnection(ConString))
            {
                string sql = "SELECT * FROM Tourist";
                cmd = new SqlCommand(sql, conn);
                ap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ap.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}