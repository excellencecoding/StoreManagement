using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace StoreManagement.STF
{
	public partial class STF_AddProductPartyWish : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
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
		protected void DropDownCat_TextChanged(object sender, EventArgs e)
		{
			DropDownProductName.Enabled = false;
			DropDownProductName.Items.Clear();
			DropDownProductName.Items.Insert(0, new ListItem("Select Product Name", "0"));
			int CategoryID = int.Parse(DropDownCat.SelectedItem.Value);
			if (CategoryID > 0)
			{
				//select pid,FinalNameProduct from Tbl_addProduct where CategoryID=2
				string query = string.Format("select pid, FinalNameProduct from Tbl_addProduct where CategoryID= {0}", CategoryID);
				BindDropDownList(DropDownProductName, query, "FinalNameProduct", "pid", "Select Product"); //bind next Drop down list 
				DropDownProductName.Enabled = true;
			}
						
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

			conn.Open();

			SqlCommand cmd = new SqlCommand("insert into Tbl_addProductPartWish(ProductID,productName, CategoryID, CategoryName, PartyId, PartyName, EntryTime, UpdateTime, Uid, Status)values(" + DropDownProductName.SelectedItem.Value + ",'" + DropDownProductName.SelectedItem.Text + "'," + DropDownCat.SelectedItem.Value + ", '" + DropDownCat.SelectedItem.Text + "',"+DropDownPartylist.SelectedValue+",'"+DropDownPartylist.SelectedItem.Text+"',GETDATE(), GETDATE(),1,1)", conn);
			//SqlCommand cmd = new SqlCommand("insert into Tbl_addProduct (,ProductName,ModelNo,Size,Make,CategoryID,CategoryName,FinalNameProduct,EntryTime,UpdateTime,Status,Uid)values('" + txtProductName.Text + "', '" + txtModelNo.Text + "', '" + txtSize.Text + "', '" + txtMake.Text + "',  '" + txtProductName.Text + " " + txtModelNo.Text + " " + txtSize.Text + " " + txtMake.Text + "', GETDATE(), GETDATE(),1,1)", conn);

			cmd.ExecuteNonQuery();

			conn.Close();
			showAllData();
			Label5.Visible = true;
			Label5.Text = "Add successfully";
			


		}

		protected void showAllData()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("select distinct productName,CategoryName,PartyName from Tbl_addProductPartWish"))
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




	}
}