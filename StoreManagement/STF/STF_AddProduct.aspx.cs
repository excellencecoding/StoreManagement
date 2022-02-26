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
	public partial class STF_AddProduct : System.Web.UI.Page
	{
		String constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			showAllData();
			//productCatList();
			ProductIdmax();

		}

	protected void ProductIdmax()
		{
			
				string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
				using (SqlConnection conn = new SqlConnection(constr))
				{
					using (SqlCommand cmd = new SqlCommand("select max(pid+1) as ProductId from [dbo].[Tbl_addProduct]"))
					{
						cmd.CommandType = CommandType.Text;
						cmd.Connection = conn;
						conn.Open();
						using (SqlDataReader sdr = cmd.ExecuteReader())
						{
							sdr.Read();
							txtMaxIdProduct.Text = sdr["ProductId"].ToString(); ;
						}
						conn.Close();
					}
				}
			

			
			
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			
			
			saverecode();
			showAllData();

		}
		
		protected void saverecode()
		{
			string txtMaxIdProduct1 = "1";
			if (txtMaxIdProduct.Text == "")
			{

				 txtMaxIdProduct.Text= txtMaxIdProduct1.ToString();

				SqlConnection conn = new SqlConnection();
				conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

				conn.Open();

				SqlCommand cmd = new SqlCommand("insert into Tbl_addProduct (ProductName,ModelNo,Size,Make,CategoryID,CategoryName,FinalNameProduct,EntryTime,UpdateTime,Status,Uid)values('" + txtProductName.Text + "', '" + txtModelNo.Text + "', '" + txtSize.Text + "', '" + txtMake.Text + "', " + DropDownCat.SelectedItem.Value + ", '" + DropDownCat.SelectedItem.Text + "', '" + txtProductName.Text + " " + txtModelNo.Text + " " + txtSize.Text + " " + txtMake.Text + "', GETDATE(), GETDATE(),1,1)", conn);
				SqlCommand cmd1 = new SqlCommand("insert into Tbl_addProductPartWish(ProductID,productName, CategoryID, CategoryName, PartyId, PartyName, EntryTime, UpdateTime, Uid, Status)values(" + txtMaxIdProduct1 + ",'" + txtProductName.Text + " " + txtModelNo.Text + " " + txtSize.Text + " " + txtMake.Text + "'," + DropDownCat.SelectedItem.Value + ", '" + DropDownCat.SelectedItem.Text + "'," + DropDownPartyListName.SelectedValue + ",'" + DropDownPartyListName.SelectedItem.Text + "',GETDATE(), GETDATE(),1,1)", conn);
				cmd.ExecuteNonQuery();
				cmd1.ExecuteNonQuery();
				conn.Close();
				Label5.Visible = true;
				Label5.Text = "Add successfully";

			}
			else
			{
				SqlConnection conn = new SqlConnection();
				conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

				conn.Open();

				SqlCommand cmd = new SqlCommand("insert into Tbl_addProduct (ProductName,ModelNo,Size,Make,CategoryID,CategoryName,FinalNameProduct,PartyID,PartyName,EntryTime,UpdateTime,Status,Uid)values('" + txtProductName.Text + "', '" + txtModelNo.Text + "', '" + txtSize.Text + "', '" + txtMake.Text + "', " + DropDownCat.SelectedItem.Value + ", '" + DropDownCat.SelectedItem.Text + "', '" + txtProductName.Text + " " + txtModelNo.Text + " " + txtSize.Text + " " + txtMake.Text + "',"+DropDownPartyListName.SelectedValue+",'"+DropDownPartyListName.SelectedItem.Text+"',GETDATE(), GETDATE(),1,1)", conn);
				//SqlCommand cmd = new SqlCommand("insert into Tbl_addProduct(CategoryID,CategoryName,FinalNameProduct,Partyid,PartyName,EntryTime,UpdateTime,Uid,Status)values("+DropDownCat.SelectedValue+",'"+DropDownCat.SelectedItem.Text+ "','" + txtProductName.Text + " " + txtModelNo.Text + " " + txtSize.Text + " " + txtMake.Text + "'," + DropDownPartyListName.SelectedValue+",'"+DropDownPartyListName.SelectedItem.Text+"',GETDATE(),GETDATE(),1,1)", conn);
				SqlCommand cmd1 = new SqlCommand("insert into Tbl_addProductPartWish(ProductID,productName, CategoryID, CategoryName, PartyId, PartyName, EntryTime, UpdateTime, Uid, Status)values(" + txtMaxIdProduct.Text + ",'" + txtProductName.Text + " " + txtModelNo.Text + " " + txtSize.Text + " " + txtMake.Text + "'," + DropDownCat.SelectedItem.Value + ", '" + DropDownCat.SelectedItem.Text + "'," + DropDownPartyListName.SelectedValue + ",'" + DropDownPartyListName.SelectedItem.Text + "',GETDATE(), GETDATE(),1,1)", conn);
				cmd.ExecuteNonQuery();
				cmd1.ExecuteNonQuery();
				conn.Close();
				Label5.Visible = true;
				Label5.Text = "Add successfully";
			}
			
		}
		
		protected void showAllData()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			///using (SqlCommand cmd = new SqlCommand("select FinalNameProduct,CategoryName from Tbl_addProduct order by pid desc"))
			using (SqlCommand cmd = new SqlCommand("select pid,FinalNameProduct,CategoryName,PartyName from Tbl_addProduct order by pid desc"))
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

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridViewRow gr = GridView1.SelectedRow;
			txtDeleteId.Text = gr.Cells[0].Text;
		}

		protected void btnDelete_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

			conn.Open();

			SqlCommand cmd = new SqlCommand("delete from Tbl_addProduct where pid="+txtDeleteId.Text+"", conn);
		
			cmd.ExecuteNonQuery();
			conn.Close();
			Response.Write("<Script>alert('Recode Delete' )</Script>");
		}
	}
}