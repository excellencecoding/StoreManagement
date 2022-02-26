<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_AddProductCategory.aspx.cs" Inherits="StoreManagement.STF.STF_AddProductCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ADD CATEGORY</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label4" runat="server" Text="Add Category Name" Font-Size="Large"></asp:Label>
                    <asp:Label ID="Label5"  style="color:green" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtcate" runat="server" Height="40px" Width="274px" Font-Size="15pt"></asp:TextBox>
                </div>
                <div class="col-3">
                    <br />
                    <br />
                    <asp:Button ID="btnSave" runat="server" Text="Save" Height="42px" Width="226px" Font-Bold="True" Font-Size="Large" OnClick="btnSave_Click" />

                </div>

            </div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="Large" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="400px">
                <Columns>
                     <asp:TemplateField>
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
                    <asp:BoundField DataField="CatName" HeaderText="All Category Name " />
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
