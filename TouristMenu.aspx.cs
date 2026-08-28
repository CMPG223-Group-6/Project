using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class TouristMenu : System.Web.UI.Page
    {
        private string name = "";
        private string surname = "";
        private int touristID = 0;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Tourist_LastName, Tourist_FirstName " +
                             "FROM TOURIST WHERE Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", touristID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        surname = reader["Tourist_LastName"].ToString();
                        name = reader["Tourist_FirstName"].ToString();
                    }
                }
            }

            lblNameDisplay0.Text = "Welcome, " + name + " " + surname;
            lblNameDisplay.Text = name + " " + surname;

            Session["name"] = name;
            Session["surname"] = surname;
        }

        protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}