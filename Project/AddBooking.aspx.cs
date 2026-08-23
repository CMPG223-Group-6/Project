using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AddBooking : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        decimal totalprice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT Event_ID FROM EVENT";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();

                while (reader.Read())
                {
                    ddlEventID.Items.Add(reader.GetValue(0).ToString());
                }
                reader.Close();

                sql = "SELECT e.*, et.Event_Name, et.Event_Description FROM EVENT e, EVENTTYPE et";
                comm = new SqlCommand(sql, conn);
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();

                

                adap.SelectCommand = comm;
                adap.Fill(ds, "EVENT");

                gvEvents.DataSource = ds;
                gvEvents.DataBind();

            }
        }

        protected void BtnAddBooking_Click(object sender, EventArgs e)
        {
            DateTime date = DateTime.Parse(txtArriveDate.Text);

            if (date.DayOfYear < DateTime.Today.DayOfYear)
            {
                lblMessage.Text = "Please enter a valid date.";
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();

                    string sql = "INSERT INTO BOOKING (Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Payment_method, Payment_Amount, Payment_Made)" +
                                 "VALUES (@eventID, @touristID, @num, @date, @payment_method, @amount, @payment_made)";
                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@eventID", ddlEventID.Text);
                        comm.Parameters.AddWithValue("@touristID", txtTouristID.Text);
                        comm.Parameters.AddWithValue("@num", int.Parse(txtNoOfTickets.Text));
                        comm.Parameters.AddWithValue("@date", date);
                        comm.Parameters.AddWithValue("@payment_method", ddlPaymentMethod.SelectedItem.Text);
                        comm.Parameters.AddWithValue("@amount", SqlMoney.Parse(totalprice.ToString()));
                        comm.Parameters.AddWithValue("@payment_made", false);
                        comm.ExecuteNonQuery();
                    }

                }
            }
        }

        protected void txtNoOfTickets_TextChanged(object sender, EventArgs e)
        {
            decimal price = 0;
            

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT Event_Price FROM EVENT WHERE Event_ID = @id";

                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@id", ddlEventID.Text);
                SqlDataReader reader = comm.ExecuteReader();

                while (reader.Read())
                {
                    price = (decimal)reader.GetValue(0);
                }
                reader.Close();

                totalprice = price * int.Parse(txtNoOfTickets.Text);
                lblAmountOutput.Text = totalprice.ToString();
            }
        }
    }
}