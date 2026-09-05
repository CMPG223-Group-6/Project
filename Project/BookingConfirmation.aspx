<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="Project.BookingConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style4 {
            width: 195px;
            height: 71px;
        }
        .auto-style5 {
            height: 71px;
        text-align: left;
    }
        .auto-style2 {
            width: 195px;
            height: 157px;
        }
        .auto-style3 {
            height: 157px;
        }
        .auto-style6 {
            width: 195px;
            height: 91px;
        }
        .auto-style7 {
            height: 91px;
        }
        .auto-style1 {
            width: 195px;
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
        }
        .auto-style9 {
            width: 336px;
        }
        .auto-style10 {
            width: 336px;
            text-align: right;
        }
        .auto-style11 {
            width: 382px;
        }
        .auto-style12 {
            width: 336px;
            text-align: right;
            height: 58px;
        }
        .auto-style13 {
            width: 382px;
            height: 58px;
        }
        .auto-style14 {
            height: 58px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; height: 507px;">
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
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="Large" Text="Your Booking Confirmation"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblNameDisplay0" runat="server" Font-Size="Small" ForeColor="#999999"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <br />
                        <br />
                    </td>
                    <td class="auto-style3">
                        <asp:Panel ID="Panel2" runat="server" Height="417px" style="margin-left: 0px">
                            <table style="width: 100%; height: 363px;">
                                <tr>
                                    <td class="auto-style9">&nbsp;&nbsp;&nbsp; &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                    </td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">
                                        <asp:Label ID="lblEventName0" runat="server">EventName: </asp:Label>
                                    </td>
                                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblEventNameDisplay" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                        <asp:Label ID="lblDate0" runat="server">Date Of Arrival:</asp:Label>
                                    </td>
                                    <td class="auto-style13">
                                        <br />
                                        &nbsp;&nbsp;
                                        <asp:Label ID="lblDateDisplay" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style14"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">
                                        <br />
                                        <asp:Label ID="lblEventPrice" runat="server">Price Per Ticket:</asp:Label>
                                    </td>
                                    <td class="auto-style11">
                                        <br />
                                        &nbsp;&nbsp;
                                        <asp:Label ID="lblEventP" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">
                                        <br />
                                        <asp:Label ID="lblNumTickets" runat="server">Number of Tickets:</asp:Label>
                                    </td>
                                    <td class="auto-style11">
                                        <br />
                                        &nbsp;&nbsp;
                                        <asp:Label ID="lblNumTicketsDisplay" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">
                                        <br />
                                        <asp:Label ID="lblAmountToPay" runat="server">Amount To Pay:</asp:Label>
                                        <br />
                                    </td>
                                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;
                                        <br />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblAmountDisplay" runat="server"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                        &nbsp;<br /> &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnLater" runat="server" OnClick="btnDone2_Click" Text="Later" Width="183px" />
                                    </td>
                                    <td>
                                        <br />
                                        <br />
                                        &nbsp;
                                        <asp:Button ID="btnPayNow" runat="server" BackColor="#339933" ForeColor="White" OnClick="btnPayNow_Click" Text="Pay Now" Width="165px" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            &nbsp;&nbsp;
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </asp:Panel>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style6" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style7"></td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem Text="Back" NavigateUrl="~/MyOverview.aspx" Value="Back"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BorderColor="#669999" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style8"></td>
                    <td class="auto-style8"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
