<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 94px;
        }
        .auto-style3 {
            text-align: right;
            width: 94px;
            font-weight: bold;
        }
        .auto-style4 {
            width: 212px;
        }
        .auto-style6 {
            background-color: #99FF99;
        }
    </style>
</head>
<body style="background-color: #D8EDD1">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblLogin" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000099" Text="Login Page" BackColor="#99CCFF" BorderColor="#003399"></asp:Label>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">User Name: </td>
                <td class="auto-style4">


                    <asp:TextBox ID="txtLoginUser" runat="server"></asp:TextBox>


                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvLoginUser0" runat="server" ControlToValidate="txtLoginUser" ErrorMessage="User name required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password: </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtLoginPassword" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfwLoginPassword0" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Password required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblPasswordStatus" runat="server" ForeColor="Red" Text="Password is incorrect!" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <p>
            <a href="NewAccount.aspx"><span class="auto-style6">Need a New Account?</span></a>
        </p>

    </form>
    </body>
</html>
