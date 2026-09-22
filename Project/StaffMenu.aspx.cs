using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class StaffMenu : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            int numBookings = 0;
            if (!IsPostBack)
            {
                
                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();

                    string sql = "SELECT * FROM BOOKING WHERE Payment_Made = @made";
                    SqlCommand comm = new SqlCommand(sql, conn);
                    comm.Parameters.AddWithValue("@made", false);

                    SqlDataReader reader = comm.ExecuteReader();

                    while (reader.Read())
                    {
                        numBookings++;
                    }
                }
                lblNumToProcess.Text = numBookings.ToString();
                loadBookings();
            }
        }

        private void loadBookings()
        {
           
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT * FROM BOOKING WHERE Arrive_Date = @date";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@date", DateTime.Today.Date);

                
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();

                adap.SelectCommand = comm;
                adap.Fill(ds, "BOOKING");

                GridView1.DataSource = ds;
                GridView1.DataBind();

                sql = "SELECT COUNT(*) FROM BOOKING WHERE Arrive_Date = @date";
                comm = new SqlCommand(sql, conn); 
                comm.Parameters.AddWithValue("@date", DateTime.Today.Date);

                SqlDataReader reader = comm.ExecuteReader();

                if(reader.Read())
                {
                    lblNumBookings.Text = reader[0].ToString();
                }
            }
        }

       
    }
}