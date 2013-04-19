using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void Register(object sender, EventArgs e)
    {
        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // Get data from the form
        String UserName2 = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text;
        String FirstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FirstName")).Text;
        String Surname = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Surname")).Text;
        String Birthdate = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Birthdate")).Text;
        String Country = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Country")).Text;
        String City = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("City")).Text;
        String PostCode = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("PostCode")).Text;
        String Address = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Address")).Text;
        String Sex = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Sex")).SelectedItem.Text;
        String LearningMode = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("LearningMode")).SelectedItem.Text;
        String Code = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Code")).Text;
        int Sex_number = 0;
        int LearningMode_number = 0;
        int code_id = 0;
        String role = "Registered";
        String UserId;

        // Proccessing Sex
            if (Sex.Equals("Male")) Sex_number = 0;
            else Sex_number = 1;

        // Proccessing LearningMode
            if (LearningMode.Equals("Linear")) LearningMode_number = 0;
            else LearningMode_number = 1;

        // Proccessing Birthdate
            char[] dateSeparators = new char[2];
            dateSeparators[0] = '/';
            dateSeparators[1] = '-';
            string[] dateArray = Birthdate.Split(dateSeparators);
            DateTime dt = new DateTime(Convert.ToInt32(dateArray[2]), Convert.ToInt32(dateArray[1]), Convert.ToInt32(dateArray[0]));

        // Proccessing UserId
            string sqlStr = "SELECT TOP 1 UserId FROM aspnet_Users WHERE UserName = '" + UserName2 + "' ORDER BY LastActivityDate DESC";
            // we will get the user with this login that was created last time.
            con.Open();
            SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
            Guid result = (Guid)sqlCmd.ExecuteScalar();
            UserId = result.ToString();

        // Proccessing activation code and role
            sqlStr = "SELECT id FROM Codes where code = @code";
            sqlCmd = new SqlCommand(sqlStr, con);
            sqlCmd.Parameters.AddWithValue("@code", Code);

            Object o = sqlCmd.ExecuteScalar();
            if (o != null)
            {
                code_id = (int)o;
                sqlStr = "SELECT valid FROM Codes where id = " + code_id;
                sqlCmd = new SqlCommand(sqlStr, con);
                byte valid = (byte)sqlCmd.ExecuteScalar();
                if (valid == 0)
                {
                    role = "Registered";
                    code_id = 0;
                }
                else
                {
                    role = "Active";
                    // modifying Codes table, so that this activation code coudn't be used again
                    sqlStr = "UPDATE Codes SET valid = 0 where id = " + code_id;
                    sqlCmd = new SqlCommand(sqlStr, con);
                    sqlCmd.ExecuteNonQuery();
                }
            }
            //con.Close();

            Roles.AddUserToRole(CreateUserWizard1.UserName, role);
            //Page.ClientScript.RegisterStartupScript(GetType(), Code + "msgbox" , "alert('" + Code + " " + code_id + "');", true);

        // The SQL statement to insert user data. By using prepared statements, we automatically get some protection against SQL injection.
        sqlStr = "INSERT INTO users (id, firstname, surname, sex, birthday, country, " +
                            "city, postcode, address, jump_posibility, code_id)" +
                            "VALUES (@id, @firstname, @surname, @sex, @birthday, @country, " +
                            "@city, @postcode, @address, @jump_posibility, @code_id)";

        // Open the database connection
        //con.Open();

        // Create an executable SQL command containing our SQL statement and the database connection
        sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@id", UserId);
        sqlCmd.Parameters.AddWithValue("@firstname", FirstName);
        sqlCmd.Parameters.AddWithValue("@surname", Surname);
        sqlCmd.Parameters.AddWithValue("@sex", Sex_number);
        sqlCmd.Parameters.AddWithValue("@birthday", dt);
        sqlCmd.Parameters.AddWithValue("@country", Country);
        sqlCmd.Parameters.AddWithValue("@city", City);
        sqlCmd.Parameters.AddWithValue("@postcode", PostCode);
        sqlCmd.Parameters.AddWithValue("@address", Address);
        sqlCmd.Parameters.AddWithValue("@jump_posibility", LearningMode_number);
        sqlCmd.Parameters.AddWithValue("@code_id", code_id);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();
    }
}