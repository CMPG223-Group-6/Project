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
        .auto-style14 {
            width: 397px;
        }
        .auto-style16 {
            text-align: left;
        }
        .auto-style17 {
            text-align: left;
            height: 342px;
        }
        .auto-style19 {
            width: 397px;
        }
        .auto-style20 {
            height: 28px;
        }
        .auto-style21 {
            height: 26px;
        }
        .auto-style18 {
            height: 63px;
            width: 397px;
        }
        .auto-style15 {
            height: 65px;
            width: 397px;
        }
        .auto-style13 {
            height: 61px;
            width: 397px;
        }
        .auto-style22 {
            height: 27px;
        }
        .auto-style23 {
            width: 482px;
        }
        .auto-style24 {
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1" style="border-style: outset">
                        <asp:Image ID="imgLogo" runat="server" Height="191px" ImageUrl="~/Images/zims_zoo_logo.png" Width="339px" />
                    </td>
                    <td class="auto-style2" colspan="2" style="border-style: outset; background-color: #FFFFFF">
                            <asp:Label ID="lblAddEvent0" runat="server" Text="Add New Event " BackColor="White" Font-Bold="True" Font-Size="20pt" ForeColor="Black"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style1" rowspan="2" style="background-color: #003300; border-style: outset">
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
                    <td class="auto-style23">
                            <asp:Panel ID="pnlAddEvent" runat="server" GroupingText="Add Event">
                                <table style="width:100%;">
                                    <tr>
                                        <td class="auto-style21">
                                            <asp:Label ID="lblEventTypeID" runat="server" Text="Event Type ID"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="ddlEventTypeID" ErrorMessage="*" ForeColor="Red" InitialValue="0" ValidationGroup="AddEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlEventTypeID" runat="server" AutoPostBack="True" Height="26px" OnSelectedIndexChanged="ddlEventTypeID_SelectedIndexChanged" Width="163px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventName0" runat="server" Text="Event Name"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEventNameDisplay" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtEventNameDisplay" runat="server" Height="27px" ReadOnly="True" Width="197px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCapacity" runat="server" Text="Capacity"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvCapacity" runat="server" ControlToValidate="txtCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style24">
                                            <asp:TextBox ID="txtCapacity" runat="server" AutoPostBack="True" CausesValidation="True" Height="27px" OnTextChanged="txtCapacity_TextChanged" TextMode="Number" Width="127px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddEvent"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtPrice" runat="server" Height="27px" TextMode="Number" Width="125px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlSetStatus" runat="server" Height="35px" Width="193px">
                                                <asp:ListItem Value="0">Active</asp:ListItem>
                                                <asp:ListItem Value="1">Inactive</asp:ListItem>
                                                <asp:ListItem Value="2">Full</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style22"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSubmit" runat="server" BackColor="#33CC33" ForeColor="White" Height="32px" OnClick="btnSubmit_Click" Text="Create Event " ValidationGroup="AddEvent" Width="171px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Height="32px" OnClick="btnCancel_Click" Text="Cancel" Width="120px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMessage" runat="server" Font-Size="15pt"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            </td>
                    <td class="auto-style4">
                            <br />
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Panel ID="pnlEventType" runat="server" GroupingText="Add Event Type" Height="347px" style="margin-left: 64px" Width="396px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventName" runat="server" Text="Event Name"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEventName" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddET"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtEventName" runat="server" Height="27px" Width="197px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventDescr" runat="server" Text="Event Description"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEventDesc" ErrorMessage="*" ForeColor="Red" ValidationGroup="AddET"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtEventDesc" runat="server" TextMode="MultiLine" Width="197px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style20">
                                            <asp:Button ID="btnEventTypeAdd" runat="server" BackColor="#33CC33" ForeColor="White" Text="Create Event Type" Width="146px" OnClick="btnEventTypeAdd_Click" ValidationGroup="AddET" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnCancelEventType" runat="server" Text="Cancel" Width="136px" CausesValidation="False" OnClick="btnCancelEventType_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEventMessage" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style17" colspan="2">
                        <br />
                            <asp:Panel ID="Panel2" runat="server" GroupingText="Event Types" ScrollBars="Both" Width="1166px">
                                <asp:GridView ID="gvEventTypes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="192px" Width="1132px" OnSelectedIndexChanged="gvEventTypes_SelectedIndexChanged">
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
                        <div class="auto-style16">
                            <br />
                            &nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        </div>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td style="text-align: right" class="auto-style23">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style23">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style23">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style14">
                            <br />
                            <br />
                            </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                            <br />
                            </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                            <br />
                            </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                            <br />
                            </td>
                </tr>
                <tr>
                    <td style="text-align: left" class="auto-style13">
                            &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style19">&nbsp;&nbsp;
                        </td>
                </tr>
            </table>
    </form>
</body>
</html>
