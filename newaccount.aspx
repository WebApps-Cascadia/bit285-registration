<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewAccount.aspx.cs" Inherits="NewAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 60%;
            border: 1px solid #000080;
            background-color: #99CCFF;
        }
        .auto-style3 {
            width: 364px;
            text-align: right;
            font-size: large;
            font-weight: bold;
        }
        .auto-style5 {
            width: 848px;
        }
        .auto-style6 {
            width: 255px;
        }
        .auto-style7 {
            width: 364px;
        }
    </style>
</head>
<body style="background-color: #336699">
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CCFFFF" Text="New Account Page"></asp:Label>
&nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style3">First Name:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Last Name:</td>
                <td class="auto-style6">
                    <asp:TextBox runat="server" ID="txtLastName" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">User Name:</td>
                <td class="auto-style6">
                    <asp:TextBox runat="server" ID="txtUserName" Width="170px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtEmail" runat="server" Width="170px"></asp:TextBox><br/>
                    <asp:CheckBox runat="server" ID="chkEmailUpdates" Text="Get Email Updates"/>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="revValidateEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Valid email address required" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Confirm Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="cvComparePasswords" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Both passwords must match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Program ID:</td>
                <td class="auto-style6">
                    <asp:TextBox runat="server" ID="txtProgramID" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator runat="server" ID="rfvProgramID" ControlToValidate="txtProgramID" ErrorMessage="Program ID required" ForeColor="red"></asp:RequiredFieldValidator><br/>
                    <asp:RegularExpressionValidator runat="server" ID="revProgramID" ControlToValidate="txtProgramID" ErrorMessage="Program ID must be 1 or 2 digit number" ForeColor="red" ValidationExpression="^\d{1,2}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Submit" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" CausesValidation="False" OnClick="btnReset_Click" Text="Reset" />
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblSuccess" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
