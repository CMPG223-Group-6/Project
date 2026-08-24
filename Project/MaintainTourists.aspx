<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainTourists.aspx.cs" Inherits="Project.MaintainTourists" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Menu1 ul.static { height:40px;padding:40px 10px 40px 10px; }
	#Menu1 ul { list-style:none;margin:0;padding:0;width:auto; }
	#Menu1 a.popout { background-image:url("mvwres://System.Web,%20Version=4.0.0.0,%20Culture=neutral,%20PublicKeyToken=b03f5f7f11d50a3a/Menu_Popout.gif");background-repeat:no-repeat;background-position:right center;padding-right:14px; }
	#Menu1 a { color:White;font-size:13pt;font-weight:bold;text-decoration:none;white-space:nowrap;display:block; }
	    .auto-style1 {
            width: 262px;
        }
        .auto-style2 {
            height: 125px;
        }
        .auto-style3 {
            height: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; height: 400px;">
                <tr>
                    <td class="auto-style1">
                        <asp:Image ID="Image2" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        </td>
                    <td colspan="3" style="border-style: double">
                        <asp:Label ID="lblHeader" runat="server" Text="Tourist Dashboard" Font-Bold="True" Font-Size="50px"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style1" rowspan="8" style="background-color: #003300">
                        <asp:Menu ID="Menu2" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
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
                                    <asp:Button ID="btnAdd" runat="server" Height="32px" OnClick="btnAdd_Click" Text="Add a Tourist" Width="220px" BackColor="#00CC00" />
                                </td>
                    <td>
                                    <asp:Button ID="btnUpdate" runat="server" Height="36px" OnClick="btnUpdate_Click" Text="Update Tourist Details" BackColor="#999999" Width="220px" />
                                    </td>
                    <td>
                                    <asp:Button ID="btnDelete" runat="server" Height="40px" OnClick="btnDelete_Click" Text="Delete Tourist" BackColor="Red" Width="220px" />
                                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTourists" runat="server" Font-Bold="True" Font-Size="15pt" Text="Current Tourists:"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="gvTourists" runat="server" Width="1009px">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
