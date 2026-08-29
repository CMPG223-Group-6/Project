<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSummary.aspx.cs" Inherits="Project.PaymentSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #00CC66">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 26px;
            width: 508px;
        }
        .auto-style4 {
            width: 399px;
        }
        .auto-style5 {
            height: 26px;
            width: 399px;
        }
        .auto-style6 {
            text-align: center;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="lblHeading" runat="server" style="font-size: xx-large; font-weight: 700" Text="Payment Summary"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style5"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblBookingID" runat="server" Font-Bold="True" Text="Booking ID:"></asp:Label>
                &nbsp;<asp:Label ID="lblBookingIDOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style5"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblTouristID" runat="server" Font-Bold="True" Text="Tourist Name:"></asp:Label>
                &nbsp;<asp:Label ID="lblTouristNameOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblEventID0" runat="server" Font-Bold="True" Text="Event ID:"></asp:Label>
                &nbsp;<asp:Label ID="lblEventIDOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblEventName0" runat="server" Font-Bold="True" Text="Event Name:"></asp:Label>
                &nbsp;<asp:Label ID="lblEventNameOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblNumberTickets0" runat="server" Font-Bold="True" Text="Number of Tickets:"></asp:Label>
                &nbsp;<asp:Label ID="lblNumTicketsOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style5"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblArrivalDate0" runat="server" Font-Bold="True" Text="Arrival Date:"></asp:Label>
                    &nbsp;<asp:Label ID="lblArrivalDateOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblPaymentDate0" runat="server" Font-Bold="True" Text="Payment Date:"></asp:Label>
                &nbsp;<asp:Label ID="lblPaymentDateOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblPaymentMethod0" runat="server" Font-Bold="True" Text="Payment Method:"></asp:Label>
                &nbsp;<asp:Label ID="lblPaymentMethodOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblToatlPaid0" runat="server" Font-Bold="True" Text="Total Paid:"></asp:Label>
                &nbsp;<asp:Label ID="lblTotalPaidOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" Font-Bold="True" OnClick="Button1_Click" Text="Return to payment overview" Width="233px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
