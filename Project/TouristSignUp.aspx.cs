using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class TouristSignUp : System.Web.UI.Page
    {

        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadCountries();
            }
        }

        private void LoadCountries()
        {
            string sql = @"SELECT COUNTRY_ID, Country_Name FROM COUNTRY ORDER BY Country_Name";

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlCountry.Items.Clear();

                        ddlCountry.Items.Add(new ListItem("-- Select Country --"));

                        while(reader.Read())
                        {
                            ddlCountry.Items.Add(new ListItem(reader["Country_Name"].ToString(), reader["COUNTRY_ID"].ToString()));
                        }
                    }
                }
            }
        }

        protected void lbtnHaveAnAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string password = txtPassword.Text.Trim();

            

            int countryID = Convert.ToInt32(ddlCountry.SelectedValue);

            string hashedPassword = HashPassword(password);

            string sql = @"INSERT INTO TOURIST(Tourist_LastName, Tourist_FirstName, Contact_Number, Email_Address, User_Password, Country_ID) VALUES(@LastName, @FirstName, @ContactNumber, @Email, @Password, @CountryID)";

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@LastName", surname);
                    cmd.Parameters.AddWithValue("@FirstName", name);
                    cmd.Parameters.AddWithValue("@ContactNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", hashedPassword);
                    cmd.Parameters.AddWithValue("@CountryID", countryID);

                    cnn.Open();

                    cmd.ExecuteNonQuery();
                }
            }

            string sql2 = @"SELECT TOURIST_ID FROM TOURIST WHERE Email_Address = @Email";

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql2, cnn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    cnn.Open();

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            int touristID = Convert.ToInt32(reader["Tourist_ID"]);

                            lblTouristIDDisplay.Text = touristID.ToString();

                            Panel1.Visible = true;
                        }
                    }
                }
            }
        }
    }
}