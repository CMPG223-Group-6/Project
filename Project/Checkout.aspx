<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Project.Checkout" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 153px;
        }
        .auto-style3 {
            height: 383px;
        }
        .auto-style4 {
            width: 1094px;
        }
        .auto-style5 {
            height: 383px;
            width: 1094px;
        }
        .auto-style6 {
            width: 950px;
        }
        .auto-style7 {
            height: 383px;
            width: 950px;
            text-align: left;
        }
        .auto-style9 {
            height: 266px;
        }
        .auto-style10 {
            width: 950px;
            height: 266px;
        }
        .auto-style11 {
            width: 1094px;
            height: 266px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td class="auto-style9" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                        <br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                        <br />
                        <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style10">
                        <asp:Label ID="lblInfo" runat="server" style="font-weight: 700; font-size: x-large" Text="Check-out"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:Image ID="Imageofzoo" runat="server" Height="258px" ImageUrl="~/Images/zims_zoo_logo.png" Width="454px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="border-style: inset; border-color: #006600; background-color: #006600">
                                    <asp:Menu ID="Menu1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                                        <Items>
                                            <asp:MenuItem NavigateUrl="~/MyOverview.aspx" Text="My Overview" Value="0"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/Bookings.aspx" Text="Bookings" Value="1"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/Payment.aspx" Text="Payment" Value="2"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/CheckIn.aspx" Text="Check - In" Value="3"></asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/ZooInformation.aspx" Text="Zoo Information" Value="4"></asp:MenuItem>
                                            <asp:MenuItem Text="Check out" Value="5"></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#669999" />
                                    </asp:Menu>
                                </td>
                    <td class="auto-style7">
                        <asp:Label ID="lblVerifyExit" runat="server" style="text-align: left; font-size: large" Text="Enter Booking ID or Tourist Name"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="btnBookingId" runat="server" Height="52px" Text="Booking ID" Width="200px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblor" runat="server" style="font-size: large; text-align: center" Text="or"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnTouristName" runat="server" Height="51px" Text="Tourist Name" Width="200px" />
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" Height="46px" Width="259px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:DropDownList ID="ddlDetails" runat="server" Height="82px" Width="263px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnConfirmExit" runat="server" Height="47px" Text="Confirm Exit" Width="461px" />
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblConfirmMessage" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblFAQ" runat="server" Text="Related FAQ's"></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Menu ID="Menu2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem NavigateUrl="~/MyProfile.aspx" Text="My Profile"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#669999" />
                        </asp:Menu>
                        <br />
                        <br />
                        <asp:Label ID="lblNameDisplay" runat="server" Font-Size="Small" ForeColor="#999999"></asp:Label>
                    </td>
                    <td class="auto-style6" rowspan="2">
                        <asp:Panel ID="Panel1" runat="server" GroupingText="Summary" Height="233px" style="margin-top: 0px">
                            <asp:GridView ID="GridView1" runat="server">
                            </asp:GridView>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                        </asp:Panel>
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                    <td class="auto-style4" rowspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem Text="Sign Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BorderColor="#669999" />
                        </asp:Menu>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
