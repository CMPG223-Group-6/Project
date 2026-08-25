<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainBookings.aspx.cs" Inherits="Project.MaintainBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1368px;
        }
        .auto-style6 {
            width: 331px;
        }
        .auto-style18 {
            height: 127px;
            text-align: center;
        }
        .auto-style22 {
            width: 331px;
            height: 413px;
        }
        .auto-style23 {
            text-align: justify;
            height: 413px;
        }
        .auto-style26 {
            width: 331px;
            height: 102px;
        }
        .auto-style31 {
            text-align: justify;
            height: 102px;
        }
        .auto-style32 {
            text-align: justify;
            height: 102px;
            width: 344px;
        }
        .auto-style33 {
            text-align: justify;
            height: 65px;
        }
        .auto-style34 {
            text-align: justify;
            height: 65px;
            width: 344px;
        }
        .auto-style35 {
            text-align: justify;
            height: 35px;
        }
        .auto-style36 {
            text-align: justify;
            height: 35px;
            width: 344px;
        }
        .auto-style37 {
            text-align: justify;
            height: 41px;
        }
        .auto-style38 {
            text-align: justify;
            height: 41px;
            width: 344px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">
                        <asp:Image ID="Image1" runat="server" Height="211px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                    </td>
                    <td class="auto-style18" colspan="3" style="border-style: double">&nbsp;<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblHeader" runat="server" Font-Size="50px" Text="Booking Management Dashboard" Font-Bold="True"></asp:Label>
                        <br />
                        <br style="border-style: double" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        </td>
                </tr>
                <tr>
                    <td class="auto-style26" rowspan="7" style="background-color: #003300">
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
                    <td class="auto-style33">
                        <br />
                                    <asp:Button ID="btnAddBooking" runat="server" Font-Bold="True" Height="54px" Text="Add New Booking" Width="217px" BackColor="#009933" ForeColor="White" OnClick="btnAddBooking_Click" BorderColor="#00FF99" BorderStyle="Groove" />
                                <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                
                        </td>
                    <td class="auto-style34">
                                    <asp:Button ID="btnUpdBooking" runat="server" Font-Bold="True" Height="56px" Text="Update A Booking" Width="223px" BackColor="#999999" ForeColor="White" OnClick="btnUpdBooking_Click" BorderColor="#999999" BorderStyle="Groove" />
                        
                        </td>
                    <td class="auto-style34">
                                    <asp:Button ID="btnDelete" runat="server" Font-Bold="True" Height="55px" Text="Delete A Booking" Width="216px" BackColor="Red" ForeColor="White" OnClick="btnDelete_Click" BorderColor="Red" BorderStyle="Groove" />
                        
                        </td>
                </tr>
                <tr>
                    <td class="auto-style35">
                        <asp:Label ID="Label1" runat="server" Text="Search for event:"></asp:Label>
                        
                        </td>
                    <td class="auto-style36">
                        
                        </td>
                    <td class="auto-style36">
                        
                        </td>
                </tr>
                <tr>
                    <td class="auto-style37">
                        <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="331px"></asp:TextBox>
                        
                        </td>
                    <td class="auto-style38">
                        <asp:Button ID="btnSearch" runat="server" Height="38px" Text="Search" Width="120px" />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReload" runat="server" Height="39px" Text="Reload Table" Width="132px" />
                        
                        </td>
                    <td class="auto-style38">
                        
                        </td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        <br />
                        <br />
                        <asp:Label ID="lblAvailableEvents" runat="server" Font-Bold="True" Font-Size="20pt" Text="Available Events:"></asp:Label>
                        
                        </td>
                    <td class="auto-style32">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style31" colspan="3">
                        <asp:GridView ID="gvEvents" runat="server" Height="244px" Width="1017px">
                        </asp:GridView>
                        
                        </td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style23" colspan="3">
                        &nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
