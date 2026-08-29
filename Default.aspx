<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #00CC66">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 412px;
            text-align: center;
        }
        .auto-style2 {
            width: 436px;
        }
        .auto-style3 {
            width: 412px;
            height: 26px;
            text-align: center;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            width: 436px;
            text-align: left;
        }
        .auto-style8 {
            width: 412px;
            text-align: left;
        }
        .auto-style14 {
            width: 412px;
            text-align: center;
            height: 29px;
        }
        .auto-style17 {
            width: 412px;
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
        .auto-style21 {
            width: 412px;
            text-align: left;
            height: 24px;
        }
        .auto-style23 {
            text-align: center;
            height: 24px;
        }
        .auto-style24 {
            width: 412px;
            text-align: left;
            height: 32px;
        }
        .auto-style25 {
            text-align: center;
            height: 32px;
        }
        .auto-style26 {
            height: 33px;
        }
        .auto-style27 {
            width: 412px;
            text-align: left;
            height: 41px;
        }
        .auto-style28 {
            text-align: center;
            height: 41px;
        }
        .auto-style29 {
            width: 412px;
            text-align: center;
            height: 40px;
        }
        .auto-style30 {
            text-align: center;
            height: 40px;
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
                    <asp:Label ID="lblHeading" runat="server" style="text-align: center" Text="Zoo Information Management System"></asp:Label>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="lblSubheading" runat="server" style="font-size: large" Text="Welcome to ZooInfo System, Proceed to Login or Sign up"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style7">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style7" rowspan="13">
                    <asp:Panel ID="pnlLogin" runat="server" GroupingText="Login" Height="542px">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <br />
                                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email" Font-Size="Small" ForeColor="Red" ValidationGroup="btnLoginValid"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email adrress, please enter valid email" Font-Size="Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="btnLoginValid"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style26">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" OnTextChanged="txtPassword_TextChanged" TextMode="Password"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" Font-Size="Small" ForeColor="Red" ValidationGroup="btnLoginValid"></asp:RequiredFieldValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Button ID="btnLoginValid" runat="server" OnClick="btnLoginValid_Click" Text="Login" Width="175px" ValidationGroup="btnLoginValid" style="text-align: left" />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblInvalid" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style26">
                                    <br />
                                    <asp:Label ID="lblAccount" runat="server" ForeColor="#666666" Text="Don't have an account?"></asp:Label>
                                    &nbsp;<asp:LinkButton ID="lbtnSignUp" runat="server" CausesValidation="false" OnClick="lbtnSignUp_Click">Sign Up</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:LinkButton ID="lbtnForgotPassword" runat="server" OnClick="lbtnForgotPassword_Click">Forgot Password?</asp:LinkButton>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style19">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style27"></td>
                <td class="auto-style28">
                    </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29"></td>
                <td class="auto-style30">
                    </td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style23">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24"></td>
                <td class="auto-style25">
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
