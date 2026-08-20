<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Project.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style22 {
            width: 310px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style22">
                        <asp:Image ID="Image1" runat="server" Height="168px" ImageUrl="~/Images/zims_zoo_logo.png" Width="330px" />
                        </td>
                    <td colspan="2" style="border-style: double">
                        <asp:Label ID="txtReports" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="REPORTS"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        <asp:Menu ID="Menu4" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
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
                    <td colspan="2">
                        <asp:Panel ID="pnlReports" runat="server" GroupingText="Report Parameters" Height="678px">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblReportType" runat="server" Text="Report type:"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:DropDownList ID="ddReportType" runat="server">
                                            <asp:ListItem Value="&quot;&quot;">Select Report</asp:ListItem>
                                            <asp:ListItem>Number of Bookings per Time Period</asp:ListItem>
                                            <asp:ListItem>Top 5 Event Types per Time Period</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddReportType" ErrorMessage="Please select the report you want!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStartDate" runat="server" Text="Start Date:"></asp:Label>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Please select the start date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
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
                                    <td>
                                        <asp:Label ID="lblSortBy" runat="server" Text="Sort By:"></asp:Label>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:DropDownList ID="ddSortBy" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem Value="EventType">Event Type</asp:ListItem>
                                            <asp:ListItem Value="Bookings">Number of Bookings</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                    <td>
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
                                    <td>&nbsp;</td>
                                    <td>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnGenerateReport" runat="server" Height="38px" Text="📊 Generate Report" />
                                    </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                        <br />
                                        <asp:Button ID="btnExportReport" runat="server" Text="Export Report" Visible="False" />
                                    </td>
                                    <td>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnClear0" runat="server" Height="42px" Text="↻ Clear" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Panel ID="pnlCharts" runat="server" GroupingText="Reports Results" Height="340px" Visible="False">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridView2" runat="server" Height="205px" Width="530px">
                                                        </asp:GridView>
                                                    </td>
                                                    <td>
                                                        <asp:Chart ID="Chart1" runat="server" Width="435px">
                                                            <Series>
                                                                <asp:Series Name="Series1">
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1">
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <br />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
