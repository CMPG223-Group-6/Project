<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CardDetails.aspx.cs" Inherits="Project.CardDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #00CC66">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style3 {
            width: 463px;
        }
        .auto-style5 {
            height: 26px;
            width: 463px;
        }
        .auto-style6 {
            width: 463px;
            height: 27px;
        }
        .auto-style7 {
            height: 27px;
        }
        .auto-style8 {
            width: 284px;
        }
        .auto-style9 {
            height: 27px;
            width: 284px;
        }
        .auto-style11 {
            height: 26px;
            width: 284px;
        }
        .auto-style12 {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblHeading" runat="server" style="font-size: xx-large; font-weight: 700" Text="Card Details"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblSubheading" runat="server" style="font-size: large" Text="Payment Information"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblAmountPay" runat="server" Font-Bold="True" Text="Amount to pay:"></asp:Label>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAmountPay" runat="server" ReadOnly="True" Width="92px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblCardholderName" runat="server" Font-Bold="True" Text="Cardholder name:"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCardholderName" runat="server" Width="137px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCardholderName" ErrorMessage="Please enter name!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblCardholderSurname" runat="server" Font-Bold="True" Text="Cardholder surname:"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCardholderSurname" runat="server" Width="134px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCardholderSurname" ErrorMessage="Please enter surname!" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style12" rowspan="3">
                    <asp:Panel ID="Panel1" runat="server" Height="74px">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblCardNumber" runat="server" Font-Bold="True" Text="Card number:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblExpiryDate" runat="server" Font-Bold="True" Text="Expiry date:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblCVV" runat="server" Font-Bold="True" Text="CVV:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtCardNumber" runat="server" Placeholder="XXXX XXXX XXXX XXXX" Width="220px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="*" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtExpiryDate" runat="server" Placeholder="MM/YY" Width="63px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtExpiryDate" ErrorMessage="*" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCVV" runat="server" OnTextChanged="txtCVV_TextChanged" Placeholder="XXX" Width="59px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCVV" ErrorMessage="*" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    </td>
                <td class="auto-style3">
                    </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="btnPay" runat="server" BackColor="#CCCCCC" Font-Bold="True" OnClick="btnPay_Click" Text="Pay" Width="99px" />
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
