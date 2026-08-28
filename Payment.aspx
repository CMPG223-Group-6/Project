<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Project.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style4 {
            width: 198px;
            height: 71px;
        }
        .auto-style5 {
            height: 71px;
        text-align: left;
    }
        .auto-style2 {
            width: 198px;
            height: 282px;
        }
        .auto-style3 {
            height: 282px;
        }
        .auto-style6 {
            width: 198px;
            height: 91px;
        }
        .auto-style7 {
            height: 91px;
        }
        .auto-style1 {
            width: 198px;
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
        }
        .auto-style9 {
            height: 282px;
            width: 569px;
        }
        .auto-style10 {
            height: 91px;
            width: 569px;
        }
        .auto-style11 {
            height: 40px;
            width: 569px;
        }
        .auto-style17 {
            width: 389px;
        }
        .auto-style18 {
            width: 389px;
            height: 27px;
        }
        .auto-style19 {
            height: 27px;
            width: 835px;
        }
        .auto-style21 {
            height: 26px;
            width: 389px;
        }
        .auto-style22 {
            width: 835px;
        }
        .auto-style23 {
            width: 389px;
            height: 29px;
        }
        .auto-style24 {
            width: 835px;
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>
                        <table style="width:100%;">
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
                                    <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Payments"></asp:Label>
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
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
                                            <asp:MenuItem NavigateUrl="~/CheckIn.aspx" Text="Check - In" Value="3"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/ZooInformation.aspx" Text="Zoo Information" Value="4"></asp:MenuItem>
                                            <asp:MenuItem></asp:MenuItem>
                                            <asp:MenuItem></asp:MenuItem>
                                            <asp:MenuItem></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#669999" />
                                    </asp:Menu>
                                </td>
                                <td class="auto-style9">
                                    <table style="width: 203%;">
                                        <tr>
                                            <td class="auto-style21">
                                                <asp:Label ID="lblHeading" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment details:"></asp:Label>
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Label ID="lblHeading2" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment method"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style22">
                                                <asp:Label ID="lblPaymentMethod" runat="server" Font-Bold="True" Text="Payment method:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="lblBookingID" runat="server" Font-Bold="True" Text="Booking ID:"></asp:Label>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:DropDownList ID="ddlPaymentMethod" runat="server" Height="19px" Width="96px">
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>Cash</asp:ListItem>
                                                    <asp:ListItem>Credit Card</asp:ListItem>
                                                    <asp:ListItem>Debit Card</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style23">
                                                <asp:DropDownList ID="ddlBookingID" runat="server" Height="20px" Width="159px" AutoPostBack="True" OnSelectedIndexChanged="ddlBookingID_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style24">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPaymentMethod" ErrorMessage="Choose a payment method!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBookingID" ErrorMessage="Choose a booking ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:Label ID="lblPaymentDate" runat="server" Font-Bold="True" Text="Payment date:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="lblEventID" runat="server" Font-Bold="True" Text="Event ID:"></asp:Label>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:TextBox ID="txtPaymentDate" runat="server" TextMode="Date" Width="114px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:TextBox ID="txtEventID" runat="server" ReadOnly="True" Width="63px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPaymentDate" ErrorMessage="Please choose a date!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style22">
                                                <asp:Label ID="lblAmount" runat="server" Font-Bold="True" Text="Amount (ZAR):"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="lblTouristID" runat="server" Font-Bold="True" Text="Tourist ID:"></asp:Label>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:TextBox ID="txtAmount" runat="server" ReadOnly="True" Width="116px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:TextBox ID="txtTouristID" runat="server" Width="63px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:Label ID="lblTax" runat="server" Font-Bold="True" Text="Tax (15%):"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style22">
                                                <asp:TextBox ID="txtTax" runat="server" ReadOnly="True" Width="119px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="lblNumberTickets" runat="server" Font-Bold="True" Text="Number of tickets:"></asp:Label>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True" Text="Total Amount (ZAR):"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:TextBox ID="txtNumberTickets" runat="server" ReadOnly="True" Width="63px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:TextBox ID="txtTotalAmount" runat="server" ReadOnly="True" Width="119px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style22">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style18">
                                                <asp:Label ID="lblArrivalDate" runat="server" Font-Bold="True" Text="Arrival date:"></asp:Label>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:Button ID="btnMakePayment" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" OnClick="btnMakePayment_Click" Text="Make payment" Width="229px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:TextBox ID="txtArrivalDate" runat="server" ReadOnly="True" Width="152px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style22">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style22">
                                                <asp:Label ID="lblOutput" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        </table>
                                </td>
                                <td class="auto-style3">
                                    &nbsp;</td>
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
                                <td class="auto-style10">
                                    &nbsp;</td>
                                <td class="auto-style7">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1" style="border-style: inset; border-color: #006600; background-color: #006600">
                                    <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                                        <Items>
                                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/MyOverview.aspx"></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BorderColor="#669999" />
                                    </asp:Menu>
                                </td>
                                <td class="auto-style11">
                                    &nbsp;</td>
                                <td class="auto-style8"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
