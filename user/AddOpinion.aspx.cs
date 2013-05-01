using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;

public partial class AddOpinion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddOwnOpinion(object sender, EventArgs e)
    {
        SqlConnection conn;
        using (conn = new SqlConnection())
        {

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();
            String sqlStr = "INSERT INTO Ratings (username, date, rating, description, acceptance)" +
                            "VALUES (@username, @date, @rate, @desc, 0)";
            SqlCommand sqlCmd = new SqlCommand(sqlStr, conn);
            sqlCmd.Parameters.AddWithValue("@username", HttpContext.Current.User.Identity.Name);
            sqlCmd.Parameters.AddWithValue("@date", DateTime.Now);
            sqlCmd.Parameters.AddWithValue("@rate", Rating.CurrentRating);
            sqlCmd.Parameters.AddWithValue("@desc", TextBox1.Text);
            sqlCmd.ExecuteNonQuery();

            this.ClientScript.RegisterStartupScript(this.GetType(), "show", "<script>window.parent.document.getElementById('btnCancel').click();</script>");
        }
    }
}