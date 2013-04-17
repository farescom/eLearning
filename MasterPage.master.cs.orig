using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Connection to databse
        SqlConnection conn;
        using(conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Random opinion ----------------------------------------------------------------------------------------
            SqlCommand command = new SqlCommand("SELECT count(*) FROM Ratings WHERE acceptance = 1", conn);
            int count = (int)command.ExecuteScalar();

            Random rand = new Random();
            int randomNumber = rand.Next(0, count);

            command.CommandText = "SELECT ID FROM Ratings WHERE acceptance = 1";
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            da.Fill(dt);

            command.CommandText = String.Format("SELECT * FROM Ratings WHERE ID = {0}", dt.Rows[randomNumber][0]);
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();

            RandOpinionDesc.InnerText = reader.GetString(4);
            RandOpinionAuthor.InnerText = reader.GetString(1);
            reader.Close();
            // -------------------------------------------------------------------------------------------------------

            // User Info ----------------------------------------------------------------------------------------
            //command.CommandText = String.Format("SELECT * FROM Users WHERE username = {0}", LoginName);
            //reader = command.ExecuteReader();
            //reader.Read();


            //LoginName name = (LoginName)LoginView1.FindControl("LoginName2");
            //name.
            //LoginView1.LoggedInTemplate.
	    Debug.WriteLine(LoginView1.FindControl("UserInfo").ClientID);`
            }
            
            // -------------------------------------------------------------------------------------------------------

        }
    }

    // displays a menu containing only top-level item.
    public void display_menu()
    {
        Response.Write("<li><a href=\"" + SiteMap.RootNode.Url + "\">" + SiteMap.RootNode.Title + "</a></li>");
        int i = 0;
        for (; i < SiteMap.RootNode.ChildNodes.Count - 1; i++)
        {
            Response.Write("<li><a href=\"" + SiteMap.RootNode.ChildNodes[i].Url
                + "\">" + SiteMap.RootNode.ChildNodes[i].Title + "</a></li>");
        }
        Response.Write("<li class=\"end\"><a href=\""
            + SiteMap.RootNode.ChildNodes[i].Url + "\">"
            + SiteMap.RootNode.ChildNodes[i].Title + "</a></li>");
    }

    // decided whether it is a Default (main) page, or another page
    // The header depends on the result of this function
    public void header_shape()
    {
        if (SiteMap.CurrentNode != null)
        {
            String url = SiteMap.CurrentNode.Url;
            if (url.IndexOf("Default.aspx") != -1)
                Response.Write("page1");
            else
                Response.Write("page2");
        }
        else
                Response.Write("page2");
    }

    // decided whether it is a Default (main) page, or another page
    // Depending on the result of this function, the login box could be shown or not
    public void login_apperance()
    {
        if (SiteMap.CurrentNode != null)
        {
            String url = SiteMap.CurrentNode.Url;
            if (url.IndexOf("Default.aspx") == -1)
                Response.Write("hidden");
            else
                Response.Write("not-hidden");
        }
        else
            Response.Write("hidden");
    }

    public void path_apperance()
    {
        if (SiteMap.CurrentNode != null)
            Response.Write("not-hidden");
        else
            Response.Write("hidden");       // because we won't be able to identify this page from SiteMap
    }

    // decided whether it is a Default (main) page, or another page
    // The header depends on the result of this function
    public void header_banners()
    {
        if (SiteMap.CurrentNode != null && SiteMap.CurrentNode.Url.IndexOf("Default.aspx") != -1)
        {
            Response.Write(
                "<ul class=\"banners\">" +
                "<li><a href=\"about.aspx\"><img src=\"images/about.jpg\" alt=\"\"></a></li>" +
                "<li><a href=\"register.aspx\"><img src=\"images/register.jpg\" alt=\"\"></a></li>" +
                "<li><a href=\"contact.aspx\"><img src=\"images/contact.jpg\" alt=\"\"></a></li>" +
                "</ul>");
        }
    }
}