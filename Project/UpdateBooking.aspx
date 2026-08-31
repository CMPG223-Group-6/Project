<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateBooking.aspx.cs" Inherits="Project.UpdateBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style4 {
            width: 195px;
            }
        .auto-style5 {
            text-align: left;
    }
        .auto-style9 {
            width: 573px;
        }
        .auto-style1 {
            width: 195px;
            height: 3px;
        }
        .auto-style12 {
            height: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; height: 601px;">
                <tr>
                    <td class="auto-style4" style="border-style: inset; border-color: #006600; background-color: #006600">&nbsp;<br />
                        <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                    </td>
                    <td class="auto-style5" colspan="2" style="border-style: double">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="Large" Text="Update Booking"></asp:Label>
                        &nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style9">
                        <asp:Panel ID="Panel1" runat="server" Height="464px" Width="566px" BorderColor="Black" BorderStyle="Groove">
                            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<asp:Label ID="lblBookingID" runat="server" Text="Booking ID:"></asp:Label>
                            &nbsp; &nbsp;&nbsp;<asp:DropDownList ID="ddlBookingID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBookingID_SelectedIndexChanged" style="text-align: center" Width="206px">
                                <asp:ListItem Value="0">Select Booking ID</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlBookingID" ErrorMessage="Please select booking id" Font-Size="Small" ForeColor="Red" InitialValue="0" ValidationGroup="btnUpdate"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="ddrlEventID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddrlEventID_SelectedIndexChanged" style="text-align: center" Width="203px">
                                <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddrlEventID" ErrorMessage="Please select event id" Font-Size="Small" ForeColor="Red" InitialValue="0" ValidationGroup="btnUpdate"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblEventType" runat="server" Text="Event Type:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtDisplayEventType" runat="server" Width="230px" AutoPostBack="True" ReadOnly="True"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblArrivalDate" runat="server" Text="Arrival Date:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True" TextMode="Date" Width="156px" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate" ErrorMessage="Please select date" Font-Size="Small" ForeColor="Red" ValidationGroup="btnUpdate" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblTickets" runat="server" Text="Number of Tickets:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtNumberTickets" runat="server" AutoPostBack="True" Width="60px" TextMode="Number" OnTextChanged="txtNumberTickets_TextChanged"></asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNumberTickets" ErrorMessage="Please enter number of tickets" Font-Size="Small" ForeColor="Red" ValidationGroup="btnUpdate"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblAmount" runat="server" Text="Payment Amount:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtAmount0" runat="server" AutoPostBack="True" ReadOnly="True" Width="172px"></asp:TextBox>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="ddrlMethod" runat="server" Width="189px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">Cash</asp:ListItem>
                                <asp:ListItem Value="2">Debit Card</asp:ListItem>
                                <asp:ListItem Value="2">Credit Card</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddrlMethod" ErrorMessage="Please select payment method" Font-Size="Small" ForeColor="Red" ValidationGroup="btnUpdate"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Width="131px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" ValidationGroup="btnUpdate" Width="136px" BackColor="#33CC33" ForeColor="White" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                        </asp:Panel>
                    </td>
                    <td>
                        <table style="width: 100%; height: 455px;">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlEvents" runat="server" GroupingText="Booked Events" Height="276px">
                                        <br />
                                        <asp:GridView ID="gdvDisplayEvents" runat="server" Width="496px" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="Booking_ID" HeaderText="Booking_ID" />
                                                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" />
                                                <asp:BoundField DataField="Event_Name" HeaderText="Event_Name" />
                                                <asp:BoundField DataField="Number_Tickets" HeaderText="Number_Tickets" />
                                                <asp:BoundField DataField="Arrive_Date" HeaderText="Arrive_Date" DataFormatString="{0:yyyy/MM/dd}" />
                                                <asp:BoundField DataField="Questionnaires" HeaderText="Questionnaires" />
                                                <asp:BoundField DataField="Payment_Method" HeaderText="Payment_Method" />
                                                <asp:BoundField DataField="Payment_Amount" HeaderText="Payment_Amount" DataFormatString="{0:C}" />
                                                <asp:BoundField DataField="Payment_Made" HeaderText="Payment_Made" />
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem Text="Back" NavigateUrl="~/Bookings.aspx" Value="Back"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BorderColor="#669999" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style12" style="border-style: groove; border-color: #000000">
                        <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style12" style="border-style: groove; border-color: #000000">
                        <asp:Panel ID="Panel2" runat="server" Height="139px" BorderColor="Black" BorderStyle="Double" GroupingText="Confirmation Of Update" Visible="False">
                            <br />
                            &nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblConfirmation" runat="server" Visible="False">Your Booking has been updated successfully</asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnDone" runat="server" OnClick="btnDone_Click" Text="Later" Width="123px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnPayNow" runat="server" BackColor="#339933" BorderColor="#006600" BorderStyle="Double" ForeColor="White" OnClick="btnPayNow_Click" Text="Pay Now" Visible="False" Width="155px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
