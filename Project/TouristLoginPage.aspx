<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristLoginPage.aspx.cs" Inherits="Project.EmployeeLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 26px;
            width: 787px;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            text-align: center;
            width: 787px;
        }
        .auto-style6 {
            text-align: left;
            width: 787px;
        }
        .auto-style7 {
            text-align: right;
            width: 787px;
            height: 26px;
        }
        .auto-style8 {
            text-align: center;
            width: 787px;
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
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: xx-large" Text="Tourist Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="Label2" runat="server" style="font-size: large" Text="Enter your details to login to your account."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style1"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="Tourist ID:"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:TextBox ID="txtTouristID" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTouristID" ErrorMessage="Please enter your tourist ID!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter correct format email!" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label5" runat="server" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPassword" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your password!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style1"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Button ID="btnLoginTourist" runat="server" BackColor="#66CCFF" BorderStyle="Solid" Font-Bold="True" Height="50px" OnClick="btnLoginTourist_Click" Text="Login" Width="243px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style1"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label6" runat="server" Text="Don't have an account?"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Button ID="BtnSignUp" runat="server" BackColor="Silver" Font-Bold="True" Height="31px" OnClick="Button1_Click" CausesValidation="false" Text="Sign up" Width="139px" />
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
