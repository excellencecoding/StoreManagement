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
	public partial class dropdownlist : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                string query = "select CountryId, CountryName from Countries";
                BindDropDownList(ddlCountries, query, "CountryName", "CountryId", "Select Country");
                ddlStates.Enabled = false;
                ddlCities.Enabled = false;
                ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
                ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
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

		protected void ddlCountries_TextChanged(object sender, EventArgs e)
		{
            
                ddlStates.Enabled = false;
                ddlCities.Enabled = false;
                ddlStates.Items.Clear();
                ddlCities.Items.Clear();
                ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
                ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
                int countryId = int.Parse(ddlCountries.SelectedItem.Value);
                if (countryId > 0)
                {
                    string query = string.Format("select StateId, StateName from States where CountryId = {0}", countryId);
                    BindDropDownList(ddlStates, query, "StateName", "StateId", "Select State");
                    ddlStates.Enabled = true;
                }
         }

		protected void ddlStates_TextChanged(object sender, EventArgs e)
		{
            ddlCities.Enabled = false;
            ddlCities.Items.Clear();
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));
            int stateId = int.Parse(ddlStates.SelectedItem.Value);
            if (stateId > 0)
            {
                string query = string.Format("select CityId, CityName from Cities where StateId = {0}", stateId);
                BindDropDownList(ddlCities, query, "CityName", "CityId", "Select City");
                ddlCities.Enabled = true;
            }
        }
	}
}