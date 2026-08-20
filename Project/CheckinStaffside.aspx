<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckinStaffside.aspx.cs" Inherits="Project.CheckInTourist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style6 {
            width: 170px;
        }
        .auto-style5 {
            width: 456px;
        }
        .auto-style1 {
            width: 1363px;
            height: 808px;
        }
        .auto-style9 {
            height: 77px;
        }
        .auto-style10 {
            height: 273px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="4">
                        <asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px" OnMenuItemClick="Menu1_MenuItemClick">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Maintain" Value="Maintain">
                                    <asp:MenuItem NavigateUrl="~/MaintainTourists.aspx" Text="Maintain Tourists" Value="Maintain Tourists"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/MaintainEventsTypes.aspx" Text="Maintain Event Types" Value="Maintain Event Types"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/MaintainBookings.aspx" Text="Maintain Bookings" Value="Maintain Bookings"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/ProcessPayments.aspx" Text="Process Payments" Value="Process Payments"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/CheckInStaffside.aspx" Text="Check-In" Value="Check-In"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Reports.aspx" Text="Reports" Value="Reports"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Log Out" Value="Log Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td>
                        <asp:Label ID="lblHeading" runat="server" style="font-size: xx-large; font-weight: 700" Text="Check-in"></asp:Label>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style10">
                                    <asp:Panel ID="Panel1" runat="server" GroupingText="Check-in Details" Height="315px" Width="910px">
                                        <asp:Label ID="lblBookingID" runat="server" Text="BookingID :"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvBookingIDStaff" runat="server" ControlToValidate="ddlBookingEventsStaffcheckin" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlBookingEventsStaffcheckin" runat="server" Height="28px" Width="189px">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnCheck" runat="server" Text="Check In" BackColor="#33CC33" Height="43px" Width="186px" OnClick="btnCheck_Click" />
                                        <br />
                                        <br />
                                        <asp:Label ID="lblOutput" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                    </asp:Panel>
                                </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" Height="179px" Width="1069px">
                                    </asp:GridView>
                                </td>
                </tr>
            </table>
    </form>
</body>
</html>
