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
using AjaxControlToolkit;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    //protected void UploadFinish(object sender, AsyncFileUploadEventArgs e)
    //{
    //        Debug.WriteLine(Request.PhysicalApplicationPath);
    //        AjaxFileUpload1.SaveAs(Request.PhysicalApplicationPath + "materials\\" + e.FileName);
    //}

    protected void UsersUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView1.EditIndex;
        GridViewRow row = GridView1.Rows[index];

        e.NewValues["firstname"] = ((TextBox)row.FindControl("txtFirstName")).Text;
        e.NewValues["surname"] = ((TextBox)row.FindControl("txtSurname")).Text;
        e.NewValues["sex"] = ((DropDownList)row.FindControl("dropSex")).SelectedValue;
        e.NewValues["birthday"] = ((TextBox)row.FindControl("txtBirthday")).Text;
        e.NewValues["country"] = ((TextBox)row.FindControl("txtCountry")).Text;
        e.NewValues["city"] = ((TextBox)row.FindControl("txtCity")).Text;
        e.NewValues["postcode"] = ((TextBox)row.FindControl("txtPostcode")).Text;
        e.NewValues["address"] = ((TextBox)row.FindControl("txtAddress")).Text;
        e.NewValues["jump_posibility"] = ((DropDownList)row.FindControl("dropJump")).SelectedValue;
    }

    protected void SettingsUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView3.EditIndex;
        GridViewRow row = GridView3.Rows[index];

        e.NewValues["coursename"] = ((TextBox)row.FindControl("txtCoursename")).Text;
        e.NewValues["slogan"] = ((TextBox)row.FindControl("txtSlogan")).Text;
        e.NewValues["show_opinions"] = ((DropDownList)row.FindControl("dropShow")).SelectedValue;
        e.NewValues["receive_opinions"] = ((DropDownList)row.FindControl("dropReceive")).SelectedValue;
        e.NewValues["active_version"] = ((TextBox)row.FindControl("txtActive")).Text;
        e.NewValues["site_mode"] = ((DropDownList)row.FindControl("dropMode")).SelectedValue;
    }

    protected void StartpageUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView7.EditIndex;
        GridViewRow row = GridView7.Rows[index];

        e.NewValues["startpage_content"] = ((TextBox)row.FindControl("txtStart")).Text;
    }

    protected void AboutusUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView9.EditIndex;
        GridViewRow row = GridView9.Rows[index];

        e.NewValues["aboutus_content"] = ((TextBox)row.FindControl("txtAbout")).Text;
    }

    protected void SectionsUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView2.EditIndex;
        GridViewRow row = GridView2.Rows[index];

        e.NewValues["title"] = ((TextBox)row.FindControl("txtTitle")).Text;
        e.NewValues["section_content"] = ((TextBox)row.FindControl("txtSectionContent")).Text;
        e.NewValues["show"] = ((DropDownList)row.FindControl("dropJump")).SelectedValue;

    }

    protected void RatingsUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView4.EditIndex;
        GridViewRow row = GridView4.Rows[index];

        e.NewValues["username"] = ((TextBox)row.FindControl("txtUserName")).Text;
        e.NewValues["date"] = ((TextBox)row.FindControl("txtDate")).Text;
        e.NewValues["rating"] = ((DropDownList)row.FindControl("dropRating")).SelectedValue;
        e.NewValues["description"] = ((TextBox)row.FindControl("txtDesc")).Text;
        e.NewValues["acceptance"] = ((DropDownList)row.FindControl("dropAcceptance")).SelectedValue;
    }

    protected void QuestionsUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView5.EditIndex;
        GridViewRow row = GridView5.Rows[index];

        e.NewValues["section_id"] = ((TextBox)row.FindControl("txtSectionID")).Text;
        e.NewValues["question"] = ((TextBox)row.FindControl("txtQuestion")).Text;
        e.NewValues["question_type"] = ((DropDownList)row.FindControl("dropQuestion")).SelectedValue;
        e.NewValues["answer_1"] = ((TextBox)row.FindControl("txtAnswer1")).Text;
        e.NewValues["answer_2"] = ((TextBox)row.FindControl("txtAnswer2")).Text;
        e.NewValues["answer_3"] = ((TextBox)row.FindControl("txtAnswer3")).Text;
        e.NewValues["answer_4"] = ((TextBox)row.FindControl("txtAnswer4")).Text;
        e.NewValues["correct"] = ((TextBox)row.FindControl("txtCorrect")).Text;
    }

    protected void MaterialsUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView6.EditIndex;
        GridViewRow row = GridView6.Rows[index];

        e.NewValues["title"] = ((TextBox)row.FindControl("txtTitle")).Text;
        e.NewValues["file_path"] = ((TextBox)row.FindControl("txtPath")).Text;
        e.NewValues["show"] = ((DropDownList)row.FindControl("dropShow")).SelectedValue;
        e.NewValues["description"] = ((TextBox)row.FindControl("txtDesc")).Text;
    }

    protected void CodesUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        int index = GridView8.EditIndex;
        GridViewRow row = GridView8.Rows[index];

        e.NewValues["code"] = ((TextBox)row.FindControl("txtCode")).Text;
        e.NewValues["valid"] = ((DropDownList)row.FindControl("dropValid")).SelectedValue;
    }

    protected void SectionInserting(object sender, EventArgs e)
    {
        GridViewRow row = GridView2.FooterRow;

        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        SqlDataSource3.InsertParameters["title"].DefaultValue = ((TextBox)row.FindControl("txtTitle")).Text;
        SqlDataSource3.InsertParameters["section_content"].DefaultValue = ((TextBox)row.FindControl("txtSectionContent")).Text;
        SqlDataSource3.InsertParameters["show"].DefaultValue = ((DropDownList)row.FindControl("dropJump")).SelectedValue;
        SqlDataSource3.Insert();
    }

    protected void QuestionInserting(object sender, EventArgs e)
    {
        GridViewRow row = GridView5.FooterRow;

        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.
        SqlDataSource5.InsertParameters["section_id"].DefaultValue = ((TextBox)row.FindControl("txtSectionID")).Text;
        SqlDataSource5.InsertParameters["question"].DefaultValue = ((TextBox)row.FindControl("txtQuestion")).Text;
        SqlDataSource5.InsertParameters["question_type"].DefaultValue = ((DropDownList)row.FindControl("dropQuestion")).SelectedValue;
        SqlDataSource5.InsertParameters["answer_1"].DefaultValue = ((TextBox)row.FindControl("txtAnswer1")).Text;
        SqlDataSource5.InsertParameters["answer_2"].DefaultValue = ((TextBox)row.FindControl("txtAnswer2")).Text;
        SqlDataSource5.InsertParameters["answer_3"].DefaultValue = ((TextBox)row.FindControl("txtAnswer3")).Text;
        SqlDataSource5.InsertParameters["answer_4"].DefaultValue = ((TextBox)row.FindControl("txtAnswer4")).Text;
        SqlDataSource5.InsertParameters["correct"].DefaultValue = ((TextBox)row.FindControl("txtCorrect")).Text;
        SqlDataSource5.Insert();
    }

    protected void UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        Session["fileName"] = e.FileName;
        Session["filePath"] = Request.PhysicalApplicationPath + "materials\\" + e.FileName;
        AjaxFileUpload1.SaveAs(Request.PhysicalApplicationPath + "materials\\" + e.FileName);
    }

    protected void MaterialInserting(object sender, EventArgs e)
    {
        SqlDataSource6.InsertParameters["title"].DefaultValue = (String)Session["fileName"];
        SqlDataSource6.InsertParameters["file_path"].DefaultValue = (String)Session["filePath"];
        SqlDataSource6.InsertParameters["description"].DefaultValue = txtDescMaterial.Text;
        SqlDataSource6.InsertParameters["show"].DefaultValue = dropShowMaterial.SelectedValue;
        SqlDataSource6.Insert();
    }

    /// <summary>
    /// Show Add new record
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AddNewSection(object sender, EventArgs e)
    {
        GridView2.ShowFooter = true;
    }
    protected void AddNewQuestion(object sender, EventArgs e)
    {
        GridView5.ShowFooter = true;
    }
    protected void AddNewMaterial(object sender, EventArgs e)
    {
        GridView6.ShowFooter = true;
    }
    
}