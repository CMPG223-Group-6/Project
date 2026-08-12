<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEventType.aspx.cs" Inherits="Project.AddEventType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 335px;
        }
        .auto-style2 {
            height: 181px;
        }
        .auto-style4 {
            height: 50px;
        }
        .auto-style6 {
            height: 60px;
        }
        .auto-style7 {
            height: 75px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1" rowspan="11">
                        <asp:Image ID="imgLogo" runat="server" Height="182px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Back" Value="Back" NavigateUrl="~/MaintainEventsTypes.aspx">
                                </asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style2" colspan="2" style="border-style: hidden; background-color: #003300">
                            <asp:Label ID="lblAddEvent0" runat="server" Text="Add New Event Type" BackColor="#003300" Font-Bold="True" Font-Size="20pt" ForeColor="White"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                            <asp:Label ID="lblEventName" runat="server" Text="Event Name"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEventType" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtEventType" runat="server" BackColor="White" Height="27px" OnTextChanged="txtEventType_TextChanged" Width="427px"></asp:TextBox>
                            </td>
                    <td class="auto-style4">
                            <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent" ControlToValidate="ddlCategory" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddlCategory" runat="server" Height="30px" Width="292px" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Category</asp:ListItem>
                                <asp:ListItem Value="1">Wildlife tour</asp:ListItem>
                                <asp:ListItem Value="2">Aquatic</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                            <asp:Label ID="lblCapacity" runat="server" Text="Capacity"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtCapacity" runat="server" Height="27px" TextMode="Number" Width="127px"></asp:TextBox>
                            </td>
                    <td class="auto-style7">
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                            <br />
                            <asp:DropDownList ID="ddlSetStatus" runat="server" Width="290px" Height="30px">
                                <asp:ListItem Value="1">Active</asp:ListItem>
                                <asp:ListItem Value="2">Inactive</asp:ListItem>
                                <asp:ListItem Value="3">Full</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                            <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtPrice" runat="server" Height="27px" Width="125px"></asp:TextBox>
                            </td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="31px" Width="83px" OnClick="btnCancel_Click" />
                            </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" Text="Create Event Type" BackColor="#33CC33" ForeColor="White" Height="32px" ValidationGroup="CreateEvent" Width="171px" OnClick="btnSubmit_Click" />
                            </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <br />
                            <br />
                            &nbsp;&nbsp;
                            </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td style="text-align: right">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
