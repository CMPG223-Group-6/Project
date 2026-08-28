<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffMenu.aspx.cs" Inherits="Project.StaffMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style7 {
            width: 328px;
        }
        .auto-style1 {
            width: 195px;
            height: 40px;
        }
        .auto-style6 {
            width: 195px;
            height: 91px;
        }
        .auto-style2 {
            width: 195px;
            height: 282px;
        }
        .auto-style5 {
            height: 71px;
        text-align: left;
    }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style7">
                        <asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        </td>
                    <td colspan="2">
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Staff Dashboard"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style7">
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        </div>
    </form>
</body>
</html>
