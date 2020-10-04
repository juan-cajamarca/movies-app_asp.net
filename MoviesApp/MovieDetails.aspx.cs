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
    public partial class MovieDetails : System.Web.UI.Page
    {
        int movieId;
        protected void Page_Load(object sender, EventArgs e)
        {
            movieId = Request["movieId"] != null ? int.Parse(Request["movieId"]) : 0;
            if (movieId != 0)
            {
                GetRequestedMovie();
            }
        }

        private void GetRequestedMovie()
        {
            string CS = System.Configuration.ConfigurationManager.ConnectionStrings["MoviesListConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Movie] WHERE Id = " + movieId, con);
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