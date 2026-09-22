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
        .auto-style10 {
            height: 364px;
            width: 480px;
        }
        .auto-style11 {
            height: 26px;
            width: 480px;
        }
        .auto-style12 {
            width: 336px;
        }
        .auto-style13 {
            height: 364px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
            <table style="width:81%;">
                <tr>
                    <td class="auto-style6">
                        <asp:Image ID="imgLogo" runat="server" Height="201px" ImageUrl="~/Images/zims_zoo_logo.png" Width="335px" />
                    </td>
                    <td class="auto-style2" colspan="2" style="border-style: outset; background-color: #FFFFFF">
                            <asp:Label ID="lblChangeEvent" runat="server" Text="Delete Event " BackColor="White" Font-Bold="True" Font-Size="20pt" ForeColor="Black"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style1" rowspan="2" style="background-color: #003300">
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
                    <td class="auto-style10">
                            <asp:Panel ID="pnlDeletEvent" runat="server" GroupingText="Delete Event" Width="402px">
                                <table style="width:94%; height: 230px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventName0" runat="server" Text="Event ID"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlEventID" ErrorMessage="*" ForeColor="Red" InitialValue="0" ValidationGroup="DeletEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlEventID" runat="server" Height="30px" Width="157px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblConfirmM" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnDelete" runat="server" BackColor="Red" ForeColor="White" Height="32px" OnClick="btnDelete_Click" Text="Delete Event " ValidationGroup="DeletEvent" Width="149px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnCancel" runat="server" Height="32px" OnClick="btnCancel_Click" Text="Cancel" Width="83px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnYes" runat="server" BackColor="Red" Height="32px" OnClick="btnYes_Click" style="margin-top: 0px" Text="Yes" Visible="False" Width="104px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnNo" runat="server" Height="32px" OnClick="btnCancel_Click" Text="No" Visible="False" Width="83px" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            </td>
                    <td class="auto-style13">
                        <br />
                        &nbsp;
                        <br />
&nbsp;<asp:Panel ID="pnlDeleteET" runat="server" GroupingText="Delete Event Type" Width="366px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <table style="width:90%;">
                                <tr>
                                    <td class="auto-style12">
                                        <asp:Label ID="lblEtID" runat="server" Text="Event Type ID"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlEventTypeID" ErrorMessage="*" ForeColor="Red" ValidationGroup="DeleteET"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:DropDownList ID="ddlEventTypeID" runat="server" Height="30px" Width="130px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:Label ID="lblETMessage" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:Label ID="lblConfirm" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:Button ID="btnDeleteET" runat="server" BackColor="Red" ForeColor="White" Height="32px" OnClick="btnDeleteET_Click" Text="Delete Event Type" ValidationGroup="DeleteET" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnETCancel" runat="server" Height="32px" OnClick="btnETCancel_Click" Text="Cancel" Width="83px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:Button ID="btnETYes" runat="server" ForeColor="Red" Height="32px" OnClick="btnETYes_Click" Text="Yes" Visible="False" Width="104px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnETNo" runat="server" Height="32px" Text="No" Visible="False" Width="83px" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style7">
                        <asp:Panel ID="pnlDisplay" runat="server" GroupingText="All Current Events" ScrollBars="Both">
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
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                    </td>
                    <td class="auto-style11"></td>
                    <td class="auto-style9"></td>
                </tr>
                </table>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style4" colspan="2">
                            <br />
                            </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                            &nbsp;
                        &nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                    <td style="text-align: right">
                            &nbsp;</td>
                </tr>
            </table>
    </form>
</body>
</html>
