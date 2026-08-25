<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateTourist.aspx.cs" Inherits="Project.UpdateTourist" %>

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
        .auto-style15 {
            width: 450px;
            height: 706px;
        }
        .auto-style5 {
            width: 450px;
        }
        .auto-style16 {
            height: 26px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6" rowspan="3">
                        <asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/Images/zims_zoo_logo.png" Width="331px" />
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
                    <td class="auto-style2" colspan="2" style="border-style: double">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblUpdateInfo" runat="server" Text="Update Tourist Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">
                            <table style="width:100%; height: 645px;">
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblUpdMessage" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblTouristID" runat="server" Text="Enter Tourist ID:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdTouristID" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTouristID" runat="server" ControlToValidate="txtUpdTouristID" ErrorMessage="Please enter your Tourist ID!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlEventID" runat="server" Height="25px" Width="138px">
                                            <asp:ListItem Value="0">Select Event ID</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEventID" runat="server" ControlToValidate="ddlEventID" ErrorMessage="Please select an Event!" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblName" runat="server" Text="Enter Name:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtUpdName" ErrorMessage="Please enter a name!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSurname" runat="server" Text="Enter Surname:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdSurname" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ErrorMessage="Please enter a surname!" ForeColor="Red" ControlToValidate="txtUpdSurname"></asp:RequiredFieldValidator>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblPhoneNo" runat="server" Text="Enter phone number:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdPhoneNo" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ControlToValidate="txtUpdPhoneNo" ErrorMessage="Please enter a phone number!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblEmail" runat="server" Text="Enter Email:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdEmail" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtUpdEmail" ErrorMessage="Please enter a email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblCountry" runat="server" Text="Country of Origin:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlUpdCountries" runat="server" Height="16px" Width="161px" OnSelectedIndexChanged="ddlUpdCountries_SelectedIndexChanged">
                                            <asp:ListItem>Select a Country</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BtnUpdate" runat="server" Height="28px" Text="Update" Width="145px" BackColor="Green" Font-Bold="True" ForeColor="White" OnClick="BtnUpdate_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnContinue" runat="server" Height="27px" Text="Continue" Width="128px" BackColor="#009900" Font-Bold="True" ForeColor="White" />
                                    </td>
                                </tr>
                            </table>
                    </td>
                    <td class="auto-style15">
                        <asp:GridView ID="GridView1" runat="server" Height="379px" Width="603px">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
        </div>
        </div>
    </form>
   
