<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckInTourist.aspx.cs" Inherits="Project.CheckInTourist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style6 {
            width: 170px;
        }
        .auto-style1 {
            width: 1777px;
            height: 862px;
        }
        .auto-style14 {
            height: 116px;
        }
        .auto-style27 {
            height: 36px;
        }
        .auto-style28 {
            height: 67px;
        }
        .auto-style29 {
            height: 6px;
        }
        .auto-style30 {
            height: 12px;
            font-weight: 700;
        }
        .auto-style31 {
            height: 15px;
        }
        .auto-style32 {
            height: 11px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="8">
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
                                <asp:MenuItem NavigateUrl="~/CheckInTourist.aspx" Text="Check-In" Value="Check-In"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Reports.aspx" Text="Reports" Value="Reports"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Log Out" Value="Log Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style28" style="background-color: #FFFFFF">
                        <asp:Label ID="lblHeading" runat="server" style="font-size: xx-large; font-weight: 700" Text="Check-in" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29">
                                    <asp:Panel ID="Panel1" runat="server" GroupingText="Check in Details">
                                        <asp:Label ID="lblBookingID0" runat="server" Text="BookingID :"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvBookingIDStaff0" runat="server" ControlToValidate="ddlBookingEventsStaffcheckin" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlBookingEventsStaffcheckin" runat="server" Height="23px" Width="134px">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnCheck0" runat="server" BackColor="#33CC33" Height="43px" OnClick="btnCheck_Click" Text="Check In" Width="186px" />
                                        <br />
                                        <br />
                                        <asp:Label ID="lblOutput" runat="server"></asp:Label>
                                    </asp:Panel>
                                </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                                    <asp:Label ID="lblBookings" runat="server" Font-Bold="True" Font-Size="15pt" Text="Bookings:"></asp:Label>
                                </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                                    <asp:GridView ID="GridView1" runat="server" Height="272px" Width="1389px">
                                    </asp:GridView>
                                </td>
                </tr>
                <tr>
                    <td class="auto-style31">
                                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style32">
                                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style27">
                                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">
                                    &nbsp;</td>
                </tr>
            </table>
            <p>
                &nbsp;</p>
    </form>
</body>
</html>
