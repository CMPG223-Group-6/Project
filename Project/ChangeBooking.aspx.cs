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
    public partial class ChangeBooking : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        int maxVisitors;
        int ticketAvailable;
        string eventStatus;
        bool checkedIn;
        bool checkedOut;
        int eventID;
        decimal amountOwed;
        decimal paymentTotal;
        string paymentMethod;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDate.Attributes["Min"] = DateTime.Today.ToString("yyyy-MM-dd");
            txtTouristID.Attributes["Min"] = 1.ToString();
            txtNumTickets.Attributes["Min"] = 1.ToString();

            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(conStr))
                {

                    conn.Open();

                    string sql = "SELECT Event_ID FROM EVENT ";


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

                string sql = "SELECT * FROM BOOKING";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();

                adap.SelectCommand = comm;
                adap.Fill(ds, "BOOKING");

                gvTouristBookings.DataSource = ds;
                gvTouristBookings.DataBind();

            }
        }

        private bool recordExists(int IDCheck)
        {
            bool exists = false;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT TOURIST_ID FROM TOURIST";

                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();

                while (reader.Read())
                {
                    int ID = (int)reader.GetValue(0);
                    if (ID == IDCheck)
                    {
                        exists = true;
                    }
                }
            }

            return exists;
        }

        protected void btnLoadBookings_Click(object sender, EventArgs e)
        {
            int touristID = int.Parse(txtTouristID.Text);
            txtPaymentAmount.Text = "";
            txtDate.Text = "";
            ddlEventID.SelectedIndex = 0;
            ddlPaymentMethod.SelectedIndex = 0;
            txtNumTickets.Text = "";
            lblOutput.Text = "";
            lblMessage.Text = "";
            ddlBookingID.Items.Clear();

            if(recordExists(touristID))
            {

                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();

                    string sql = "SELECT * FROM BOOKING WHERE Tourist_ID = @touristID";

                    SqlCommand comm = new SqlCommand(sql, conn);
                    comm.Parameters.AddWithValue("@touristID", touristID);

                    SqlDataReader reader = comm.ExecuteReader();

                    ddlBookingID.Items.Add("Select Booking ID");

                    while (reader.Read())
                    {
                        ddlBookingID.Items.Add(reader.GetValue(0).ToString());
                    }
                    reader.Close();

                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();



                    adap.SelectCommand = comm;
                    adap.Fill(ds, "BOOKING");

                    gvTouristBookings.DataSource = ds;
                    gvTouristBookings.DataBind();

                }
            }
            else
            {
                lblMessage.Text = "Tourist ID does not exist";
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtTouristID.Text = "";
            txtPaymentAmount.Text = "";
            txtDate.Text = "";
            ddlEventID.SelectedIndex = 0;
            ddlPaymentMethod.SelectedIndex = 0;
            txtNumTickets.Text = "";
            ddlBookingID.SelectedIndex = 0;
            lblOutput.Text = "";
            loadBookings();
        }

        protected void ddlBookingID_SelectedIndexChanged(object sender, EventArgs e)
        {
            string paymentMethod = "";

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedItem.Text);

                SqlDataReader reader = comm.ExecuteReader();

                while(reader.Read())
                {
                    txtNumTickets.Text = reader.GetValue(3).ToString();

                    DateTime arriveDate = Convert.ToDateTime(reader["Arrive_Date"]);
                    txtDate.Text = arriveDate.ToString("yyyy-MM-dd");
                    
                    paymentMethod = reader.GetValue(6).ToString();
                    if (paymentMethod == "Cash")
                    {
                        ddlPaymentMethod.SelectedIndex = 1;
                    }
                    else if (paymentMethod == "Debit Card")
                    {
                        ddlPaymentMethod.SelectedIndex = 2;
                    }
                    else if (paymentMethod == "Credit Card")
                    {
                        ddlPaymentMethod.SelectedIndex = 3;
                    }
                    
                    txtPaymentAmount.Text = reader.GetValue(7).ToString();
                    ddlEventID.Text = reader.GetValue(1).ToString();
                    txtNumTickets.Attributes["Min"] = reader.GetValue(3).ToString();
                }
            }
            loadEvents();
            loadInfo();
        }

        private int loadInfo()
        {
            
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedItem.Text);
                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    eventID = int.Parse(reader["Event_ID"].ToString());
                    amountOwed = decimal.Parse(reader["Amount_Owed"].ToString());
                    paymentTotal = decimal.Parse(reader["Payment_Amount"].ToString());
                    paymentMethod = reader["Payment_method"].ToString();
                    //checkedIn = (bool)reader["Checked_In"];
                    //checkedOut = (bool)reader["Checked_Out"];
                }
            }
            return eventID;
        }
        private int getNumTickets()
        {
            int numTickets = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedItem.Text);
                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    numTickets = int.Parse(reader["Number_Tickets"].ToString());
                }
            }
            return numTickets;
        }

        private void AvailabilityOfEvent()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = @"SELECT e.Tickets_Available, e.Status, e.Max_Visitors, b.Number_Tickets
                               FROM EVENT e, BOOKING b
                               WHERE e.Event_ID = @eventID
                                AND b.booking_ID = @bookingID";

                using (SqlCommand comm = new SqlCommand(sql, conn))
                {
                    comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                    comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedItem.Text);
                    SqlDataReader reader = comm.ExecuteReader();

                    while(reader.Read())
                    {
                        ticketAvailable = int.Parse(reader["Tickets_Available"].ToString());

                        maxVisitors = int.Parse(reader["Max_Visitors"].ToString());
                        eventStatus = reader["Status"].ToString();
                    }
                }
            }
        }

        private void loadEvents()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {

                conn.Open();

                string sql = "SELECT e.Event_ID, e.EVENTTYPE_ID, et.Event_Name, et.Event_Description, e.Event_Price, e.Max_Visitors, " +
                             "e.Tickets_Available, e.Status FROM EVENT e, EVENTTYPE et " +
                             "WHERE e.EVENTTYPE_ID = et.EVENTTYPE_ID ";


                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();



                adap.SelectCommand = comm;
                adap.Fill(ds);

                gvTouristBookings.DataSource = ds;
                gvTouristBookings.DataBind();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                
                AvailabilityOfEvent();
                //loadInfo();
                decimal totalprice;
                int numTickets = getNumTickets();
                if (isPaymentMade())
                {
                    totalprice = calculateTotalPrice(int.Parse(txtNumTickets.Text) - numTickets);
                }
                else
                {
                    totalprice = calculateTotalPrice(int.Parse(txtNumTickets.Text));
                }

                if (ticketAvailable == 0)
                {
                    lblOutput.Text = "Could not book event: No tickets available";
                    return;
                }

                if (checkedIn)
                {
                    lblOutput.Text = "Could not book event: Booking Akready Checked In";
                    return;
                }

                if (checkedOut)
                {
                    lblOutput.Text = "Could not book event: Booking already Checked Out";
                    return;
                }

                if(eventStatus == "Inactive" || eventStatus == "Full")
                {
                    lblOutput.Text = "Could not book event: Event full or inactive";
                    return;
                }

                int addedTickets = int.Parse(txtNumTickets.Text);
                if((addedTickets-numTickets) > ticketAvailable)
                {
                    lblOutput.Text = "Could not book event: Not enough tickets available";
                    return;
                }

                if ((ticketAvailable - (addedTickets- numTickets)) == 0)
                {
                    eventStatus = "Full";
                }

                using (SqlConnection conn = new SqlConnection(conStr))
                {
                    conn.Open();
                    string sql = @"UPDATE BOOKING SET 
                               Event_ID = @bookingeventID, Arrive_Date = @arriveDate, Payment_method = @paymentMethod, Number_Tickets = @numTickets,
                               Payment_Amount = Payment_Amount + @paymentAmount, Amount_Owed = @paymentOwed, Payment_Made = @paymentMade
                               WHERE Booking_ID = @bookingID";

                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedItem.Text);
                        comm.Parameters.AddWithValue("@bookingeventID", ddlEventID.SelectedItem.Text);
                        comm.Parameters.AddWithValue("@arriveDate", txtDate.Text);
                        comm.Parameters.AddWithValue("@numTickets", int.Parse(txtNumTickets.Text));
                        comm.Parameters.AddWithValue("@paymentMethod", ddlPaymentMethod.SelectedItem.Text);
                        comm.Parameters.AddWithValue("@paymentAmount", decimal.Parse(txtPaymentAmount.Text));
                        if (!cbxPayment.Checked)
                        {
                            comm.Parameters.AddWithValue("@paymentOwed", decimal.Parse(txtPaymentAmount.Text));
                        }
                        else
                        {
                            comm.Parameters.AddWithValue("@paymentOwed", 0.00);
                        }
                        comm.Parameters.AddWithValue("@paymentMade", cbxPayment.Checked);

                        comm.ExecuteNonQuery();
                    }

                    sql = @"UPDATE EVENT SET Status = @status, Tickets_Available = Tickets_Available - @numTickets WHERE Event_ID = @eventID";
                    using (SqlCommand comm = new SqlCommand(sql, conn))
                    {
                        comm.Parameters.AddWithValue("@eventID", ddlEventID.SelectedItem.Text);
                        comm.Parameters.AddWithValue("@status", eventStatus);
                        comm.Parameters.AddWithValue("@numTickets", int.Parse(txtNumTickets.Text));
                        comm.ExecuteNonQuery();
                    }
                }
                loadBookings();
                lblOutput.Text = "Booking Updated Successfully";
            }
            catch (SqlException ex)
            {
                lblOutput.Text = "Error: " + ex.Message;
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        private decimal calculateTotalPrice(int tickets)
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

                totalprice = price * tickets;
                txtPaymentAmount.Text = totalprice.ToString();
            }

            return totalprice;
        }

        protected void txtPaymentAmount_TextChanged(object sender, EventArgs e)
        {
            
        }

        private bool isPaymentMade()
        {
            bool paymentMade = false;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT * FROM BOOKING WHERE Booking_ID = @bookingID";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedItem.Text);
                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    paymentMade = (bool)reader["Payment_Made"];
                }
            }

            return paymentMade;
        }

        protected void txtNumTickets_TextChanged(object sender, EventArgs e)
        {
            
            if (isPaymentMade())
            {
                int numTickets = getNumTickets();
                int tickets = (int.Parse(txtNumTickets.Text) - numTickets);
                decimal totalPrice = calculateTotalPrice(tickets);
            }
            else
            {
                decimal totalPrice = calculateTotalPrice(int.Parse(txtNumTickets.Text));
            }
            
        }
    }
}