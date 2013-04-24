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
using System.Diagnostics;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowEditing(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index =  GridView1.EditIndex;
        GridViewRow row = GridView1.Rows[index];

        e.NewValues["birthday"] = ((TextBox)row.FindControl("BirthdayTextBox")).Text;
    }

    
}