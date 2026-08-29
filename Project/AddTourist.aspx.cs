using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            if (!IsPostBack)
            {
                LoadCountries();
                LoadTourists();
            }
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

            string Password = Name + Surname;

            string HashedPassword = HashPassword(Password);


            using (conn = new SqlConnection(ConString))
            {
                string sql = "INSERT INTO Tourist (Tourist_FirstName, Tourist_LastName, Contact_Number, Email_Address, User_Password, Country_ID) VALUES (@FirstName, @LastName, @PhoneNo, @Email, @Password, @Country)";
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@FirstName", Name);
                cmd.Parameters.AddWithValue("@LastName", Surname);
                cmd.Parameters.AddWithValue("@Country", Country);
                cmd.Parameters.AddWithValue("@Password", HashedPassword);
                cmd.Parameters.AddWithValue("@PhoneNo", Number);
                cmd.Parameters.AddWithValue("@Email", Email);

                conn.Open();

                cmd.ExecuteNonQuery();

                LoadTourists();

                lblAddMessage.Text = "Tourist added successfully!";



            }
        }
         public static string HashPassword(string password)
         {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);

                byte[] hash = sha256.ComputeHash(bytes);

                return Convert.ToBase64String(hash);
            }
         }
        


        private void LoadTourists()
        {
            using(conn = new SqlConnection(ConString))
            {
               string sql = "SELECT * FROM Tourist";
                cmd = new SqlCommand(sql, conn);
                ap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ap.Fill(ds);
                gvTourist.DataSource = ds;
                gvTourist.DataBind();
                
            }
        }
        private void LoadCountries()
        {
            using (conn = new SqlConnection(ConString))
            {
                string sql = "SELECT COUNTRY_ID FROM COUNTRY";

                cmd = new SqlCommand(sql, conn);

                ap = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();

                ap.Fill(ds);

                ddlCountries.DataSource = ds;

                ddlCountries.DataTextField = "COUNTRY_ID";
                ddlCountries.DataValueField = "COUNTRY_ID";

                ddlCountries.DataBind();

                ddlCountries.Items.Insert(0, new ListItem("Select a Country", "0"));
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainTourists.aspx");
        }
    }
}
