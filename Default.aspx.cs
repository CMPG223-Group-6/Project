using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Default : System.Web.UI.Page
    {
        string connectionString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rdoStaff_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void rdoTourist_CheckedChanged(object sender, EventArgs e)
        {
        }

        protected void lbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristSignUp.aspx");
        }

        protected void lbtnForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristForgotPassword.aspx");
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
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

        public static bool VerifyPassword(string password, string storedPassword)
        {
            string hashedPassword = HashPassword(password);

            return hashedPassword.Equals(storedPassword);
        }

        protected void btnLoginValid_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string domain = "@zims.com";
            string Gmail = "gmail.com";
            string acza = "ac.za";
            string outlook = "outlook.com";
            string yahoo = "yahoo.com";

            // Check if the email contains the domain (case-insensitive)
            if (email.ToLower().EndsWith(domain.ToLower()))
            {
                //Valid if the entered password matches the hardcoded password.
                //before you redirect

                string staffPassword = "admin123";

                if(password == staffPassword)
                {
                    Session["Staff_Email"] = email;

                    Session.Timeout = 10;

                    Response.Redirect("StaffMenu.aspx");

                    return;
                }
            }
            else if (email.ToLower().EndsWith(Gmail.ToLower()) || email.ToLower().EndsWith(acza.ToLower()) || email.ToLower().EndsWith(outlook.ToLower()) || email.ToLower().EndsWith(yahoo.ToLower()))
            {
                //When email domain is correct:
                //1. Check email exists in table(database)
                //2. Check password at that email
                //3. If both are correct you can redirect to tourist form

                string sql = @"SELECT TOURIST_ID, Tourist_LastName, Tourist_FirstName, Email_Address, User_Password FROM TOURIST WHERE Email_Address = @Email";

                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, cnn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        cnn.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if(reader.Read())
                            {
                                string storedPassword = reader["User_Password"].ToString();

                                bool passwordCorrect = VerifyPassword(password, storedPassword);

                                if(passwordCorrect)
                                {
                                    Session["Tourist_ID"] = reader["Tourist_ID"].ToString();
                                    Session["Tourist_LastName"] = reader["Tourist_LastName"].ToString();
                                    Session["Tourist_FirstName"] = reader["Tourist_FirstName"].ToString();
                                    Session["Tourist_Email"] = reader["Email_Address"].ToString();

                                    Session.Timeout = 10;

                                    Response.Redirect("TouristMenu.aspx");

                                    return;
                                }
                                else
                                {
                                    lblInvalid.Text = "Incorrect Email address or Password.";
                                    txtPassword.Text = "";
                                    txtEmail.Text = "";

                                    return;
                                }
                            }
                        }
                    }
                }   
            }
            else
            {
                lblInvalid.Text = "Incorrect Email address or Password.";
                txtPassword.Text = "";
                txtEmail.Text = "";
            }
        }
    }
}
