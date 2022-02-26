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
	public partial class STF_OldOrderRecode : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			showAllData();

			lbQty.Visible = false;
			lbPrice.Visible = false;
			Label1.Visible = false;
			Label2.Visible = false;

		}
		protected void showAllData()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("select * from Tbl_Order_Place"))
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

		protected void Button2_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("select ProductName,qty,	perUnitPrice,	totalPrice,	PartyName	,EntryDate from Tbl_Order_Place where orderId="+txtSearchNO.Text+""))
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

			using (SqlCommand cmd = new SqlCommand("SELECT sum(qty)as Qty,sum(totalPrice) as totalPrice FROM Tbl_Order_Place where orderId=" + txtSearchNO.Text + ""))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Connection = conn;
				conn.Open();
				using (SqlDataReader sdr = cmd.ExecuteReader())
				{
					sdr.Read();
					lbQty.Text = sdr["Qty"].ToString();
					lbPrice.Text = sdr["totalPrice"].ToString();
				}
				conn.Close();
			}

			lbQty.Visible = true;
			lbPrice.Visible = true;
			Label1.Visible = true;
			Label2.Visible = true;

		}



	}
}



