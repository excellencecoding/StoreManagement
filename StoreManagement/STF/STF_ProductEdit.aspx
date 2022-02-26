<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_ProductEdit.aspx.cs" Inherits="StoreManagement.STF.STF_ProductEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
         <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>ADMIN DASHBOARD</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->

                  <asp:Panel ID="addProduct" runat="server">
                      <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                            <p>Enter Product No :</p>
                            <asp:TextBox ID="txtSearchno" runat="server" ReadOnly="True"></asp:TextBox>

                            <asp:Button ID="BtnSearch" runat="server" Text="Edit" OnClick="BtnSearch_Click" />
                        </div>
                       
                    </div>
                    </div>
                <div Class="editbox">
                    <div class="row">
                        <div class="col-3" aria-sort="none">
                            <asp:Label ID="Label2" runat="server" Text="Select Product Category" Font-Size="Large"></asp:Label><br />
                          <asp:DropDownList ID="DropDownCat" Font-Size="Large" runat="server" Height="40px" Width="330px" DataSourceID="catList" DataTextField="CatName" DataValueField="cid">
                         
                                
                                <asp:ListItem Value="o">Select Catgoery </asp:ListItem>    
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="catList" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [cid], [CatName] FROM [Tbl_addCat]"></asp:SqlDataSource>


                        </div>
                        <div class="col-9" >
                            <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                            <asp:TextBox ID="txtProductName" runat="server" Height="39px" Width="1170px" Font-Size="15pt"></asp:TextBox>

                        </div>
                        <%--<div class="col-3">
                            <asp:Label ID="Label4" runat="server" Text="Model NO" Font-Size="Large"></asp:Label><br />
                         <<asp:Panel runat="server"></asp:Panel><asp:Panel runat="server"></asp:Panel>asp:TextBox ID="txtModelNo" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>
                        </div>
                         <div class="col-3">
                            <asp:Label ID="Label3" runat="server" Text="Size" Font-Size="Large"></asp:Label><br />
                         <asp:TextBox ID="txtSize" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>
                        </div>--%>                
                    </div>
                    
                      <div class="row">
                   <%-- <div class="col-3">
                            <asp:Label ID="Label5" runat="server" Text="Make " Font-Size="Large"></asp:Label><br />
                         <asp:TextBox ID="txtMake" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>
                        </div>--%>
                    <div class="col-3"> 
                             <asp:Label ID="Label6" runat="server" Text="Party Name " Font-Size="Large"></asp:Label><br />

                             <asp:DropDownList ID="DropDownPartyListName"  Height="39px" Width="330px" Font-Size="15pt" runat="server" DataSourceID="partyName" DataTextField="PartyName" DataValueField="Partyid" ></asp:DropDownList>

                   
                             <asp:SqlDataSource ID="partyName" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [Partyid], [PartyName] FROM [Tbl_addNewParty]"></asp:SqlDataSource>

                   
                        </div>
                    <div class="col-3">
                            <br /> <br />
                            <asp:Button ID="btnupdate" runat="server" Text="Update" Height="42px" Width="330px" Font-Bold="True" Font-Size="Large" BackColor="#33CCFF" OnClick="btnupdate_Click" />

                    </div>
                    </div>
                </div>
                </asp:Panel>


                  <hr />
             
                  <!-- /. ROW  --> 
                <br />
                <asp:GridView ID="GridView1" runat="server" Font-Size="15pt" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1171px">
                    <Columns>
                        <asp:BoundField DataField="pid" HeaderText="PID" SortExpression="pid" />
                        <asp:BoundField DataField="FinalNameProduct" HeaderText="Product Name" />
                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
                        <asp:BoundField DataField="PartyName" HeaderText="Party Name" SortExpression="PartyName" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
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

              

                </div>
             </div>

    
</asp:Content>
