<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_OrderItem.aspx.cs" Inherits="StoreManagement.STF.STF_OrderItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
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

        .auto-style2 {
            margin-left: 126px;
        }

        .auto-style3 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: -1px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .auto-style4 {
            margin-left: 1100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="auto-style3">
                    <h2>Order Item
                        <a style="margin-left: 80%; border-bottom: dotted 1px red;" href="./STF_LastOrder.aspx">Last Order</a>
                    </h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


                    <div class="row">



                        <div class="col-9">

                            <div class="row">
                                <div class="col-4">
                                    <asp:Label ID="Label2" runat="server" Text="Select Product Category" Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownCat" Font-Size="Large" AutoPostBack="true" runat="server" Height="40px" Width="330px" OnTextChanged="DropDownCat_TextChanged">
                                    </asp:DropDownList>

                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownProductName" AutoPostBack="true" Font-Size="Large" runat="server" Height="40px" Width="330px" OnTextChanged="DropDownProductName_TextChanged">
                                    </asp:DropDownList>


                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label6" runat="server" Text="Party Name " Font-Size="Large"></asp:Label><br />
                                    <asp:DropDownList ID="DropDownpPartyName" AutoPostBack="true" Font-Size="Large" runat="server" Height="40px" Width="330px">
                                    </asp:DropDownList>


                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="row">

                                <div class="col-4">
                                    <asp:Label ID="Label3" runat="server" Text="QTY" Font-Size="Large"></asp:Label><br />
                                    <asp:TextBox ID="txtQty" AutoPostBack="true" runat="server" Height="40px" Width="330px" Font-Size="15pt" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                                    
                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label7" runat="server" Text="PER UNIT PRICE" Font-Size="Large"></asp:Label><br />
                                    <asp:TextBox ID="txtPerUnit" AutoPostBack="true" runat="server" Height="40px" Width="330px" Font-Size="15pt" OnTextChanged="txtPerUnit_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label8" runat="server" Text="Total Price" Font-Size="Large"></asp:Label><br />
                                    <asp:TextBox ID="txtTotalPrice" runat="server" Height="40px" Width="330px" Font-Size="15pt" OnTextChanged="txtTotalPrice_TextChanged" BackColor="#FFFFCC"></asp:TextBox>
                                </div>


                            </div>


                        </div>

                        <div class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="Date" Font-Size="Large"></asp:Label>

                            <br />
                            <%--<asp:TextBox ID="txtDate" placeholder="dd/mm/yyyy" runat="server" Height="40px" Width="330px" Font-Size="15pt"></asp:TextBox>--%>
                            <asp:Calendar ID="CalendarDate" runat="server" Height="143px" Width="200px" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" ShowGridLines="True">
                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                <SelectorStyle BackColor="#FFCC66" />
                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                            </asp:Calendar>



                            <asp:TextBox ID="txtMaxIdOrderId" runat="server" CssClass="mt-0" Visible="False"></asp:TextBox>



                        </div>


                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>


            <br />
            <div class="row">
                <%-- <div class="col-3">
                    <asp:Label ID="Label9" runat="server" Text="Payment Type" Font-Size="Large"></asp:Label>

                    <asp:DropDownList ID="DropDownPaymentType" Font-Size="Large" runat="server" Height="40px" Width="330px">


                        <asp:ListItem Value="o">Select Payment Type </asp:ListItem>
                        <asp:ListItem>Advance pay</asp:ListItem>
                        <asp:ListItem>After Delivery Pay</asp:ListItem>
                    </asp:DropDownList>
                </div>--%>

                <div class="col-6">
                    <asp:Label ID="Label11" runat="server" Text="Where is the use of this Product ??" Font-Size="Large" Font-Bold="True" ForeColor="Red"></asp:Label><br />
                    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Height="43px" Width="730px"></asp:TextBox>
                    &nbsp;
                </div>

                <br />
                <div class="row">
                    <div class="col-3">
                        <br />
                        <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <asp:Button ID="btnAdd" Style="margin-left: 10px;" runat="server" Text="Add To Cart" OnClick="Insert" BackColor="#FF9999" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="15pt" Height="44px" Width="262px" />

                    </div>



                </div>



            </div>
            <!-- /. PAGE INNER  -->
            <div class="row">
                <div class="col-md-12">
                    <hr />
                    <br />
                    <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="15pt" OnRowDeleting="GridView2_RowDeleting" Width="1410px" OnRowDataBound="GridView2_RowDataBound">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle ForeColor="#FF0066" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" BorderStyle="None" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                    <hr />
                    <b>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Yes !" />
                        <asp:Label ID="Label13" runat="server" Text="I am Confirm place this order"></asp:Label></b>
                    <br />

                    <div>

                        <asp:Button ID="btnOrderNow" runat="server" Text="Order Place " Height="42px" Width="258px" Font-Bold="True" Font-Size="Large" OnClick="btnOrderNow_Click" BackColor="#66CCFF" BorderColor="#3333FF" BorderStyle="Solid" CssClass="auto-style2" />

                    </div>

                </div>

            </div>


        </div>

    </div>
</asp:Content>
