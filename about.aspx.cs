using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void show_aboutus()
    {
        //Connection to databse
        SqlConnection conn;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Random opinion ----------------------------------------------------------------------------------------
            SqlCommand command = new SqlCommand("SELECT aboutus_content FROM Settings", conn);
            String aboutus = (String)command.ExecuteScalar();

            Response.Write(HttpUtility.HtmlDecode(aboutus));

        }
    }
    
}