<%@ Page Title="" Language="C#" MasterPageFile="~/STF_Master.Master" AutoEventWireup="true" CodeBehind="newCart.aspx.cs" Inherits="StoreManagement.STF.newCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Order Item</h2>
                </div>
            </div>
   <div>
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">

      
     <ContentTemplate>  
          <table id="table1" runat="server">  
              <tr>  
                  <td id="td1" runat="server" style="font-weight: 700; color: #800000; font-family: Andalus"  
                      class="style1">Category</td>  
                  <td class="style1">     
                      <asp:DropDownList ID="DropDownCat" runat="server" AutoPostBack="True" DataSourceID="productCat" DataTextField="CatName" DataValueField="cid"  >  
                      </asp:DropDownList>  
                                
                      <asp:SqlDataSource ID="productCat" runat="server" ConnectionString="<%$ ConnectionStrings:SMDBConnectionString %>" SelectCommand="SELECT [cid], [CatName] FROM [Tbl_addCat]"></asp:SqlDataSource>
                                
                  </td>  
                  <td>  </td>  
                  <td style="font-weight: 700; color: #800000; font-family: Andalus"  
                      class="style1">  Product:</td>  
                  <td class="style1">  
                      <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                 </td>  
             </tr>  
         </table>  
     </ContentTemplate>  
            </asp:UpdatePanel>
   </div>

            </div>
        </div>

</asp:Content>
