<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="newPage.aspx.cs" Inherits="StoreManagement.STF.newPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Order Item</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />

            <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>


            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label2" runat="server" Text="Select Product Category" Font-Size="Large"></asp:Label><br />
                    <asp:DropDownList ID="DropDownCat" Font-Size="Large" runat="server" Height="40px" Width="264px" OnTextChanged="DropDownCat_TextChanged">
                       
                    </asp:DropDownList>                   

                </div>
                <div class="col-3">
                    <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                    <asp:DropDownList ID="DropDownProductName" Font-Size="Large" runat="server" Height="40px" Width="264px">
                     
                        <asp:ListItem>Ramesh</asp:ListItem>
                     
                    </asp:DropDownList>

                   
                </div>
                <div class="col-3">
                    <asp:Label ID="Label6" runat="server" Text="Party Name " Font-Size="Large"></asp:Label><br />
                    <asp:DropDownList ID="DropDownpPartyName" Font-Size="Large" runat="server" Height="40px" Width="264px">
                        
                    </asp:DropDownList>

                   
                </div>
                <div class="col-3">
                    <asp:Label ID="Label4" runat="server" Text="Date" Font-Size="Large"></asp:Label>
                    
                    <br />
                    <asp:TextBox ID="txtDate" placeholder="dd/mm/yyyy" runat="server" Height="40px" Width="274px" Font-Size="15pt"></asp:TextBox>
                </div>


            </div>
            <br />
             <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label3" runat="server" Text="QTY" Font-Size="Large"></asp:Label><br />
                     <asp:TextBox ID="txtQty" runat="server" Height="40px" Width="274px" Font-Size="15pt"></asp:TextBox>
                </div>
                <div class="col-3">
                    <asp:Label ID="Label7" runat="server" Text="PER UNIT PRICE" Font-Size="Large"></asp:Label><br />
                   <asp:TextBox ID="txtPerUnit" runat="server" Height="40px" Width="274px" Font-Size="15pt"></asp:TextBox>
                </div>
                <div class="col-3">
                    <asp:Label ID="Label8" runat="server" Text="Total Price" Font-Size="Large"></asp:Label><br />
                     <asp:TextBox ID="txtTotalPrice" runat="server" Height="40px" Width="274px" Font-Size="15pt"></asp:TextBox>
                </div>
                <div class="col-3">
                    <asp:Label ID="Label9" runat="server" Text="Payment Type" Font-Size="Large"></asp:Label>
                 
                 <asp:DropDownList ID="DropDownPaymentType" Font-Size="Large" runat="server" Height="40px" Width="264px" >


                        <asp:ListItem Value="o">Select Payment Type </asp:ListItem>
                        <asp:ListItem>Advance pay</asp:ListItem>
                        <asp:ListItem>After Delivery Pay</asp:ListItem>
                    </asp:DropDownList>
                </div>
             </div>
            <br />
                <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label10" runat="server" Text="Pay Amount" Font-Size="Large"></asp:Label><br />
                     <asp:TextBox ID="txtPayAmount" runat="server" Height="40px" Width="274px" Font-Size="15pt"></asp:TextBox>
                </div>
                <div class="col-6" >
                    <asp:Label ID="Label11"  runat="server" Text="Why Use These Product ??" Font-Size="Large" Font-Bold="True" ForeColor="Red"></asp:Label><br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="43px" Width="664px"></asp:TextBox>
&nbsp;</div>
                <div class="col-3">
                    <asp:Label ID="Label5" runat="server" Text="Balance Amount" Font-Size="Large"></asp:Label><br />
                     <asp:TextBox ID="txtBalanceAmount" runat="server" Height="40px" Width="274px" Font-Size="15pt" BackColor="#FFCCFF" ReadOnly="True"></asp:TextBox>
                </div>
               
             </div>
            <br />
              <div class="row">
                <div class="col-3">
                    <br /> 
                    <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                            <asp:Button ID="btnOrderNow" runat="server" Text="Order Now" Height="42px" Width="276px" Font-Bold="True" Font-Size="Large"   />

                </div>
               
                <div class="col-3">
                     <br /> <br />
                            <asp:Button ID="btnPOreport" runat="server" Text="P.O Report" Height="42px" Width="276px" Font-Bold="True" Font-Size="Large" />

                </div>
               
             </div>


            </ContentTemplate>
</asp:UpdatePanel>
        </div>
        <!-- /. PAGE INNER  -->
    </div>

</asp:Content>
