<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #00CC66">
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
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            width: 367px;
            text-align: left;
        }
        .auto-style8 {
            width: 508px;
            text-align: left;
        }
        .auto-style10 {
            width: 367px;
            text-align: center;
            height: 30px;
        }
        .auto-style12 {
            width: 367px;
            text-align: left;
            height: 26px;
        }
        .auto-style14 {
            width: 508px;
            text-align: center;
            height: 29px;
        }
        .auto-style15 {
            width: 367px;
            text-align: left;
            height: 29px;
        }
        .auto-style16 {
            text-align: center;
            height: 29px;
        }
        .auto-style17 {
            width: 508px;
            text-align: center;
            height: 30px;
        }
        .auto-style18 {
            text-align: center;
            height: 30px;
        }
        .auto-style19 {
            text-align: center;
        }
        .auto-style20 {
            width: 367px;
            text-align: center;
        }
        .auto-style21 {
            width: 508px;
            text-align: left;
            height: 24px;
        }
        .auto-style22 {
            width: 367px;
            text-align: left;
            height: 24px;
        }
        .auto-style23 {
            text-align: center;
            height: 24px;
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
                    <asp:Label ID="lblSubheading" runat="server" style="font-size: large" Text="Please choose how you want to login."></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: center">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rdoStaff" runat="server" AutoPostBack="True" Font-Bold="True" GroupName="rdoLoginOptions" OnCheckedChanged="rdoStaff_CheckedChanged" Text="Staff" />
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rdoTourist" runat="server" AutoPostBack="True" Font-Bold="True" GroupName="rdoLoginOptions" OnCheckedChanged="rdoTourist_CheckedChanged" Text="Tourist" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4"></td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblStaffHeadingLogin" runat="server" style="font-weight: 700; font-size: x-large" Text="Staff"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Label ID="lblTouristHeading" runat="server" style="font-weight: 700; font-size: x-large" Text="Tourist"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblStaffEmail" runat="server" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Label ID="lblTouristID" runat="server" Text="Tourist ID:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txtStaffEmail" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtTouristID" runat="server" Width="65px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Please enter your email!" Font-Bold="True" ValidationGroup="StaffValidation" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Please enter correct format email!" Font-Bold="True" ValidationGroup="StaffValidation" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style12"></td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTouristID" ErrorMessage="Please enter your tourist ID!" ValidationGroup="TouristValidation" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblStaffPassword" runat="server" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Label ID="lblTouristEmail" runat="server" Text="Email:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:TextBox ID="txtStaffPassword" runat="server" TextMode="Password" Width="223px"></asp:TextBox>
                </td>
                <td class="auto-style15"></td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtTouristEmail" runat="server" Width="210px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStaffPassword" ErrorMessage="Please enter your password!" Font-Bold="True" ValidationGroup="StaffValidation" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTouristEmail" ErrorMessage="Please enter your email!" Font-Bold="True" ValidationGroup="TouristValidation" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTouristEmail" ErrorMessage="Please enter correct format email!" Font-Bold="True" ValidationGroup="TouristValidation" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Button ID="btnStaffLogin" runat="server" BackColor="#CCCCCC" Font-Bold="True" ValidationGroup="StaffValidation" Height="25px" Text="Login" Width="109px" OnClick="btnStaffLogin_Click" />
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style18">
                    <asp:Label ID="lblTouristPassword" runat="server" Text="Password:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtTouristPassword" runat="server" TextMode="Password" Width="207px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style19">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTouristPassword" ValidationGroup="TouristValidation" ErrorMessage="Please enter your password!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Button ID="btnTouristLogin" runat="server" BackColor="#CCCCCC" Font-Bold="True" ValidationGroup="TouristValidation" Text="Login" Width="131px" OnClick="btnTouristLogin_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22"></td>
                <td class="auto-style23">
                    <asp:LinkButton ID="lbtnSignUp" runat="server" CausesValidation="false" OnClick="lbtnSignUp_Click">Sign Up</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:LinkButton ID="lbtnForgotPassword" runat="server" OnClick="lbtnForgotPassword_Click">Forgot Password?</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
