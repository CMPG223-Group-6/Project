using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.Text;


namespace Project
{
    public partial class MyProfile : System.Web.UI.Page
    {
        int Tourist_ID;
        string surname;
        string name;
        string Email;
        string StoredPassword;
        int Country_ID;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null)
            {
                Tourist_ID = int.Parse(Session["Tourist_ID"].ToString());
            }
            if (Session["Tourist_LastName"] != null)
            {
                surname = Session["Tourist_LastName"].ToString();
            }
            if (Session["Tourist_FirstName"] != null)
            {
                name = Session["Tourist_FirstName"].ToString();
            }
            CountriesToDropDownList();
            if(!IsPostBack)
            {
                LoadDataBooking(Tourist_ID);
            }
            lblNameDisplay0.Text = name + " " + surname;
        }

        // Hash a password
        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);

                byte[] hash = sha256.ComputeHash(bytes);

                return Convert.ToBase64String(hash);
            }
        }

        // Verify a password
        public static bool VerifyPassword(string enteredPassword, string storedHash)
        {
            string hashOfEntered = HashPassword(enteredPassword);
            return hashOfEntered.Equals(storedHash);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string enteredPassword = txtPassword.Text.Trim();
            string storedHash = StoredPassword;
            bool isValid = VerifyPassword(enteredPassword, storedHash);

            if (isValid)
            {
                Response.Redirect("DeleteAccount.aspx");
            }
            else
            {
                lblError.Text = "Invalid password or email";
            }  
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                //Update Booking and Event tables
                string sql = @"UPDATE TOURIST SET Tourist_LastName = @Surname, Tourist_FirstName = @name, Contact_Number = @number,
                              Email_Address = @email, Country_ID = @country
                              WHERE Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@number", txtNumber.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@country", ddrlCountry.SelectedValue);
                    cmd.ExecuteNonQuery();
                }
            }

            lblUpdated.Text = "Your changes have been saved successfully.";
        }

        private void CountriesToDropDownList()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Country_Name, Country_ID FROM COUNTRY";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ddrlCountry.Items.Add(new ListItem(reader["Country_Name"].ToString(), reader["Country_ID"].ToString()));
                    }
                }
            }

        }
        public void LoadDataBooking(int Tourist_ID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT Tourist_LastName, Tourist_FirstName, Contact_Number, Email_Address, Country_ID, User_Password
                              FROM TOURIST WHERE Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        txtSurname.Text = reader["Tourist_LastName"].ToString();
                        txtName.Text = reader["Tourist_FirstName"].ToString();
                        txtNumber.Text = reader["Contact_Number"].ToString();
                        Email = reader["Email_Address"].ToString();
                        StoredPassword = reader["User_Password"].ToString();
                        ddrlCountry.SelectedValue = reader["Country_ID"].ToString();
                        txtEmail.Text = Email;
                    }

                }

                conn.Close();
            }
        }

        protected void ddrlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristForgotPassword.aspx");
        }
    }
}