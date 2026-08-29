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
    public partial class DeleteBooking : System.Web.UI.Page
    {
        string conStr = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
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

                SqlDataReader reader = comm.ExecuteReader();

                while(reader.Read())
                {
                    ddlBookingID.Items.Add(reader.GetValue(0).ToString());
                }
                reader.Close();
                
                SqlDataAdapter adap = new SqlDataAdapter();
                DataSet ds = new DataSet();



                adap.SelectCommand = comm;
                adap.Fill(ds, "BOOKING");

                gvBookings.DataSource = ds;
                gvBookings.DataBind();

            }

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            if (!recordExists(int.Parse(ddlBookingID.SelectedItem.Text)))
            {
                lblDeleteMessage.Text = "Booking ID does not exist";
                return;
            }
            BtnDelete.Visible = false;
            btnCancel.Visible = false;

            lblDeleteMessage.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        private bool recordExists(int IDCheck)
        {
            bool exists = false;

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = "SELECT Booking_ID FROM BOOKING";

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

        protected void btnYes_Click(object sender, EventArgs e)
        {
            
            int returnTickets = getReturnTickets(int.Parse(ddlBookingID.SelectedItem.Text));
            int eventID = getEventID(int.Parse(ddlBookingID.SelectedItem.Text));
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();

                string sql = @"DELETE FROM BOOKING WHERE Booking_ID = @id
                                
                               UPDATE EVENT SET Tickets_Available = Tickets_Available + @returnTickets WHERE Event_ID = @eventID";
                using (SqlCommand comm = new SqlCommand(sql, conn))
                {
                    comm.Parameters.AddWithValue("@id", ddlBookingID.SelectedItem.Text);
                    comm.Parameters.AddWithValue("@returnTickets", returnTickets);
                    comm.Parameters.AddWithValue("@eventID", eventID);
                    comm.ExecuteNonQuery();
                }

            }
            loadBookings();
            ddlBookingID.SelectedIndex= 0;
            BtnDelete.Visible = true;
            btnCancel.Visible = true;

            lblDeleteMessage.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;

        }

        private int getReturnTickets(int bookingID)
        {
            int numTickets = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Number_Tickets FROM BOOKING WHERE Booking_ID = @id";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@id", bookingID);
                SqlDataReader reader = comm.ExecuteReader();
                while(reader.Read())
                {
                    numTickets = int.Parse(reader.GetValue(0).ToString());
                }
            }
           
            return numTickets;
        }
        private int getEventID(int bookingID)
        {
            int eventID = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string sql = "SELECT Event_ID FROM BOOKING WHERE Booking_ID = @id";
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddWithValue("@id", bookingID);
                SqlDataReader reader = comm.ExecuteReader();
                while(reader.Read())
                {
                    eventID = int.Parse(reader.GetValue(0).ToString());
                }
            }
           
            return eventID;
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            BtnDelete.Visible = true;
            btnCancel.Visible = true;

            lblDeleteMessage.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ddlBookingID.SelectedIndex = 0;
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {

        }
    }
}