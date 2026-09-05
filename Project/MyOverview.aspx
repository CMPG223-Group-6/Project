<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOverview.aspx.cs" Inherits="Project.MyOverview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style4 {
            width: 191px;
            height: 71px;
        }
        .auto-style5 {
            height: 71px;
        text-align: left;
    }
        .auto-style2 {
            width: 191px;
            height: 282px;
        }
        .auto-style3 {
        }
        .auto-style6 {
            width: 191px;
            height: 91px;
        }
        .auto-style7 {
            height: 91px;
        }
        .auto-style1 {
            width: 191px;
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
        }
        .auto-style9 {
            width: 774px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style4" style="border-style: inset; border-color: #006600; background-color: #006600">&nbsp;<br />
                        <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                    </td>
                    <td class="auto-style5" colspan="2" style="border-style: double">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="My Overview"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblNameDisplay0" runat="server" Font-Size="Small" ForeColor="#999999"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="border-style: inset; border-color: #006600; background-color: #006600" rowspan="2">
                        <asp:Label ID="lblZooNavigation" runat="server" Font-Size="Small" ForeColor="#999999" Text="NAVIGATION"></asp:Label>
                        <br />
                        <br />
                        <asp:Menu ID="Menu1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem NavigateUrl="~/MyOverview.aspx" Text="My Overview" Value="0"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Bookings.aspx" Text="Bookings" Value="1"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Payment.aspx" Text="Payment" Value="2"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/CheckIn.aspx" Text="Check - In" Value="3"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/ChatBot.aspx" Text="Chat" Value="Chat"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/ZooInformation.aspx" Text="Zoo Information" Value="4"></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#669999" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style9" rowspan="4">
                        <asp:Panel ID="Panel2" runat="server" Height="427px" Width="886px" GroupingText="Available &amp; Upcoming Events" ScrollBars="Both">
                            &nbsp;&nbsp;&nbsp;
                            <br />
                            <asp:GridView ID="gdvDisplayEvents" runat="server" Height="367px" Width="842px" OnSelectedIndexChanged="gdvDisplayEvents_SelectedIndexChanged">
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel3" runat="server" Height="121px" BorderColor="Black" BorderStyle="Groove">
                            <br />
                            &nbsp;<asp:Label ID="lblInformation0" runat="server" style="text-align: justify" Text="Total Visits"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblDisplayVisits" runat="server" ForeColor="#006600" style="text-align: justify"></asp:Label>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Panel ID="Panel4" runat="server" Height="116px" BorderColor="Black" BorderStyle="Groove">
                            <br />
                            &nbsp;
                            <asp:Label ID="lblInformation1" runat="server" style="text-align: justify" Text="Booked Events"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblBookedDisplay" runat="server" ForeColor="#0099FF" style="text-align: justify"></asp:Label>
                        </asp:Panel>
                    </td>
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
                    <td class="auto-style7">
                        <asp:Panel ID="Panel5" runat="server" Height="107px" BorderColor="Black" BorderStyle="Groove">
                            <br />
                            &nbsp;
                            <asp:Label ID="lblInformation2" runat="server" style="text-align: justify" Text="Total Spent"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblDisplaySpent" runat="server" ForeColor="#660066" style="text-align: justify"></asp:Label>
                        </asp:Panel>
                    </td>
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
                    <td class="auto-style8"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
