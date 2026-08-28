<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeEventType.aspx.cs" Inherits="Project.ChangeEventType" %>

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
            height: 24px;
        }
        .auto-style5 {
            height: 24px;
            width: 318px;
        }
        .auto-style6 {
        }
        .auto-style7 {
            width: 318px;
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
                    <td class="auto-style2" colspan="2" style="border-style: outset; background-color: #FFFFFF">
                            <asp:Label ID="lblChangeEvent" runat="server" Text="Change Event Details" BackColor="White" Font-Bold="True" Font-Size="20pt" ForeColor="Black"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                            <asp:Label ID="lblEventID" runat="server" Text="Event ID"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlEventID" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddlEventID" runat="server" Width="160px" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="ddlEventID_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                    <td class="auto-style4">
                            <asp:Label ID="lblEventName" runat="server" Text="Event Name"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEventType" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtEventType" runat="server" BackColor="White" Height="27px" OnTextChanged="txtEventType_TextChanged" Width="346px"></asp:TextBox>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                            <asp:Label ID="lblCapacity" runat="server" Text="Capacity"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtCapacity" runat="server" Height="27px" TextMode="Number" Width="126px"></asp:TextBox>
                            </td>
                    <td>
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
                    <td class="auto-style7">
                            <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtPrice" runat="server" Height="27px" Width="121px"></asp:TextBox>
                            </td>
                    <td>
                            <asp:Label ID="lblDesc" runat="server" Text="Event Description:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent" ControlToValidate="txtDesc"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="352px"></asp:TextBox>
                            <br />
                            </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                            <asp:Label ID="lblAvailable" runat="server" Text="Spaces Available"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAvailable" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtAvailable" runat="server" Width="114px" Height="27px"></asp:TextBox>
                            </td>
                    <td>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" style="text-align: right">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="31px" Width="83px" OnClick="btnCancel_Click" />
                            </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" Text="Update Event Type" BackColor="#FF9900" ForeColor="White" Height="32px" ValidationGroup="UpdateEvent" Width="171px" OnClick="btnSubmit_Click" />
                            </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <br />
                            <asp:GridView ID="gvEvents" runat="server" Height="176px" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged" Width="1034px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                            <br />
                            &nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        &nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
