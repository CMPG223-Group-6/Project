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
    public partial class TouristForgotPassword : System.Web.UI.Page
    {
        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnDone_Click(object sender, EventArgs e)
        {
            string email = txtEmailAddress.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if(newPassword != confirmPassword)
            {
                lblOutputPasswords.Text = "Passwords do not match.";

                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";

                return;
            }

            string hashedPassword = HashPassword(newPassword);

            string sql = @"SELECT COUNT(*) FROM TOURIST WHERE Email_Address = @Email";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    cnn.Open();

                    int emailExists = (int)cmd.ExecuteScalar();

                    if(emailExists == 0)
                    {
                        lblEmailNoExists.Text = "Email address does not exist.";

                        return;
                    }
                }
            }

            string sql2 = "UPDATE TOURIST SET User_Password = @Password WHERE Email_Address = @Email";

            using(SqlConnection cnn = new SqlConnection(connectionString))
            {
                using(SqlCommand cmd = new SqlCommand(sql2, cnn))
                {
                    cmd.Parameters.AddWithValue("@Password", hashedPassword);
                    cmd.Parameters.AddWithValue("@Email", email);

                    cnn.Open();

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("Default.aspx");
        }
    }
}