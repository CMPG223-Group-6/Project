using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    
    public partial class UpdateBooking : System.Web.UI.Page
    {
        int Tourist_ID = 3; //Temp have to use sessions
        private decimal NewTotalPrice = 0.0m;
        private bool isPaymentMade = false;
        private string StatusOfEvent = "";
        private int TicketsAvailable = 0;
        private int TicketsBefore = 0;
        private int MAX_Visitors = 0;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //read all available events from database
                LoadDataBooking(Tourist_ID);
                //Read event ids to the dropdown list
                ReadEventIDsToDropDownList();
                //Read booking ids to dropdownlist
                BookingIDsToDropDownList();
                //Validate so user doesnt select a date that has passed
                txtDate.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
                txtNumberTickets.Attributes["min"] = 0.ToString();

                if (Session["Tourist_ID"] != null)
                {
                    Tourist_ID = (int)Session["Tourist_ID"];
                }
            }

            //Reseting the pay now button 
            btnPayNow.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            lblConfirmation.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            AvailabilityOfEvent();

            int eventID = EventID();
            int numTickets = numberTickets();
            decimal amountOwed = CalculateAmount(out bool isSameEvent);
            decimal paymentTotal = NewTotalPrice;
            string paymentMethod = Method();

            //Ensure that a booking atleast on 1 ticket
            bool hasValidTicketCount = numTickets >= 1;
            //Checks for 2 validations of events 
            bool sameEventValid = isSameEvent
                && hasValidTicketCount
                && (numTickets <= (TicketsAvailable + TicketsBefore))
                && (StatusOfEvent != "Inactive");

            bool differentEventValid = !isSameEvent
                && hasValidTicketCount
                && (TicketsAvailable >= numTickets)
                && (StatusOfEvent != "Inactive");

            if (sameEventValid || differentEventValid)
            {
                if (isSameEvent)
                {
                    // Same event: add what they already paid to what they now owe
                    if (isPaymentMade)
                    {
                        if (NewTotalPrice > paymentBefore())
                        {
                            paymentTotal = paymentBefore() + amountOwed;
                            isPaymentMade = false;
                            TicketsAvailable = TicketsAvailable - (numTickets - TicketsBefore);
                            if (TicketsAvailable == 0)
                            {
                                StatusOfEvent = "Full";
                            }
                        }
                        else
                        {
                            //if the amount is less or still the same
                            paymentTotal = NewTotalPrice;
                            //check if tickets now are less than what they had before
                            if(numTickets < TicketsBefore)
                            {
                                TicketsAvailable = TicketsAvailable + (TicketsBefore - numTickets);
                                //when the tickets available is equal the max visitors
                                if (MAX_Visitors == TicketsAvailable)
                                {
                                    TicketsAvailable = MAX_Visitors;
                                } 
                            }
                        }
                    }
                    else
                    {
                        paymentTotal = amountOwed;
                        //check if they have decreased tickets they had before
                        if (TicketsBefore > numTickets)
                        {
                            TicketsAvailable = TicketsAvailable + (TicketsBefore - numTickets);
                            //when the tickets available is equal the max visitors
                            if (MAX_Visitors == TicketsAvailable)
                            {
                                TicketsAvailable = MAX_Visitors;
                            }
                        }
                        else if(numTickets > TicketsBefore)
                        {
                            //check if they added more tickets 
                            TicketsAvailable = TicketsAvailable - (numTickets - TicketsBefore);
                            if (TicketsAvailable == 0)
                            {
                                StatusOfEvent = "Full";
                            }
                        }
                    }

                }
                else
                {
                    // Different event: start completely fresh, ignore old payment
                    paymentTotal = amountOwed;
                    TicketsAvailable = TicketsAvailable - numTickets;
                    if (TicketsAvailable == 0)
                    {
                        StatusOfEvent = "Full";
                    }
                }

                // If amount owed > 0 therefore they haven't made a payment
                if (amountOwed > 0.0m)
                {
                    btnPayNow.Visible = true;
                    isPaymentMade = false;
                }
                else
                {
                    btnDone.Text = "Done";
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
                        cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                        cmd.Parameters.AddWithValue("@numberTickets", numTickets);
                        cmd.Parameters.AddWithValue("@arriveDate", GetArrivalDate());
                        cmd.Parameters.AddWithValue("@paymentMethod", paymentMethod);
                        cmd.Parameters.AddWithValue("@paymentAmount", paymentTotal);
                        cmd.Parameters.AddWithValue("@amountOwed", amountOwed);
                        cmd.Parameters.AddWithValue("@paymentMade", isPaymentMade);
                        cmd.Parameters.AddWithValue("@ticketsAvailable", TicketsAvailable);
                        cmd.ExecuteNonQuery();
                    }
                }

                LoadDataBooking(Tourist_ID);
                ReadEventIDsToDropDownList();
                BookingIDsToDropDownList();

                Panel2.Visible = true;
                lblConfirmation.Visible = true;
                lblConfirmation.Text = "You have successfully updated your booking.";

                ddlBookingID.SelectedIndex = 0;
                ddrlEventID.SelectedIndex = 0;
                txtDisplayEventType.Text = "";
                txtDate.Text = "";
                txtAmount0.Text = "";
                txtNumberTickets.Text = "";
                ddrlMethod.SelectedIndex = 0;
                lblError.Text = "";
            }
            else
            {
                if(!hasValidTicketCount)
                {
                    lblError.Text = "Please select atleast 1 ticket.";
                }
                else
                {
                    lblError.Text = "This event is inactive or currently sold out, so we cannot update bookings.";
                } 
            }
        }
        
           
        //Load the data to the data grid view
        public void LoadDataBooking(int Tourist_ID)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT B.Booking_ID, B.Event_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, B.Questionnaires, B.Payment_Method, B.Payment_Amount, B.Payment_Made
                              FROM BOOKING B, EVENT E, EVENTTYPE ET
                              WHERE B.Event_ID = E.Event_ID
                              AND E.EventType_ID = ET.EventType_ID
                              AND B.Tourist_ID = @Tourist_ID
                              AND B.Arrive_Date >= @Today"; 

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Tourist_ID", Tourist_ID);
                    cmd.Parameters.AddWithValue("@Today", DateTime.Today);

                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap.SelectCommand = cmd;
                    adap.Fill(ds, "BOOKING");

                    gdvDisplayEvents.DataSource = ds;
                    gdvDisplayEvents.DataBind();
                }

                conn.Close();
            }
        }

        //We fetching the amount they have already made for the event they updating.
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
        //Get the tickets available for the event
        private void AvailabilityOfEvent()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT E.Tickets_Available, E.Status, E.Max_Visitors, B.Number_Tickets 
                             FROM EVENT E, BOOKING B
                             WHERE E.Event_ID = @eventID
                             AND B.Booking_ID = @bookingID";
                          

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@eventID", ddrlEventID.SelectedValue);
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedValue);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        TicketsAvailable = int.Parse(reader["Tickets_Available"].ToString());
                        StatusOfEvent = reader["Status"].ToString();
                        TicketsBefore = int.Parse(reader["Number_Tickets"].ToString());
                        MAX_Visitors = int.Parse(reader["Max_Visitors"].ToString());
                    }
                }
            }

        }
        //Read the evend ids from the table EVENT
        private void ReadEventIDsToDropDownList()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT E.Event_ID FROM EVENT E, BOOKING B " +
                             " WHERE E.Event_ID = B.Event_ID " +
                             "AND B.Arrive_Date >= @Today";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Today", DateTime.Today);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ddrlEventID.Items.Add(new ListItem(reader["Event_ID"].ToString(), reader["Event_ID"].ToString()));
                    }
                }
            }
        }
        //Read boking id to drop down list
        private void BookingIDsToDropDownList()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Booking_ID " +
                             "FROM BOOKING " +
                             "WHERE Arrive_Date >= @Today " +
                             " AND Tourist_ID = @touristID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@touristID", Tourist_ID);
                    cmd.Parameters.AddWithValue("@Today", DateTime.Today);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ddlBookingID.Items.Add(new ListItem(reader["Booking_ID"].ToString(), reader["Booking_ID"].ToString()));
                    }
                }
            }
        }

        //Select event ID and event name is displayed
        protected void ddrlEventID_SelectedIndexChanged(object sender, EventArgs e)
        {
            EventID();
            txtAmount0.Text = "";
            txtNumberTickets.Text = "";
        }
        public int EventID()
        {
            int eventID;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT  ET.Event_Name
                               FROM EVENT E, EVENTTYPE ET
                               WHERE E.EventType_ID = ET.EventType_ID
                               AND E.Event_ID = @eventID";


                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@eventID", (ddrlEventID.SelectedValue));
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        txtDisplayEventType.Text = reader["Event_Name"].ToString();
                    }
                }

                conn.Close();
            }

            return eventID = int.Parse(ddrlEventID.SelectedValue);
        }

        protected void txtNumberTickets_TextChanged(object sender, EventArgs e)
        {
            numberTickets();
            CalculateAmount(out bool _);
        }
        //Return the number of tickets
        private int numberTickets()
        {
            if(int.TryParse(txtNumberTickets.Text, out int tickets))
            {
                return tickets;
            }
            return 0;
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
                    int.TryParse(ddrlEventID.SelectedValue, out int eventID);
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedValue);
                    cmd.Parameters.AddWithValue("@eventID", eventID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        int originalEventID = int.Parse(reader["OriginalEventID"].ToString());
                        double price = double.Parse(reader["Event_Price"].ToString());
                        isPaymentMade = Boolean.Parse(reader["Payment_Made"].ToString());
                        //stored amount that has already been made
                        decimal storedPaymentAmount = decimal.Parse(reader["Payment_Amount"].ToString());
                        int tickets = int.Parse(txtNumberTickets.Text);

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

                        txtAmount0.Text = "R " + amountOwed.ToString("F2");
                    }
                }
            }

            // new total so btnUpdate_Click can set Payment_Amount correctly
            NewTotalPrice = newTotalPrice;

            return amountOwed;
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            GetArrivalDate();
        } 
        private DateTime GetArrivalDate()
        {
            if (DateTime.TryParse(txtDate.Text, out DateTime result))
            {
                return result;
            }
            return DateTime.MinValue; // handle as "no valid date yet"
        }

        //return pament method as a string
        private string Method()
        {
            string method = "";
            if (ddrlMethod.SelectedIndex == 1)
            {
                method = "Cash";
            }
            else if (ddrlMethod.SelectedIndex == 2)
            {
                method = "Debit Card";
            }
            else
            {
                method = "Credit Card";
            }

            return method;
        }

        protected void ddlBookingID_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT Event_ID, Number_Tickets, Arrive_Date, Payment_method, Payment_Amount 
                       FROM BOOKING WHERE Booking_ID = @bookingID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedValue);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Select the matching Event ID in the dropdown
                        ddrlEventID.ClearSelection();
                        ListItem item = ddrlEventID.Items.FindByValue(reader["Event_ID"].ToString());
                        if (item != null)
                            item.Selected = true;

                        // Correct field: tickets go in the tickets box, not Event_ID
                        txtNumberTickets.Text = reader["Number_Tickets"].ToString();

                        // Format date as yyyy-MM-dd for the date input
                        DateTime arriveDate = Convert.ToDateTime(reader["Arrive_Date"]);
                        txtDate.Text = arriveDate.ToString("yyyy-MM-dd");

                        txtAmount0.Text = reader["Payment_Amount"].ToString();

                        ddrlMethod.ClearSelection();
                        ListItem method = ddrlMethod.Items.FindByValue(reader["Payment_method"].ToString());
                        if (method != null)
                            method.Selected = true;
                    }
                    reader.Close();

                    //We displaying the currently selected booking id alone on grid view
                    string sql2 = @"SELECT B.Booking_ID, B.Event_ID, ET.Event_Name, B.Number_Tickets, B.Arrive_Date, B.Questionnaires, B.Payment_Method, B.Payment_Amount, B.Payment_Made
                                  FROM BOOKING B, EVENT E, EVENTTYPE ET
                                  WHERE B.Event_ID = E.Event_ID
                                  AND E.EventType_ID = ET.EventType_ID
                                  AND B.Tourist_ID = @Tourist_ID
                                  AND B.Booking_ID = @bookingID";

                    using (SqlCommand comm = new SqlCommand(sql2, conn))
                    {
                    comm.Parameters.AddWithValue("@Tourist_ID", Tourist_ID);
                    comm.Parameters.AddWithValue("@bookingID", ddlBookingID.SelectedValue);

                    SqlDataAdapter adap2 = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap2.SelectCommand = comm;
                    adap2.Fill(ds, "BOOKING");

                    gdvDisplayEvents.DataSource = ds;
                    gdvDisplayEvents.DataBind();
                }

                    conn.Close();
                }

            }

            // Now that Event ID is correctly selected, populate Event Type and recalc price
            EventID();
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
    
}