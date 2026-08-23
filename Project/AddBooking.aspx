<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" Inherits="Project.AddBooking" %>

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
        .auto-style16 {
            height: 26px;
        }
        .auto-style15 {
            width: 450px;
            height: 706px;
        }
        .auto-style5 {
            width: 450px;
        }
        .auto-style17 {
            height: 104px;
        }
        .auto-style18 {
            height: 67px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="3">
                        <asp:Image ID="Image1" runat="server" Height="194px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
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
                    <td class="auto-style18" colspan="2" style="border-style: double">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblAddBooking" runat="server" Text="Add Booking Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">
                        <asp:Panel ID="Panel1" runat="server" Height="510px">
                            <table style="width:100%; height: 389px;">
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblTouristID" runat="server" Text="Enter Tourist ID:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtTouristID" runat="server" TextMode="Number" Width="145px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTouristID" runat="server" ControlToValidate="txtTouristID" ErrorMessage="Please enter your Tourist ID!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlEventID" runat="server" Height="25px" Width="138px">
                                            <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEventID" runat="server" ControlToValidate="ddlEventID" ErrorMessage="Please select an Event!" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblNoOfTickets" runat="server" Text="No Of Tickets:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtNoOfTickets" runat="server" AutoPostBack="True" OnTextChanged="txtNoOfTickets_TextChanged" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ControlToValidate="txtNoOfTickets" ErrorMessage="Please select a number of tickets!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblDate" runat="server" Text="Check In Date:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtArriveDate" runat="server" Height="16px" TextMode="Date"></asp:TextBox>
                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtArriveDate" ErrorMessage="Please select a Check-In Date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" Height="26px" Width="221px">
                                            <asp:ListItem>Select a Payment Method</asp:ListItem>
                                            <asp:ListItem Value="1">Cash</asp:ListItem>
                                            <asp:ListItem Value="2">Debit Card</asp:ListItem>
                                            <asp:ListItem Value="3">Credit Card</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                        <br />
                                        <asp:Label ID="lblAmount" runat="server" Text="Amount   R:"></asp:Label>
                                        <asp:Label ID="lblAmountOutput" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        &nbsp;
                                        </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="auto-style15">
                        <asp:GridView ID="gvEvents" runat="server" Height="303px" Width="603px">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                                        <asp:Button ID="BtnAddBooking" runat="server" Height="36px" Text="Add" Width="149px" Font-Bold="True" BackColor="Green" ForeColor="White" OnClick="BtnAddBooking_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnContinue" runat="server" Height="33px" Text="Continue" Width="130px" Font-Bold="True" BackColor="White" ForeColor="Black" />
                                    </td>
                </tr>
            </table>
        </div>
        </div>
    </form>
   
    