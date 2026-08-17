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
        .auto-style16 {
            height: 26px;
        }
        .auto-style15 {
            width: 450px;
            height: 706px;
        }
        .auto-style5 {
            width: 450px;
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
                    <td class="auto-style2" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblUpdateInfo" runat="server" Text="Update Tourist Dashboard:" Font-Bold="True" Font-Size="45px" style="text-align: center"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">
                        <asp:Panel ID="Panel1" runat="server" Height="391px">
                            <table style="width:100%; height: 389px;">
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblTouristID" runat="server" Text="Enter your Tourist ID:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdTouristID" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTouristID" runat="server" ControlToValidate="txtUpdTouristID" ErrorMessage="Please enter your Tourist ID!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblEventID" runat="server" Text="Event ID:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlEventID" runat="server" Height="25px" Width="138px">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEventID" runat="server" ControlToValidate="ddlEventID" ErrorMessage="Please select an Event!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="lblName" runat="server" Text="Enter your name:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtUpdName" ErrorMessage="Please enter a name!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSurname" runat="server" Text="Enter your surname:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdSurname" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ErrorMessage="Please enter a surname!" ForeColor="Red" ControlToValidate="txtUpdSurname"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblPhoneNo" runat="server" Text="Enter your phone number:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdPhoneNo" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ControlToValidate="txtUpdPhoneNo" ErrorMessage="Please enter a phone number!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblEmail" runat="server" Text="Enter your email:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdEmail" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtUpdEmail" ErrorMessage="Please enter a email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblDate" runat="server" Text="Check In Date:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtUpdDate" runat="server" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Please select a Check-In Date!" ForeColor="Red" ControlToValidate="txtUpdDate"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblStatus" runat="server" Text="Enter your status:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlUpdStatus" runat="server" Height="17px" Width="149px">
                                            <asp:ListItem>Confirmed</asp:ListItem>
                                            <asp:ListItem>Pending</asp:ListItem>
                                            <asp:ListItem>Cancelled</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="lblCountry" runat="server" Text="Country of Origin:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlUpdCountries" runat="server" Height="16px" Width="161px">
                                            <asp:ListItem>Select a Country</asp:ListItem>
                                            <asp:ListItem>Algeria</asp:ListItem>
                                            <asp:ListItem>Angola</asp:ListItem>
                                            <asp:ListItem>Benin</asp:ListItem>
                                            <asp:ListItem>Botswana</asp:ListItem>
                                            <asp:ListItem>Burkina Faso</asp:ListItem>
                                            <asp:ListItem>Burundi</asp:ListItem>
                                            <asp:ListItem>Cabo Verde</asp:ListItem>
                                            <asp:ListItem>Cameroon</asp:ListItem>
                                            <asp:ListItem>Central African Republic</asp:ListItem>
                                            <asp:ListItem>Chad</asp:ListItem>
                                            <asp:ListItem>Comoros</asp:ListItem>
                                            <asp:ListItem>Democratic Republic of the Congo</asp:ListItem>
                                            <asp:ListItem>Republic of the Congo</asp:ListItem>
                                            <asp:ListItem>Côte d’Ivoire</asp:ListItem>
                                            <asp:ListItem>Djibouti</asp:ListItem>
                                            <asp:ListItem>Egypt</asp:ListItem>
                                            <asp:ListItem>Equatorial Guinea</asp:ListItem>
                                            <asp:ListItem>Eritrea</asp:ListItem>
                                            <asp:ListItem>Eswatini</asp:ListItem>
                                            <asp:ListItem>Ethiopia</asp:ListItem>
                                            <asp:ListItem>Gabon</asp:ListItem>
                                            <asp:ListItem>Gambia</asp:ListItem>
                                            <asp:ListItem>Ghana</asp:ListItem>
                                            <asp:ListItem>Guinea</asp:ListItem>
                                            <asp:ListItem>Guinea-Bissau</asp:ListItem>
                                            <asp:ListItem>Kenya</asp:ListItem>
                                            <asp:ListItem>Lesotho</asp:ListItem>
                                            <asp:ListItem>Liberia</asp:ListItem>
                                            <asp:ListItem>Libya</asp:ListItem>
                                            <asp:ListItem>Madagascar</asp:ListItem>
                                            <asp:ListItem>Malawi</asp:ListItem>
                                            <asp:ListItem>Mali</asp:ListItem>
                                            <asp:ListItem>Mauritania</asp:ListItem>
                                            <asp:ListItem>Mauritius</asp:ListItem>
                                            <asp:ListItem>Morocco</asp:ListItem>
                                            <asp:ListItem>Mozambique</asp:ListItem>
                                            <asp:ListItem>Namibia</asp:ListItem>
                                            <asp:ListItem>Niger</asp:ListItem>
                                            <asp:ListItem>Nigeria</asp:ListItem>
                                            <asp:ListItem>Rwanda</asp:ListItem>
                                            <asp:ListItem>São Tomé and Príncipe</asp:ListItem>
                                            <asp:ListItem>Senegal</asp:ListItem>
                                            <asp:ListItem>Seychelles</asp:ListItem>
                                            <asp:ListItem>Sierra Leone</asp:ListItem>
                                            <asp:ListItem>Somalia</asp:ListItem>
                                            <asp:ListItem>South Africa</asp:ListItem>
                                            <asp:ListItem>South Sudan</asp:ListItem>
                                            <asp:ListItem>Sudan</asp:ListItem>
                                            <asp:ListItem>Tanzania</asp:ListItem>
                                            <asp:ListItem>Togo</asp:ListItem>
                                            <asp:ListItem>Tunisia</asp:ListItem>
                                            <asp:ListItem>Uganda</asp:ListItem>
                                            <asp:ListItem>Zambia</asp:ListItem>
                                            <asp:ListItem>Zimbabwe</asp:ListItem>
                                            <asp:ListItem>Afghanistan</asp:ListItem>
                                            <asp:ListItem>Armenia</asp:ListItem>
                                            <asp:ListItem>Azerbaijan</asp:ListItem>
                                            <asp:ListItem>Bahrain</asp:ListItem>
                                            <asp:ListItem>Bangladesh</asp:ListItem>
                                            <asp:ListItem>Bhutan</asp:ListItem>
                                            <asp:ListItem>Brunei</asp:ListItem>
                                            <asp:ListItem>Cambodia</asp:ListItem>
                                            <asp:ListItem>China</asp:ListItem>
                                            <asp:ListItem>Cyprus</asp:ListItem>
                                            <asp:ListItem>Georgia</asp:ListItem>
                                            <asp:ListItem>India</asp:ListItem>
                                            <asp:ListItem>Indonesia</asp:ListItem>
                                            <asp:ListItem>Iran</asp:ListItem>
                                            <asp:ListItem>Iraq</asp:ListItem>
                                            <asp:ListItem>Israel</asp:ListItem>
                                            <asp:ListItem>Japan</asp:ListItem>
                                            <asp:ListItem>Jordan</asp:ListItem>
                                            <asp:ListItem>Kazakhstan</asp:ListItem>
                                            <asp:ListItem>Kuwait</asp:ListItem>
                                            <asp:ListItem>Kyrgyzstan</asp:ListItem>
                                            <asp:ListItem>Laos</asp:ListItem>
                                            <asp:ListItem>Lebanon</asp:ListItem>
                                            <asp:ListItem>Malaysia</asp:ListItem>
                                            <asp:ListItem>Maldives</asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Mongolia</asp:ListItem>
                                            <asp:ListItem>Myanmar</asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Nepal</asp:ListItem>
                                            <asp:ListItem>North Korea</asp:ListItem>
                                            <asp:ListItem>Oman</asp:ListItem>
                                            <asp:ListItem>Pakistan</asp:ListItem>
                                            <asp:ListItem>Palestine</asp:ListItem>
                                            <asp:ListItem>Philippines</asp:ListItem>
                                            <asp:ListItem>Qatar</asp:ListItem>
                                            <asp:ListItem>Pakistan</asp:ListItem>
                                            <asp:ListItem>Palestine</asp:ListItem>
                                            <asp:ListItem>Philippines</asp:ListItem>
                                            <asp:ListItem>Qatar</asp:ListItem>
                                            <asp:ListItem>Saudi Arabia</asp:ListItem>
                                            <asp:ListItem>Singapore</asp:ListItem>
                                            <asp:ListItem>South Korea</asp:ListItem>
                                            <asp:ListItem>Sri Lanka</asp:ListItem>
                                            <asp:ListItem>Syria</asp:ListItem>
                                            <asp:ListItem>Taijkistan</asp:ListItem>
                                            <asp:ListItem>Thailand</asp:ListItem>
                                            <asp:ListItem>Timor-Leste</asp:ListItem>
                                            <asp:ListItem>Turkey</asp:ListItem>
                                            <asp:ListItem>Turkmenistan</asp:ListItem>
                                            <asp:ListItem>United Arab Emirates</asp:ListItem>
                                            <asp:ListItem>Uzebekistan</asp:ListItem>
                                            <asp:ListItem>Vietnam</asp:ListItem>
                                            <asp:ListItem>Yemen</asp:ListItem>
                                            <asp:ListItem>Albania</asp:ListItem>
                                            <asp:ListItem>Andorra</asp:ListItem>
                                            <asp:ListItem>Austria</asp:ListItem>
                                            <asp:ListItem>Belarus</asp:ListItem>
                                            <asp:ListItem>Belgium</asp:ListItem>
                                            <asp:ListItem>Bosnia and Herzegovina</asp:ListItem>
                                            <asp:ListItem>Bulgaria</asp:ListItem>
                                            <asp:ListItem>Croatia</asp:ListItem>
                                            <asp:ListItem>Czechia</asp:ListItem>
                                            <asp:ListItem>Denmark</asp:ListItem>
                                            <asp:ListItem>Estonia</asp:ListItem>
                                            <asp:ListItem>Finland</asp:ListItem>
                                            <asp:ListItem>France</asp:ListItem>
                                            <asp:ListItem>Germany</asp:ListItem>
                                            <asp:ListItem>Greece</asp:ListItem>
                                            <asp:ListItem>Hungary</asp:ListItem>
                                            <asp:ListItem>Iceland</asp:ListItem>
                                            <asp:ListItem>Ireland</asp:ListItem>
                                            <asp:ListItem>Italy</asp:ListItem>
                                            <asp:ListItem>Latvia</asp:ListItem>
                                            <asp:ListItem>Lichenstein</asp:ListItem>
                                            <asp:ListItem>Lithuania</asp:ListItem>
                                            <asp:ListItem>Luxembourg</asp:ListItem>
                                            <asp:ListItem>Malta</asp:ListItem>
                                            <asp:ListItem>Moldova</asp:ListItem>
                                            <asp:ListItem>Monaco</asp:ListItem>
                                            <asp:ListItem>Montengero</asp:ListItem>
                                            <asp:ListItem>Netherlands</asp:ListItem>
                                            <asp:ListItem>North Macedonia</asp:ListItem>
                                            <asp:ListItem>Norway</asp:ListItem>
                                            <asp:ListItem>Poland</asp:ListItem>
                                            <asp:ListItem>Portugal</asp:ListItem>
                                            <asp:ListItem>Romania</asp:ListItem>
                                            <asp:ListItem>Russia</asp:ListItem>
                                            <asp:ListItem>San Marino</asp:ListItem>
                                            <asp:ListItem>Serbia</asp:ListItem>
                                            <asp:ListItem>Slovakia</asp:ListItem>
                                            <asp:ListItem>Spain</asp:ListItem>
                                            <asp:ListItem>Sweden</asp:ListItem>
                                            <asp:ListItem>Switzerland</asp:ListItem>
                                            <asp:ListItem>Ukraine</asp:ListItem>
                                            <asp:ListItem>United Kingdom</asp:ListItem>
                                            <asp:ListItem>Vatican City</asp:ListItem>
                                            <asp:ListItem>Antigua and Barbuda</asp:ListItem>
                                            <asp:ListItem>Bahamas</asp:ListItem>
                                            <asp:ListItem>Barbados</asp:ListItem>
                                            <asp:ListItem>Belize</asp:ListItem>
                                            <asp:ListItem>Canada</asp:ListItem>
                                            <asp:ListItem>Costa Rica</asp:ListItem>
                                            <asp:ListItem>Cuba</asp:ListItem>
                                            <asp:ListItem>Dominica</asp:ListItem>
                                            <asp:ListItem>Dominican Republic</asp:ListItem>
                                            <asp:ListItem>El Salvador</asp:ListItem>
                                            <asp:ListItem>Grenada</asp:ListItem>
                                            <asp:ListItem>Guatemala</asp:ListItem>
                                            <asp:ListItem>Haiti</asp:ListItem>
                                            <asp:ListItem>Honduras</asp:ListItem>
                                            <asp:ListItem>Jamaica</asp:ListItem>
                                            <asp:ListItem>Mexico</asp:ListItem>
                                            <asp:ListItem>Nicaragua</asp:ListItem>
                                            <asp:ListItem>Panama</asp:ListItem>
                                            <asp:ListItem>Saint Kitts and Nevis</asp:ListItem>
                                            <asp:ListItem>Saint Lucia</asp:ListItem>
                                            <asp:ListItem>Saint Vincent and the Grenadines</asp:ListItem>
                                            <asp:ListItem>Trinidad and Tobago</asp:ListItem>
                                            <asp:ListItem>United States</asp:ListItem>
                                            <asp:ListItem>Argentina</asp:ListItem>
                                            <asp:ListItem>Bolivia</asp:ListItem>
                                            <asp:ListItem>Brazil</asp:ListItem>
                                            <asp:ListItem>Chile</asp:ListItem>
                                            <asp:ListItem>Colombia</asp:ListItem>
                                            <asp:ListItem>Ecuador</asp:ListItem>
                                            <asp:ListItem>Guyana</asp:ListItem>
                                            <asp:ListItem>Paraguay</asp:ListItem>
                                            <asp:ListItem>Peru</asp:ListItem>
                                            <asp:ListItem>Suriname</asp:ListItem>
                                            <asp:ListItem>Uruguay</asp:ListItem>
                                            <asp:ListItem>Venezuela</asp:ListItem>
                                            <asp:ListItem>Australia</asp:ListItem>
                                            <asp:ListItem>Fiji</asp:ListItem>
                                            <asp:ListItem>Kiribati</asp:ListItem>
                                            <asp:ListItem>Marshall Islands</asp:ListItem>
                                            <asp:ListItem>Micronesia</asp:ListItem>
                                            <asp:ListItem>Nauru</asp:ListItem>
                                            <asp:ListItem>New Zealand</asp:ListItem>
                                            <asp:ListItem>Palau</asp:ListItem>
                                            <asp:ListItem>Papua New Guinea</asp:ListItem>
                                            <asp:ListItem>Samoa</asp:ListItem>
                                            <asp:ListItem>Solomon Islands</asp:ListItem>
                                            <asp:ListItem>Tonga</asp:ListItem>
                                            <asp:ListItem>Tuvalu</asp:ListItem>
                                            <asp:ListItem>Vanuatu</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BtnUpdate" runat="server" Height="28px" Text="Update" Width="145px" BackColor="Green" Font-Bold="True" ForeColor="White" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnContinue" runat="server" Height="27px" Text="Continue" Width="128px" BackColor="Yellow" Font-Bold="True" ForeColor="White" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
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
   
