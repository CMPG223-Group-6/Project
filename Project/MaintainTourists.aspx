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
            width: 455px;
        }
        .auto-style5 {
            width: 411px;
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
                    <td class="auto-style5">
                        <asp:Label ID="lblHeader" runat="server" Text="Tourist Dashboard"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Panel ID="pnlAdd" runat="server" GroupingText="Add Tourist">
                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnAdd" runat="server" Height="32px" Text="Add" Width="157px" />
                        </asp:Panel>
                    </td>
                    <td class="auto-style5">
                        <asp:Panel ID="pnlChange" runat="server" GroupingText="Update Tourist Info:">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnUpdate" runat="server" Height="32px" Text="Change" Width="157px" />
                        </asp:Panel>
                    </td>
                    <td class="auto-style5">
                        <asp:Panel ID="pnlDelete" runat="server" GroupingText="Delete Tourist Info:">
                            <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                            <br />
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
                            <asp:Button ID="BtnDelete" runat="server" Height="26px" Text="Delete" Width="123px" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
