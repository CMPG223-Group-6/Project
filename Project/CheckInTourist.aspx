<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckInTourist.aspx.cs" Inherits="Project.CheckInTourist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        #Menu1 { background-color:#003300;height:700px;width:330px; }
	#Menu1 ul.static { height:40px;padding:40px 10px 40px 10px; }
	#Menu1 ul { list-style:none;margin:0;padding:0;width:auto; }
	#Menu1 a.popout { background-image:url("mvwres://System.Web,%20Version=4.0.0.0,%20Culture=neutral,%20PublicKeyToken=b03f5f7f11d50a3a/Menu_Popout.gif");background-repeat:no-repeat;background-position:right center;padding-right:14px; }
	#Menu1 a { color:White;font-size:13pt;font-weight:bold;text-decoration:none;white-space:nowrap;display:block; }
	    .auto-style43 {
            width: 287px;
        }
        .auto-style44 {
        }
        .auto-style46 {
            width: 246px;
        }
        .auto-style47 {
            width: 246px;
            height: 33px;
        }
        .auto-style48 {
            height: 33px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
            <p>
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style43">
                        <asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        </td>
                        <td style="border-style: double">
                        <asp:Label ID="lblHeading" runat="server" style="font-size: xx-large; font-weight: 700" Text="Check-in" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style43" rowspan="2">
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
                        <td>
                            <asp:Panel ID="pnlCheckingDetails" runat="server" GroupingText="Checking Details" Height="669px" Width="1203px">
                                <table style="width:100%;">
                                    <tr>
                                        <td class="auto-style46">
                                            <asp:Label ID="lblTouristID" runat="server" Text="Tourist ID:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvTouristId" runat="server" ControlToValidate="txtTouristID" ErrorMessage="*" ForeColor="Red" ValidationGroup="TouristID" InitialValue="0"></asp:RequiredFieldValidator>
                                            &nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">
                                            <asp:TextBox ID="txtTouristID" runat="server" Width="87px" CausesValidation="True" TextMode="Number" OnTextChanged="txtTouristID_TextChanged"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">
                                            <asp:Button ID="btnEnter" runat="server" BackColor="#999999" Height="36px" Text="Enter" Width="194px" OnClick="btnEnter_Click" ValidationGroup="TouristID" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">
                                            <asp:Label ID="lblBookingID2" runat="server" Text="BookingID :"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvBookingID" runat="server" ControlToValidate="ddlBookingEventsStaffcheckin" ErrorMessage="*" ForeColor="Red" InitialValue="0" ValidationGroup="BookingID"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">
                                            <asp:DropDownList ID="ddlBookingEventsStaffcheckin" runat="server" Height="23px" Width="134px" OnSelectedIndexChanged="ddlBookingEventsStaffcheckin_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style47"></td>
                                        <td class="auto-style48"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">
                                            <asp:Button ID="btnCheck0" runat="server" BackColor="#33CC33" Height="43px" OnClick="btnCheck_Click" Text="Check In" Width="186px" ValidationGroup="BookingID" />
                                            &nbsp;<br />
                                            <br />
                                            <asp:Button ID="btnDone" runat="server" BackColor="#009900" Height="42px" Text="Done" Width="188px" OnClick="btnDone_Click" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <br />
                                            <br />
                                            <asp:Label ID="lblOutput" runat="server"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style44" colspan="2">
                                            <asp:Panel ID="pnlBookings" runat="server" GroupingText="Bookings" ScrollBars="Both">
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="gvBookingsStaffside" runat="server" Height="167px" Width="1162px">
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </p>
    </form>
</body>
</html>
