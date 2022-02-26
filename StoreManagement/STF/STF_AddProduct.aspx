<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_AddProduct.aspx.cs" Inherits="StoreManagement.STF.STF_AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            
                                  <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>ADD Product <span style="margin-left:80%;color:blue"><a href="./STF_ProductEdit.aspx">Edit Product</a></span> </h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                
                    <div class="row">
                        <div class="col-3" aria-sort="none">
                            <asp:Label ID="Label2" runat="server" Text="Select Product Category" Font-Size="Large"></asp:Label><br />
                          <asp:DropDownList ID="DropDownCat" Font-Size="Large" runat="server" Height="40px" Width="330px" DataSourceID="SqlDataSource1" DataTextField="CatName" DataValueField="cid">
                         
                                
                                <asp:ListItem Value="o">Select Catgoery </asp:ListItem>    
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [cid], [CatName] FROM [Tbl_addCat]"></asp:SqlDataSource>


                            <asp:TextBox ID="txtMaxIdProduct" runat="server" CssClass="mt-0" Visible="False"></asp:TextBox>


                        </div>
                        <div class="col-3" >
                            <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                            <asp:TextBox ID="txtProductName" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>

                        </div>
                        <div class="col-3">
                            <asp:Label ID="Label4" runat="server" Text="Model NO" Font-Size="Large"></asp:Label><br />
                         <asp:TextBox ID="txtModelNo" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>
                        </div>
                         <div class="col-3">
                            <asp:Label ID="Label3" runat="server" Text="Size" Font-Size="Large"></asp:Label><br />
                         <asp:TextBox ID="txtSize" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>
                        </div>                
                    </div>
                    
                      <div class="row">
                    <div class="col-3">
                            <asp:Label ID="Label5" runat="server" Text="Make " Font-Size="Large"></asp:Label><br />
                         <asp:TextBox ID="txtMake" runat="server" Height="39px" Width="330px" Font-Size="15pt"></asp:TextBox>
                        </div>
                    <div class="col-3"> 
                             <asp:Label ID="Label6" runat="server" Text="Party Name " Font-Size="Large"></asp:Label><br />

                             <asp:DropDownList ID="DropDownPartyListName"  Height="39px" Width="330px" Font-Size="15pt" runat="server" DataSourceID="partyNameList" DataTextField="PartyName" DataValueField="Partyid"></asp:DropDownList>

                   
                             <asp:SqlDataSource ID="partyNameList" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [Partyid], [PartyName] FROM [Tbl_addNewParty]"></asp:SqlDataSource>


                        </div>
                    <div class="col-3">
                            <br /> <br />
                            <asp:Button ID="btnSave" runat="server" Text="Save" Height="42px" Width="330px" Font-Bold="True" Font-Size="Large" OnClick="btnSave_Click" BackColor="#33CCFF" />

                    </div>
                           <div class="col-3">
                               <br /> <br />
                            <asp:TextBox ID="txtDeleteId" runat="server" Visible="False"></asp:TextBox>

                               <asp:Button ID="btnDelete" runat="server" Text="Delete" BackColor="#FFFF66" BorderStyle="Solid" BorderColor="#FFCC00" Font-Size="15pt" Height="40px" Width="330px" OnClick="btnDelete_Click" />
                          
                            
                            
                    </div>
                    </div>

                          

    <hr />
                <asp:GridView ID="GridView1" Width="99%" Font-Size="Large" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
                <Columns>
                    
                    <asp:BoundField DataField="pid">
                    <ItemStyle ForeColor="White" Width="1px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="SR.No">
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>

                    <asp:BoundField DataField="FinalNameProduct" HeaderText="All Product Name" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category " />
                    <asp:BoundField DataField="PartyName" HeaderText="PartyName" />
                    <asp:CommandField ShowSelectButton="True">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#FF0066" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                       
                           
                      
                  

            
               
                </div>
                </div>
                


            

   
</asp:Content>
