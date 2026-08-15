<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessPayments.aspx.cs" Inherits="Project.ProcessPayments" %>

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
        .auto-style7 {
            width: 422px;
        }
        .auto-style8 {
            width: 204px;
        }
        .auto-style9 {
            width: 422px;
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
            width: 343px;
            height: 529px;
        }
        .auto-style14 {
            width: 422px;
            height: 26px;
        }
        .auto-style15 {
            width: 204px;
            height: 26px;
        }
        .auto-style16 {
            height: 26px;
        }
        .auto-style17 {
            width: 422px;
            height: 27px;
        }
        .auto-style18 {
            width: 204px;
            height: 27px;
        }
        .auto-style19 {
            height: 27px;
        }
        .auto-style20 {
            width: 422px;
            height: 33px;
        }
        .auto-style21 {
            width: 204px;
            height: 33px;
        }
        .auto-style22 {
            height: 33px;
        }
        .auto-style23 {
            width: 666px;
            height: 72px;
        }
        .auto-style24 {
            width: 343px;
            height: 72px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="2">
                        <asp:Image ID="Image1" runat="server" Height="238px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
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
                        <table style="width:164%;">
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblHeadings" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment Details"></asp:Label>
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
                                    <asp:Label ID="lblStaffEmail" runat="server" Font-Bold="True" Text="Staff Email:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtStaffEmail" runat="server" Width="188px"></asp:TextBox>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Enter your email!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Enter the correct format email!" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td class="auto-style10">
                                </td>
                                <td class="auto-style11">
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="lblStaffPassword" runat="server" Font-Bold="True" Text="Staff Password:"></asp:Label>
                                </td>
                                <td class="auto-style10">
                                    &nbsp;</td>
                                <td class="auto-style11">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtStaffPassword" runat="server" Width="188px" TextMode="Password"></asp:TextBox>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStaffPassword" ErrorMessage="Enter your password!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Booking ID:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:DropDownList ID="ddlBookingID" runat="server" Height="19px" Width="66px">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style15"></td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlBookingID" ErrorMessage="Choose a booking ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblEventID" runat="server" Font-Bold="True" Text="Event ID:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:TextBox ID="txtEventID" runat="server" ReadOnly="True" Width="56px"></asp:TextBox>
                                </td>
                                <td class="auto-style10"></td>
                                <td class="auto-style11"></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblTouristID" runat="server" Font-Bold="True" Text="Tourist ID:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtTouristID" runat="server" ReadOnly="True" Width="52px"></asp:TextBox>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style17">&nbsp;</td>
                                <td class="auto-style18">&nbsp;</td>
                                <td class="auto-style19">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Label ID="lblNumberTickets" runat="server" Font-Bold="True" Text="Number of tickets:"></asp:Label>
                                </td>
                                <td class="auto-style18"></td>
                                <td class="auto-style19"></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtNumberTickets" runat="server" ReadOnly="True" Width="50px"></asp:TextBox>
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
                                    <asp:Label ID="lblArrivalDate" runat="server" Font-Bold="True" Text="Arrival date:"></asp:Label>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtArrivalDate" runat="server" ReadOnly="True" Width="136px"></asp:TextBox>
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
                                    <asp:Label ID="lblPaymentMethod" runat="server" Font-Bold="True" Text="Payment method:"></asp:Label>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtPaymentMethod" runat="server" ReadOnly="True" Width="93px"></asp:TextBox>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14"></td>
                                <td class="auto-style15"></td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblPaymentAmount" runat="server" Font-Bold="True" Text="Payment amount:"></asp:Label>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtPaymentAmount" runat="server" ReadOnly="True" Width="130px"></asp:TextBox>
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
                                <td class="auto-style20">
                                    <asp:Button ID="btnProcessPayment" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" Text="Process payment" Width="165px" />
                                </td>
                                <td class="auto-style21"></td>
                                <td class="auto-style22"></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblPaymentProcessedOutput" runat="server" Font-Bold="True"></asp:Label>
                                </td>
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
                    <td class="auto-style23">
                    </td>
                    <td class="auto-style24">
                        &nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
