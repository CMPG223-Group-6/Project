<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTourist.aspx.cs" Inherits="Project.AddTourist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 1368px;
        }
        .auto-style6 {
            width: 455px;
        }
        .auto-style2 {            height: 118px;
        }
        .auto-style5 {
            width: 456px;
        }
        .auto-style17 {
        }
        .auto-style18 {
            width: 216px;
        }
        .auto-style19 {
            height: 70px;
        }
        .auto-style20 {
            height: 69px;
        }
        .auto-style21 {
            height: 84px;
        }
        .auto-style22 {
            height: 79px;
        }
        .auto-style23 {
            height: 80px;
        }
        .auto-style24 {
            height: 52px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style18" rowspan="2">
                        <asp:Image ID="Image1" runat="server" Height="166px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                    </td>
                    <td class="auto-style2" colspan="2" style="border-style: double">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblAddInfo" runat="server" Text="Add Tourist Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" rowspan="2">
                            <table style="width:100%; height: 698px;">
                                <tr>
                                    <td class="auto-style19">
                                        <asp:Label ID="lblAddMessage" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style19">
                                        <asp:Label ID="lblName" runat="server" Text="Enter Tourist name:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a name!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style20">
                                        <asp:Label ID="lblSurname" runat="server" Text="Enter Tourist surname:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ErrorMessage="Please enter a surname!" ForeColor="Red" ControlToValidate="txtSurname"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style21">
                                        <asp:Label ID="lblPhoneNo" runat="server" Text="Enter Tourist phone number:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ControlToValidate="txtPhoneNo" ErrorMessage="Please enter a phone number!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style22">
                                        <asp:Label ID="lblEmail" runat="server" Text="Enter Tourist email:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style23">
                                        <br />
                                        <asp:Label ID="lblCountry" runat="server" Text="Country of Origin:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlCountries" runat="server" Height="16px" Width="161px" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style23">
                                        <br />
                                        <asp:Button ID="BtnAdd" runat="server" Height="28px" Text="Add" Width="147px" BackColor="Green" Font-Bold="True" ForeColor="White" OnClick="BtnAdd_Click" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnContinue" runat="server" Height="27px" Text="Continue" Width="128px" BackColor="White" Font-Bold="True" ForeColor="Black" BorderStyle="Solid" OnClick="btnContinue_Click" OnClientClick="return confirm('Are you sure you want to return the maintain tourist dashboard?');" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                </tr>
                                <tr>
                                    <td class="auto-style24">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        &nbsp;</td>
                                </tr>
                            </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18" style="background-color: #FFFFFF">
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Back" Value="Back" NavigateUrl="~/MaintainTourists.aspx">
                                </asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style5">
                        <asp:GridView ID="gvTourist" runat="server" Height="379px" Width="603px" OnSelectedIndexChanged="gvTourist_SelectedIndexChanged">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        </div>
    </form>
</body>
</html>
