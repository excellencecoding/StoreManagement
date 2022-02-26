<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="STF_Dashboard.aspx.cs" Inherits="StoreManagement.STF.STF_Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
            height: 586px;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                       <h3>STAFF DASHBOARD</h3>  
                        <hr />
                    </div>
                    <div class="auto-style1 ">
                   
                       <div class="row">
                           <div class="col-3">
                                <asp:Label ID="Label1" runat="server" Text="PARTY NAME" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtPartyName" runat="server" Height="33px" Width="274px" Font-Size="15pt"></asp:TextBox>
                           
          
                           </div>
                           <div class="col-3">
                                <asp:Label ID="Label2" runat="server" Text="GST.NO" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtGst" runat="server" Height="33px" Width="274px" Font-Size="15pt"></asp:TextBox>
                           </div>
                           <div class="col-3">
                                <asp:Label ID="Label3" runat="server" Text="CONTACT NO" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtCon1" runat="server" Height="33px" Width="274px" Font-Size="15pt"></asp:TextBox>
                                
                           </div>
                       <div class="col-3">
                                <asp:Label ID="Label4" runat="server" Text="2nd CONTACT NO" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtCon2" runat="server" Height="33px" Width="274px" Font-Size="15pt"></asp:TextBox>
                           </div>

                       </div>
                        <div class="row">
                           <div class="col-3">
                                <asp:Label ID="Label5" runat="server" Text="CITY NAME" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtCity" runat="server" Height="33px" Width="274px" Font-Size="15pt"></asp:TextBox>
                           
          
                           </div>
                           <div class="col-3">
                                <asp:Label ID="Label6" runat="server" Text="STATE" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtState" runat="server" Height="33px" Width="274px" Font-Size="15pt"></asp:TextBox>
                           </div>
                           <div class="col-3">
                                <asp:Label ID="Label7" runat="server" Text="FUll ADDRESS" Font-Size="Large"></asp:Label><br />
                        <asp:TextBox ID="txtAddress" runat="server" Height="131px" Width="274px" Font-Size="15pt"></asp:TextBox>
                                
                           </div>
                           <div class="col-3">
                               <%-- <br /><br />
                               <asp:Button ID="Button1" runat="server" Text="SAVE  NEW PARTY  RECODE" Height="110px" Width="278px" BackColor="#009900" BorderColor="#00CC00" BorderStyle="Solid" Font-Names="Arial Rounded MT Bold" Font-Size="Large" ForeColor="White" />
                           </div>--%>

                       </div>
                   
                    </div>
                    <div class="col-3">
                               <br /><br />
                               <asp:Button ID="btnSave" runat="server" Text="SAVE NEW PARTY" Height="68px" Width="240px"  Font-Size="Medium" ForeColor="White" BackColor="#009900" OnClick="btnSave_Click"  />
                              
                           </div>
                </div>              
              
                  <asp:GridView ID="GridView1" runat="server" Font-Size="15pt">
                               </asp:GridView>
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
</asp:Content>
