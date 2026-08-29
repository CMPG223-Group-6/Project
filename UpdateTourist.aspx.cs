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
using System.Xml.Linq;


namespace Project
{

    public partial class UpdateTourist : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;
        SqlDataAdapter ap;
        SqlDataReader reader;

        string Email;
        int ID;

        string ConString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadCountries();
                LoadTourists();
            }
            
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            string Name = txtUpdName.Text;
            string Surname = txtUpdSurname.Text;
            string Number = txtUpdPhoneNo.Text;
            Email = txtUpdEmail.Text;
            string Country = ddlUpdCountries.SelectedValue;
            int ID = int.Parse(txtUpdTouristID.Text);

            // Password is Name + Surname
            string Password = Name + Surname;

            string HashedPassword = HashPassword(Password);

            using (conn = new SqlConnection(ConString))
            {
                string sql = "UPDATE TOURIST SET Tourist_FirstName = @FirstName, Tourist_LastName = @LastName, Contact_Number = @PhoneNo, Email_Address = @Email, User_Password = @Password, Country_ID = @Country WHERE TOURIST_ID = @TouristID";

                cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@FirstName", Name);
                cmd.Parameters.AddWithValue("@LastName", Surname);
                cmd.Parameters.AddWithValue("@PhoneNo", Number);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Password", HashedPassword);
                cmd.Parameters.AddWithValue("@Country", Country);
                cmd.Parameters.AddWithValue("@TouristID", ID);
                conn.Open();
                cmd.ExecuteNonQuery();
                lblUpdMessage.Text = "Tourist details updated successfully!";
                LoadTourists();
            }
        }
        private void LoadTourists()
        {
            using (conn = new SqlConnection(ConString))
            {
                string sql = @"SELECT T.Tourist_ID, 
                      T.Tourist_LastName, 
                      T.Tourist_FirstName, 
                      T.Contact_Number, 
                      T.Email_Address, 
                      C.Country_Name
               FROM TOURIST T, COUNTRY C
               WHERE T.Country_ID = C.Country_ID";
                cmd = new SqlCommand(sql, conn);
                ap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ap.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }

        }

        protected void ddlUpdCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        private void LoadCountries()
        {
            using (conn = new SqlConnection(ConString))
            {
                string sql = "SELECT Country_ID FROM COUNTRY";

                cmd = new SqlCommand(sql, conn);

                ap = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();

                ap.Fill(ds);

                ddlUpdCountries.DataSource = ds;

                ddlUpdCountries.DataTextField = "Country_ID";
                ddlUpdCountries.DataValueField = "Country_ID";

                ddlUpdCountries.DataBind();

                ddlUpdCountries.Items.Insert(0, new ListItem("Select a Country", "0"));
            }
        }

        protected void txtUpdPhoneNo_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainTourists.aspx");
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

        protected void txtUpdTouristID_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(txtUpdTouristID.Text.Trim(), out int touristID))
            {
                LoadDataBooking(touristID);
            }
        }
        public void LoadDataBooking(int Tourist_ID)
        {
            using (SqlConnection conn = new SqlConnection(ConString))
            {
                conn.Open();
                string sql = @"SELECT Tourist_LastName, Tourist_FirstName, Contact_Number, Email_Address, Country_ID
                              FROM TOURIST WHERE Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        txtUpdSurname.Text = reader["Tourist_LastName"].ToString();
                        txtUpdName.Text = reader["Tourist_FirstName"].ToString();
                        txtUpdPhoneNo.Text = reader["Contact_Number"].ToString();
                        Email = reader["Email_Address"].ToString();
                        ddlUpdCountries.SelectedValue = reader["Country_ID"].ToString();
                        txtUpdEmail.Text = Email;
                    }

                }

                conn.Close();
            }
        }
    }
}
