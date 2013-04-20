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

            if (count != 0)
            {
                Random rand = new Random();
                int randomRows;
                if(count == 1) randomRows = 1;
                else if(count == 2) randomRows = 2;
                else randomRows = 3;

                command.CommandText = String.Format("SELECT TOP {0} * FROM Ratings WHERE acceptance = 1 ORDER BY NEWID()", randomRows);
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                da.Fill(dt);

                for (int i = 0; i < randomRows; i++)
                {
                    randomOpinions.InnerHtml += "<div class='RandOpinionDesc'><img style='margin-right: 10px;' src='images/quot1.gif' />" + dt.Rows[i][4] + "<img style='margin-left: 15px;' src='images/quot1.gif' /></div>" +
                        "<div class='RandOpinionAuthor'>" + dt.Rows[i][1] + "</div>";
                }
            }
            else randomOpinions.InnerText = "Brak opini";
            
            // -------------------------------------------------------------------------------------------------------

            // User Info ----------------------------------------------------------------------------------------
            //if (HttpContext.Current.User.Identity.Name != null)
            //{
            //    command.CommandText = String.Format("SELECT * FROM Users WHERE username = {0}", HttpContext.Current.User.Identity.Name);
            //    reader = command.ExecuteReader();
            //    reader.Read();

            //    //LoginName name = (LoginName)LoginView1.FindControl("LoginName2");
            //    //name.
            //    //LoginView1.LoggedInTemplate.
            //    Debug.WriteLine(LoginView1.FindControl("UserInfo").ClientID);
            //}
            
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