using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.IO;
using System.Xml.Linq;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    // the method redirect admins, active and registered users to their own folders.
    // the not-logged users will still remain on the main Default.aspx site.
    public void redirect_logged_users()
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            string[] rolesuserbelongto = Roles.GetRolesForUser();
            if (rolesuserbelongto.Length != 0)
            {
                if (rolesuserbelongto[0].Equals("Admin")
                    || rolesuserbelongto[0].Equals("Registered")
                    || rolesuserbelongto[0].Equals("Active"))
                    Response.Write("<meta HTTP-EQUIV=\"REFRESH\" content=\"0; url=user/Default.aspx\">");
            }
        }
    }

    protected void show_startpage()
    {
        //Connection to databse
        SqlConnection conn;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Random opinion ----------------------------------------------------------------------------------------
            SqlCommand command = new SqlCommand("SELECT startpage_content FROM Settings", conn);
            String startpage = (String)command.ExecuteScalar();

            Response.Write(HttpUtility.HtmlDecode(startpage));

        }
    }
}