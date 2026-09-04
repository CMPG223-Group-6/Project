<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteBooking.aspx.cs" Inherits="Project.DeleteBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



        .auto-style18 {
            width: 1368px;
            height: 892px;
        }
        .auto-style19 {
            width: 331px;
            height: 158px;
        }
        .auto-style25 {
            height: 158px;
        }
        .auto-style26 {
            width: 331px;
            height: 365px;
        }
        .auto-style29 {
            height: 365px;
            width: 515px;
        }
        .auto-style30 {
            height: 365px;
            width: 516px;
        }
        .auto-style31 {
            height: 40px;
            width: 515px;
        }
        .auto-style32 {
            height: 40px;
            width: 516px;
        }
        .auto-style33 {
            height: 42px;
            width: 515px;
        }
        .auto-style34 {
            height: 42px;
            width: 516px;
        }
        .auto-style35 {
            height: 43px;
            width: 515px;
        }
        .auto-style36 {
            height: 43px;
            width: 516px;
        }
        .auto-style37 {
            height: 39px;
        }
        .auto-style39 {
            height: 18px;
            width: 515px;
        }
        .auto-style40 {
            height: 18px;
            width: 516px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <table class="auto-style18">
                <tr>
                    <td class="auto-style19">
                        <asp:Image ID="Image1" runat="server" Height="166px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        </td>
                    <td class="auto-style25" colspan="2" style="border-style: outset">
                        <asp:Label ID="lblDeleteInfo" runat="server" Text="Delete Booking Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style26" rowspan="8" style="background-color: #003300; border-style: outset">
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Back" Value="Back" NavigateUrl="~/MaintainBookings.aspx">
                                </asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style39">
                                        <asp:Label ID="lblTouristID" runat="server" Text="Tourist ID"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtTouristID" runat="server" Height="30px" TextMode="Number"></asp:TextBox>
                                        <br />
                                        <br />
                    </td>
                    <td class="auto-style40">
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style39">
                                        <asp:Button ID="btnLoad" runat="server" Height="33px" OnClick="btnLoad_Click" Text="Load" Width="162px" />
                                        <br />
                                        <br />
                    </td>
                    <td class="auto-style40">
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style39">
                                        <asp:Label ID="lblBookingID" runat="server" Text="Enter Booking ID:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlBookingID" runat="server" Height="35px" Width="128px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBookingID" ErrorMessage="Enter Booking ID" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                    </td>
                    <td class="auto-style40">
                                        <asp:Label ID="lblDeleteMessage" runat="server"></asp:Label>
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style39">
                                        <asp:Button ID="BtnDelete" runat="server" Height="28px" Text="Delete" Width="145px" BackColor="Red" Font-Bold="True" ForeColor="White" OnClientClick="return confirm('Are you sure you want to delete this booking?');" OnClick="BtnDelete_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Height="27px" Text="Cancel" Width="128px" BackColor="#999999" Font-Bold="True" ForeColor="White" OnClick="btnCancel_Click" />
                                        <br />
                                        <br />
                                        </td>
                    <td class="auto-style40">
                        <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" Visible="False" Width="93px" />
&nbsp;&nbsp;
                        <asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Visible="False" Width="89px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style37" colspan="2">
                        <asp:Panel ID="pnlBookings" runat="server" GroupingText="Bookings" Height="400px" ScrollBars="Both">
                            <asp:GridView ID="gvBookings" runat="server" Height="336px" Width="1022px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    <td class="auto-style35"></td>
                    <td class="auto-style36"></td>
                </tr>
                <tr>
                    <td class="auto-style33"></td>
                    <td class="auto-style34"></td>
                </tr>
                <tr>
                    <td class="auto-style31"></td>
                    <td class="auto-style32"></td>
                </tr>
                <tr>
                    <td class="auto-style26">&nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                </tr>
            </table>
        </div>
        <div>
        <div>
        </div>
        </div>
    </form>
    