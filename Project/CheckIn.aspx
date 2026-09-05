<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckIn.aspx.cs" Inherits="Project.CheckIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style2 {
            width: 327px;
            height: 282px;
        }
        .auto-style6 {
            width: 327px;
            height: 91px;
        }
        .auto-style1 {
            width: 327px;
            height: 40px;
        }
        .auto-style8 {
            width: 1349px;
        }
        .auto-style9 {
            height: 86px;
        }
        .auto-style10 {
            width: 327px;
            height: 86px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>
                        <table style="width:100%; height: 872px;">
                            <tr>
                                <td class="auto-style10" style="border-style: inset; border-color: #006600; background-color: #006600">&nbsp;<br />
                                    <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                                </td>
                                <td class="auto-style9" colspan="2" style="border-style: double">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Check - In"></asp:Label>
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
                                            <asp:MenuItem NavigateUrl="~/ChatBot.aspx" Text="AI Chat"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/CheckIn.aspx" Text="Check - In" Value="3"></asp:MenuItem>
                                            <asp:MenuItem Text="Check Out" Value="5" NavigateUrl="~/Checkout.aspx"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/ZooInformation.aspx" Text="Zoo Information" Value="4"></asp:MenuItem>
                                            <asp:MenuItem></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#669999" />
                                    </asp:Menu>
                                </td>
                                <td colspan="2">
                                    &nbsp;<asp:Panel ID="pnlCheckDetails" runat="server" GroupingText="Checking Details" Height="579px" Width="1326px">
                                        <br />
                                        <br />
                                        <table style="width: 100%; height: 172px;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBookingID" runat="server" Text="Enter booking ID"></asp:Label>
                                                    <br />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                    <asp:DropDownList ID="ddlBookingEvents0" runat="server" Height="30px" Width="130px">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvBookingIDTourist0" runat="server" ControlToValidate="ddlBookingEvents0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="btnCheck" runat="server" BackColor="#33CC33" Height="36px" OnClick="btnCheck_Click" Text="Check In" Width="140px" />
                                                    <br />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Panel ID="pnlCurrentBookings" runat="server" GroupingText="Current Bookings">
                                                        <br />
                                                        <asp:GridView ID="gdvDisplay" runat="server" Width="1313px">
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
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
                                    </asp:Panel>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
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
                                <td colspan="2">
                                    &nbsp;</td>
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
                                <td>
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
