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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTouristID.Attributes["Min"] = 1.ToString();
            txtNoOfTickets.Attributes["Min"] = 1.ToString();
            txtArriveDate.Attributes["Min"] = DateTime.Today.ToString("yyyy-MM-dd");
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {

                    conn.Open();

                    string sql = "SELECT e.Event_ID, et.Event_Name, et.Event_Description, e.Event_Price, e.Max_Visitors, " +
                                 "e.Tickets_Available FROM EVENT e, EVENTTYPE et " +
                                 "WHERE e.EVENTTYPE_ID = et.EVENTTYPE_ID ";
                                

                    SqlCommand comm = new SqlCommand(sql, conn);
                    SqlDataReader reader = comm.ExecuteReader();

                    while (reader.Read())
                    {
                        ddlEventID.Items.Add(reader.GetValue(0).ToString());
                    }
                    reader.Close();

                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();



                    adap.SelectCommand = comm;
                    adap.Fill(ds);

                    gvEvents.DataSource = ds;
                    gvEvents.DataBind();

                }

                
            }
               
        }

        private bool recordExists(int IDCheck)
        {
            bool exists = false;

            using(SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT TOURIST_ID FROM TOURIST";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();

                while(reader.Read())
                {
                    int ID = (int)reader.GetValue(0); 
                    if(ID == IDCheck)
                    {
                        exists = true;
                    }
                }
            }

            return exists;
        }

        protected void BtnAddBooking_Click(object sender, EventArgs e)
        {
            try
            {
                decimal totalprice = calculateTotalPrice();
                int tickets = int.Parse(txtNoOfTickets.Text);
                int touristID = int.Parse(txtTouristID.Text);
                DateTime date = DateTime.Parse(txtArriveDate.Text);

                if ((date.DayOfYear < DateTime.Today.DayOfYear) || !recordExists(touristID))
                {
                    if (date.DayOfYear < DateTime.Today.DayOfYear)
                    {
                        lblMessage.Text = "Please enter a valid date.";
                    }
                    else
                    {
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                        lblOutput.Text = "Tourist ID does not exist.";
                    }
                }
                else
                {
                    if (tickets < 1 || touristID < 1)
                    {
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                        if (tickets < 1)
                        {
                            lblOutput.Text = "Enter valid Number of tickets";
                        }
                        else
                        {
                            lblOutput.Text = "Enter valid Tourist ID";
                        }
                    }
                    else
                    {
                        using (SqlConnection conn = new SqlConnection(conStr))
                        {
                            conn.Open();

                            string sql = "INSERT INTO BOOKING (Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Payment_method, Payment_Amount, Amount_Owed, Payment_Made)" +
                                         "VALUES (@eventID, @touristID, @numTickets, @date, @payment_method, @amount, @amount_owed, @paymentMade)";
                            using (SqlCommand comm = new SqlCommand(sql, conn))
                            {
                                comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                                comm.Parameters.AddWithValue("@touristID", touristID);
                                comm.Parameters.AddWithValue("@numTickets", tickets);
                                comm.Parameters.AddWithValue("@date", date);
                                comm.Parameters.AddWithValue("@payment_method", ddlPaymentMethod.SelectedItem.Text);
                                comm.Parameters.AddWithValue("@amount", totalprice);
                                comm.Parameters.AddWithValue("@amount_owed", totalprice);

                                bool paymentMade = false;
                                if (cbxPayment.Checked)
                                {
                                    paymentMade = true;
                                }
                                comm.Parameters.AddWithValue("@paymentMade", paymentMade);
                                comm.ExecuteNonQuery();
                            }
                            lblOutput.ForeColor = System.Drawing.Color.Green;
                            lblOutput.Text = "Booking Added Successful";
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void txtNoOfTickets_TextChanged(object sender, EventArgs e)
        {
            decimal totalprice = calculateTotalPrice();
        }

        private decimal calculateTotalPrice()
        {
            decimal price = 0;
            decimal totalprice = 0;

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

            return totalprice;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtArriveDate.Text = "";
            txtNoOfTickets.Text = "";
            txtTouristID.Text = "";
            ddlEventID.SelectedIndex = 0;
            ddlPaymentMethod.SelectedIndex = 0;
            lblOutput.Text = "";
        }

        protected void cbxPayment_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}