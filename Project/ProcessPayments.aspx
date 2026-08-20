<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessPayments.aspx.cs" Inherits="Project.ProcessPayments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1368px;
        }
        .auto-style2 {
            width: 666px;
        }
        .auto-style5 {
            width: 456px;
        }
        .auto-style6 {
            width: 170px;
        }
        .auto-style7 {
            width: 286px;
        }
        .auto-style8 {
            width: 204px;
        }
        .auto-style9 {
            width: 286px;
            height: 29px;
        }
        .auto-style10 {
            width: 204px;
            height: 29px;
        }
        .auto-style11 {
            height: 29px;
        }
        .auto-style12 {
            width: 666px;
            height: 529px;
        }
        .auto-style13 {
            width: 456px;
            height: 529px;
        }
        .auto-style14 {
            height: 26px;
            width: 163px;
        }
        .auto-style17 {
            height: 26px;
            width: 172px;
        }
        .auto-style18 {
            width: 172px;
        }
        .auto-style20 {
            width: 172px;
            height: 29px;
        }
        .auto-style21 {
            width: 163px;
        }
        .auto-style22 {
            height: 29px;
            width: 163px;
        }
        .auto-style23 {
            height: 26px;
            width: 187px;
        }
        .auto-style24 {
            width: 187px;
        }
        .auto-style25 {
            height: 29px;
            width: 187px;
        }
        .auto-style27 {
            width: 150px;
        }
        .auto-style28 {
            width: 188px;
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
                    <td class="auto-style12">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment Details"></asp:Label>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Staff Email:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtStaffEmail" runat="server" Width="188px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Enter email!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Enter correct format email!" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Staff Name:"></asp:Label>
                                </td>
                                <td class="auto-style10">
                                    <asp:TextBox ID="txtStaffName" runat="server" Width="188px"></asp:TextBox>
                                </td>
                                <td class="auto-style11">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStaffName" ErrorMessage="Enter your name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Booking ID:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtBookingID" runat="server" Width="188px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBookingID" ErrorMessage="Enter booking ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Tourist Name:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtTouristName" runat="server" Width="188px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTouristName" ErrorMessage="Enter tourist name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Event Name:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtEventName" runat="server" Width="188px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEventName" ErrorMessage="Enter event name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
</td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style23">
                                    <asp:Label ID="Label7" runat="server" ForeColor="#009933" style="text-decoration: underline; font-weight: 700" Text="Payment Method"></asp:Label>
                                </td>
                                <td class="auto-style17"></td>
                                <td class="auto-style14"></td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">
                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Payment Date:"></asp:Label>
                                </td>
                                <td class="auto-style18">
                                    <asp:Calendar ID="Calendar1" runat="server">
                                        <DayHeaderStyle BackColor="#0066FF" />
                                        <SelectedDayStyle BackColor="Yellow" />
                                        <TodayDayStyle BackColor="#99FF33" />
                                        <WeekendDayStyle BackColor="#CCCCFF" />
                                    </asp:Calendar>
                                </td>
                                <td class="auto-style21">
                                    <asp:Label ID="lblDateErrorMessage" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Payment Method:"></asp:Label>
                                </td>
                                <td class="auto-style18">
                                    <asp:DropDownList ID="ddlPaymentMethod" runat="server" Height="29px" Width="191px">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Cash</asp:ListItem>
                                        <asp:ListItem>Credit or Debit Card</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style21">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlPaymentMethod" ErrorMessage="Choose a payment method!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Amount (ZAR):"></asp:Label>
                                </td>
                                <td class="auto-style20">
                                    <asp:TextBox ID="txtAmount" runat="server" Width="183px"></asp:TextBox>
                                </td>
                                <td class="auto-style22">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAmount" ErrorMessage="Enter amount!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Tax (15%):"></asp:Label>
                                </td>
                                <td class="auto-style18">
                                    <asp:Label ID="lblTax" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">
                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Total Amount (ZAR):"></asp:Label>
                                </td>
                                <td class="auto-style18">
                                    <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">
                                    <asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="40px" OnClick="Button2_Click" CausesValidation="false" Text="Log Out" Width="151px" />
                                </td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style21">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style5">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="Label12" runat="server" ForeColor="#009933" style="font-weight: 700; text-decoration: underline" Text="Payment Summary"></asp:Label>
                                </td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="Label13" runat="server" Text="Amount:"></asp:Label>
                                </td>
                                <td class="auto-style27">
                                    <asp:Label ID="lblPaymentSummaryAmount" runat="server"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="Label14" runat="server" Text="Tax (15%):"></asp:Label>
                                </td>
                                <td class="auto-style27">
                                    <asp:Label ID="lblPaymentSummaryTax" runat="server"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="Label16" runat="server" Text="Payment Date:"></asp:Label>
                                </td>
                                <td class="auto-style27">
                                    <asp:Label ID="lblPaymentSummaryDate" runat="server"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="#009933" Text="Total Amount:"></asp:Label>
                                </td>
                                <td class="auto-style27">
                                    <asp:Label ID="lblPaymentSummaryTotalAmount" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">
                                    <asp:Button ID="Button1" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" OnClick="Button1_Click" Text="Process Payment" Width="227px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style28">&nbsp;</td>
                                <td class="auto-style27">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
