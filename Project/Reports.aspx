<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Project.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style22 {
            width: 310px;
        }
        .auto-style23 {
            height: 35px;
        }
        .auto-style24 {
            height: 63px;
        }
        .auto-style25 {
            width: 100%;
            height: 896px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style25">
                <tr>
                    <td class="auto-style22">
                        <asp:Image ID="Image1" runat="server" Height="168px" ImageUrl="~/Images/zims_zoo_logo.png" Width="330px" />
                        </td>
                    <td style="border-style: double">
                        <asp:Label ID="txtReports" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="REPORTS"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22" rowspan="3">
                        <asp:Menu ID="Menu4" runat="server" BackColor="#003300" DynamicHorizontalOffset="13" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="700px" StaticSubMenuIndent="25px" Width="330px">
                            <DynamicHoverStyle BackColor="#339933" />
                            <Items>
                                <asp:MenuItem Text="Maintain" Value="Maintain">
                                    <asp:MenuItem NavigateUrl="~/MaintainTourists.aspx" Text="Maintain Tourists" Value="Maintain Tourists"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/ValidateUser.aspx" Text="Maintain Event Types" Value="Maintain Event Types"></asp:MenuItem>
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
                    <td>
                        <asp:Panel ID="pnlParameters" runat="server" GroupingText="Report Parameters" Height="310px">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblReportType" runat="server" Text="Report type:"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:DropDownList ID="ddReportType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddReportType_SelectedIndexChanged">
                                            <asp:ListItem Value=" ">Select Report</asp:ListItem>
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
                                        <asp:TextBox ID="calStartDate" runat="server" TextMode="Date"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="calStartDate" ErrorMessage="Please select the start date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEndDate" runat="server" Text="End Date:"></asp:Label>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="calEndDate" runat="server" TextMode="Date"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="calEndDate" ErrorMessage="Please select the end date!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style24">
                                        <asp:Label ID="lblSortBy" runat="server" Text="Sort By:"></asp:Label>
                                    </td>
                                    <td class="auto-style24">
                                        <br />
                                        <asp:DropDownList ID="ddSortBy" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddSortBy_SelectedIndexChanged" Height="25px" Width="117px">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                    </td>
                                    <td class="auto-style24">
                                        <asp:Label ID="lblSortOrder" runat="server" Text="Sort Order: "></asp:Label>
                                    </td>
                                    <td class="auto-style24">
                                        <asp:DropDownList ID="ddSortOrder" runat="server" Height="25px" Width="146px">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style23"></td>
                                    <td class="auto-style23">
                                        <asp:Button ID="btnGenerateReport" runat="server" Height="38px" Text="📊 Generate Report" OnClick="btnGenerateReport_Click" />
                                    </td>
                                    <td class="auto-style23">
                                        <asp:Button ID="btnExportReport" runat="server" Text="Export Report" Visible="False" Height="38px" OnClick="btnExportReport_Click" />
                                    </td>
                                    <td class="auto-style23">
                                        <asp:Button ID="btnClear" runat="server" Height="38px" Text="↻ Clear" OnClick="btnClear0_Click" />
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
                                        <asp:Label ID="lblDisplay1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                                        <asp:Panel ID="pnlResults" runat="server" GroupingText="Reports Results" Height="404px" Visible="False">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td rowspan="2">
                                                        <asp:GridView ID="gvReport" runat="server"
                                                            Height="205px"
                                                            Width="530px"
                                                            AutoGenerateColumns="True">
                                                        </asp:GridView>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Chart ID="Chart1" runat="server" Height="300px" Width="550px" OnLoad="Chart1_Load">
                                                            <Series>
                                                                <asp:Series ChartType="Column" Name="Series1">
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1">
                                                                    <AxisX Title="Event Name">
                                                                    </AxisX>
                                                                    <AxisY Title="Number of Bookings">
                                                                    </AxisY>
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
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
