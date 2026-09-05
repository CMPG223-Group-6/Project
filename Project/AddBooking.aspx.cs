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
   
        int eventID;
        private double priceEvent = 0.0;

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
                }
                loadBookings();
                
            }
               
        }

        private void loadBookings()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {

                conn.Open();

                string sql = "SELECT e.Event_ID, et.Event_Name, et.Event_Description, e.Event_Price, e.Max_Visitors, " +
                             "e.Tickets_Available, e.Status FROM EVENT e, EVENTTYPE et " +
                             "WHERE e.EVENTTYPE_ID = et.EVENTTYPE_ID ";


                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();

                adap.SelectCommand = comm;
                adap.Fill(ds);

                gvEvents.DataSource = ds;
                gvEvents.DataBind();
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

        private int getAvailableTickets()
        {
            int ticketAvailable = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = @"SELECT *
                               FROM EVENT
                               WHERE Event_ID = @eventID";

                using (SqlCommand comm = new SqlCommand(sql, conn))
                {
                    comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                    
                    SqlDataReader reader = comm.ExecuteReader();

                    while (reader.Read())
                    {
                        ticketAvailable = int.Parse(reader["Tickets_Available"].ToString());
                    }
                }
            }

            return ticketAvailable;
        }
        private int getCapacity()
        {
            int capacity = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = @"SELECT *
                               FROM EVENT
                               WHERE Event_ID = @eventID";

                using (SqlCommand comm = new SqlCommand(sql, conn))
                {
                    comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                    
                    SqlDataReader reader = comm.ExecuteReader();

                    while (reader.Read())
                    {
                        capacity = int.Parse(reader["Max_Visitors"].ToString());
                    }
                }
            }
            return capacity;
        }
        private string getStatus()
        {
            string status = "";
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = @"SELECT *
                               FROM EVENT
                               WHERE Event_ID = @eventID";

                using (SqlCommand comm = new SqlCommand(sql, conn))
                {
                    comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                    
                    SqlDataReader reader = comm.ExecuteReader();

                    while (reader.Read())
                    {
                       
                        status = reader["Status"].ToString();
                    }
                }
            }

            return status;
        }

        protected void BtnAddBooking_Click(object sender, EventArgs e)
        {
            try
            {
                string eventStatus = getStatus();
                int ticketAvailable = getAvailableTickets();
                int tickets = int.Parse(txtNoOfTickets.Text);
                if (ticketAvailable == 0)
                {
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                    lblOutput.Text = "Could not book event: No tickets available";
                    return;
                }

                if (eventStatus == "Inactive" || eventStatus == "Full")
                {
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                    lblOutput.Text = "Could not book event: Event full or inactive";
                    return;
                }

                
                if (tickets > ticketAvailable)
                {
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                    lblOutput.Text = "Could not book event: Not enough tickets available";
                    return;
                }

                if ((ticketAvailable - tickets) == 0)
                {
                    eventStatus = "Full";
                }
                decimal totalprice = CalculateAmount();
                int touristID = int.Parse(txtTouristID.Text);
                DateTime date = DateTime.Parse(txtArriveDate.Text);

                if (!recordExists(touristID))
                {
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                    lblOutput.Text = "Tourist ID does not exist.";
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

                            string sql2 = @"UPDATE EVENT SET Status = @status, Tickets_Available = Tickets_Available - @numTickets WHERE Event_ID = @eventID";
                            using (SqlCommand comm = new SqlCommand(sql2, conn))
                            {
                                comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                                comm.Parameters.AddWithValue("@status", eventStatus);
                                comm.Parameters.AddWithValue("@numTickets", int.Parse(txtNoOfTickets.Text));
                                comm.ExecuteNonQuery();
                            }
                        }
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                        lblOutput.Text = "Booking Added Successful";
                        clearFields();
                        loadBookings();
                    }
                }
                
                
            }
            catch (SqlException ex)
            {
                lblOutput.Text = "Error: " + ex.Message;
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void txtNoOfTickets_TextChanged(object sender, EventArgs e)
        {
            decimal totalprice = CalculateAmount();
        }

        private decimal CalculateAmount()
        {
            decimal amount = 0.0m;
            double tax = 0.15;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT Event_Price 
                              FROM EVENT
                              WHERE Event_ID = @eventID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@eventID", ddlEventID.SelectedValue);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        int tickets = 0;
                        priceEvent = double.Parse(reader["Event_Price"].ToString());
                        int.TryParse(txtNoOfTickets.Text, out tickets);
                        amount = (decimal)(priceEvent * tickets * (1.0 + tax));
                        lblAmountOutput.Text = amount.ToString();
                    }
                }
            }

            return amount;
        }

      
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearFields();
        }

        private void clearFields()
        {
            txtArriveDate.Text = "";
            txtNoOfTickets.Text = "";
            txtTouristID.Text = "";
            ddlEventID.SelectedIndex = 0;
            ddlPaymentMethod.SelectedIndex = 0;
            //lblOutput.Text = "";
            lblAmountOutput.Text = "";
            cbxPayment.Checked = false;
        }
        protected void cbxPayment_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void txtArriveDate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}