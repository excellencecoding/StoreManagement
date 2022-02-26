using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StoreManagement
{
	public partial class STR_Master : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			lb1.Text = "<b><font color=Brown>" + "User ID:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";

		}

		protected void logoutBTN_Click(object sender, EventArgs e)
		{
			Session.Abandon();
			Session.Remove("UserName");
			Response.Redirect("~/index.aspx");
		}
	}
}