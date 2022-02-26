using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace StoreManagement.STF
{
	public partial class STF_OrderItem : System.Web.UI.Page
	{
		
		protected void Page_Load(object sender, EventArgs e)
		{

			
			if (!IsPostBack)
			{
				string query = "select cid, CatName from Tbl_addCat";
				BindDropDownList(DropDownCat, query, "CatName", "cid", "Select Category");
				DropDownProductName.Enabled = false;
				DropDownpPartyName.Enabled = false;
				DropDownProductName.Items.Insert(0, new ListItem("Select Product", "0"));
				DropDownpPartyName.Items.Insert(0, new ListItem("Select Party Name", "0"));
			}
			


			if (!this.IsPostBack)
			{
				DataTable dt = new DataTable();
				dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Or.No"),new DataColumn("Product Name"), new DataColumn("Qty"), new DataColumn("Per Unit Price"), new DataColumn("SubTotal"), new DataColumn("Party Name") });
				//dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Qty"), new DataColumn("Per Unit Price"), new DataColumn("SubTotal") });
				ViewState["orderList"] = dt;
				this.BindGrid();
			}

			ProductIdmax();
			btnOrderNow.Visible = false;


		}

		protected void ProductIdmax()
		{

			string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlConnection conn = new SqlConnection(constr))
			{
				using (SqlCommand cmd = new SqlCommand("select max(OrderId+1) as OrderId from Tbl_Temp_OrderId"))
				{
					cmd.CommandType = CommandType.Text;
					cmd.Connection = conn;
					conn.Open();
					using (SqlDataReader sdr = cmd.ExecuteReader())
					{
						sdr.Read();
						txtMaxIdOrderId.Text = sdr["OrderId"].ToString(); ;
					}
					conn.Close();
				}
			}
		}

		protected void btnOrderNow_Click(object sender, EventArgs e)
		{

			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

			foreach (GridViewRow gr in GridView2.Rows)
			{
				conn.Open();
				SqlCommand cmd = new SqlCommand("insert into Tbl_Order_Place (orderId,ProductName,qty,perUnitPrice,totalPrice,PartyName)values(" + gr.Cells[1].Text+",N'" + gr.Cells[2].Text+ "'," + gr.Cells[3].Text + "," + gr.Cells[4].Text + "," + gr.Cells[5].Text + ",'" + gr.Cells[6].Text + "')", conn);
				cmd.ExecuteNonQuery();
				conn.Close();
			}
			conn.Open();
			SqlCommand cmd1 = new SqlCommand("insert into Tbl_Temp_OrderId (OrderId,entryDate,updateDate,status, Uid)values("+txtMaxIdOrderId.Text+",getdate(),getdate(),1,1)", conn);
			cmd1.ExecuteNonQuery();
			conn.Close();
			

			Response.Redirect("~/STF/STF_LastOrder.aspx");
		}


		public void SaveRecode()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

			conn.Open();

			//SqlCommand cmd = new SqlCommand("insert into Tbl_OrderItem(CategoryID,CategoryName,productID,ProductName,partyid,partyName,Orderdate,Qty,perUnitPrice,TotalPrice,PaymentType,PayAmount,blanceAmount,Massage,EntryDate,uid)values(" + DropDownCat.SelectedItem.Value + ",'" + DropDownCat.SelectedItem.Text + "'," + DropDownProductName.SelectedItem.Value + ",'" + DropDownProductName.SelectedItem.Text + "'," + DropDownpPartyName.SelectedItem.Value + ",'" + DropDownpPartyName.SelectedItem.Text + "','" + txtDate.Text + "'," + txtQty.Text + "," + txtPerUnit.Text + "," + txtTotalPrice.Text + ",'" + DropDownPaymentType.Text + "'," + txtPayAmount.Text + ",00,'" + TextBox1.Text + "',GETDATE(),1)", conn);
			//SqlCommand cmd = new SqlCommand("insert into Tbl_OrderItem(CategoryID,CategoryName,productID,ProductName,partyid,partyName,Orderdate,Qty,perUnitPrice,TotalPrice,PaymentType,PayAmount,blanceAmount,Massage,EntryDate,UpdateTime,Uid,Status)values(" + DropDownCat.SelectedItem.Value + ",'" + DropDownCat.SelectedItem.Text + "'," + DropDownProductName.SelectedItem.Value + ",'" + DropDownProductName.SelectedItem.Text + "'," + DropDownpPartyName.SelectedItem.Value + ",'" + DropDownpPartyName.SelectedItem.Text + "','" + CalendarDate.SelectedDate.Date + "'," + txtQty.Text + "," + txtPerUnit.Text + "," + txtTotalPrice.Text + ",'" + DropDownPaymentType.Text + "',00.00,00.00,'massages inthre box ',GETDATE(), GETDATE(),1,1);", conn);
			SqlCommand cmd = new SqlCommand("insert into Tbl_OrderItem(CategoryID,CategoryName,productID,ProductName,partyid,partyName,Orderdate,Qty,perUnitPrice,TotalPrice,PaymentType,PayAmount,blanceAmount,Massage,EntryDate,UpdateTime,Uid,Status)values(" + DropDownCat.SelectedItem.Value + ",'" + DropDownCat.SelectedItem.Text + "'," + DropDownProductName.SelectedItem.Value + ",'" + DropDownProductName.SelectedItem.Text + "'," + DropDownpPartyName.SelectedItem.Value + ",'" + DropDownpPartyName.SelectedItem.Text + "','" + CalendarDate.SelectedDate.Date + "'," + txtQty.Text + "," + txtPerUnit.Text + "," + txtTotalPrice.Text + ",'dummy',00.00,00.00,'massages inthre box ',GETDATE(), GETDATE(),1,1);", conn);
			cmd.ExecuteNonQuery();
			conn.Close();
			Label12.Visible = true;
			Label12.Text = "Order Place successfully";
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

		protected void DropDownCat_TextChanged(object sender, EventArgs e)
		{
			//DropDownProductName.Enabled = false;
			//DropDownpPartyName.Enabled = false;
			//DropDownProductName.Items.Clear();
			//DropDownpPartyName.Items.Clear();
			//DropDownProductName.Items.Insert(0, new ListItem("Select Product", "0"));
			//DropDownpPartyName.Items.Insert(0, new ListItem("Select Party Name", "0"));
			//int CategoryID = int.Parse(DropDownCat.SelectedItem.Value);
			//if (CategoryID > 0)
			//{
			//	//select pid,FinalNameProduct from Tbl_addProduct where CategoryID=2
			//	string query = string.Format("select DISTINCT pid,FinalNameProduct from Tbl_addProduct where CategoryID= {0}", CategoryID);
			//	BindDropDownList(DropDownProductName, query, "FinalNameProduct", "pid", "Select Product");
			//	DropDownProductName.Enabled = true;
			//}

			DropDownProductName.Enabled = false;
			DropDownpPartyName.Enabled = false;
			DropDownProductName.Items.Clear();
			DropDownpPartyName.Items.Clear();
			DropDownProductName.Items.Insert(0, new ListItem("Select Product", "0"));
			DropDownpPartyName.Items.Insert(0, new ListItem("Select Party Name", "0"));
			int CategoryID = int.Parse(DropDownCat.SelectedItem.Value);
			if (CategoryID > 0)
			{
				//select pid,FinalNameProduct from Tbl_addProduct where CategoryID=2
				string query = string.Format("select DISTINCT ProductID,productName from Tbl_addProductPartWish where CategoryID= {0}", CategoryID);
				BindDropDownList(DropDownProductName, query, "productName", "ProductID", "Select Product");
				DropDownProductName.Enabled = true;
			}
			
		}

		protected void DropDownProductName_TextChanged(object sender, EventArgs e)
		{
			DropDownpPartyName.Enabled = false;
			DropDownpPartyName.Items.Clear();
			DropDownpPartyName.Items.Insert(0, new ListItem("Select Party Name", "0"));
			string ProductID = DropDownProductName.SelectedItem.Value;			
				string query = string.Format("select DISTINCT PartyID, productName, PartyName from Tbl_addProductPartWish where ProductID ={0}", ProductID);			
				BindDropDownList(DropDownpPartyName, query, "PartyName", "PartyID", "Select Party Name");
				DropDownpPartyName.Enabled = true;
			
		}

		protected void txtTotalPrice_TextChanged(object sender, EventArgs e)
		{
			//TxtCalMoney();
		}

		public void TxtCal()
		{
			int t1, t2;
			bool b1 = int.TryParse(txtQty.Text, out t1);
			bool b2 = int.TryParse(txtPerUnit.Text, out t2);

			if(b1 && b2)
			{
				txtTotalPrice.Text = (t1 * t2).ToString();
			}
			else
			{
				txtTotalPrice.Text = "Worng input !!!";
			}

		}
		//public void TxtCalMoney()
		//{
		//	int t3,t4;
		//	bool b3 = int.TryParse(txtTotalPrice.Text, out t3);
		//	bool b4 = int.TryParse(txtPayAmount.Text, out t4);

		//	if (b3 && b4)
		//	{
		//		txtBalanceAmount.Text = (t3 - t4).ToString();
		//	}
		//	else
		//	{
		//		txtBalanceAmount.Text = "Worng input !!!";
		//	}

		//}



		protected void txtQty_TextChanged(object sender, EventArgs e)
		{
			TxtCal();
		}

		protected void txtPerUnit_TextChanged(object sender, EventArgs e)
		{
			TxtCal();
		}

		protected void txtBalanceAmount_TextChanged(object sender, EventArgs e)
		{
			//TxtCalMoney();
		}

		protected void BindGrid()
		{
			GridView2.DataSource = (DataTable)ViewState["orderList"];
			GridView2.DataBind();
		

		}
	
		protected void Insert(object sender, EventArgs e)
		{
			DataTable dt = (DataTable)ViewState["orderList"];
			dt.Rows.Add(txtMaxIdOrderId.Text.Trim(),DropDownProductName.SelectedItem.Text.Trim(), txtQty.Text.Trim(), txtPerUnit.Text.Trim(),txtTotalPrice.Text.Trim(), DropDownpPartyName.SelectedItem.Text.Trim());
		//	dt.Rows.Add( txtQty.Text.Trim(), txtPerUnit.Text.Trim(),txtTotalPrice.Text.Trim());
			ViewState["orderList"] = dt;
			this.BindGrid();
			txtQty.Text = string.Empty;
			txtPerUnit.Text = string.Empty;
			txtTotalPrice.Text = string.Empty;
		
		}

		protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				string item = e.Row.Cells[0].Text;
				foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
				{
					if (button.CommandName == "Delete")
					{
						button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
					}
				}
			}
		}

		protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			int index = Convert.ToInt32(e.RowIndex);
			DataTable dt = ViewState["orderList"] as DataTable;
			dt.Rows[index].Delete();
			ViewState["orderList"] = dt;
			BindGrid();

		}
		
		protected void Button1_Click(object sender, EventArgs e)
		{
			btnOrderNow.Visible = true;
			Button1.BackColor = System.Drawing.Color.Green;
			Button1.ForeColor = System.Drawing.Color.White;
		}

		
	}
}
