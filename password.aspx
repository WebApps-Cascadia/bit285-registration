<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Password.aspx.cs" Inherits="Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Automatic Password Generator</h1>
            <h3>Hello, <asp:Label runat="server" ID="hello"/>.<br/>
                Congratulations on getting into <asp:Label runat="server" ID="program"/>
            </h3>
            <p>
                <asp:Label runat="server" ID="email" Text="We'll send email updates to you at " Visible="False"/>
            </p>
            <p>
                We know how hard coming up with a new password is, <asp:Label runat="server" ID="name"/>,<br />
                so just enter your information below to automatically generate a password!
            </p>
            
            <asp:Table runat="server" ID="info">
                <asp:TableRow>
                    <asp:TableCell>
                    <asp:Label runat="server" Text="Last Name:"/>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="lastName" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" Text="*required" style="color: red;"/>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                    <asp:Label runat="server" Text="Birth Year:"/>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="birthYear" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="birthYear" Text="*required" style="color: red;"/>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="birthYear"
                            ValidationExpression="^\d{4}$" ErrorMessage="Year needs to be 4 numbers"/>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                    <asp:Label runat="server" Text="Favorite Color:"/>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox runat="server" ID="favColor" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="favColor" Text="*required" style="color: red;"/>
                    </asp:TableCell></asp:TableRow></asp:Table><br />

            <asp:Button runat="server" ID="suggest" Text="Suggest Passwords >>>" OnClick="suggest_Click" />
            
            <asp:DropDownList runat="server" ID="passwords">
                <asp:ListItem>Possible Passwords</asp:ListItem></asp:DropDownList><br/>
        </div>
    </form>
</body>
</html>
