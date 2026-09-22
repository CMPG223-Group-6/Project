<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBooking.aspx.cs" Inherits="Project.BookEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 730px;
        }

        .auto-style4 {
            width: 195px;
            height: 14px;
        }
        .auto-style5 {
            height: 14px;
        text-align: left;
    }
        .auto-style1 {
            width: 195px;
            height: 3px;
        }
        .auto-style9 {
            height: 324px;
            width: 573px;
        }
        .auto-style12 {
            height: 3px;
        }
        .auto-style14 {
            width: 195px;
            height: 324px;
        }
        .auto-style15 {
            height: 324px;
            width: 36px;
        }
    </style>
</head>
<body style="height: 728px">
    <form id="form1" runat="server">
            <table style="width: 100%; height: 361px;">
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
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="Large" Text="Make New Booking"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style14" style="border-style: inset; border-color: #006600; background-color: #006600">
                        </td>
                    <td class="auto-style9">
                        <asp:Panel ID="Panel1" runat="server" Height="458px" Width="566px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="ddrlEventID" runat="server" AutoPostBack="True" Width="224px" style="text-align: center" OnSelectedIndexChanged="ddrlEventID_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddrlEventID" ErrorMessage="Please select event id" Font-Size="Small" ForeColor="Red" InitialValue="0" ValidationGroup="btnBook"></asp:RequiredFieldValidator>
                            &nbsp;<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblArrivalDate" runat="server" Text="Arrival Date:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True" TextMode="Date" Width="220px" style="text-align: center" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate" ErrorMessage="Please enter date" Font-Size="Small" ForeColor="Red" ValidationGroup="btnBook" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblEventType" runat="server" Text="Event Type:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txtDisplayEventType" runat="server" AutoPostBack="True" ReadOnly="True" Width="230px" style="text-align: center"></asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;
                            <asp:Label ID="lblTickets" runat="server" Text="Number of Tickets:"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="txtNumberTickets" runat="server" AutoPostBack="True" Height="23px" Width="64px" TextMode="Number" OnTextChanged="txtNumberTickets_TextChanged">0</asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNumberTickets" ErrorMessage="Please number of tickets" Font-Size="Small" ForeColor="Red" ValidationGroup="btnBook" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblAmount" runat="server" Text="Payment Amount:"></asp:Label>
&nbsp;
                            <asp:TextBox ID="txtAmount0" runat="server" AutoPostBack="True" ReadOnly="True" Width="172px" style="text-align: center"></asp:TextBox>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:"></asp:Label>
                            &nbsp;
                            <asp:DropDownList ID="ddrlMethod" runat="server" Width="246px" style="text-align: center" OnSelectedIndexChanged="ddrlMethod_SelectedIndexChanged">
                                <asp:ListItem Value="0">select payment method</asp:ListItem>
                                <asp:ListItem Value="1">Cash</asp:ListItem>
                                <asp:ListItem Value="2">Debit Card</asp:ListItem>
                                <asp:ListItem Value="3">Credit Card</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddrlMethod" ErrorMessage="Please payment method" Font-Size="Small" ForeColor="Red" ValidationGroup="btnBook" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancelProgress" runat="server" OnClick="btnCancelProgress_Click" Text="Cancel" Width="98px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnBook" runat="server" BackColor="#009933" BorderColor="#009933" BorderStyle="Groove" ForeColor="White" OnClick="btnBook_Click" Text="Book" ValidationGroup="btnBook" Width="126px" />
                            &nbsp;&nbsp;
                            <br />
                            <br />
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            <br />
                            <br />
                        </asp:Panel>
                    </td>
                    <td class="auto-style15">
                        <asp:Panel ID="pnlEvents" runat="server" GroupingText="Available Events" Height="449px">
                            <br />
                            <asp:GridView ID="gdvDisplay" runat="server" Width="486px" OnSelectedIndexChanged="gdvDisplay_SelectedIndexChanged" AutoGenerateColumns="False">
                         <Columns>
                            <asp:BoundField DataField="Event_ID" HeaderText="Event ID" />
                            <asp:BoundField DataField="Event_Name" HeaderText="Event Name" />
                            <asp:BoundField DataField="Event_Price" HeaderText="Ticket Price" />
                            <asp:BoundField DataField="Max_Visitors" HeaderText="Max Visitors" />
                            <asp:BoundField DataField="Tickets_Available" HeaderText="No. Tickets Available" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                            </asp:GridView>

                          
                        </asp:Panel>
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
                    <td class="auto-style12" colspan="2">
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </form>
</body>
</html>
