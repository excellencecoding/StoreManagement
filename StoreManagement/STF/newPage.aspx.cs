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
	public partial class newPage : System.Web.UI.Page
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
			DropDownpPartyName.Enabled = false;
			DropDownProductName.Items.Clear();
			DropDownpPartyName.Items.Clear();
			DropDownProductName.Items.Insert(0, new ListItem("Select Product", "0"));
			DropDownpPartyName.Items.Insert(0, new ListItem("Select Party Name", "0"));
			int CategoryID = int.Parse(DropDownCat.SelectedItem.Value);
			if (CategoryID > 0)
			{
				//select pid,FinalNameProduct from Tbl_addProduct where CategoryID=2
				string query = string.Format("select pid,FinalNameProduct from Tbl_addProduct where CategoryID= {0}", CategoryID);
				BindDropDownList(DropDownProductName, query, "FinalNameProduct", "pid", "Select Product");
				DropDownProductName.Enabled = true;
			}
		}
	}
}