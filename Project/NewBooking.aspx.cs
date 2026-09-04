using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Security.Cryptography.X509Certificates;
using System.EnterpriseServices;

namespace Project
{
    public partial class BookEvent : System.Web.UI.Page
    {
        //Temporary Have to use sessions
        int touristID;
        private string StatusOfEvent = "";
        private int TicketsAvailable = 0;
        private double priceEvent = 0.0;
        private int maxOfVisitors;

        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //read all available events from database
                LoadData();
                //Read event ids to the dropdown list
                ReadEventIDsToDropDownList();
                //Validate so user doesnt select a date that has passed
                txtDate.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
                txtNumberTickets.Attributes["min"] = 0.ToString();
            }
            if (Session["Tourist_ID"] != null)
            {
                touristID = Convert.ToInt32(Session["Tourist_ID"]);
            }
        }

        protected void btnCancelProgress_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewBooking.aspx");
            lblError.Text = "";
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            AvailabilityOfEvent();
            int eventID = EventID();
            int numTickets = numberTickets();
            decimal paymentAmount = CalculateAmount();
            decimal amountOwed = CalculateAmount();
            bool paymentMade = false;
            string paymentMethod = Method();
            int ticketsAvailable = TicketsAvailable - numTickets;

            if ( (TicketsAvailable >= numTickets) && (StatusOfEvent == "Active"))
            {
                if (ticketsAvailable == 0)
                {
                    StatusOfEvent = "Full";
                }
                else
                {
                    using (SqlConnection conn = new SqlConnection(conStr))
                    {
                        conn.Open();
                        string sql = @"INSERT INTO BOOKING (Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Payment_method, Payment_Amount, Amount_Owed, Payment_Made, Checked_In, Checked_Out)
                                      VALUES(@eventID, @touristID, @numberTickets, @arriveDate, @paymentMethod, @paymentAmount, @amountOwed, @paymentMade, @checkedIn, @checkedOut)
                                      
                                  UPDATE E
                                  SET E.Tickets_Available = @ticketsAvailable, E.Status = @status
                                  FROM EVENT E
                                  WHERE E.Event_ID = @eventID";

                        using (SqlCommand cmd = new SqlCommand(sql, conn))
                        {
                            cmd.Parameters.AddWithValue("@eventID", eventID);
                            cmd.Parameters.AddWithValue("@touristID", touristID);
                            cmd.Parameters.AddWithValue("@numberTickets", numTickets);
                            cmd.Parameters.AddWithValue("@arriveDate", GetArrivalDate());
                            cmd.Parameters.AddWithValue("@paymentMethod", paymentMethod);
                            cmd.Parameters.AddWithValue("@paymentAmount", paymentAmount);
                            cmd.Parameters.AddWithValue("@amountOwed", paymentAmount);
                            cmd.Parameters.AddWithValue("@paymentMade", paymentMade);
                            cmd.Parameters.AddWithValue("@checkedIn", false);
                            cmd.Parameters.AddWithValue("@ticketsAvailable", ticketsAvailable);
                            cmd.Parameters.AddWithValue("@status", StatusOfEvent);
                            cmd.Parameters.AddWithValue("@checkedOut", false);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    //Store details to display in booking confirmation page
                    Session["Event_Name"] = txtDisplayEventType.Text;
                    Session["Date"] = GetArrivalDate();
                    Session["PriceOfEvent"] = priceEvent;
                    Session["NumberOfTickets"] = numTickets;
                    Session["TotalAmount"] = paymentAmount;

                    Response.Redirect("BookingConfirmation.aspx");
                }
            }
            else
            {
                lblError.Text = "This event is inactive or currently sold out, so we cannot accept new bookings.";
            }
        }
        //Load the data to the data grid view
        public void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT E.Event_ID, ET.Event_Name, E.Event_Price, E.Max_Visitors, E.Tickets_Available, E.Status
                               FROM EVENT E, EVENTTYPE ET
                               WHERE E.EventType_ID = ET.EventType_ID";


                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    SqlDataAdapter adap = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    adap.SelectCommand = cmd;
                    adap.Fill(ds, "EVENT");

                    gdvDisplay.DataSource = ds;
                    gdvDisplay.DataBind();
                }

                conn.Close();
            }
        }
        //Get the number tickets available and Status
        private void AvailabilityOfEvent()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = @"SELECT Tickets_Available, Status, Max_Visitors FROM EVENT
                             WHERE Event_ID = @eventID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@eventID", ddrlEventID.SelectedValue);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        TicketsAvailable = int.Parse(reader["Tickets_Available"].ToString());
                        StatusOfEvent = reader["Status"].ToString();
                        maxOfVisitors = int.Parse(reader["Max_Visitors"].ToString());
                    }
                }
            }
              
        }
        //Allows the event ID to change and display different event types 
        protected void ddrlEventID_SelectedIndexChanged(object sender, EventArgs e)
        {
            EventID();
        }
        //Store the event ID selected by the user and return it
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

            return eventID = ddrlEventID.SelectedIndex;
        }

        //Read the evend ids from the table EVENT
        private void ReadEventIDsToDropDownList()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Event_ID FROM EVENT";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ddrlEventID.Items.Add(new ListItem(reader["Event_ID"].ToString(), reader["Event_ID"].ToString()));
                    }
                }
            }
        }

        //Allows the amount textbox displayed to change everytime 
        //User changes number of tickets
        protected void txtNumberTickets_TextChanged(object sender, EventArgs e)
        { 
            numberTickets();
            decimal amount = CalculateAmount();
            txtAmount0.Text = "R " + amount.ToString("F2");
        }
        //Return the number of tickets
        private int numberTickets()
        {
           if(int.TryParse(txtNumberTickets.Text, out int number ))
           {
                return number;
           }
            return 0;
        }
        //Calculate the amount and return it to use later
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
                    cmd.Parameters.AddWithValue("@eventID", ddrlEventID.SelectedValue);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        int tickets = 0;
                        priceEvent = double.Parse(reader["Event_Price"].ToString());
                        int.TryParse(txtNumberTickets.Text, out tickets);
                        amount = (decimal)(priceEvent * tickets * (1.0 + tax));
                    }
                }
            }

            return amount;
        }

        //Get the date selected by the user
        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            GetArrivalDate();
        }
        private DateTime GetArrivalDate()
        {
            return DateTime.Parse(txtDate.Text); 
        }

        protected void ddrlMethod_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //Return payment method as string
        private string Method()
        {
            string method = "";
            if(ddrlMethod.SelectedIndex == 1)
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

        protected void gdvDisplay_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}