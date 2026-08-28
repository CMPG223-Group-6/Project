<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteBooking.aspx.cs" Inherits="Project.DeleteBooking" %>

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
        .auto-style15 {
            width: 450px;
            height: 706px;
        }
        .auto-style5 {
            width: 450px;
        }
        .auto-style16 {
            height: 111px;
        }
        .auto-style18 {
            width: 1368px;
            height: 892px;
        }
        .auto-style19 {
            width: 331px;
            height: 158px;
        }
        .auto-style20 {
            height: 158px;
            width: 516px;
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
                    <td class="auto-style25" colspan="2" style="border-style: double">
                        <asp:Label ID="lblDeleteInfo" runat="server" Text="Delete Booking Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style26" rowspan="6">
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
                    <td class="auto-style39">
                                        <asp:Label ID="lblTouristID" runat="server" Text="Enter Tourist ID:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtDeleteTouristID" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDeleteTouristID" ErrorMessage="Enter Tourist ID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style40">
                                        <asp:Label ID="lblDeleteMessage" runat="server"></asp:Label>
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style39">
                                        <asp:Button ID="BtnDelete" runat="server" Height="28px" Text="Delete" Width="145px" BackColor="Red" Font-Bold="True" ForeColor="White" OnClientClick="return confirm('Are you sure you want to delete this booking?');" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnContinue" runat="server" Height="27px" Text="Close" Width="128px" BackColor="#999999" Font-Bold="True" ForeColor="White" OnClick="btnContinue_Click" />
                                        </td>
                    <td class="auto-style40">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style37" colspan="2">
                        <asp:GridView ID="GridView1" runat="server" Height="379px" Width="1022px">
                        </asp:GridView>
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
    