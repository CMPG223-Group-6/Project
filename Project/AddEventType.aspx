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
        }
        .auto-style13 {
            height: 61px;
        }
        .auto-style14 {
            height: 40px;
        }
        .auto-style15 {
            height: 65px;
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
                            <asp:Label ID="lblAddEvent0" runat="server" Text="Add New Event " BackColor="#003300" Font-Bold="True" Font-Size="20pt" ForeColor="White"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                            <asp:Label ID="lblEventName" runat="server" Text="Event Type ID"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="ddlEventTypeID" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddlEventTypeID" runat="server" Height="26px" Width="163px">
                                <asp:ListItem Value="0">Select Event Type</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            </td>
                    <td class="auto-style4" rowspan="6">
                            <br />
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:GridView ID="gvEventTypes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="192px" Width="369px">
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
                            </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                            <asp:Label ID="lblCapacity" runat="server" Text="Capacity"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvCapacity" runat="server" ControlToValidate="txtCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtCapacity" runat="server" Height="27px" TextMode="Number" Width="127px" AutoPostBack="True" CausesValidation="True" OnTextChanged="txtCapacity_TextChanged"></asp:TextBox>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                            <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" ValidationGroup="CreateEvent"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtPrice" runat="server" Height="27px" Width="125px" TextMode="Number"></asp:TextBox>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                            <br />
                            <asp:DropDownList ID="ddlSetStatus" runat="server" Width="193px" Height="35px">
                                <asp:ListItem Value="0">Active</asp:ListItem>
                                <asp:ListItem Value="1">Inactive</asp:ListItem>
                                <asp:ListItem Value="2">Full</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                </tr>
                <tr>
                    <td style="text-align: left" class="auto-style13">
                            <asp:Button ID="btnSubmit" runat="server" Text="Create Event Type" BackColor="#33CC33" ForeColor="White" Height="32px" ValidationGroup="CreateEvent" Width="171px" OnClick="btnSubmit_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="32px" Width="120px" OnClick="btnCancel_Click" />
                            </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <asp:Label ID="lblMessage" runat="server" Font-Size="15pt"></asp:Label>
                    </td>
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
