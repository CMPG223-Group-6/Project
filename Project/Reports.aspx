<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Project.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style9 {
            text-align: left;
        }
        .auto-style11 {
            width: 100%;
            height: 284px;
        }
        .auto-style13 {
            height: 62px;
        }
        .auto-style15 {
            width: 100%;
            height: 185px;
        }
        .auto-style16 {
            width: 378px;
        }
        .auto-style18 {
            text-align: center;
            width: 98px;
        }
        .auto-style19 {
            width: 102px;
        }
        .auto-style20 {
            width: 258px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style8" rowspan="4">
                        <asp:Image ID="Image1" runat="server" Height="161px" ImageUrl="~/Images/zims_zoo_logo.png" Width="330px" />
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
                    <td class="auto-style12">
                        <asp:Label ID="txtReports" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="REPORTS"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Panel ID="pnlReportParameter" runat="server" BorderColor="#D6D6D6" BorderStyle="Solid" BorderWidth="1px" Height="311px">
                            <table class="auto-style11">
                                <tr>
                                    <td class="auto-style13" colspan="4">
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="REPORT PARAMETERS"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Label ID="lblReportType" runat="server" Text="Report type:"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="ddReportType" runat="server">
                                            <asp:ListItem Value="&quot;&quot;">Select Report</asp:ListItem>
                                            <asp:ListItem>Number of Bookings per Time Period</asp:ListItem>
                                            <asp:ListItem>Top 5 Event Types per Time Period</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddReportType" ErrorMessage="Please select the report you want!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Label ID="lblStartDate" runat="server" Text="Start Date:"></asp:Label>
                                    </td>
                                    <td class="auto-style20">
                                        <br />
                                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Please select the start date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style19">
                                        <asp:Label ID="lblEndDate" runat="server" Text="End Date:"></asp:Label>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Please select the end date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Label ID="lblSortBy" runat="server" Text="Sort By:"></asp:Label>
                                    </td>
                                    <td class="auto-style20">
                                        <asp:DropDownList ID="ddSortBy" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="EventType">Event Type</asp:ListItem>
                                            <asp:ListItem Value="Bookings">Number of Bookings</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style19">
                                        <asp:Label ID="lblSortOrder" runat="server" Text="Sort Order: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddSortOrder" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="DESC">Highest to Lowest</asp:ListItem>
                                            <asp:ListItem Value="ASC">Lowest to Highest</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">&nbsp;</td>
                                    <td class="auto-style20">
                                        <asp:Button ID="btnGenerateReport" runat="server" Height="38px" Text="📊 Generate Report" />
                                    </td>
                                    <td class="auto-style19">
                                        <asp:Button ID="btnClear" runat="server" Height="42px" Text="↻ Clear" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Panel ID="pnlReportResults" runat="server" BorderColor="#D6D6D6" BorderStyle="Solid" BorderWidth="1px" Height="397px">
                            <table class="auto-style15">
                                <tr>
                                    <td class="auto-style9" colspan="2">
                                        <asp:Label ID="lblReportResults" runat="server" Text="REPORT RESULTS"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblDisplay1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:GridView ID="GridView1" runat="server">
                                        </asp:GridView>
                                    </td>
                                    <td rowspan="2">
                                        <asp:Chart ID="Chart1" runat="server">
                                            <series>
                                                <asp:Series Name="Series1">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblDisplay2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Button ID="btnExportReport" runat="server" Text="Export Report" />
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
