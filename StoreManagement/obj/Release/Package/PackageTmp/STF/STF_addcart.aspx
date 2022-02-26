<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_addcart.aspx.cs" Inherits="StoreManagement.STF.STF_addcart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 15;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>Cart Page</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="15pt" >
                    <Columns>
                        <asp:BoundField DataField="ProdductName" HeaderText="ProdductName" SortExpression="Product Name" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:Button Text="-" runat="server" style="background:orange"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QTY">
                            <ItemTemplate>
                                <asp:TextBox runat="server" Width="100px" ID="txtQuatntity" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:Button ID="Button1" Text="+" style="background:green" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="totalPrice" HeaderText="Price" SortExpression="totalPrice" />
                  <asp:TemplateField HeaderText=" ">
                            <ItemTemplate>
                                <asp:Button ID="Button1" Text="Delete" style="background:Red;color:White" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField> </Columns>
                    <EditRowStyle Font-Size="15pt" />


                </asp:GridView>
             <!-- /. PAGE INNER  -->


                
            </div>


</asp:Content>
