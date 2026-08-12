<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainBookings.aspx.cs" Inherits="Project.MaintainBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1368px;
        }
        .auto-style6 {
            width: 170px;
        }
        .auto-style5 {
            width: 437px;
        }
        .auto-style8 {
            width: 371px;
        }
        .auto-style11 {
            width: 371px;
            height: 217px;
        }
        .auto-style12 {
            width: 437px;
            height: 217px;
        }
        .auto-style13 {
            width: 385px;
        }
        .auto-style14 {
            width: 385px;
            height: 217px;
        }
        .auto-style15 {
            width: 385px;
            height: 722px;
        }
        .auto-style16 {
            width: 371px;
            height: 722px;
        }
        .auto-style17 {
            width: 437px;
            height: 722px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="3">
                        <asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Maintain" Value="Maintain">
                                    <asp:MenuItem NavigateUrl="~/MaintainTourists.aspx" Text="Maintain Tourists" Value="Maintain Tourists"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/MaintainEventsTypes.aspx" Text="Maintain Event Types" Value="Maintain Event Types"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/MaintainBookings.aspx" Text="Maintain Bookings" Value="Maintain Bookings"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/ProcessPayments.aspx" Text="Process Payments" Value="Process Payments"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/CheckInTourist.aspx" Text="Check-In" Value="Check-In"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Reports.aspx" Text="Reports" Value="Reports"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Log Out" Value="Log Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style15">&nbsp;<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="pnlAdd" runat="server" Height="470px" GroupingText="Add Booking" Width="344px">
                            <asp:Label ID="lblAddID" runat="server" Text="Event ID:" Font-Bold="True" Font-Size="15px"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtAddID" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;
                            <br />
                            <br />
                            <asp:Label ID="lblTouristID" runat="server" Font-Bold="True" Font-Size="15px" Text="Tourist ID:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtAddTouristID" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="lblNoOfTickets" runat="server" Font-Bold="True" Font-Size="15px" Text="No Of Tickets:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtNoOfTickets" runat="server" OnTextChanged="TextBox3_TextChanged" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="lblArrivalDate" runat="server" Font-Bold="True" Font-Size="15px" Text="Date Of Arrival:"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="lblPaymentMethod" runat="server" Font-Bold="True" Font-Size="15px" Text="Payment Method:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" Width="159px">
                                <asp:ListItem>Select A Payment Method</asp:ListItem>
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem>Card</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="lblPaymentAmount" runat="server" Font-Bold="True" Font-Size="15px" Text="Amount:  R"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnAdd" runat="server" Font-Bold="True" Height="28px" Text="Add" Width="147px" BackColor="Yellow" />
                        </asp:Panel>
                        </td>
                    <td class="auto-style16">&nbsp;<asp:Label ID="lblHeader" runat="server" Font-Size="30px" Text="Booking Management Dashboard"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="pnlUpdate" runat="server" Height="386px" Width="398px" GroupingText="Update Booking">
                            <asp:Label ID="Label6" runat="server" Text="Booking ID:" Font-Bold="True" Font-Size="15px"></asp:Label>
                            <br />
&nbsp;<asp:TextBox ID="TextBox5" runat="server" TextMode="Number"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="lblSearch" runat="server" Font-Bold="True" Height="27px" Text="Search" Width="68px" BackColor="Red" />
                            <br />
                            <br />
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="15px" Text="Tourist ID:"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox7" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="lblUpdNoOfTickets" runat="server" Font-Bold="True" Font-Size="15px" Text="No Of Tickets:"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox8" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="lblUpdDateOfArrival" runat="server" Font-Bold="True" Font-Size="15px" Text="Date Of Arrival:"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox9" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="lblStatus" runat="server" Font-Bold="True" Font-Size="15px" Text="Status:"></asp:Label>
                            &nbsp;<br />
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" Width="159px">
                                <asp:ListItem>Confirmed</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Unconfirmed</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnUpdate" runat="server" Font-Bold="True" Height="33px" Text="Update" Width="127px" BackColor="Green" />
                            <br />
                        </asp:Panel>
                    </td>
                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="PnlDelete" runat="server" GroupingText="Delete Booking" Height="351px" Width="360px">
                            <asp:Label ID="lblDeleteID" runat="server" Text="Tourist ID:" Font-Bold="True" Font-Size="15px"></asp:Label>
                            &nbsp;<br />
                            <asp:TextBox ID="txtTouristID" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnDelete" runat="server" Font-Bold="True" Height="40px" Text="Delete" Width="151px" BackColor="Blue" OnClientClick="return confirm('Are you sure you want to delete this booking?');" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </asp:Panel>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:GridView ID="GridView1" runat="server" Height="225px" Width="436px" ForeColor="Green">
                            <HeaderStyle BackColor="Black" />
                        </asp:GridView>
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
