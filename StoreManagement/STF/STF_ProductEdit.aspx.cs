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
	public partial class STF_ProductEdit : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			showAllData();
		}
		protected void showAllData()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			///using (SqlCommand cmd = new SqlCommand("select FinalNameProduct,CategoryName from Tbl_addProduct order by pid desc"))
			using (SqlCommand cmd = new SqlCommand("select pID,FinalNameProduct,CategoryName,PartyName from Tbl_addProduct order by pid desc"))
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

		protected void btnupdate_Click(object sender, EventArgs e)
		{
			GridViewRow gr = GridView1.SelectedRow;
			txtProductName.Text = gr.Cells[1].Text;
		}

		protected void BtnSearch_Click(object sender, EventArgs e)
		{
			string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlConnection conn = new SqlConnection(constr))
			{
				using (SqlCommand cmd = new SqlCommand("select FinalNameProduct,CategoryName,PartyName from Tbl_addProduct where pID="+txtSearchno.Text+""))
				{
					cmd.CommandType = CommandType.Text;
					cmd.Connection = conn;
					conn.Open();
					using (SqlDataReader sdr = cmd.ExecuteReader())
					{
						sdr.Read();
						txtProductName.Text = sdr["FinalNameProduct"].ToString();
					}
					conn.Close();
				}
			}


			




		}
		protected void fillDropDown()
		{

			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			SqlCommand com = new SqlCommand("select CategoryID,CategoryName,PartyName,Partyid from Tbl_addProduct where pID=" + txtSearchno.Text + "", conn);
			// table name   
			SqlDataAdapter da = new SqlDataAdapter(com);
			DataSet ds = new DataSet();
			da.Fill(ds);  // fill dataset  
			DropDownCat.DataTextField = ds.Tables[0].Columns["CategoryName"].ToString(); // text field name of table dispalyed in dropdown       
			DropDownCat.DataValueField = ds.Tables[0].Columns["CategoryID"].ToString();
			// to retrive specific  textfield name   
			DropDownCat.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
			DropDownCat.DataBind();
		}
		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridViewRow gr = GridView1.SelectedRow;
			txtSearchno.Text = gr.Cells[0].Text;
		}
	}
}