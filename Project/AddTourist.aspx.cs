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


            using (conn = new SqlConnection(ConString))
            {
                string sql = "INSERT INTO Tourist (Tourist_FirstName,Tourist_LastName,Contact_Number,Email_Address,User_Password,Country_ID) VALUES (@LastName, @FirstName, @Country, @PhoneNo, @Email)";
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@FirstName", Name);
                cmd.Parameters.AddWithValue("@LastName", Surname);
                cmd.Parameters.AddWithValue("@Country", Country);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@PhoneNo", Number);
                cmd.Parameters.AddWithValue("@Email", Email);
               
               
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
                string sql = "SELECT Country_ID FROM COUNTRY";

                cmd = new SqlCommand(sql, conn);

                ap = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();

                ap.Fill(ds);

                ddlCountries.DataSource = ds;

                ddlCountries.DataTextField = "Country_ID";
                ddlCountries.DataValueField = "Country_ID";

                ddlCountries.DataBind();

                ddlCountries.Items.Insert(0, new ListItem("Select a Country", "0"));
            }
        }
    }
}
