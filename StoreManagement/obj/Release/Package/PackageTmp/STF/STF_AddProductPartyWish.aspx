<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_AddProductPartyWish.aspx.cs" Inherits="StoreManagement.STF.STF_AddProductPartyWish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 0px;
            top: 0px;
            height: 133px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 25%;
            flex: 0 0 25%;
            max-width: 25%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ADD Product PARTY Wish</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
            <div class="row">
                <div class="auto-style1">


                    <div class="row">
                        <div class="auto-style2">
                            <asp:Label ID="Label2" runat="server" Text="Product Category" Font-Size="Large"></asp:Label><br />
                            <asp:DropDownList ID="DropDownCat" AutoPostBack="true" Font-Size="Large" runat="server" Height="40px" Width="264px" DataSourceID="productCatList" DataTextField="CatName" DataValueField="cid" OnTextChanged="DropDownCat_TextChanged">
                                                         
                        
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="productCatList" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [cid], [CatName] FROM [Tbl_addCat]"></asp:SqlDataSource>




                           




                        </div>
                        <div class="col-3" >
                            <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                            <asp:DropDownList ID="DropDownProductName"  Font-Size="Large" runat="server" Height="40px" Width="264px" >
                            </asp:DropDownList>

                        </div>
                        <div class="col-3">
                            <asp:Label ID="Label4" runat="server" Text="Party Name" Font-Size="Large"></asp:Label><br />
                            <asp:DropDownList ID="DropDownPartylist" runat="server" DataSourceID="partylistname" DataTextField="PartyName" DataValueField="Partyid" Height="41px" Width="264px" Font-Size="14pt">
                                <asp:ListItem Value='o'>--- Select List ----</asp:ListItem>

                            </asp:DropDownList>

                            <asp:SqlDataSource ID="partylistname" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [Partyid], [PartyName] FROM [Tbl_addNewParty]"></asp:SqlDataSource>
                        </div>
                        <div class="col-3">
                             <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            <br /> <br />
                            <asp:Button ID="btnSave" runat="server" Text="Save" Height="42px" Width="226px" Font-Bold="True" Font-Size="Large" OnClick="btnSave_Click" />

                    </div>
                    </div>




                </div>
            </div>
             </ContentTemplate>
</asp:UpdatePanel>

            <asp:GridView ID="GridView1" class="text-center" Font-Size="Medium" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="84px" Width="774px">
                <Columns>
                    <asp:TemplateField HeaderText="SR.No">
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
                    <asp:BoundField DataField="productName" HeaderText="Product Name" ReadOnly="True" SortExpression="productName" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" ReadOnly="True" SortExpression="CategoryName" />
                    <asp:BoundField DataField="PartyName" HeaderText="Party Name" ReadOnly="True" SortExpression="PartyName" />
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
        <!-- /. PAGE INNER  -->
    </div>

</asp:Content>
