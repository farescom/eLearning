using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Web.Security;
using System.Web.UI.DataVisualization.Charting;


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

            // Receive opinions ----------------------------------------------------------------------------------------
            SqlCommand command = new SqlCommand("SELECT receive_opinions FROM Settings", conn);
            byte receive = (byte)command.ExecuteScalar();
            if (receive == 1) LinkButton1.Attributes.Add("style", "display: block; cursor: pointer;");

            // Show opinions ----------------------------------------------------------------------------------------
            command.CommandText = "SELECT show_opinions FROM Settings";
            byte show = (byte)command.ExecuteScalar();

            if (show == 1)
            {
                OpinionBox.Attributes.Add("style", "display: block;");
                // Random opinions ----------------------------------------------------------------------------------------
                command.CommandText = "SELECT count(*) FROM Ratings WHERE acceptance = 1";
                int count = (int)command.ExecuteScalar();

                if (count != 0)
                {
                    Random rand = new Random();
                    int randomRows;
                    if (count == 1) randomRows = 1;
                    else if (count == 2) randomRows = 2;
                    else randomRows = 3;

                    command.CommandText = String.Format("SELECT TOP {0} * FROM Ratings WHERE acceptance = 1 ORDER BY NEWID()", randomRows);
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    for (int i = 0; i < randomRows; i++)
                    {
                        OwnControls_OpinionControl opinion = new OwnControls_OpinionControl(dt.Rows[i][4].ToString(), dt.Rows[i][1].ToString(), dt.Rows[i][3].ToString(), HttpContext.Current.Request.Url.AbsolutePath.IndexOf("user").ToString());
                        randomOpinions.Controls.Add(opinion);
                    }
                }
                else randomOpinions.InnerText = "Lack of opinions";
            }
        }
    }

    public void show_coursename()
    {
        //Connection to databse
        SqlConnection conn;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Random opinion ----------------------------------------------------------------------------------------
            SqlCommand command = new SqlCommand("SELECT coursename FROM Settings", conn);
            String coursename = (String)command.ExecuteScalar();

            Response.Write(HttpUtility.HtmlDecode(coursename));

        }
    }

    public void show_slogan()
    {
        //Connection to databse
        SqlConnection conn;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Random opinion ----------------------------------------------------------------------------------------
            SqlCommand command = new SqlCommand("SELECT slogan FROM Settings", conn);
            String slogan = (String)command.ExecuteScalar();

            Response.Write(HttpUtility.HtmlDecode(slogan));

        }
    }

    // displays a menu containing only top-level item.
    public void display_menu() 
    {
        string[] roleNames = Roles.GetRolesForUser();

        if (roleNames.Length != 0)
            Response.Write("<li><a href=\"/eLearning/user/Default.aspx\" >" + SiteMap.RootNode.Title + "</a></li>");
        else
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

    public void color_class()
    {
        if (SiteMap.CurrentNode != null)
            Response.Write("box1");
        else
            Response.Write("box2");
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

    protected void Chart1_Load(object sender, EventArgs e)
    {
        SqlConnection conn;
        using (conn = new SqlConnection())
        {

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();
            SqlCommand command1 = new SqlCommand("SELECT count(*) FROM Sections WHERE show=1", conn);
            int sections = (int)command1.ExecuteScalar();

            string UserId = Membership.GetUser().ProviderUserKey.ToString();
            SqlCommand command2 = new SqlCommand("SELECT count(*) FROM Done_sections WHERE userid = '" + UserId+"'", conn);
            int doneSections = (int)command2.ExecuteScalar();

            int[] yValues = { (sections - doneSections), doneSections };
            string[] xValues = new string[2];
            if (doneSections == 0)
            {
                xValues[0] = "Remained";
            }
            else
            {
                xValues[0] = "Remained";
                xValues[1] = "Done sections";
            }
            ((Chart)(LoginView1.FindControl("Chart1"))).Series["Default"].Points.DataBindXY(xValues, yValues);

            //LoginView1.FindControl("Chart1");.Series["Default"].Points[0].Color = Color.MediumSeaGreen;
            //LoginView1.FindControl("Chart1");.Series["Default"].Points[1].Color = Color.PaleGreen;
        }

    }

    protected void Prediction()
    {
        DateTime now;
        MembershipUser mu = Membership.GetUser(HttpContext.Current.User.Identity.Name);
        DateTime date = mu.CreationDate;
        now = DateTime.Now;
        SqlConnection conn;
        int sections;
        int doneSections;
        using (conn = new SqlConnection())
        {

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();
            SqlCommand command1 = new SqlCommand("SELECT count(*) FROM Sections WHERE show=1", conn);
            sections = (int)command1.ExecuteScalar();

            SqlCommand command2 = new SqlCommand("SELECT count(*) FROM Done_sections", conn);
            doneSections = (int)command2.ExecuteScalar();
        }
        int sectionsToDo = sections - doneSections;
        int x = (int)(now - date).TotalDays;
        if (doneSections != 0)
        {
            int z = (x * sectionsToDo) / doneSections;
            DateTime finish = DateTime.Now.AddDays(z);
            Response.Write(finish);
        }
        else Response.Write("impossible to predict");
    }
}