<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="ZooInformation.aspx.cs" Inherits="Project.ZooInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style4 {
            width: 195px;
            height: 71px;
        }
        .auto-style5 {
            height: 71px;
        text-align: left;
    }
        .auto-style2 {
            width: 195px;
            height: 254px;
        }
        .auto-style3 {
            height: 254px;
        }
        .auto-style6 {
            width: 195px;
            height: 298px;
        }
        .auto-style7 {
            height: 298px;
        }
        .auto-style9 {
            width: 100%;
            height: 324px;
        }
        .auto-style10 {
            width: 100%;
            height: 1110px;
            margin-bottom: 0px;
        }
        .auto-style11 {
            height: 51px;
        }
        .auto-style12 {
            width: 100%;
            height: 313px;
        }
        .auto-style21 {
            height: 32px;
        }
        .auto-style22 {
            width: 195px;
            height: 209px;
        }
        .auto-style23 {
            height: 209px;
        }
        .auto-style24 {
            height: 107px;
        }
        .auto-style27 {
            height: 58px;
        }
        .auto-style28 {
            height: 70px;
        }
        .auto-style30 {
            width: 100%;
            height: 102px;
            margin-left: 0px;
        }
        .auto-style31 {
            height: 55px;
        }
        .auto-style32 {
            height: 40px;
        }
        .auto-style33 {
            height: 40px;
            width: 166px;
            text-align: left;
        }
        .auto-style34 {
            height: 55px;
            width: 166px;
            text-align: left;
        }
        .auto-style35 {
            height: 70px;
            width: 166px;
            text-align: left;
        }
    </style>
</head>
<body style="height: 1733px">
    <form id="form1" runat="server">
        <div>
        </div>
            <table class="auto-style10">
                <tr>
                    <td class="auto-style4" style="border-style: inset; border-color: #006600; background-color: #006600">&nbsp;<br />
                        <asp:Label ID="lblZooInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="ZooInfoSys"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Screenshot 2026-08-10 122157.png" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblZooInfo0" runat="server" Font-Size="Small" ForeColor="#999999" Text="Operations"></asp:Label>
                    </td>
                    <td class="auto-style5" colspan="2" style="border-style: double">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Zoo Information"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Label ID="lblZooNavigation" runat="server" Font-Size="Small" ForeColor="#999999" Text="NAVIGATION"></asp:Label>
                        <br />
                        <br />
                        <asp:Menu ID="Menu1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem NavigateUrl="~/MyOverview.aspx" Text="My Overview" Value="0"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Bookings.aspx" Text="Bookings" Value="1"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Payment.aspx" Text="Payment" Value="2"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/CheckIn.aspx" Text="Check - In" Value="3"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/ZooInformation.aspx" Text="Zoo Information" Value="4"></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#669999" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style3">
                        <asp:Panel ID="pnlContactDetails" runat="server" BorderColor="#D6D6D6" BorderStyle="Solid" BorderWidth="2px" Height="301px">
                            <asp:Label ID="Label19" runat="server" Text="ⓘ Contact &amp; Location" Font-Bold="True"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Text="📍 Address"></asp:Label>
                            <br />
                            <asp:Label ID="Label21" runat="server" Text="Lion Park Rd, Cato Ridge, KZN"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label22" runat="server" Text="☎ Phone"></asp:Label>
                            <br />
                            <asp:Label ID="Label23" runat="server" Text="031 785 4708"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label24" runat="server" Text="  💬 WhatsApp"></asp:Label>
                            <br />
                            <asp:Label ID="Label31" runat="server" Text="083 267 0392 / 083 640 2641"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label32" runat="server" Text="✉ Email"></asp:Label>
                            <br />
                            <asp:Label ID="Label33" runat="server" Text="admin@natalzoo.co.za"></asp:Label>
                        </asp:Panel>
                    </td>
                    <td class="auto-style3">
                        <asp:Panel ID="pnlOpeningHours" runat="server" BorderColor="#D6D6D6" BorderStyle="Solid" BorderWidth="2px" Height="299px">
                            <asp:Label ID="Label25" runat="server" Text="◷ Opening Hours" Font-Bold="True"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <table class="auto-style30">
                                <tr>
                                    <td class="auto-style33">
                                        <asp:Label ID="Label36" runat="server" Text="Monday - Thursday"></asp:Label>
                                    </td>
                                    <td class="auto-style32">
                                        <asp:Label ID="Label39" runat="server" Text="8:00 - 17:00"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label37" runat="server" Text="Friday - Sunday"></asp:Label>
                                    </td>
                                    <td class="auto-style31">
                                        <asp:Label ID="Label40" runat="server" Text="8:00 - 18:30"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style35">
                                        <asp:Label ID="Label38" runat="server" Text="Public Holidays"></asp:Label>
                                    </td>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label41" runat="server" Text="8:00 - 16:00"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Menu ID="Menu2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem NavigateUrl="~/MyProfile.aspx" Text="My Profile"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#669999" />
                        </asp:Menu>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblNameDisplay" runat="server" Font-Size="Small" ForeColor="#999999"></asp:Label>
                    </td>
                    <td class="auto-style7" colspan="2">
                        <asp:Panel ID="pnlEvents" runat="server" BorderColor="#D6D6D6" BorderStyle="Solid" BorderWidth="2px" Height="363px">
                            <table class="auto-style9">
                                <tr>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Zone Overview"></asp:Label>
                                    </td>
                                    <td class="auto-style28">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style24">
                                        <asp:Label ID="Label1" runat="server" Text="Savannah Safari Zone"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label2" runat="server">Lions, Giraffes, Zebras, Wildebeest</asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server">Gate 3 – East Entrance</asp:Label>
                                    </td>
                                    <td class="auto-style24">
                                        <asp:Label ID="Label10" runat="server">Reptile House</asp:Label>
                                        <br />
                                        <asp:Label ID="Label11" runat="server">Crocodiles, Pythons, Chameleons, Tortoises</asp:Label>
                                        <br />
                                        <asp:Label ID="Label12" runat="server">Zone B – Central</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label4" runat="server">Aviary &amp; Bird Park</asp:Label>
                                        <br />
                                        <asp:Label ID="Label5" runat="server">200+ bird species, Flamingos, Eagles</asp:Label>
                                        <br />
                                        <asp:Label ID="Label6" runat="server">North Wing – Gate 2</asp:Label>
                                    </td>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label13" runat="server">Elephant Sanctuary</asp:Label>
                                        <br />
                                        <asp:Label ID="Label14" runat="server">African Elephants, Rhinos, Hippos</asp:Label>
                                        <br />
                                        <asp:Label ID="Label15" runat="server">Zone D – West</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server">Aquatic World</asp:Label>
                                        <br />
                                        <asp:Label ID="Label8" runat="server">Sharks, Rays, Tropical Fish, Penguins</asp:Label>
                                        <br />
                                        <asp:Label ID="Label9" runat="server">Zone E – South</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server">Children&#39;s Petting Zoo</asp:Label>
                                        <br />
                                        <asp:Label ID="Label17" runat="server">Goats, Rabbits, Deer, Ponies</asp:Label>
                                        <br />
                                        <asp:Label ID="Label18" runat="server">Education Center</asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22" style="border-style: inset; border-color: #006600; background-color: #006600">
                        <asp:Menu ID="Menu3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White">
                            <Items>
                                <asp:MenuItem Text="Sign Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BorderColor="#669999" />
                        </asp:Menu>
                    </td>
                    <td class="auto-style23" colspan="2">
                        <asp:Panel ID="pnlFaq" runat="server" BorderColor="#D6D6D6" BorderStyle="Solid" BorderWidth="2px" Height="433px">
                            <table class="auto-style12">
                                <tr>
                                    <td class="auto-style27">
                                        <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Visitor FAQs"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style27">
                                        <asp:LinkButton ID="btnFaq1" runat="server" OnClick="btnFaq1_Click">What should I bring for my visit?</asp:LinkButton>
                                        <br />
                                        <asp:Label ID="lblFaq1" runat="server" Text="Comfortable walking shoes, sunscreen, a hat, and a water bottle. Photography is welcome in all zones. Tripods require a special permit." Visible="False"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style21">
                                        <asp:LinkButton ID="btnFaq2" runat="server" OnClick="btnFaq2_Click">Can I bring food and drinks?</asp:LinkButton>
                                        <br />
                                        <asp:Label ID="lblFaq2" runat="server" Text="Outside food is allowed in designated picnic areas. No food is permitted inside animal enclosures. We have 3 cafeterias and 5 snack kiosks on-site."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style27">
                                        <asp:LinkButton ID="btnFaq3" runat="server" OnClick="btnFaq3_Click">Does the zoo accomodate people with mobility impairement?</asp:LinkButton>
                                        <br />
                                        <asp:Label ID="lblFaq3" runat="server" Text="Yes, all our main pathways are wheelchair accessible. Wheelchairs are available at the main entrance (Gate 1) at no extra charge."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="btnFaq4" runat="server" OnClick="btnFaq4_Click">How do I check in  on the day of my visit?</asp:LinkButton>
                                        <br />
                                        <asp:Label ID="lblFaq4" runat="server" Text="Present your booking reference code or ticket QR code at the designated gate. Check-in opens 1 hour before your event start time."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11">
                                        <asp:LinkButton ID="btnFaq5" runat="server" OnClick="btnFaq5_Click">What is the cancellation policy?</asp:LinkButton>
                                        <br />
                                        <asp:Label ID="lblFaq5" runat="server" Text="Full refund for cancellations made 48+ hours before the event. 50% refund for 24 – 48 hours. No refund within 24 hours of the event."></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
