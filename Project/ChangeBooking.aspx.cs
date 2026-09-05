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
        int ticketsBefore;
        decimal amountOwed;
        decimal paymentTotal;
        decimal NewTotalPrice;
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
                loadEvents();
            }
        }

        private void loadBookings()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT * FROM BOOKING WHERE Arrive_Date >= @date AND Checked_In = 0";

                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@date", DateTime.Today);
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

                    string sql = "SELECT * FROM BOOKING WHERE Tourist_ID = @touristID AND Arrive_Date >= @date AND Checked_In = 0";

                    SqlCommand comm = new SqlCommand(sql, conn);
                    comm.Parameters.AddWithValue("@touristID", touristID);
                    comm.Parameters.AddWithValue("@date", DateTime.Today);

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
            if(ddlBookingID.SelectedIndex == 0)
            {
                loadBookings();
                return;
            }
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
                        ticketsBefore = int.Parse(reader["Number_Tickets"].ToString());
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

                gvEvents.DataSource = ds;
                gvEvents.DataBind();

            }
        }

        private decimal paymentBefore()
        {
            decimal paymentAlreadyMade = 0.0m;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT Payment_Amount FROM BOOKING WHERE Booking_ID = @booking_id";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@booking_id", ddlBookingID.SelectedValue);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        paymentAlreadyMade = decimal.Parse(reader["Payment_Amount"].ToString());
                    }
                }

                conn.Close();
            }
            return paymentAlreadyMade;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                AvailabilityOfEvent();

                int eventID = int.Parse(ddlEventID.SelectedValue);
                int numTickets = int.Parse(txtNumTickets.Text);
                decimal amountOwed = CalculateAmount(out bool isSameEvent);
                decimal paymentTotal = NewTotalPrice;
                string paymentMethod = ddlPaymentMethod.SelectedItem.Text;
                bool ispaymentMade = isPaymentMade();

                //Ensure that a booking atleast on 1 ticket
                bool hasValidTicketCount = numTickets >= 1;
                //Checks for 2 validations of events 
                bool sameEventValid = isSameEvent
                    && hasValidTicketCount
                    && (numTickets <= (ticketAvailable + ticketsBefore))
                    && (eventStatus != "Inactive");

                bool differentEventValid = !isSameEvent
                    && hasValidTicketCount
                    && (ticketAvailable >= numTickets)
                    && (eventStatus != "Inactive");

                if (sameEventValid || differentEventValid)
                {
                    if (isSameEvent)
                    {
                        // Same event: add what they already paid to what they now owe
                        if (ispaymentMade)
                        {
                            if (NewTotalPrice > paymentBefore())
                            {
                                paymentTotal = paymentBefore() + amountOwed;
                                ispaymentMade = false;
                                ticketAvailable = ticketAvailable - (numTickets - ticketsBefore);
                                if (ticketAvailable == 0)
                                {
                                    eventStatus = "Full";
                                }
                            }
                            else
                            {
                                //if the amount is less or still the same
                                paymentTotal = NewTotalPrice;
                                //check if tickets now are less than what they had before
                                if (numTickets < ticketsBefore)
                                {
                                    ticketAvailable = ticketAvailable + (ticketsBefore - numTickets);
                                    //when the tickets available is equal the max visitors
                                    if (maxVisitors == ticketAvailable)
                                    {
                                        ticketAvailable = maxVisitors;
                                    }
                                    if (ticketAvailable > 0)
                                    {
                                        eventStatus = "Active";
                                    }
                                }
                            }
                        }
                        else
                        {
                            paymentTotal = amountOwed;
                            //check if they have decreased tickets they had before
                            if (ticketsBefore > numTickets)
                            {
                                ticketAvailable = ticketAvailable + (ticketsBefore - numTickets);
                                //when the tickets available is equal the max visitors
                                if (maxVisitors == ticketAvailable)
                                {
                                    ticketAvailable = maxVisitors;
                                }
                                if (ticketAvailable > 0)
                                {
                                    eventStatus = "Active";
                                }
                            }
                            else if (numTickets > ticketsBefore)
                            {
                                //check if they added more tickets 
                                ticketAvailable = ticketAvailable - (numTickets - ticketsBefore);
                                if (ticketAvailable == 0)
                                {
                                    eventStatus = "Full";
                                }
                            }
                        }

                    }
                    else
                    {
                        // Different event: start completely fresh, ignore old payment
                        paymentTotal = amountOwed;
                        ticketAvailable = ticketAvailable - numTickets;
                        if (ticketAvailable == 0)
                        {
                            eventStatus = "Full";
                        }
                    }

                    

                    using (SqlConnection conn = new SqlConnection(conStr))
                    {
                        conn.Open();
                        //Update Booking and Event tables
                        string sql = @"UPDATE B SET B.Event_ID = @eventID, B.Tourist_ID = @touristID, B.Number_Tickets = @numberTickets, 
                                         B.Arrive_Date = @arriveDate, B.Payment_method = @paymentMethod, B.Payment_Amount = @paymentAmount, 
                                         B.Amount_Owed = @amountOwed, B.Payment_Made = @paymentMade
                                  FROM BOOKING B
                                  WHERE B.Booking_ID = @bookingID;
                                  
                                  UPDATE E
                                  SET E.Tickets_Available = @ticketsAvailable
                                  FROM EVENT E
                                  WHERE E.Event_ID = @eventID";

                        using (SqlCommand cmd = new SqlCommand(sql, conn))
                        {
                            cmd.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedValue);
                            cmd.Parameters.AddWithValue("@eventID", eventID);
                            cmd.Parameters.AddWithValue("@touristID", int.Parse(txtTouristID.Text));
                            cmd.Parameters.AddWithValue("@numberTickets", numTickets);
                            cmd.Parameters.AddWithValue("@arriveDate", GetArrivalDate());
                            cmd.Parameters.AddWithValue("@paymentMethod", paymentMethod);
                            cmd.Parameters.AddWithValue("@paymentAmount", paymentTotal);
                            cmd.Parameters.AddWithValue("@amountOwed", amountOwed);
                            cmd.Parameters.AddWithValue("@paymentMade", ispaymentMade);
                            cmd.Parameters.AddWithValue("@ticketsAvailable", ticketAvailable);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    loadBookings();
                    loadEvents();
                    ddlBookingID.SelectedIndex = 0;
                    ddlEventID.SelectedIndex = 0;
                    txtDate.Text = "";
                    txtPaymentAmount.Text = "";
                    txtNumTickets.Text = "";
                    ddlPaymentMethod.SelectedIndex = 0;

                }
                else
                {
                    if (!hasValidTicketCount)
                    {
                        lblOutput.Text = "Please select atleast 1 ticket.";
                    }
                    else
                    {
                        lblOutput.Text = "This event is inactive or currently sold out, so we cannot update bookings.";
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

        private DateTime GetArrivalDate()
        {
            if (DateTime.TryParse(txtDate.Text, out DateTime result))
            {
                return result;
            }
            return DateTime.MinValue; // handle as "no valid date yet"
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

        
        private decimal CalculateAmount(out bool isSameEvent)
        {
            decimal amountOwed = 0.0m;
            decimal newTotalPrice = 0.0m;
            double tax = 0.15;
            isSameEvent = false;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT B.Event_ID AS OriginalEventID, B.Payment_Amount, B.Payment_Made, E.Event_Price
                             FROM BOOKING B, EVENT E
                             WHERE B.Booking_ID = @bookingID
                             AND E.Event_ID = @eventID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    int.TryParse(ddlEventID.SelectedValue, out int eventID);
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedValue);
                    cmd.Parameters.AddWithValue("@eventID", eventID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        int originalEventID = int.Parse(reader["OriginalEventID"].ToString());
                        double price = double.Parse(reader["Event_Price"].ToString());
                        bool isPaymentMade = Boolean.Parse(reader["Payment_Made"].ToString());
                        //stored amount that has already been made
                        decimal storedPaymentAmount = decimal.Parse(reader["Payment_Amount"].ToString());
                        int tickets = int.Parse(txtNumTickets.Text);

                        isSameEvent = (originalEventID == eventID);
                        newTotalPrice = (decimal)(price * tickets * (1.0 + tax));

                        if (isSameEvent)
                        {
                            if (isPaymentMade)
                            {
                                if (newTotalPrice > storedPaymentAmount)
                                {
                                    // new total exceeds what they already paid - they owe the difference
                                    amountOwed = newTotalPrice - storedPaymentAmount;
                                }
                                else
                                {
                                    //new total is equal to or less than what they already paid - nothing owed
                                    amountOwed = 0.0m;
                                }
                            }
                            else
                            {
                                //Same event - but not paid yet
                                amountOwed = newTotalPrice;
                            }
                        }
                        else
                        {
                            // Different event - fresh booking, full new total is owed
                            amountOwed = newTotalPrice;
                        }

                        txtPaymentAmount.Text = amountOwed.ToString("F2");
                    }
                }
            }

            // new total so btnUpdate_Click can set Payment_Amount correctly
            NewTotalPrice = newTotalPrice;

            return amountOwed;
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