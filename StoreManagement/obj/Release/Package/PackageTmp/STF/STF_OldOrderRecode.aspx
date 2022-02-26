<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_OldOrderRecode.aspx.cs" Inherits="StoreManagement.STF.STF_OldOrderRecode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>All Order List 
                         
                        </h2> 
                        Enter Order No: 
                        <asp:TextBox ID="txtSearchNO" runat="server"></asp:TextBox>
                        
                        
                        <asp:Button ID="btnSearch" runat="server" Height="25px" Text="Search" Width="92px" OnClick="Button2_Click" />
                        &nbsp;&nbsp;</div>
                </div>              
                 <!-- /. ROW  -->
                <hr />
                  <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="13pt">
                      <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                      <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <RowStyle BackColor="White" ForeColor="#330099" />
                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                      <SortedAscendingCellStyle BackColor="#FEFCEB" />
                      <SortedAscendingHeaderStyle BackColor="#AF0101" />
                      <SortedDescendingCellStyle BackColor="#F6F0C0" />
                      <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <br />
                <div class="row">
                    <div class="col-lg-12 ">                       
                        
                  
                                <asp:Label ID="Label2" runat="server" Text="Total Qty:   " Font-Size="15pt"></asp:Label>
                                <asp:Label ID="lbQty" runat="server" Font-Bold="True" Font-Size="15pt"></asp:Label>
                                &nbsp;  &nbsp;  &nbsp;  &nbsp  &nbsp;                     
                                <asp:Label ID="Label1" runat="server" Text="Total Price :   " Font-Size="15pt"></asp:Label>
                               <asp:Label ID="lbPrice" runat="server" Font-Bold="True" Font-Size="15pt"></asp:Label>


                       
                       
                    </div>
                    </div>

                </div>
         </div>


</asp:Content>
