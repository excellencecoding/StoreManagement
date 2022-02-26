<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_LastOrder.aspx.cs" Inherits="StoreManagement.STF.STF_LastOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 66px;
            margin-bottom: 0;
        }

        .auto-style2 {
            left: 0px;
            top: 0px;
        }

        .auto-style3 {
            margin-left: 46px;
            margin-bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Your Order Review</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <asp:TextBox ID="txtMaxIdOrderId" runat="server" Visible="False"></asp:TextBox>
            <asp:Button ID="btnOrderShow" runat="server" OnClick="btnOrderShow_Click" Text="Order Show " Visible="False" />
            <hr />
            <div class="row">
                <div class="col-lg-12 ">
                    <div class="alert ">

                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="884px" Font-Size="15pt" Height="151px">

                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>

                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 ">

                    <div class="auto-style2">
                        <div class="alert alert-danger">

                            <h5 style="margin-left: 250px">


                                <asp:Label ID="Label2" runat="server" Text="Total Qty"></asp:Label>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="auto-style3" Width="200px" Height="30px"></asp:TextBox>
                                &nbsp;  &nbsp;  &nbsp;  &nbsp  &nbsp;                     
                                <asp:Label ID="Label1" runat="server" Text="Total Price"></asp:Label>
                                <asp:TextBox ID="txtTotalPrice" runat="server" CssClass="auto-style1" Width="200px" Height="30px"></asp:TextBox>
                            </h5>
                        </div>

                    </div>
                </div>
            </div>

            <hr />
             <div class="row">
                <div class="col-lg-12">
                    <h2>Payment </h2>
                </div>
            </div>
            <asp:DropDownList ID="DropDownPaymentMode" runat="server" DataSourceID="PaymentMode" DataTextField="paymentType" AutoPostBack="True" DataValueField="PaymentID" OnTextChanged="DropDownPaymentMode_TextChanged" Font-Size="15pt" Width="277px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:SqlDataSource ID="PaymentMode" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [paymentType], [PaymentID] FROM [Tbl_paymentMode]"></asp:SqlDataSource>
            
            <asp:Label ID="lbAmount" runat="server" Text="Enter Amount :" Font-Bold="True" Font-Size="12pt"></asp:Label><br />
           
            <asp:TextBox ID="txtPayAmount" runat="server" CssClass="form-check-label" Width="277px" Font-Size="15pt"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPayAmount" runat="server"  Text="Save Recode" BackColor="#66FF66" BorderColor="#009900" Font-Size="13pt" OnClick="btnPayAmount_Click"  />
            <br />
           
            <hr />

              <div class="col-3">
                    

                </div>

        </div>
    </div>




</asp:Content>
