<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 508px;
            text-align: center;
        }
        .auto-style2 {
            width: 367px;
        }
        .auto-style3 {
            width: 508px;
            height: 26px;
            text-align: center;
        }
        .auto-style4 {
            width: 367px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table style="width:100%;">
            <tr>
                <td colspan="3" style="text-align: center; font-weight: 700; font-size: xx-large">
                    <asp:Label ID="lblHeading" runat="server" style="text-align: center" Text="Welcome"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" style="font-size: large" Text="Please choose how you want to login."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: center">
                    <asp:Label ID="Label2" runat="server" style="font-weight: 700; font-size: large" Text="Staff"></asp:Label>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td style="text-align: center">
                    <asp:Label ID="Label3" runat="server" style="font-size: large; font-weight: 700" Text="Tourist"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="Login as staff to access the staff dashboard."></asp:Label>
                </td>
                <td class="auto-style4"></td>
                <td class="auto-style5">
                    <asp:Label ID="Label5" runat="server" Text="Login as tourist to continue."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnLoginStaff" runat="server" BackColor="#66CCFF" BorderStyle="Solid" Font-Bold="True" Height="50px" OnClick="btnLoginStaff_Click" Text="Login" Width="132px" />
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td style="text-align: center">
                    <asp:Button ID="btnLoginTourist" runat="server" BackColor="#66CCFF" BorderStyle="Solid" Font-Bold="True" Height="50px" OnClick="btnLoginTourist_Click" Text="Login" Width="132px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
