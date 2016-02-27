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
        .auto-style8 {
            width: 364px;
            text-align: right;
            font-size: large;
            font-weight: bold;
            height: 24px;
        }
        .auto-style9 {
            width: 255px;
            height: 24px;
        }
        .auto-style10 {
            width: 848px;
            height: 24px;
        }
        .auto-style11 {
            width: 364px;
            text-align: right;
            font-size: small;
            font-weight: bold;
        }
    </style>
</head>
<body style="background-color: #336699">
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CCFFFF" Text="New Account Page"></asp:Label>
&nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style3">User Name:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtUsername" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvUsername0" runat="server" ControlToValidate="txtUsername" ErrorMessage="User Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">First Name:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvUsername1" runat="server" ControlToValidate="txtUsername" ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Last Name:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtLastName" runat="server" Width="171px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvPassword0" runat="server" ControlToValidate="txtPassword" ErrorMessage="Last Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvPassword1" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Confirm Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword0" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="cvComparePasswords0" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Both passwords must match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Email:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtEmail" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="rfvEmail0" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="revValidateEmail0" runat="server" ControlToValidate="txtEmail" ErrorMessage="Valid email address required" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Would you like regular email updates?</td>
                <td class="auto-style6">
                    <asp:CheckBox ID="chkEmailOptIn" runat="server" />
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Submit" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" CausesValidation="False" OnClick="btnReset_Click" Text="Reset" />
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblSuccess" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnSuggPwds" runat="server" CausesValidation="False" OnClick="btnSuggPwds_Click" Text="Suggest Passwords" />
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblFavoriteColor" runat="server" Text="Favorite Color:" Visible="False" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFavoriteColor" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblBirthYear" runat="server" Text="Birth Year:" Visible="False" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtBirthYear" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnGenerate" runat="server" CausesValidation="False" OnClick="btnGenerate_Click" Text="Generate" Visible="False" />
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlPasswords" runat="server" OnSelectedIndexChanged="ddlPasswords_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
