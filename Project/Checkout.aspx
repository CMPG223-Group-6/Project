<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Project.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            height: 309px;
            width: 259px;
        }
        .auto-style5 {
            height: 309px;
            width: 934px;
        }
        .auto-style6 {
        }
        .auto-style7 {
            height: 309px;
            width: 743px;
            }
        .auto-style9 {
            height: 53px;
            width: 259px;
        }
        .auto-style10 {
            height: 53px;
        }
        .auto-style13 {
            width: 259px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="height: 640px; width: 1541px">
                <tr>
                    <td class="auto-style9" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                        <br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                        <br />
                        <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style10" colspan="2" style="border-style: double">
                        <asp:Label ID="lblInfo" runat="server" style="font-weight: 700; font-size: x-large" Text="Check-out"></asp:Label>
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
                                            <asp:MenuItem NavigateUrl="~/Checkout.aspx" Text="Check out" Value="5"></asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#669999" />
                                    </asp:Menu>
                                </td>
                    <td class="auto-style7">
                        <asp:Label ID="lblVerifyExit" runat="server" style="text-align: left; font-size: large" Text="Enter Booking ID"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBookingIDDetails" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:DropDownList ID="ddlBookingIDDetails" runat="server" Height="31px" Width="242px" OnSelectedIndexChanged="ddlBookingIDDetails_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="btnConfirmExit" runat="server" Height="47px" Text="Confirm Exit" Width="276px" BackColor="#33CC33" OnClick="btnConfirmExit_Click" />
                        <br />
                        <br />
                        <asp:Label ID="lblConfirmMessage" runat="server"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblOptional" runat="server" Text="Optional"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblRating" runat="server" Text="Rate us:"></asp:Label>
                        <br />
                        <br />
                        <asp:RadioButton ID="rbStar1" runat="server" GroupName="Rating" Text="★" />
                        &nbsp;
                        <asp:RadioButton ID="rbStar2" runat="server" GroupName="Rating" Text="★★" />
                        &nbsp;
                        <asp:RadioButton ID="rbStar3" runat="server" GroupName="Rating" Text="★★★" />
                        &nbsp;
                        <asp:RadioButton ID="rbStar4" runat="server" GroupName="Rating" Text="★★★★" />
                        &nbsp;
                        <asp:RadioButton ID="rbStar5" runat="server" GroupName="Rating" Text="★★★★★" />
                        <br />
                        <br />
                        &nbsp;<asp:Button ID="btnSubmitRating" runat="server" BackColor="#33CC33" Height="45px" OnClick="btnSubmitRating_Click" Text="Submit rating" Width="211px" />
                        <br />
                        <br />
                        <asp:Label ID="lblResults" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13" style="border-style: inset; border-color: #006600; background-color: #006600">
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
                    <td class="auto-style6" rowspan="2" colspan="2">
                        <asp:Panel ID="Panel1" runat="server" GroupingText="Your information" Height="136px" style="margin-top: 0px" Width="1140px">
                            <asp:GridView ID="gvTouristActivitySummary" runat="server" Height="229px" Width="1323px">
                            </asp:GridView>
                            <br />
                        </asp:Panel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="border-style: inset; border-color: #006600; background-color: #006600" class="auto-style13">
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
