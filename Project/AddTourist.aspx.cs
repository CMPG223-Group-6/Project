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
    public partial class AddTourist : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;
        SqlDataAdapter ap;
        SqlDataReader reader;
        string ConString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Trust Server Certificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTourists();
        }

        protected void gvTourist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {

        }

        private void LoadTourists()
        {
            using(conn = new SqlConnection(ConString))
            {
               string sql = "SELECT * FROM Tourist";
                cmd = new SqlCommand(sql, conn);
                ap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ap.Fill(dt);
                gvTourist.DataSource = dt;
                gvTourist.DataBind();
                
            }
        }
    }
}
