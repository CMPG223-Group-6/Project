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
            width: 566px;
        }
        .auto-style10 {
            height: 91px;
            width: 566px;
        }
        .auto-style11 {
            height: 40px;
            width: 566px;
        }
        .auto-style12 {
            width: 140px;
        }
        .auto-style14 {
            height: 26px;
        }
        .auto-style15 {
            width: 265px;
        }
        .auto-style17 {
            width: 195px;
        }
        .auto-style18 {
            height: 26px;
            width: 195px;
        }
        .auto-style19 {
            width: 196px;
        }
        .auto-style20 {
            height: 26px;
            width: 196px;
        }
        .auto-style21 {
            width: 195px;
            height: 29px;
        }
        .auto-style22 {
            width: 196px;
            height: 29px;
        }
        .auto-style23 {
            height: 29px;
        }
        .auto-style24 {
            width: 140px;
        }
        .auto-style25 {}
        .auto-style26 {
            text-decoration: underline;
        }
        .auto-style27 {
            width: 265px;
        }
        .auto-style28 {
            width: 180px;
        }
        .auto-style29 {
            width: 260px;
        }
        .auto-style30 {
            width: 180px;
            height: 26px;
        }
        .auto-style31 {
            width: 260px;
            height: 26px;
        }
        .auto-style32 {
            text-align: center;
        }
        .auto-style33 {
            width: 260px;
            text-align: center;
        }
        .auto-style34 {
            width: 171px;
        }
        .auto-style35 {
            width: 153px;
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
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Label ID="Label10" runat="server" CssClass="auto-style26" Font-Bold="True" ForeColor="#009933" Text="Payment Details"></asp:Label>
                                            </td>
                                            <td class="auto-style27">&nbsp;</td>
                                            <td class="auto-style26">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Label ID="Label1" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Tourist ID:"></asp:Label>
                                            </td>
                                            <td class="auto-style15">
                                                <asp:TextBox ID="txtTouristID" runat="server" Height="30px" Width="257px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTouristID" ErrorMessage="Enter tourist ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Label ID="Label2" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Tourist Name:"></asp:Label>
                                            </td>
                                            <td class="auto-style15">
                                                <asp:TextBox ID="txtTouristName" runat="server" Height="30px" Width="257px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTouristName" ErrorMessage="Enter your name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Label ID="Label3" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Event Name:"></asp:Label>
                                            </td>
                                            <td class="auto-style15">
                                                <asp:TextBox ID="txtEventName" runat="server" Height="30px" Width="257px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEventName" ErrorMessage="Enter event name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Label ID="Label4" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Booking ID:"></asp:Label>
                                            </td>
                                            <td class="auto-style15">
                                                <asp:TextBox ID="txtBookingID" runat="server" Height="30px" Width="257px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBookingID" ErrorMessage="Enter booking ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="auto-style3">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment Method"></asp:Label>
                                            </td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Payment Date:"></asp:Label>
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Calendar ID="Calendar1" runat="server" Width="262px">
                                                    <DayHeaderStyle BackColor="#3399FF" />
                                                    <SelectedDayStyle BackColor="Yellow" />
                                                    <TodayDayStyle BackColor="#99FF66" />
                                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                                </asp:Calendar>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblDateErrorMessage" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style21">
                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Payment Method:"></asp:Label>
                                            </td>
                                            <td class="auto-style22">
                                                <asp:DropDownList ID="ddlPaymentMethod" runat="server" Height="22px" Width="189px">
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>Cash</asp:ListItem>
                                                    <asp:ListItem>Credit or Debit Card</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style23">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlPaymentMethod" ErrorMessage="Choose payment method!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style18">
                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Amount (ZAR):"></asp:Label>
                                            </td>
                                            <td class="auto-style20">
                                                <asp:TextBox ID="txtAmount" runat="server" Width="180px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAmount" ErrorMessage="Enter amount!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Tax (15%)"></asp:Label>
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Label ID="lblTaxAmount" runat="server"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Total Amount (ZAR):"></asp:Label>
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
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
                                <td class="auto-style10"></td>
                                <td class="auto-style7">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style28">
                                                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment Summary"></asp:Label>
                                            </td>
                                            <td class="auto-style29">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">&nbsp;</td>
                                            <td class="auto-style29">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">
                                                <asp:Label ID="Label12" runat="server" Text="Amount:"></asp:Label>
                                            </td>
                                            <td class="auto-style29">
                                                <asp:Label ID="lblPaymentSummaryAmount" runat="server"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">&nbsp;</td>
                                            <td class="auto-style29">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">
                                                <asp:Label ID="Label13" runat="server" Text="Tax (15%):"></asp:Label>
                                            </td>
                                            <td class="auto-style29">
                                                <asp:Label ID="lblPaymentSummaryTax" runat="server"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style30"></td>
                                            <td class="auto-style31"></td>
                                            <td class="auto-style14"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style30">
                                                <asp:Label ID="Label16" runat="server" Text="Payment Date:"></asp:Label>
                                            </td>
                                            <td class="auto-style31">
                                                <asp:Label ID="lblPaymentSummaryDate" runat="server"></asp:Label>
                                            </td>
                                            <td class="auto-style14">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style30">&nbsp;</td>
                                            <td class="auto-style31">&nbsp;</td>
                                            <td class="auto-style14">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">
                                                <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="#009933" Text="Total Amount:"></asp:Label>
                                            </td>
                                            <td class="auto-style29">
                                                <asp:Label ID="lblPaymentSummaryTotal" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">&nbsp;</td>
                                            <td class="auto-style29">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">&nbsp;</td>
                                            <td class="auto-style33">
                                                <asp:Button ID="Button1" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" OnClick="Button1_Click" style="text-align: center" Text="Make Payment" Width="224px" />
                                            </td>
                                            <td class="auto-style32">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">&nbsp;</td>
                                            <td class="auto-style29">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" style="border-style: inset; border-color: #006600; background-color: #006600">
                                    <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                                        <Items>
                                            <asp:MenuItem Text="Sign Out"></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BorderColor="#669999" />
                                    </asp:Menu>
                                </td>
                                <td class="auto-style11">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style34">&nbsp;</td>
                                            <td class="auto-style35">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style34">&nbsp;</td>
                                            <td class="auto-style35">
                                                <asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="41px" OnClick="Button2_Click" CausesValidation="false" Text="Sign Out" Width="156px" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style34">&nbsp;</td>
                                            <td class="auto-style35">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
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
