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
	public partial class STF_AddProductCategory : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			showAllData();
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
         
                conn.Open();
              
                SqlCommand cmd = new SqlCommand("insert into Tbl_addCat(CatName,EntryTime,UpdateTime,Uid,Status)values('" + txtcate.Text + "',getdate(),getdate(),1,1);", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Label5.Visible = true;
                Label5.Text = "Add successfully";
			showAllData();



		}

        protected void showAllData()
		{
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand("select CatName from Tbl_addCat"))
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
