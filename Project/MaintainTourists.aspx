<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainTourists.aspx.cs" Inherits="Project.MaintainTourists" %>

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
        .auto-style2 {
        }
        .auto-style5 {
            width: 411px;
        }
        .auto-style7 {
            width: 229px;
        }
        .auto-style8 {
            width: 455px;
            height: 699px;
        }
        .auto-style9 {
            width: 229px;
            height: 699px;
        }
        .auto-style10 {
            width: 411px;
            height: 699px;
        }
        .auto-style11 {
            height: 22px;
        }
        .auto-style12 {
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="3">
                        <asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
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
                    <td class="auto-style2"></td>
                    <td class="auto-style7">
                        <asp:Label ID="lblHeader" runat="server" Text="Tourist Dashboard" Font-Bold="True" Font-Size="25px"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="lblAddOutput" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:Label ID="lblUpdOutput" runat="server"></asp:Label>
                        <asp:Panel ID="pnlChange" runat="server" GroupingText="Update Tourist Info:" Height="562px" Width="359px">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUpdateID" runat="server" Font-Bold="True" Font-Size="15px" Text="Enter your Tourist ID:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:TextBox ID="txtUpdID" runat="server" Height="16px" style="margin-left: 0px" TextMode="Number" Width="138px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUpdName" runat="server" Font-Bold="True" Font-Size="15px" Text="Enter your name:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUpdName" runat="server" Height="16px" Width="148px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUpdSurname" runat="server" Font-Bold="True" Font-Size="15px" Text="Enter your surname:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUpdSurname" runat="server" Height="16px" OnTextChanged="TextBox3_TextChanged" Width="140px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUpdNumber" runat="server" Font-Bold="True" Font-Size="15px" Text="Enter your phone number: "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUpdNumber" runat="server" Height="17px" Width="152px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUpdEmail" runat="server" Font-Bold="True" Font-Size="15px" Text="Enter your email:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUpdEmail" runat="server" Height="16px" TextMode="Email" Width="153px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblNoOfTickets0" runat="server" Font-Bold="True" Font-Size="15px" Text="No of Tickets:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtNoofTickets0" runat="server" TextMode="Number"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUpdCountry" runat="server" Font-Bold="True" Font-Size="15px" Text="Country Of Origin:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlUpdCountry" runat="server" Height="19px" OnSelectedIndexChanged="ddlAddCountry_SelectedIndexChanged" Width="154px">
                                            <asp:ListItem>Select A Country</asp:ListItem>
                                            <asp:ListItem>South Africa</asp:ListItem>
                                            <asp:ListItem>Nigeria</asp:ListItem>
                                            <asp:ListItem>Kenya</asp:ListItem>
                                            <asp:ListItem>Democratic Republic Of Congo</asp:ListItem>
                                            <asp:ListItem>Ethiopia</asp:ListItem>
                                            <asp:ListItem>United Kingdom</asp:ListItem>
                                            <asp:ListItem>England</asp:ListItem>
                                            <asp:ListItem>France</asp:ListItem>
                                            <asp:ListItem>Germany</asp:ListItem>
                                            <asp:ListItem>Wales</asp:ListItem>
                                            <asp:ListItem>United States Of America</asp:ListItem>
                                            <asp:ListItem>Canada</asp:ListItem>
                                            <asp:ListItem>Mexico</asp:ListItem>
                                            <asp:ListItem>Netherlands</asp:ListItem>
                                            <asp:ListItem>Portugal</asp:ListItem>
                                            <asp:ListItem>China</asp:ListItem>
                                            <asp:ListItem>Japan</asp:ListItem>
                                            <asp:ListItem>Singapore</asp:ListItem>
                                            <asp:ListItem>North Macedonia</asp:ListItem>
                                            <asp:ListItem>Ukraine</asp:ListItem>
                                            <asp:ListItem>Russia</asp:ListItem>
                                            <asp:ListItem>Montenegero</asp:ListItem>
                                            <asp:ListItem>Mozambique</asp:ListItem>
                                            <asp:ListItem>Angola</asp:ListItem>
                                            <asp:ListItem>Afghanistan</asp:ListItem>
                                            <asp:ListItem>Algeria</asp:ListItem>
                                            <asp:ListItem>Argentina</asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Austria</asp:ListItem>
                                            <asp:ListItem>Armenia</asp:ListItem>
                                            <asp:ListItem>Brazil</asp:ListItem>
                                            <asp:ListItem>Cameroon</asp:ListItem>
                                            <asp:ListItem>Chile</asp:ListItem>
                                            <asp:ListItem>Cuba</asp:ListItem>
                                            <asp:ListItem>Colombia</asp:ListItem>
                                            <asp:ListItem>Comoros</asp:ListItem>
                                            <asp:ListItem>Eswatini</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <asp:Button ID="BtnUpdate" runat="server" BackColor="Yellow" Font-Bold="True" ForeColor="White" Height="27px" Text="Change" Width="171px" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </asp:Panel>
                    </td>
                    <td class="auto-style10">
                        <asp:Label ID="lblDeleteOutput" runat="server"></asp:Label>
                        <asp:Panel ID="pnlDelete" runat="server" GroupingText="Delete Tourist Info:" Height="552px">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="lblDeleteTourist" runat="server" Text="Enter your Tourist ID:" Font-Bold="True" Font-Size="15px"></asp:Label>
                            <asp:TextBox ID="txtDeleteID" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnDelete" runat="server" Height="27px" Text="Delete" Width="149px" BackColor="Green" Font-Bold="True" ForeColor="White" OnClientClick="return confirm('Are you sure you want to delete this tourist?');" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:GridView ID="GridView1" runat="server" ForeColor="Green" Height="196px" Width="1022px">
                            <HeaderStyle BackColor="Black" />
                        </asp:GridView>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
