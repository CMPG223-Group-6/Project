<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristSignUp.aspx.cs" Inherits="Project.TouristSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #00CC66">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 529px;
        }
        .auto-style3 {
            height: 29px;
            width: 529px;
        }
        .auto-style4 {
            width: 529px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 426px;
        }
        .auto-style7 {
            height: 29px;
            width: 426px;
        }
        .auto-style8 {
            width: 426px;
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
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblHeading" runat="server" Font-Bold="True" style="font-size: xx-large" Text="Sign Up"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblSubheading" runat="server" style="font-size: large" Text="Enter details"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style4"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                </td>
                <td rowspan="11">
                    <asp:Panel ID="Panel1" runat="server" GroupingText="Successful Sign up" Height="280px" Visible="False">
                        <br />
                        <br />
                        <asp:Label ID="lblTouristID0" runat="server" style="font-size: large" Text="You have sucessfully signed up, you can proceed to log in."></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="lblTouristID" runat="server" style="font-size: large" Text="Tourist ID:"></asp:Label>
                        <asp:Label ID="lblTouristIDDisplay" runat="server"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server" Width="147px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name!" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="btnSignUp"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name must only contain letters." Font-Bold="True" ForeColor="#FF3300" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="btnSignUp"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblSurname" runat="server" Text="Surname:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtSurname" runat="server" Width="148px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSurname" ErrorMessage="Please enter your surname!" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="btnSignUp"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSurname" ErrorMessage="Surname must only contain letters." Font-Bold="True" ForeColor="#FF3300" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="btnSignUp"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email!" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="btnSignUp"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email adrress, please enter valid email" Font-Bold="True" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="btnSignUp"></asp:RegularExpressionValidator>
                    <br />
                    <asp:Label ID="lblOutput" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblCountry" runat="server" Text="Country of Origin:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlCountry" runat="server" Height="20px" Width="222px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Please choose your country!" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="btnSignUp"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Please enter your phone number!" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="btnSignUp"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number must only contain numbers " Font-Bold="True" ForeColor="#FF3300" ValidationExpression="^[0-9]{1,15}$" ValidationGroup="btnSignUp"></asp:RegularExpressionValidator>
                    <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="invalid number, your phone number must be 10 - 13 digits" Font-Size="Small" ForeColor="Red" ValidationExpression="^\d{10,13}$" Font-Bold="True" ValidationGroup="btnSignUp"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your password!" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="btnSignUp"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnSignUp" runat="server" BackColor="#CCCCCC" Font-Bold="True" Text="Sign Up" Width="146px" OnClick="btnSignUp_Click" ValidationGroup="btnSignUp" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblAlreadyHaveAccount" runat="server" Text="Already have an account?"></asp:Label>
&nbsp;&nbsp;
                    <asp:LinkButton ID="lbtnHaveAnAccount" runat="server" CausesValidation="false" OnClick="lbtnHaveAnAccount_Click">Login</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
