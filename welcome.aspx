<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="Large" Text="Welcome, "></asp:Label>
        <br />
    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="ipaddress" HeaderText="ipaddress" SortExpression="ipaddress" />
                <asp:BoundField DataField="last_login" HeaderText="last_login" SortExpression="last_login" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bit285_registration_dbConnectionString %>" SelectCommand="SELECT [username], [ipaddress], [last_login] FROM [UserData]"></asp:SqlDataSource>
        <br />
    
    </div>
        <br />
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
    </form>
</body>
</html>
