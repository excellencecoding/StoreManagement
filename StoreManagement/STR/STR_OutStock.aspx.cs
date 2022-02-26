using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace StoreManagement.STR
{
	public partial class STR_OutStock : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			if (!IsPostBack)
			{
				string query = "select cid, CatName from Tbl_addCat";
				BindDropDownList(DropDownCat, query, "CatName", "cid", "Select Category");
				DropDownProductName.Enabled = false;
				DropDownProductName.Items.Insert(0, new ListItem("Select Product", "0"));

			}


			showAllData();
		}
		private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			SqlCommand cmd = new SqlCommand(query);

			using (SqlDataAdapter sda = new SqlDataAdapter())
			{
				cmd.Connection = conn;
				conn.Open();
				ddl.DataSource = cmd.ExecuteReader();
				ddl.DataTextField = text;
				ddl.DataValueField = value;
				ddl.DataBind();
				conn.Close();
			}

			ddl.Items.Insert(0, new ListItem(defaultText, "0"));
		}



		

		protected void showAllData()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("select ProductName,IssueType, Qty,Catname,IssueTo,EntryTime from Tbl_Out_Stock_Product"))
			{
				using (SqlDataAdapter sda = new SqlDataAdapter())
				{
					cmd.Connection = conn; sda.SelectCommand = cmd;
					using (DataTable dt = new DataTable())
					{
						sda.Fill(dt);
						GridView1.DataSource = dt;
						GridView1.DataBind();
					}
				}
			}
		}

		protected void DropDownCat_TextChanged(object sender, EventArgs e)
		{
			DropDownProductName.Enabled = false;
			DropDownProductName.Items.Clear();
			DropDownProductName.Items.Insert(0, new ListItem("Select Product", "0"));
			int CategoryID = int.Parse(DropDownCat.SelectedItem.Value);
			if (CategoryID > 0)
			{
				//select pid,FinalNameProduct from Tbl_addProduct where CategoryID=2
				string query = string.Format("select DISTINCT ProductID,productName from Tbl_addProductPartWish where CategoryID= {0}", CategoryID);
				BindDropDownList(DropDownProductName, query, "productName", "ProductID", "Select Product");
				DropDownProductName.Enabled = true;
			}
		}

		protected void btnUpdateStock_Click(object sender, EventArgs e)
		{
			outStockSave();
			UpdateInStock();
		}

		protected void outStockSave()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

			conn.Open();

			SqlCommand cmd1 = new SqlCommand("insert into Tbl_Out_Stock_Product (ProductId,ProductName,CatId,Catname,Qty,IssueType,IssueTo,IssueTime,ReturnDate,EntryTime,UpdateTime,Uid,Status)values(" + DropDownProductName.SelectedItem.Value + ", '" + DropDownProductName.SelectedItem.Text + "'," + DropDownCat.SelectedItem.Value + ", '" + DropDownCat.SelectedItem.Text + "'," + txtQty.Text + ",'"+DropDownIssueType.SelectedValue+"','"+txtIssuseTo.Text+"','"+calenderDate.SelectedDate+"',GETDATE(),GETDATE(), GETDATE(), 1, 1)", conn);
			cmd1.ExecuteNonQuery();
			conn.Close();
			showAllData();
			//Label5.Visible = true;
			//Label5.Text = "Add successfully";
		}

		
		protected void UpdateInStock()
		{
			int oldNetQty = Convert.ToInt32(lbInStock.Text);
			int NewNetQty = Convert.ToInt32(txtQty.Text);
			int TotalNetQty = oldNetQty - NewNetQty;

			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			conn.Open();
			SqlCommand cmd = new SqlCommand("UPDATE Tbl_InStock_Product SET Qty="+TotalNetQty+" WHERE ProductId=" + DropDownProductName.SelectedItem.Value+" and CatId="+DropDownCat.SelectedItem.Value+";", conn);			
			cmd.ExecuteNonQuery();
			conn.Close();
			showAllData();
		}

		protected void DropDownProductName_TextChanged(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("select sum(Qty)as Qty from  Tbl_InStock_Product  WHERE ProductId=" + DropDownProductName.SelectedValue+" and CatId="+DropDownCat.SelectedValue+";"))
			{
				cmd.Connection = conn;
				conn.Open();
				using (SqlDataReader sdr = cmd.ExecuteReader())
				{
					sdr.Read();
					lbInStock.Text = sdr["Qty"].ToString();
				}
				conn.Close();
			}
		}
	}
}