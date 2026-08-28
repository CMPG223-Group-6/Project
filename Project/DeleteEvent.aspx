<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteEvent.aspx.cs" Inherits="Project.DeleteEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 335px;
        }
        .auto-style2 {
            height: 182px;
        }
        .auto-style4 {
            height: 12px;
        }
        .auto-style5 {
            height: 69px;
        }
        .auto-style6 {
            width: 335px;
            height: 182px;
        }
        .auto-style7 {
            height: 345px;
        }
        .auto-style8 {
            width: 335px;
            height: 26px;
        }
        .auto-style9 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6">
                        <asp:Image ID="imgLogo" runat="server" Height="201px" ImageUrl="~/Images/zims_zoo_logo.png" Width="335px" />
                    </td>
                    <td class="auto-style2" colspan="3" style="border-style: outset; background-color: #FFFFFF">
                            <asp:Label ID="lblChangeEvent" runat="server" Text="Delete Event " BackColor="White" Font-Bold="True" Font-Size="20pt" ForeColor="Black"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style1" rowspan="4" style="background-color: #003300">
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Back" Value="Back" NavigateUrl="~/MaintainEventsTypes.aspx">
                                </asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style4" colspan="2">
                            <asp:Label ID="lblEventName0" runat="server" Text="Event ID"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlEventID" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddlEventID" runat="server" Width="290px" Height="30px">
                                <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <br />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Label ID="lblConfirmM" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                            <asp:Button ID="btnNo" runat="server" Text="No" Height="31px" Width="83px" OnClick="btnCancel_Click" Visible="False" />
                            &nbsp;
                        <asp:Button ID="btnYes" runat="server" BackColor="Red" Height="32px" style="margin-top: 0px" Text="Yes" Visible="False" Width="104px" OnClick="btnYes_Click" />
&nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                    <td style="text-align: right">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="31px" Width="83px" OnClick="btnCancel_Click" />
                            </td>
                    <td>&nbsp;
                        <br />
&nbsp;<asp:Button ID="btnDelete" runat="server" BackColor="Red" ForeColor="White" Height="32px" OnClick="btnDelete_Click" Text="Delete Event Type" Width="149px" />
                        <br />
&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style7">
                        <asp:GridView ID="gvEvents" runat="server" Width="967px" CellPadding="4" ForeColor="#333333" GridLines="None" Height="284px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                    </td>
                    <td colspan="2" class="auto-style9"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style1" rowspan="5">
                        &nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right">
                        <br />
                            <br />
                            &nbsp;&nbsp;
                            </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
    </form>
</body>
</html>
