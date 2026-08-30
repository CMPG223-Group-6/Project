<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireForm.aspx.cs" Inherits="Project.QuestionnaireForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 31px;
        }
        .auto-style2 {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="#00CC66; background-color: #00CC66;">
            <table style="width:100%;">
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Label ID="lblQHeading" runat="server" style="font-size: xx-large" Text="Customer Service Questionaire"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblQ1" runat="server" Text="Were you satisfied with your visit today?"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:RadioButton ID="rbQ1Yes" runat="server" Text="Yes" GroupName="answerQ1" />
&nbsp;
                        <asp:RadioButton ID="rbQ1No" runat="server" Text="No" GroupName="answerQ1" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblMessage1" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQ2" runat="server" Text="Did the zoo meet your expectations?"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbQ2Yes" runat="server" Text="Yes" GroupName="answerQ2" />
&nbsp;
                        <asp:RadioButton ID="rbQ2No" runat="server" Text="No" GroupName="answerQ2" />
                    </td>
                    <td>
                        <asp:Label ID="lblMessage2" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblQ3" runat="server" Text="Was it easy to buy your tickets online/at the gate?"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:RadioButton ID="rbQ3Yes" runat="server" Text="Yes" GroupName="answerQ3" />
&nbsp;
                        <asp:RadioButton ID="rbQ3No" runat="server" Text="No" GroupName="answerQ3" />
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lblMessage3" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQ4" runat="server" Text="Were you able to see your favorite animals easily?"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbQ4Yes" runat="server" Text="Yes" GroupName="answerQ4" />
&nbsp;
                        <asp:RadioButton ID="rbQ4No" runat="server" Text="No" GroupName="answerQ4" />
                    </td>
                    <td>
                        <asp:Label ID="lblMessage4" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQ5" runat="server" Text="Were the animal information signs clear and helpful?"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbQ5Yes" runat="server" Text="Yes" GroupName="answerQ5" />
&nbsp;
                        <asp:RadioButton ID="rbQ5No" runat="server" Text="No" GroupName="answerQ5" />
                    </td>
                    <td>
                        <asp:Label ID="lblMessage5" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblQ6" runat="server" Text="Were the walking paths, rest areas, and restrooms clean?"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:RadioButton ID="rbQ6Yes" runat="server" Text="Yes" GroupName="answerQ6" />
&nbsp;
                        <asp:RadioButton ID="rbQ6No" runat="server" Text="No" GroupName="answerQ6" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblMessage6" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQ7" runat="server" Text="Were our staff members welcoming and polite?"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbQ7Yes" runat="server" Text="Yes" GroupName="answerQ7" />
&nbsp;
                        <asp:RadioButton ID="rbQ7No" runat="server" Text="No" GroupName="answerQ7" />
                    </td>
                    <td>
                        <asp:Label ID="lblMessage7" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQ8" runat="server" Text="We'd love to hear from you. Add a review"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtReview" runat="server" Width="285px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnQuestionaireComplete" runat="server" BackColor="#999999" Height="57px" Text="Complete" Width="216px" OnClick="btnQuestionaireComplete_Click" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
