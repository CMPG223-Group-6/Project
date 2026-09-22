<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" Inherits="Project.AddBooking" %>

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
        .auto-style16 {
            height: 26px;
        }
        .auto-style15 {
            width: 450px;
            height: 564px;
        }
        .auto-style5 {
            width: 450px;
            height: 23px;
        }
        .auto-style17 {
            height: 104px;
        }
        .auto-style18 {
            height: 91px;
        }
        .auto-style19 {
            width: 170px;
            height: 188px;
        }
        .auto-style20 {
            height: 65px;
        }
        .auto-style21 {
            height: 52px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style19">
                        <asp:Image ID="Image1" runat="server" Height="184px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                    </td>
                    <td class="auto-style18" colspan="2" style="border-style: outset" rowspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblAddBooking" runat="server" Text="Add Booking Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" rowspan="3" style="background-color: #003300">
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
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">
                        <asp:Panel ID="Panel1" runat="server" Height="708px">
                            <table style="width:100%; height: 389px;">
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblTouristID" runat="server" Text="Enter Tourist ID:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtTouristID" runat="server" TextMode="Number" Width="145px" AutoPostBack="True" OnTextChanged="txtTouristID_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTouristID" runat="server" ControlToValidate="txtTouristID" ErrorMessage="Please enter your Tourist ID!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlEventID" runat="server" Height="25px" Width="138px">
                                            <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEventID" runat="server" ControlToValidate="ddlEventID" ErrorMessage="Please select an Event!" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblNoOfTickets" runat="server" Text="No Of Tickets:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtNoOfTickets" runat="server" AutoPostBack="True" OnTextChanged="txtNoOfTickets_TextChanged" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ControlToValidate="txtNoOfTickets" ErrorMessage="Please select a number of tickets!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblDate" runat="server" Text="Check In Date:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtArriveDate" runat="server" Height="16px" TextMode="Date" OnTextChanged="txtArriveDate_TextChanged"></asp:TextBox>
                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtArriveDate" ErrorMessage="Please select a Check-In Date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPaymentMethod" ErrorMessage="Select Payement Method" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" Height="26px" Width="221px">
                                            <asp:ListItem Value="0">Select a Payment Method</asp:ListItem>
                                            <asp:ListItem Value="1">Cash</asp:ListItem>
                                            <asp:ListItem Value="2">Debit Card</asp:ListItem>
                                            <asp:ListItem Value="3">Credit Card</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style20">
                                        <asp:CheckBox ID="cbxPayment" runat="server" OnCheckedChanged="cbxPayment_CheckedChanged" Text="Made Payment" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style21">
                                        <br />
                                        <br />
                                        <asp:Label ID="lblAmount" runat="server" Text="Amount   R:" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="lblAmountOutput" runat="server" Font-Bold="True"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblOutput" runat="server" ForeColor="Green"></asp:Label>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        &nbsp;
                                        <asp:Button ID="BtnAddBooking" runat="server" BackColor="Green" Font-Bold="True" ForeColor="White" Height="36px" OnClick="BtnAddBooking_Click" Text="Add" Width="149px" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" BackColor="White" Font-Bold="True" ForeColor="Black" Height="33px" OnClick="btnCancel_Click" Text="Cancel" Width="130px" />
                                        </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="auto-style15">
                        <asp:Panel ID="pnlTourist" runat="server" GroupingText="Tourists" Height="305px" ScrollBars="Both" Width="602px">
                            <asp:GridView ID="gvTourists" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="271px" Width="572px">
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
                        <br />
                        <asp:Panel ID="pnlEvents" runat="server" GroupingText="Events" Height="261px" ScrollBars="Both" Width="607px">
                            <asp:GridView ID="gvEvents" runat="server" Height="303px" Width="603px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    <td class="auto-style5" rowspan="2">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                </tr>
            </table>
        </div>
        </div>
    </form>
   
    