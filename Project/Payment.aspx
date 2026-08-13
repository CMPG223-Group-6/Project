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
        .auto-style14 {
            height: 26px;
        }
        .auto-style15 {
            width: 265px;
        }
        .auto-style17 {
            width: 195px;
        }
        .auto-style19 {
            width: 196px;
        }
        .auto-style21 {
            width: 195px;
            height: 38px;
        }
        .auto-style22 {
            width: 196px;
            height: 38px;
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
            height: 45px;
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
        .auto-style36 {
            width: 140px;
            height: 45px;
        }
        .auto-style37 {
            text-decoration: underline;
            height: 45px;
        }
        .auto-style38 {
            width: 140px;
            height: 32px;
        }
        .auto-style39 {
            width: 265px;
            height: 32px;
        }
        .auto-style40 {
            height: 32px;
        }
        .auto-style43 {
            height: 43px;
        }
        .auto-style44 {
            width: 140px;
            height: 43px;
        }
        .auto-style45 {
            width: 265px;
            height: 43px;
        }
        .auto-style46 {
            height: 48px;
        }
        .auto-style57 {
            width: 140px;
            height: 56px;
        }
        .auto-style58 {
            width: 265px;
            height: 56px;
        }
        .auto-style59 {
            height: 56px;
        }
        .auto-style62 {
            height: 50px;
        }
        .auto-style65 {
            width: 140px;
            height: 39px;
        }
        .auto-style66 {
            width: 265px;
            height: 39px;
        }
        .auto-style67 {
            height: 39px;
        }
        .auto-style68 {
            width: 140px;
            height: 48px;
        }
        .auto-style69 {
            width: 265px;
            height: 48px;
        }
        .auto-style73 {
            width: 195px;
            height: 44px;
        }
        .auto-style74 {
            width: 196px;
            height: 44px;
        }
        .auto-style75 {
            height: 44px;
        }
        .auto-style76 {
            width: 195px;
            height: 31px;
        }
        .auto-style77 {
            width: 196px;
            height: 31px;
        }
        .auto-style78 {
            height: 31px;
        }
        .auto-style79 {
            width: 195px;
            height: 46px;
        }
        .auto-style80 {
            width: 196px;
            height: 46px;
        }
        .auto-style81 {
            height: 46px;
        }
        .auto-style82 {
            width: 195px;
            height: 47px;
        }
        .auto-style83 {
            width: 196px;
            height: 47px;
        }
        .auto-style84 {
            height: 47px;
        }
        .auto-style85 {
            height: 38px;
        }
        .auto-style86 {
            width: 195px;
            height: 55px;
        }
        .auto-style87 {
            width: 196px;
            height: 55px;
        }
        .auto-style88 {
            height: 55px;
        }
        .auto-style89 {
            width: 195px;
            height: 54px;
        }
        .auto-style90 {
            width: 196px;
            height: 54px;
        }
        .auto-style91 {
            height: 54px;
        }
        .auto-style92 {
            width: 195px;
            height: 53px;
        }
        .auto-style93 {
            width: 196px;
            height: 53px;
        }
        .auto-style94 {
            height: 53px;
        }
        .auto-style97 {
            width: 140px;
            height: 54px;
        }
        .auto-style98 {
            width: 265px;
            height: 54px;
        }
        .auto-style99 {
            width: 195px;
            height: 50px;
        }
        .auto-style100 {
            width: 196px;
            height: 50px;
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
                                    <table style="width:100%; height: 809px;">
                                        <tr>
                                            <td class="auto-style36">
                                                <asp:Label ID="Label10" runat="server" CssClass="auto-style26" Font-Bold="True" ForeColor="#009933" Text="Payment Details"></asp:Label>
                                            </td>
                                            <td class="auto-style27"></td>
                                            <td class="auto-style37"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style38"></td>
                                            <td class="auto-style39"></td>
                                            <td class="auto-style40"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style44">
                                                <asp:Label ID="Label4" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Booking ID:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ddlBookingID" runat="server" Height="26px" Width="119px">
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                            </td>
                                            <td class="auto-style45">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlBookingID" ErrorMessage="Enter booking ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style43">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style65">
                                                <asp:Label ID="lblEventID" runat="server" Font-Bold="True" Text="Event ID:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtEventID" runat="server" Height="26px" ReadOnly="True" Width="125px"></asp:TextBox>
                                                <br />
                                                <br />
                                            </td>
                                            <td class="auto-style66">
                                            </td>
                                            <td class="auto-style67">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style57">
                                                <asp:Label ID="Label3" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Event Name:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtEventName" runat="server" Height="30px" Width="257px" ReadOnly="True"></asp:TextBox>
                                                <br />
                                                <br />
                                            </td>
                                            <td class="auto-style58">
                                                &nbsp;</td>
                                            <td class="auto-style59">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style68">
                                                <asp:Label ID="Label2" runat="server" CssClass="auto-style25" Font-Bold="True" Text="Tourist Name:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtTouristName" runat="server" Height="30px" Width="257px" ReadOnly="True"></asp:TextBox>
                                                <br />
                                            </td>
                                            <td class="auto-style69">
                                                &nbsp;</td>
                                            <td class="auto-style46">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style97">&nbsp;</td>
                                            <td class="auto-style98"></td>
                                            <td class="auto-style91"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style24">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="auto-style3">
                                    <table style="width:100%; height: 812px;">
                                        <tr>
                                            <td class="auto-style73">
                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment Method"></asp:Label>
                                            </td>
                                            <td class="auto-style74"></td>
                                            <td class="auto-style75"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style76"></td>
                                            <td class="auto-style77"></td>
                                            <td class="auto-style78"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style79">
                                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Payment Date:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                                                <br />
                                                <br />
                                            </td>
                                            <td class="auto-style80">
                                                &nbsp;</td>
                                            <td class="auto-style81">
                                                <asp:Label ID="lblDateErrorMessage" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style82">
                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Payment Method:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ddlPaymentMethod" runat="server" Height="24px" Width="166px">
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>Cash</asp:ListItem>
                                                    <asp:ListItem>Credit or Debit Card</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                            </td>
                                            <td class="auto-style83"></td>
                                            <td class="auto-style84"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style21">
                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Amount (ZAR):"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtAmount" runat="server" Width="157px" ReadOnly="True"></asp:TextBox>
                                                <br />
                                                <br />
                                            </td>
                                            <td class="auto-style22">
                                                &nbsp;</td>
                                            <td class="auto-style85">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style86">
                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Tax (15%)"></asp:Label>
                                            </td>
                                            <td class="auto-style87">
                                                <asp:Label ID="lblTaxAmount" runat="server"></asp:Label>
                                            </td>
                                            <td class="auto-style88"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style89">
                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Total Amount (ZAR):"></asp:Label>
                                            </td>
                                            <td class="auto-style90">
                                                <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td class="auto-style91">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style92">&nbsp;</td>
                                            <td class="auto-style93"></td>
                                            <td class="auto-style94"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style82">
                                                &nbsp;</td>
                                            <td class="auto-style83">
                                                <asp:Button ID="Button1" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" OnClick="Button1_Click" style="text-align: center" Text="Make Payment" Width="224px" />
                                            </td>
                                            <td class="auto-style84"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style99"></td>
                                            <td class="auto-style100"></td>
                                            <td class="auto-style62"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17">
                                                &nbsp;</td>
                                            <td class="auto-style19">
                                                &nbsp;</td>
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
                                                &nbsp;</td>
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
                                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/MyOverview.aspx"></asp:MenuItem>
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
                                                &nbsp;</td>
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
