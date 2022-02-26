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
	public partial class STF_LastOrder : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			lastOrderId();
			showAllData();
			qty();
			lbAmount.Visible = false;
			txtPayAmount.Visible = false;
			btnPayAmount.Visible = false;
		}

		protected void lastOrderId()
		{

			string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlConnection conn = new SqlConnection(constr))
			{
				using (SqlCommand cmd = new SqlCommand("select max(OrderId)as OrderId from [dbo].[Tbl_Temp_OrderId]"))
				{
					cmd.CommandType = CommandType.Text;
					cmd.Connection = conn;
					conn.Open();
					using (SqlDataReader sdr = cmd.ExecuteReader())
					{
						sdr.Read();
						txtMaxIdOrderId.Text = sdr["OrderId"].ToString(); 
					}
					conn.Close();
				}
			}
		}

		protected void qty()
		{

			string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlConnection conn = new SqlConnection(constr))
			{
				using (SqlCommand cmd = new SqlCommand("SELECT sum(qty)as Qty,sum(totalPrice) as totalPrice FROM Tbl_Order_Place where orderId=" + txtMaxIdOrderId.Text + ""))
				{
					cmd.CommandType = CommandType.Text;
					cmd.Connection = conn;
					conn.Open();
					using (SqlDataReader sdr = cmd.ExecuteReader())
					{
						sdr.Read();
						txtQty.Text = sdr["Qty"].ToString();
						txtTotalPrice.Text = sdr["totalPrice"].ToString();
					}
					conn.Close();
				}
			}
		}
		//SELECT sum(qty)as Qty,sum(totalPrice) as totalPrice FROM Tbl_Order_Place where orderId=





		protected void showAllData()
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("SELECT ProductName,qty	,perUnitPrice,totalPrice,PartyName FROM Tbl_Order_Place where orderId ='" + txtMaxIdOrderId.Text + "'"))
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

		protected void btnOrderShow_Click(object sender, EventArgs e)
		{
			//showAllData();
		}

		protected void DropDownPaymentMode_TextChanged(object sender, EventArgs e)
		{
			if (DropDownPaymentMode.Text == "0")
			{

			}
			if (DropDownPaymentMode.Text == "1")
			{
				lbAmount.Visible = true;
				txtPayAmount.Visible = true;
				btnPayAmount.Visible = true;
		
				
			}
			if (DropDownPaymentMode.Text == "2")
			{

			}

		}

		protected void btnPayAmount_Click(object sender, EventArgs e)
		{
			if(txtTotalPrice.Text == txtPayAmount.Text )
			{
				
			}
			else
			{

			}
		}
	}
}