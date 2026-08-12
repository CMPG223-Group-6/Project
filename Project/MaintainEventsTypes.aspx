<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainEventsTypes.aspx.cs" Inherits="Project.MaintainEventsTypes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1368px;
        }
        .auto-style6 {
            width: 170px;
        }
        .auto-style2 {
        }
        .auto-style5 {
            width: 456px;
            text-align: center;
        }
        .auto-style7 {
            width: 216px;
        }
        .auto-style8 {
            height: 42px;
        }
        .auto-style9 {
            height: 83px;
        }
        .auto-style10 {
            width: 456px;
            text-align: center;
            height: 83px;
        }
        .auto-style11 {
            height: 49px;
        }
        .auto-style12 {
            width: 456px;
            text-align: center;
            height: 49px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
         <link rel="stylesheet" type ="text/css" href="MyCSS.css" />
        
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="12">
                        <asp:Image ID="imgLogo" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
                        <asp:Menu ID="Menu1" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Maintain" Value="Maintain">
                                    <asp:MenuItem NavigateUrl="~/MaintainTourists.aspx" Text="Maintain Tourists" Value="Maintain Tourists"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/MaintainEventsTypes.aspx" Text="Maintain Event Types" Value="Maintain Event Types"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/MaintainBookings.aspx" Text="Maintain Bookings" Value="Maintain Bookings"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/ProcessPayments.aspx" Text="Process Payments" Value="Process Payments"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/CheckInTourist.aspx" Text="Check-In" Value="Check-In"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Reports.aspx" Text="Reports" Value="Reports"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Log Out" Value="Log Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339933" />
                            <StaticMenuStyle Height="40px" HorizontalPadding="10px" VerticalPadding="40px" />
                            <StaticSelectedStyle BackColor="#66FF33" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style2" colspan="3">
                        
                        <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Font-Size="X-Large">Maintain Event Types</asp:Label>
                        
                        <br />
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        
                        <asp:Label ID="lblSearchEvent" runat="server" Text="Search event types"></asp:Label>
                        <br />
                        
                        <asp:TextBox ID="txtSearchEvent" runat="server" ForeColor="#CCCCCC" Height="28px" Width="548px"></asp:TextBox>
                        
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </td>
                    <td class="auto-style10">
                        &nbsp;<asp:DropDownList ID="ddlStatus" runat="server" Height="35px" Width="207px">
                            <asp:ListItem>Select Status</asp:ListItem>
                            <asp:ListItem Value="1">Active</asp:ListItem>
                            <asp:ListItem Value="2">Inactive</asp:ListItem>
                            <asp:ListItem Value="3">Full</asp:ListItem>
                        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="2">
                        
                        <asp:Button ID="btnSearch" runat="server" BackColor="#66FF99" Height="30px" Text="Search" Width="119px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReload" runat="server" BackColor="#66FF99" Height="30px" Text="Reload Table" Width="119px" />
                        
                    </td>
                    <td class="auto-style12">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">
                        
                        <asp:Button ID="btnAddEvent" runat="server" Text="+ Add Event Type" BackColor="#33CC33" ForeColor="White" Height="29px" Width="153px" OnClick="btnAddEvent_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnChangeEvent" runat="server" Text="Change Event Type Details" BackColor="#FF6600" ForeColor="White" Height="29px" Width="216px" OnClick="btnChangeEvent_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnDeleteEvent" runat="server" Text="Delete Event Type" BackColor="Red" ForeColor="White" Height="29px" Width="153px" OnClick="btnDeleteEvent_Click" />
        
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        
                        <asp:Label ID="lblEventsHeading" runat="server" Font-Bold="True" Font-Size="X-Large">Current Event Types</asp:Label>
                        
                    </td>
                    <td class="auto-style7">
                        
                        &nbsp;</td>
                    <td class="auto-style5">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        
                        <asp:GridView ID="gvEventTypes" runat="server" Height="292px" Width="1011px">
                        </asp:GridView>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
