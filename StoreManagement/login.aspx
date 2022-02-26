<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="StoreManagement.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       
    </style>
</head>
<body style="background-color:palegoldenrod">
    <form id="form1" runat="server">

        <center>
            <div style="margin-top:15vh; width:50%; border:1px solid grey">
                <br />
                <h2>User Login</h2>
                <hr />
                <br />
                <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="red"></asp:Label><br />  
     <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True" Width="100px" Font-Size="15pt"></asp:Label>  <br /> <br />
        <asp:TextBox ID="txtUserName" runat="server" ForeColor="#993300" Width="400px" Font-Size="20pt"></asp:TextBox><br />  <br />
                <br />
        <asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True" Width="100px" Font-Size="15pt"></asp:Label>  <br /> <br />
        <asp:TextBox ID="txtPassword" runat="server" ForeColor="#CC6600" TextMode="Password" Width="400px" Font-Size="20pt" ></asp:TextBox><br />  
                <br />
                <br />
                
        <asp:Button ID="btn_login" runat="server" Text="Login" Font-Bold="True"  
            BackColor="#FF5733" BorderStyle="None" Width="400px" Height="50px" style="border-radius:20px 20px 20px 20px; color:white" CssClass="auto-style1" Font-Size="20pt" OnClick="btn_login_Click"   /><br /> 
                <br />
                <br />
        </div>
            </center>
    </form>
</body>
</html>
