using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            Debug.WriteLine("Before Session");
            Debug.WriteLine(HttpContext.Current.Session["UserID"].ToString());
            Debug.WriteLine("After Session");

            // Random opinion ----------------------------------------------------------------------------------------
            //SqlCommand command = new SqlCommand(String.Format("SELECT * FROM Users WHERE ID = {0}", ), conn);
            //SqlDataAdapter da = new SqlDataAdapter(command);
            //DataTable dt = new DataTable();
            //da.Fill(dt);

            //if (count != 0)
            //{
            //    Random rand = new Random();
            //    int randomNumber = rand.Next(0, count);

            //    command.CommandText = "SELECT ID FROM Ratings WHERE acceptance = 1";


            //    command.CommandText = String.Format("SELECT * FROM Ratings WHERE ID = {0}", dt.Rows[randomNumber][0]);
            //    SqlDataReader reader = command.ExecuteReader();
            //    reader.Read();

            //    RandOpinionDesc.InnerText = reader.GetString(4);
            //    RandOpinionAuthor.InnerText = reader.GetString(1);
            //    reader.Close();
            //}
            //else RandOpinionDesc.InnerText = "Brak opini";

        }
    }
}