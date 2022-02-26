using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace StoreManagement
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string strConnString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;        
        string str, UserName, Password;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;


		int RowCount;
        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConnString);
            conn.Open();
            str = "Select * from Tbl_LogIn";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, conn);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;
            for (int i = 0; i < RowCount; i++)
            {
                UserName = dt.Rows[i]["UserName"].ToString();
                Password = dt.Rows[i]["Password"].ToString();             
            
                Session["UserName"] = txtUserName.Text;
      

                if (UserName == txtUserName.Text && Password == txtPassword.Text)
                {
                    if (dt.Rows[i]["Role"].ToString() == "Admin")
                           Response.Redirect("~/STF/STF_Dashboard.aspx");
                    else if (dt.Rows[i]["Role"].ToString() == "StoreUser")
                        Response.Redirect("~/STR/STR_Dashboard.aspx");
                    else if (dt.Rows[i]["Role"].ToString() == "PaidUser")
                        Response.Redirect("~/PaidUser/PaidUser.aspx");
                }
                else
                {
                    lb1.Text = "Invalid User Name or Password! Please try again!";
                }
            }



        }
    }
}