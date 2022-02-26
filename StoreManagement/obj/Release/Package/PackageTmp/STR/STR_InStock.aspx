<%@ Page Title="" Language="C#" MasterPageFile="~/STR_Master.Master" AutoEventWireup="true" CodeBehind="STR_InStock.aspx.cs" Inherits="StoreManagement.STR.STR_InStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-9">
                    <h2>Add InStock </h2>

                </div>
                <div class="auto-style1">
                    <h2>
                        <asp:Label ID="lable12" runat="server" Text="InStock" Font-Bold="False"></asp:Label>: 
                        <asp:Label ID="lbInStock" runat="server" ForeColor="#009933" Font-Bold="True"></asp:Label></h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-lg-12 ">

                    <div class="row">

                        <div class="col-3">
                            <asp:Label ID="Label2" runat="server" Text="Select Product Category" Font-Size="Large"></asp:Label><br />
                            <asp:DropDownList ID="DropDownCat" Font-Size="Large" AutoPostBack="True" runat="server" Height="40px" Width="330px" >
                            </asp:DropDownList>

                        </div>
                        <div class="col-3">
                            <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                            <asp:DropDownList ID="DropDownProductName" AutoPostBack="True" Font-Size="Large" runat="server" Height="40px" Width="330px" >
                            </asp:DropDownList>


                        </div>
                        <div class="col-3">
                            <%--    <asp:Label ID="Label4" runat="server" Text="Issues Type" Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownIssuesType" AutoPostBack="true" Font-Size="Large" runat="server" Height="40px" Width="330px" >
                                        <asp:ListItem>Select Type</asp:ListItem>
                                        <asp:ListItem>Consumable </asp:ListItem>
                                        <asp:ListItem Value="NonConsumable ">Non Consumable </asp:ListItem>
                                    </asp:DropDownList>--%>
                            <asp:Label ID="Label3" runat="server" Text="QTY" Font-Size="Large"></asp:Label><br />
                            <asp:TextBox ID="txtQty" AutoPostBack="true" runat="server" Height="40px" Width="330px" Font-Size="15pt"></asp:TextBox>


                        </div>
                        <div class="col-3">
                            <br />
                            <br />
                            <asp:Button ID="btnUpdateStock" Style="margin-left: 10px;" runat="server" Text="Out Stock" BackColor="#FF9999" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="15pt" Height="44px" Width="262px" />

                        </div>


                        <br />

                    </div>

                    <hr />


                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 ">

                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="15pt">
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
            <!-- /. ROW  -->
        </div>
    </div>
</asp:Content>
