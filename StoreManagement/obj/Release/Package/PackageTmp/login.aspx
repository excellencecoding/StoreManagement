<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="StoreManagement.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 112px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <br />
                <br />
                <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="red"></asp:Label><br />  
     <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True" Width="100px" BackColor="#FFFF66" ForeColor="#FF3300" Font-Size="15pt"></asp:Label>  
        <asp:TextBox ID="txtUserName" runat="server" ForeColor="#993300" Width="203px" Font-Size="20pt"></asp:TextBox><br />  <br />
                <br />
        <asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True" Width="100px" BackColor="#FFFF66" ForeColor="#FF3300" Font-Size="15pt"></asp:Label>  
        <asp:TextBox ID="txtPassword" runat="server" ForeColor="#CC6600" TextMode="Password" Width="198px" Font-Size="20pt" ></asp:TextBox><br />  
                <br />
                <br />
                <br />
        <asp:Button ID="btn_login" runat="server" Text="Login" Font-Bold="True"  
            BackColor="#CCFF99" Width="209px" CssClass="auto-style1" Font-Size="20pt" OnClick="btn_login_Click"   /><br /> 
        </div>
            </center>
    </form>
</body>
</html>
