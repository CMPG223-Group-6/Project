using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
            string Email = txtUpdEmail.Text;
            string Country = ddlUpdCountries.SelectedValue;
            int ID = int.Parse(txtUpdTouristID.Text);

            // Password is Name + Surname
            string Password = Name + Surname;


            using (conn = new SqlConnection(ConString))
            {
                string sql = "UPDATE TOURIST SET Tourist_FirstName = @FirstName, Tourist_LastName = @LastName, Contact_Number = @PhoneNo, Email_Address = @Email, User_Password = @Password, Country_ID = @Country WHERE TOURIST_ID = @TouristID";

                cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@FirstName", Name);
                cmd.Parameters.AddWithValue("@LastName", Surname);
                cmd.Parameters.AddWithValue("@PhoneNo", Number);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Country", Country);
                cmd.Parameters.AddWithValue("@TouristID", ID);

                cmd.ExecuteNonQuery();
                lblUpdMessage.Text = "Tourist details updated successfully!";
                LoadTourists();
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
    }
}
