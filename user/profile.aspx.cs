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

public partial class _Default : System.Web.UI.Page
{

    public void UpdateUser(object sender, EventArgs e)
    {
        
        ((LoginCancelEventArgs)e).Cancel = true;
        String Password = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Password")).Text;

        if (Membership.ValidateUser(HttpContext.Current.User.Identity.Name, Password))
        {
            // Gets the default connection string/path to our database from the web.config file
            string dbstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Creates a connection to our database
            SqlConnection con = new SqlConnection(dbstring);

            // Get data from the form

            String FirstName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Firstname")).Text;
            if (FirstName == "") FirstName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Firstname1")).Text;
            String Surname = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Surname")).Text;
            if (Surname == "") Surname = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Surname1")).Text;
            String Birthdate = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Birthdate")).Text;
            if (Birthdate == "") Birthdate = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Birthdate1")).Text;
            String Country = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Country")).Text;
            if (Country == "") Country = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Country1")).Text;
            String City = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("City")).Text;
            if (City == "") City = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("City1")).Text;
            String PostCode = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("PostCode")).Text;
            if (PostCode == "") PostCode = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("PostCode1")).Text;
            String Address = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Address")).Text;
            if (Address == "") Address = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Address1")).Text;
            String Email = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;
            if (Email == "") Email = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Email1")).Text;
            String Question = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Question")).Text;
            if (Question == "") Question = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Question1")).Text;
            String NewAnswer = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Answer")).Text;
            String NewPassword = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("NewPassword")).Text;
            String ConfirmNewPassword = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("ConfirmNewPassword")).Text;
            String Sex = ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Sex")).SelectedItem.Text;
            String LearningMode = ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl
("LearningMode")).SelectedItem.Text;
            String Code = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Code")).Text;
            if (Code == "") Code = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Code1")).Text;
            int Sex_number = 0;
            int LearningMode_number = 0;
            int CodeId = 0;
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
            DateTime dt = new DateTime(Convert.ToInt32(dateArray[0]), Convert.ToInt32(dateArray[1]), Convert.ToInt32(dateArray[2]));

            // Proccessing UserId
            string sqlStr = "SELECT TOP 1 UserId FROM aspnet_Users WHERE UserName = '" + HttpContext.Current.User.Identity.Name + "' ORDER BY LastActivityDate DESC";
            // we will get the user with this login that was created last time.
            con.Open();
            SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
            Guid result = (Guid)sqlCmd.ExecuteScalar();
            UserId = result.ToString();

            // Processing CodeId
            sqlStr = "SELECT id FROM Codes WHERE code = '" + Code + "' AND valid = 1 AND code != 'XXXX-XXXX'";
            sqlCmd.CommandText = sqlStr;
            try
            {
                CodeId = (int)sqlCmd.ExecuteScalar();
            }
            catch (NullReferenceException exp)
            {
                CodeId = 0;
            }

            if (CodeId != 0) Roles.AddUserToRole(HttpContext.Current.User.Identity.Name, "Active");

            // The SQL statement to insert user data. By using prepared statements, we automatically get some protection against SQL injection.
            sqlStr = "UPDATE users SET firstname = @firstname, surname = @surname, sex = @sex, birthday = @birthday, country = @country, " +
                                "city = @city, postcode = @postcode, address = @address, jump_posibility = @jump_posibility, code_id = @code " +
                                "WHERE id = @id";

            // Create an executable SQL command containing our SQL statement and the database connection
            sqlCmd.CommandText = sqlStr;

            // Fill in the parameters in our prepared SQL statement
            sqlCmd.Parameters.AddWithValue("@firstname", FirstName);
            sqlCmd.Parameters.AddWithValue("@surname", Surname);
            sqlCmd.Parameters.AddWithValue("@sex", Sex_number);
            sqlCmd.Parameters.AddWithValue("@birthday", dt);
            sqlCmd.Parameters.AddWithValue("@country", Country);
            sqlCmd.Parameters.AddWithValue("@city", City);
            sqlCmd.Parameters.AddWithValue("@postcode", PostCode);
            sqlCmd.Parameters.AddWithValue("@address", Address);
            sqlCmd.Parameters.AddWithValue("@jump_posibility", LearningMode_number);
            sqlCmd.Parameters.AddWithValue("@code", CodeId);
            sqlCmd.Parameters.AddWithValue("@id", UserId);

            // Execute the SQL command
            sqlCmd.ExecuteNonQuery();

            if (CodeId != 0)
            {
                sqlStr = "UPDATE Codes SET valid = 0 WHERE id = @code";
                sqlCmd.CommandText = sqlStr;
                sqlCmd.ExecuteNonQuery();
            }

            // Changing password and answer question
            MembershipUser mu = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (NewAnswer != "")
            {
                mu.ChangePasswordQuestionAndAnswer(Password, Question, NewAnswer);
            }
            if (Question != "")
            {
                sqlCmd.CommandText = "UPDATE aspnet_Membership SET PasswordQuestion = @question WHERE UserId = @id";
                sqlCmd.Parameters.AddWithValue("@question", Question);
                sqlCmd.ExecuteNonQuery();
            }
            if (NewPassword != "")
            {
                mu.ChangePassword(Password, NewPassword);
            }

            // Close the connection to the database
            con.Close();

            HttpContext.Current.Response.Redirect("http://localhost:3315/eLearning/user/profile.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn;
        String UserId;
        String Sex;
        String LearningMode;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Proccessing UserId
            string sqlStr = "SELECT TOP 1 UserId FROM aspnet_Users WHERE UserName = '" + HttpContext.Current.User.Identity.Name + "' ORDER BY LastActivityDate DESC";
            SqlCommand sqlCmd = new SqlCommand(sqlStr, conn);
            Guid result = (Guid)sqlCmd.ExecuteScalar();
            UserId = result.ToString();

            // User profile ----------------------------------------------------------------------------------------
            sqlCmd = new SqlCommand("SELECT * FROM Users WHERE ID = @id", conn);
            sqlCmd.Parameters.AddWithValue("@id", UserId);
            SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            sqlCmd = new SqlCommand("SELECT Email, PasswordQuestion FROM aspnet_Membership WHERE UserId = @id", conn);
            sqlCmd.Parameters.AddWithValue("@id", UserId);
            da = new SqlDataAdapter(sqlCmd);
            DataTable dt2 = new DataTable();
            da.Fill(dt2);

            // Get data from the form
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text = HttpContext.Current.User.Identity.Name;
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Email1")).Text = dt2.Rows[0][0].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Question1")).Text = dt2.Rows[0][1].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("FirstName1")).Text = dt.Rows[0][1].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Surname1")).Text = dt.Rows[0][2].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Birthdate1")).Text = dt.Rows[0][4].ToString().Substring(0, 10);
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Country1")).Text = dt.Rows[0][5].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("City1")).Text = dt.Rows[0][6].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("PostCode1")).Text = dt.Rows[0][7].ToString();
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Address1")).Text = dt.Rows[0][8].ToString();
            if (dt.Rows[0][3].ToString() == "0") Sex = "Male";
            else Sex = "Female";
            ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Sex")).SelectedItem.Text = Sex;
            if (dt.Rows[0][3].ToString() == "0") LearningMode = "Linear";
            else LearningMode = "Free";
            ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("LearningMode")).SelectedItem.Text = LearningMode;

            sqlCmd.CommandText = "SELECT code FROM Codes WHERE id = @codeId";
            sqlCmd.Parameters.AddWithValue("@codeId", dt.Rows[0][10].ToString());
            ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Code1")).Text = (String)sqlCmd.ExecuteScalar();
        }
    }
}