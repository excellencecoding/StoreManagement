<%@ Page Title="" Language="C#" MasterPageFile="~/STR_Master.Master" AutoEventWireup="true" CodeBehind="STR_OutStock.aspx.cs" Inherits="StoreManagement.STR.STR_OutStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
            -ms-flex: 0 0 25%;
            flex: 0 0 25%;
            max-width: 25%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
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
                <div class="col-lg-9">
                    <h2>Out InStock </h2>

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
                <div class="col-lg-12" >
                    <div class="row">
                        <div class="col-lg-9" >

                            <div class="row">

                                <div class="col-4">
                                    <asp:Label ID="Label2" runat="server" Text="Select Product Category" Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownCat" Font-Size="Large" AutoPostBack="True" runat="server" Height="40px" Width="330px" OnTextChanged="DropDownCat_TextChanged">
                                    </asp:DropDownList>

                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownProductName" AutoPostBack="True" Font-Size="Large" runat="server" Height="40px" Width="330px" OnTextChanged="DropDownProductName_TextChanged">
                                    </asp:DropDownList>


                                </div>
                                <div class="auto-style2">
                                    <asp:Label ID="Label3" runat="server" Text="QTY" Font-Size="Large"></asp:Label><br />
                                    <asp:TextBox ID="txtQty" AutoPostBack="true" runat="server" Height="40px" Width="330px" Font-Size="15pt"></asp:TextBox>


                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-4">
                                    <asp:Label ID="Label5" runat="server" Text="Issues Type" Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownIssueType" AutoPostBack="true" Font-Size="Large" runat="server" Height="40px" Width="330px">
                                        <asp:ListItem>Select Type</asp:ListItem>
                                        <asp:ListItem Value="Consumable">Consumable </asp:ListItem>
                                        <asp:ListItem Value="NonConsumable">Non Consumable </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label4" runat="server" Text="Issue To " Font-Size="Large"></asp:Label><br />
                                    <asp:TextBox ID="txtIssuseTo" AutoPostBack="true" runat="server" Height="40px" Width="330px" Font-Size="15pt"></asp:TextBox>


                                </div>
                              <div class="col-4">
                                    <asp:Label ID="Label6" runat="server" Text="Permission  By" Font-Size="Large" Font-Bold="True" ForeColor="#009900"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownList1" AutoPostBack="True" Font-Size="Large" runat="server" Height="40px" Width="330px" DataSourceID="userlistName" DataTextField="userName" DataValueField="id">
                                        <asp:ListItem>Select Type</asp:ListItem>
                                        <asp:ListItem Value="Consumable">Consumable </asp:ListItem>
                                        <asp:ListItem Value="NonConsumable">Non Consumable </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="userlistName" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [id], [userName] FROM [Tbl_UserOrderName]"></asp:SqlDataSource>
                                </div>

                            </div>


                        </div>

                        <div class="col-lg-3" >

                            <asp:Calendar ID="calenderDate" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="174px" ShowGridLines="True" Width="236px">
                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                <SelectorStyle BackColor="#FFCC66" />
                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                            </asp:Calendar>
                        </div>


                    </div>
                </div>

                <div class="col-lg-12" >
                    <div class="row">
                        
                  
                                <div class="col-6">
                                    <asp:Label ID="Label7" runat="server" Text="Where is the use of this Product ??" Font-Size="Large" Font-Bold="True" ForeColor="Red"></asp:Label><br />
                                    <asp:TextBox ID="TextBox1" AutoPostBack="true" runat="server" Height="40px" Width="730px" Font-Size="15pt"></asp:TextBox>


                                </div>


                        <div class="col-3">
                                    <br />
                                    <br />
                                    <asp:Button ID="btnUpdateStock"  runat="server" Text="Out Stock" BackColor="#FF9999" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="15pt" Height="44px" Width="330px" OnClick="btnUpdateStock_Click" />

                                </div>
                     
            </div>
            </div>
            </div>

            <br />
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
        </div>
        
        <!-- /. ROW  -->
    </div>
    </div>

</asp:Content>
