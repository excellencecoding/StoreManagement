<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StoreManagement.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            label<br />

        </div>
  

        <asp:TextBox ID="TextBox1" runat="server" Height="32px" Width="360px"></asp:TextBox>
      
        <p>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CatName" DataValueField="cid" OnTextChanged="DropDownList1_TextChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [cid], [CatName] FROM [Tbl_addCat]"></asp:SqlDataSource>
    </form>
</body>
</html>
