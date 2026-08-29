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
        .auto-style8 {
        }
        .auto-style9 {
            width: 223px;
            height: 29px;
        }
        .auto-style12 {
            width: 666px;
            height: 480px;
        }
        .auto-style13 {
            width: 343px;
            height: 480px;
        }
        .auto-style14 {
            width: 223px;
            height: 26px;
        }
        .auto-style16 {
            height: 26px;
        }
        .auto-style17 {
            width: 223px;
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
            width: 223px;
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
        .auto-style25 {
        }
        .auto-style26 {
            width: 170px;
            height: 480px;
        }
        .auto-style27 {
            width: 170px;
            height: 216px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style27">
                        <asp:Image ID="Image1" runat="server" Height="218px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                    </td>
                    <td class="auto-style12" rowspan="2">
                        <table style="width:164%;">
                            <tr>
                                <td class="auto-style17">
                                    &nbsp;</td>
                                <td class="auto-style18"></td>
                                <td class="auto-style19"></td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    &nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    &nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25" colspan="3">
                                    <asp:Label ID="lblHeadings" runat="server" Font-Bold="True" ForeColor="#009933" style="text-decoration: underline" Text="Payment Details" Font-Size="25pt"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    </td>
                                <td class="auto-style16"></td>
                                <td class="auto-style16"></td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Booking ID:"></asp:Label>
                                </td>
                                <td class="auto-style8" colspan="2" rowspan="22">
                                    <asp:Panel ID="Panel1" runat="server" Height="592px" ScrollBars="Both">
                                        <asp:GridView ID="GridView1" runat="server" Height="250px" Width="751px">
                                        </asp:GridView>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:DropDownList ID="ddlBookingID" runat="server" Height="26px" Width="154px" AutoPostBack="True" OnSelectedIndexChanged="ddlBookingID_SelectedIndexChanged">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlBookingID" ErrorMessage="Choose a booking ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="lblEventID" runat="server" Font-Bold="True" Text="Event ID:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:TextBox ID="txtEventID" runat="server" ReadOnly="True" Width="56px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="lblTouristID" runat="server" Font-Bold="True" Text="Tourist ID:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:TextBox ID="txtTouristID" runat="server" ReadOnly="True" Width="52px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Label ID="lblNumberTickets" runat="server" Font-Bold="True" Text="Number of tickets:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:TextBox ID="txtNumberTickets" runat="server" ReadOnly="True" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="lblArrivalDate" runat="server" Font-Bold="True" Text="Arrival date:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:TextBox ID="txtArrivalDate" runat="server" ReadOnly="True" Width="136px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="lblPaymentMethod" runat="server" Font-Bold="True" Text="Payment method:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:TextBox ID="txtPaymentMethod" runat="server" ReadOnly="True" Width="93px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14"></td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="lblPaymentAmount" runat="server" Font-Bold="True" Text="Payment amount:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:TextBox ID="txtPaymentAmount" runat="server" ReadOnly="True" Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style20">
                                    <asp:Button ID="btnProcessPayment" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" Text="Process payment" Width="165px" OnClick="btnProcessPayment_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">
                                    <asp:Label ID="lblPaymentProcessedOutput" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
</td>
                    <td class="auto-style13" rowspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style26">
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Maintain" Value="Maintain">
                                    <asp:MenuItem NavigateUrl="~/MaintainTourists.aspx" Text="Maintain Tourists" Value="Maintain Tourists"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/ValidateUser.aspx" Text="Maintain Event Types" Value="Maintain Event Types"></asp:MenuItem>
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
                </tr>
                <tr>
                    <td class="auto-style6">
                        &nbsp;</td>
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
