using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MoviesApp
{
    public partial class CategoryDetails : System.Web.UI.Page
    {
        int categoryId;
        protected void Page_Load(object sender, EventArgs e)
        {
            categoryId = Request["categoryId"] != null ? int.Parse(Request["categoryId"]) : 0;
            if (categoryId != 0)
            {
                GetRequestCategory();
            }
        }

        private void GetRequestCategory()
        {
            string CS = System.Configuration.ConfigurationManager.ConnectionStrings["MoviesListConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Category] WHERE Id = " + categoryId, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                con.Open();
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();
            }
        }
    }
}