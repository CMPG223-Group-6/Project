<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="Project.Bookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style4 {
            width: 193px;
            height: 71px;
        }
        .auto-style5 {
            height: 71px;
        text-align: left;
    }
        .auto-style2 {
            width: 193px;
            height: 282px;
        }
        .auto-style3 {
        }
        .auto-style6 {
            width: 193px;
            height: 91px;
        }
        .auto-style1 {
            width: 193px;
            height: 40px;
        }
        </style>
</head>
<body style="height: 622px">
    <form id="form1" runat="server">
        <div style="height: 621px; margin-top: 0px;">
            <table style="width:100%; height: 637px;">
                <tr>
                    <td>
                        <table style="width:100%; height: 377px;">
                            <tr>
                                <td class="auto-style4" style="border-style: inset; border-color: #006600; background-color: #006600">&nbsp;<br />
                                    <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                                </td>
                                <td class="auto-style5" style="border-style: double">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Bookings"></asp:Label>
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <br />
                                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" style="border-style: inset; border-color: #006600; background-color: #006600">
                                    <asp:Label ID="lblZooNavigation" runat="server" Font-Size="Small" ForeColor="#999999" Text="NAVIGATION"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Menu ID="Menu1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                                        <Items>
                                            <asp:MenuItem NavigateUrl="~/MyOverview.aspx" Text="My Overview" Value="0"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/Bookings.aspx" Text="Bookings" Value="1"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/Payment.aspx" Text="Payment" Value="2"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/ChatBot.aspx" Text="AI Chat"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/CheckIn.aspx" Text="Check - In" Value="3"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/Checkout.aspx" Text="Check Out"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/ZooInformation.aspx" Text="Zoo Information" Value="4"></asp:MenuItem>
                                            <asp:MenuItem></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#669999" />
                                    </asp:Menu>
                                </td>
                                <td class="auto-style3" rowspan="3">
                                    <asp:Panel ID="Panel1" runat="server" Height="490px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblSearch" runat="server" Text="Type To Search Event:"></asp:Label>
                                        &nbsp;&nbsp;
                                        <asp:TextBox ID="txtSearch" runat="server" Width="396px" OnTextChanged="txtSearch_TextChanged" TextMode="Search"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch" ErrorMessage="*" ForeColor="Red" ValidationGroup="btnSearch"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnSearch" runat="server" BackColor="#CCCCCC" Text="Search" ValidationGroup="btnSearch" Width="81px" OnClick="btnSearch_Click" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnReload" runat="server" BackColor="#CCFFFF" Text="Reload" OnClick="btnReload_Click" />
                                        <br />
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnMyBookings" runat="server" BackColor="#669999" ForeColor="White" OnClick="btnMyBookings_Click" Text="My Bookings" Width="192px" Height="29px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnNewBooking" runat="server" BackColor="#006600" BorderColor="#003300" BorderStyle="Groove" ForeColor="White" Height="28px" OnClick="btnNewBooking_Click" Text="+ New Booking" Width="161px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnUpdateBooking" runat="server" Height="28px" OnClick="btnUpdateBooking_Click" Text="Update Booking" Width="163px" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancelBooking" runat="server" BackColor="#FF3300" BorderColor="Red" BorderStyle="Groove" ForeColor="White" Height="27px" OnClick="btnCancelBooking_Click" style="margin-left: 18px" Text="Cancel Booking" Width="146px" />
                                        <br />
                                        &nbsp;&nbsp;
                                        <asp:Panel ID="Panel2" runat="server" GroupingText="Available Events:" Height="289px" ScrollBars="Both">
                                            <asp:GridView ID="gdvDisplayEvents" runat="server" Height="88px" Width="1066px" OnSelectedIndexChanged="gdvDisplayEvents_SelectedIndexChanged" AutoGenerateColumns="False">
                                             <Columns>
                                                <asp:BoundField DataField="Event_ID" HeaderText="Event ID" />
                                                <asp:BoundField DataField="Event_Name" HeaderText="Event Name" />
                                                <asp:BoundField DataField="Event_Price" HeaderText="Ticket Price" DataFormatString="{0:C}"/>
                                                <asp:BoundField DataField="Max_Visitors" HeaderText="Max Visitors" />
                                                <asp:BoundField DataField="Tickets_Available" HeaderText="No. Tickets Available" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                            </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="border-style: inset; border-color: #006600; background-color: #006600">
                                    <asp:Menu ID="Menu2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                                        <Items>
                                            <asp:MenuItem NavigateUrl="~/MyProfile.aspx" Text="My Profile"></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#669999" />
                                    </asp:Menu>
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblNameDisplay" runat="server" Font-Size="Small" ForeColor="#999999"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" style="border-style: inset; border-color: #006600; background-color: #006600">
                                    <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                                        <Items>
                                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/Default.aspx"></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BorderColor="#669999" />
                                    </asp:Menu>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
