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
    public partial class DirectorDetails : System.Web.UI.Page
    {
        int directorId;
        protected void Page_Load(object sender, EventArgs e)
        {
            directorId = Request["directorId"] != null ? int.Parse(Request["directorId"]) : 0;
            if (directorId != 0)
            {
                GetRequestedDirector();
            }
        }

        private void GetRequestedDirector()
        {
            string CS = System.Configuration.ConfigurationManager.ConnectionStrings["MoviesListConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Director] WHERE Id = " + directorId, con);
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