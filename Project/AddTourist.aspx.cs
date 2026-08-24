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
        string ConString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";

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
            string Name = txtName.Text;
            string Surname = txtSurname.Text;
            string Country = ddlCountries.SelectedValue;
            string Number = txtPhoneNo.Text;
            string Email = txtEmail.Text;
            string date = txtDate.Text;

            using (conn = new SqlConnection(ConString))
            {
                string sql = "INSERT INTO Tourist (Tourist_FirstName,Tourist_LastName,Contact_Number,Email_Address, Date) VALUES (@LastName, @FirstName, @Country, @PhoneNo, @Email, @Date)";
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@FirstName", Name);
                cmd.Parameters.AddWithValue("@LastName", Surname);
                cmd.Parameters.AddWithValue("@Country", Country);
                cmd.Parameters.AddWithValue("@PhoneNo", Number);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Date", date);
               
                cmd.ExecuteNonQuery();

            }
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
