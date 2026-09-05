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
        .auto-style4 {            height: 438px;
        }
        .auto-style5 {
            width: 318px;
            height: 438px;
        }
        .auto-style6 {
        }
        .auto-style7 {
            width: 318px;
            height: 17px;
        }
        .auto-style8 {
            height: 29px;
        }
        .auto-style9 {
            height: 37px;
        }
        .auto-style10 {
            height: 17px;
        }
        .auto-style11 {
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">
                        <asp:Image ID="imgLogo" runat="server" Height="182px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                    </td>
                    <td class="auto-style2" colspan="2" style="border-style: outset; background-color: #FFFFFF">
                            <asp:Label ID="lblChangeEvent" runat="server" Text="Change Event Details" BackColor="White" Font-Bold="True" Font-Size="20pt" ForeColor="Black"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style1" rowspan="3" style="background-color: #003300">
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
                    <td class="auto-style5">
                            <asp:Panel ID="pnlChangeEvent" runat="server" GroupingText="Change Event Details">
                                <table style="width:121%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventID" runat="server" Text="Event ID"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlEventID" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlEventID" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="ddlEventID_SelectedIndexChanged" Width="130px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUpdEventTyepeID" runat="server" Text="Event Type ID"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlUpdEventTypeID" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlUpdEventTypeID" runat="server" Height="30px" Width="100px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCapacity" runat="server" Text="Capacity"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtCapacity" runat="server" Height="27px" TextMode="Number" Width="126px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlSetStatus" runat="server" Height="30px" Width="290px">
                                                <asp:ListItem Value="1">Active</asp:ListItem>
                                                <asp:ListItem Value="2">Inactive</asp:ListItem>
                                                <asp:ListItem Value="3">Full</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtPrice" runat="server" Height="27px" Width="121px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAvailable" runat="server" Text="Spaces Available"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAvailable" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtAvailable" runat="server" Height="27px" Width="114px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMessage0" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSubmit" runat="server" BackColor="#FF9900" ForeColor="White" Height="32px" OnClick="btnSubmit_Click" Text="Update Event" ValidationGroup="UpdateEvent" Width="171px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Height="32px" OnClick="btnCancel_Click" Text="Cancel" Width="83px" CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            </td>
                    <td class="auto-style4">
                            <asp:Panel ID="pnlUpdEventType" runat="server" GroupingText="Change Event Type Details" style="margin-left: 151px" Width="386px">
                                <table style="width:75%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEvenntTypeID" runat="server" Text="Event Type ID"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlEventTypeID" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateET"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlEventTypeID" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="ddlEventTypeID_SelectedIndexChanged" Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventName" runat="server" Text="Event Name"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEventType" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateET"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9">
                                            <asp:TextBox ID="txtEventType" runat="server" BackColor="White" Height="27px" OnTextChanged="txtEventType_TextChanged" Width="346px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDesc" runat="server" Text="Event Description:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdateET"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="352px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnUpdate" runat="server" BackColor="#FF9900" Height="32px" OnClick="btnUpdate_Click" Text="Update Event Type" ValidationGroup="UpdateET" Width="166px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnEventTypeCancel" runat="server" CausesValidation="False" Height="32px" OnClick="btnEventTypeCancel_Click" Text="Cancel" Width="78px" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style10"></td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <br />
                            <br />
                            &nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <asp:Panel ID="Panel1" runat="server" GroupingText="Events" Height="279px" ScrollBars="Both">
                                <asp:GridView ID="gvEvents" runat="server" Height="176px" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged" Width="1099px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                        </asp:Panel>
                            </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
