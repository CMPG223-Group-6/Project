<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristSignUpPage.aspx.cs" Inherits="Project.EmployeeSignUpPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            text-align: left;
            width: 773px;
        }
        .auto-style5 {
            text-align: center;
            width: 773px;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style7 {
            text-align: right;
            width: 773px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1" colspan="3">
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: xx-large" Text="Create an Account"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3" style="text-align: center">
                    <asp:Label ID="Label2" runat="server" Text="Fill in your details to create a new account."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Name:"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txtName" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" Text="Surname:"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txtSurname" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSurname" ErrorMessage="Please enter your surname!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please enter your phone number!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="Email:"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txtEmail" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter correct format email!" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label7" runat="server" Text="Country:"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txtCountry" runat="server" BorderStyle="Solid" Height="36px" Width="835px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCountry" ErrorMessage="Please enter your country!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="3">
                    <asp:Button ID="btnSignUpTourist" runat="server" BackColor="#66CCFF" BorderStyle="Solid" Font-Bold="True" Height="50px" OnClick="btnLoginStaff_Click" Text="Sign Up" Width="243px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label8" runat="server" Text="Already have an account?"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Button ID="BtnLogin" runat="server" BackColor="Silver" Font-Bold="True" Height="31px" OnClick="Button1_Click" CausesValidation="false" Text="Login" Width="139px" />
                </td>
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
