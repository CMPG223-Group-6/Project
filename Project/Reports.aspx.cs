using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adap;
        DataSet ds;

        string conString = @"Data Source=localhost;Initial Catalog=zims.db;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlResults.Visible = false;
                btnExportReport.Visible = false;
                ResetSortControls();
            }
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the selected start and end dates from the calendar controls.
                DateTime startDate = Convert.ToDateTime(calStartDate.Text);
                DateTime endDate = Convert.ToDateTime(calEndDate.Text);

                if (endDate < startDate)
                {
                    lblDisplay1.Text = "End date cannot be before the start date.";
                    return;
                }

                if (ddReportType.SelectedIndex == 0)
                {
                    lblDisplay1.Text = "Please select a report.";
                    return;
                }

                if (ddSortBy.SelectedIndex == 0 || ddSortOrder.SelectedIndex == 0)
                {
                    lblDisplay1.Text = "Please select how the report should be sorted.";
                    return;
                }

                lblDisplay1.Text = "The following report is from " +
                                   startDate.ToString("dd MMMM yyyy") + " to " +
                                   endDate.ToString("dd MMMM yyyy") + ". Accessed on " +
                                   DateTime.Now.ToString("dd MMMM yyyy") + " at " +
                                   DateTime.Now.ToString("hh:mm tt") + ".";

                if (ddReportType.SelectedItem.Text == "Number of Bookings per Time Period")
                {
                    ShowBookingsReport(startDate, endDate);
                }
                else if (ddReportType.SelectedItem.Text == "Top 5 Event Types per Time Period")
                {
                    ShowTopEventTypesReport(startDate, endDate);
                }
            }
            catch (FormatException)
            {
                lblDisplay1.Text = "Please select valid start and end dates.";
            }
            catch (SqlException error)
            {
                lblDisplay1.Text = error.Message;
            }
        }

        protected void btnExportReport_Click(object sender, EventArgs e)
        {
            // Retrieve the generated report data stored in the session.
            DataSet reportData = Session["ReportData"] as DataSet;

            if (reportData == null || reportData.Tables.Count == 0)
            {
                return;
            }

            DateTime startDate;
            DateTime endDate;

            if (!DateTime.TryParse(calStartDate.Text, out startDate) ||
                !DateTime.TryParse(calEndDate.Text, out endDate))
            {
                return;
            }

            DataTable reportTable = reportData.Tables[0];

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=ZIMS_Report.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);

            WriteExcelStyles(htmlWriter);
            WriteReportHeader(htmlWriter, startDate, endDate);
            WriteReportTable(htmlWriter, reportTable);
            WriteReportFooter(htmlWriter);

            // Send the completed report to the user's browser.
            Response.Write(stringWriter.ToString());
            Response.End();
        }

        private void WriteExcelStyles(HtmlTextWriter writer)
        {
            writer.Write(@"
                <style>
                    body {
                        font-family: Arial;
                        font-size: 10pt;
                    }

                    .reportTable {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    .reportTable th {
                        border: 1px solid black;
                        padding: 6px;
                        text-align: center;
                        font-weight: bold;
                    }

                    .reportTable td {
                        border: 1px solid black;
                        padding: 6px;
                    }

                    .eventName {
                        text-align: left;
                    }

                    .bookingNumber {
                        text-align: right;
                    }

                    .grandTotalLabel {
                        text-align: right;
                        font-weight: bold;
                    }

                    .grandTotalValue {
                        text-align: right;
                        font-weight: bold;
                    }
                </style>
            ");
        }

        private void WriteReportHeader(HtmlTextWriter writer, DateTime startDate, DateTime endDate)
        {
            writer.Write("<table style='width:100%;'>" +"<tr>" +
                "<td style='text-align:left; width:50%;'>" +DateTime.Now.ToString("yyyy/MM/dd") + "</td>" +
                "<td style='text-align:right; width:50%;'>" + "Page: 1" + "</td>" + "</tr>" + "</table>");

            writer.Write("<br />");

            writer.Write("<div style='text-align:center; font-size:16pt; font-weight:bold;'>" +
                            "ZIMS Report - Zoological Gardens" + "</div>");

            writer.Write("<br />");

            writer.Write("<div style='text-align:center; font-size:12pt; font-weight:bold;'>" +
                            Server.HtmlEncode(ddReportType.SelectedItem.Text) + "</div>" );

            writer.Write("<div style='text-align:center; font-size:10pt;'>" +
                        "from " + startDate.ToString("yyyy/MM/dd") +
                        " to " + endDate.ToString("yyyy/MM/dd") +
                        "<br />ordered by " +
                        Server.HtmlEncode(GetSortDescription()) + "</div>");

            writer.Write("<br />");
        }

        private void WriteReportTable(HtmlTextWriter writer, DataTable reportTable)
        {
            writer.Write("<table class='reportTable'>");
            writer.Write("<tr>");

            foreach (DataColumn column in reportTable.Columns)
            {
                writer.Write( "<th>" +Server.HtmlEncode(GetUserHeading(column.ColumnName)) +"</th>" );
            }

            writer.Write("</tr>");

            foreach (DataRow row in reportTable.Rows)
            {
                writer.Write("<tr>");

                for (int i = 0; i < reportTable.Columns.Count; i++)
                {
                    string value = row[i].ToString();

                    if (i == 0)
                    {
                        writer.Write("<td class='eventName'>" + Server.HtmlEncode(value) +"</td>");
                    }
                    else
                    {
                        writer.Write( "<td class='bookingNumber'>" + Server.HtmlEncode(value) + "</td>");
                    }
                }
                writer.Write("</tr>");
            }
            writer.Write("<tr>");

            for (int i = 0; i < reportTable.Columns.Count; i++)
            {
                if (i == 0)
                {
                    writer.Write( "<td class='grandTotalLabel'>GRAND TOTAL</td>");
                }
                else
                {
                    int total = 0;

                    foreach (DataRow row in reportTable.Rows)
                    {
                        if (row[i] != DBNull.Value)
                        {
                            total += Convert.ToInt32(row[i]);
                        }
                    }
                    writer.Write("<td class='grandTotalValue'>" +total.ToString() +"</td>");
                }
            }
            writer.Write("</tr>");
            writer.Write("</table>");
        }
        private void WriteReportFooter(HtmlTextWriter writer)
        {
            // Add the end-of-report marker and page information.
            writer.Write("<br /><br />");
            writer.Write("<div style='text-align:center; font-weight:bold;'>" +"*** END OF REPORT ***" + "</div>");
            writer.Write("<br />");

            writer.Write("<div style='text-align:center;'>" +"Page 1 of 1" +"</div>");
        }

        protected void btnClear0_Click(object sender, EventArgs e)
        {
            ddReportType.SelectedIndex = 0;

            calStartDate.Text = "";
            calEndDate.Text = "";

            ResetSortControls();

            gvReport.DataSource = null;
            gvReport.DataBind();

            Chart1.Series["Series1"].Points.Clear();

            Session["ReportData"] = null;

            pnlResults.Visible = false;
            btnExportReport.Visible = false;
            lblDisplay1.Text = "";
        }

        private void ResetSortControls()
        {
            ddSortBy.Items.Clear();
            ddSortOrder.Items.Clear();

            ddSortBy.Items.Add(new ListItem(" ", ""));
            ddSortOrder.Items.Add(new ListItem(" ", ""));
        }

        private string GetSortOrder()
        {
            if (ddSortBy.SelectedValue == "EventType")
            {
                return "Event_Name " + ddSortOrder.SelectedValue;
            }

            return "TotalNumberOfBookings " + ddSortOrder.SelectedValue;
        }

        private string GetSortDescription()
        {
            if (ddSortBy.SelectedValue == "EventType")
            {
                if (ddSortOrder.SelectedValue == "ASC")
                {
                    return "Event Type A to Z";
                }
                return "Event Type Z to A";
            }

            if (ddSortOrder.SelectedValue == "ASC")
            {
                return "Number of Bookings Lowest to Highest";
            }
            return "Number of Bookings Highest to Lowest";
        }

        private void DisplayReport(string sql, DateTime startDate, DateTime endDate)
        {
            try
            {
                con = new SqlConnection(conString);
                con.Open();

                cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);

                adap = new SqlDataAdapter(cmd);
                ds = new DataSet();

                adap.Fill(ds);

                Session["ReportData"] = ds;

                gvReport.DataSource = ds;
                gvReport.DataBind();

                FormatGridView();

                BindChart(ds);

                lblDisplay1.Text += " Number of rows displayed: " +
                                   gvReport.Rows.Count + ".";

                pnlResults.Visible = true;
                btnExportReport.Visible = true;

                con.Close();
            }
            catch (SqlException error)
            {
                lblDisplay1.Text = error.Message;
                pnlResults.Visible = false;
                btnExportReport.Visible = false;
            }
        }

        private void FormatGridView()
        {
            gvReport.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            gvReport.HeaderStyle.Font.Bold = true;

            gvReport.RowStyle.HorizontalAlign = HorizontalAlign.Right;

            foreach (GridViewRow row in gvReport.Rows)
            {
                if (row.Cells.Count > 0)
                {
                    row.Cells[0].HorizontalAlign = HorizontalAlign.Left;
                }

                for (int i = 1; i < row.Cells.Count; i++)
                {
                    row.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                }
            }

            gvReport.ShowFooter = true;

            if (gvReport.FooterRow != null)
            {
                gvReport.FooterRow.Cells[0].Text = "GRAND TOTAL";
                gvReport.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;

                for (int i = 1; i < gvReport.FooterRow.Cells.Count; i++)
                {
                    int total = 0;

                    foreach (GridViewRow row in gvReport.Rows)
                    {
                        int value;

                        if (int.TryParse(row.Cells[i].Text, out value))
                        {
                            total += value;
                        }
                    }

                    gvReport.FooterRow.Cells[i].Text = total.ToString();
                    gvReport.FooterRow.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                }
            }
        }

        private void BindChart(DataSet reportData)
        {
            if (reportData.Tables.Count == 0)
            {
                return;
            }

            DataTable table = reportData.Tables[0];

            Chart1.Series["Series1"].Points.Clear();

            foreach (DataRow row in table.Rows)
            {
                string eventName = row["Event_Name"].ToString();
                int total = Convert.ToInt32(row["TotalNumberOfBookings"]);

                Chart1.Series["Series1"].Points.AddXY(eventName, total);
            }
            // Format the chart labels so each event name is displayed clearly.
            Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 1;
            Chart1.ChartAreas["ChartArea1"].AxisX.IsLabelAutoFit = false;
            Chart1.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = -15;
        }

        private string GetUserHeading(string columnName)
        {
            if (columnName == "Event_Name")
            {
                return "Event Name";
            }

            if (columnName == "TotalNumberOfBookings")
            {
                return "Total Number of Bookings";
            }

            return columnName;
        }

        private string BuildMonthlyColumns(DateTime startDate, DateTime endDate)
        {
            string columns = "";

            DateTime month = new DateTime(startDate.Year, startDate.Month, 1);
            DateTime lastMonth = new DateTime(endDate.Year, endDate.Month, 1);

            while (month <= lastMonth)
            {
                DateTime nextMonth = month.AddMonths(1);

                // Use the month name as the heading for the monthly booking count.
                string monthName = month.ToString("MMMM");

                columns +=", SUM(CASE " +"WHEN BOOKING.Arrive_Date >= '" +
                    month.ToString("yyyy-MM-dd") +"' " + "AND BOOKING.Arrive_Date < '" +
                    nextMonth.ToString("yyyy-MM-dd") + "' " +"THEN 1 ELSE 0 END) AS [" +
                    monthName +"]";

                month = nextMonth;
            }
            return columns;
        }

        private void ShowBookingsReport(DateTime startDate, DateTime endDate)
        {
            string monthlyColumns = BuildMonthlyColumns(startDate, endDate);
            string sortOrder = GetSortOrder();

            string sql =
                "SELECT EVENTTYPE.Event_Name " +
                monthlyColumns +
                ", COUNT(BOOKING.Booking_ID) AS TotalNumberOfBookings " +
                "FROM BOOKING " +
                "INNER JOIN EVENT ON BOOKING.Event_ID = EVENT.Event_ID " +
                "INNER JOIN EVENTTYPE ON EVENT.EventType_ID = EVENTTYPE.EventType_ID " +
                "WHERE BOOKING.Arrive_Date BETWEEN @StartDate AND @EndDate " +
                "GROUP BY EVENTTYPE.Event_Name " +
                "ORDER BY " + sortOrder;

            DisplayReport(sql, startDate, endDate);
        }

        private void ShowTopEventTypesReport(DateTime startDate, DateTime endDate)
        {
            string monthlyColumns = BuildMonthlyColumns(startDate, endDate);

            string sql =
                "SELECT TOP 5 EVENTTYPE.Event_Name " +
                monthlyColumns +
                ", COUNT(BOOKING.Booking_ID) AS TotalNumberOfBookings " +
                "FROM BOOKING " +
                "INNER JOIN EVENT ON BOOKING.Event_ID = EVENT.Event_ID " +
                "INNER JOIN EVENTTYPE ON EVENT.EventType_ID = EVENTTYPE.EventType_ID " +
                "WHERE BOOKING.Arrive_Date BETWEEN @StartDate AND @EndDate " +
                "GROUP BY EVENTTYPE.Event_Name " +
                "ORDER BY TotalNumberOfBookings DESC";

            DisplayReport(sql, startDate, endDate);
        }

        protected void ddSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddSortOrder.Items.Clear();

            ddSortOrder.Items.Add(new ListItem(" ", ""));

            if (ddSortBy.SelectedValue == "Bookings")
            {
                ddSortOrder.Items.Add(new ListItem("Highest to Lowest", "DESC"));
                ddSortOrder.Items.Add(new ListItem("Lowest to Highest", "ASC"));
            }
            else if (ddSortBy.SelectedValue == "EventType")
            {
                ddSortOrder.Items.Add(new ListItem("A to Z", "ASC"));
                ddSortOrder.Items.Add(new ListItem("Z to A", "DESC"));
            }
        }

        protected void ddReportType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddSortBy.Items.Clear();
            ddSortOrder.Items.Clear();

            ddSortBy.Items.Add(new ListItem(" ", ""));
            ddSortOrder.Items.Add(new ListItem(" ", ""));

            if (ddReportType.SelectedItem.Text == "Number of Bookings per Time Period")
            {
                ddSortBy.Items.Add(new ListItem("Event Type", "EventType"));
                ddSortBy.Items.Add(new ListItem("Number of Bookings", "Bookings"));
            }
            else if (ddReportType.SelectedItem.Text == "Top 5 Event Types per Time Period")
            {
                ddSortBy.Items.Add(new ListItem("Number of Bookings", "Bookings"));

                ddSortOrder.Items.Clear();
                ddSortOrder.Items.Add(new ListItem("Highest to Lowest", "DESC"));
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required by ASP.NET when exporting the GridView content.
        }
    }
}