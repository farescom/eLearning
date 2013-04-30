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
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Table of number of questions in each section;
        int[] section_questions = new int[6];

        // this table is mapping the id of sections in database and their numbers in tabs 
        int[] section_mapping = new int[6];

        // Checking wich tab is opened
        int tab_index = TabContainer1.ActiveTabIndex;

        int limited = 1; // 1- if the user is not active, so he have limited access

        //Connection to databse
        SqlConnection conn, conn2;
        using (conn = new SqlConnection())
        {
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            conn.Open();

            // Choosing the number o sections
            SqlCommand command = new SqlCommand("SELECT id, title, section_content FROM Sections WHERE show = 1 ORDER BY number", conn);

            SqlDataReader reader = command.ExecuteReader();

            HtmlGenericControl[] tab = new HtmlGenericControl[6];
            tab[0] = Tab_Panel_1;
            tab[1] = Tab_Panel_2;
            tab[2] = Tab_Panel_3;
            tab[3] = Tab_Panel_4;
            tab[4] = Tab_Panel_5;
            tab[5] = Tab_Panel_6;

            int counter = 0;
            int correct_answers_counter = -1;
            int current_section = -1;

            // cheking the role of user
            if (Roles.IsUserInRole("Active") || Roles.IsUserInRole("Admin"))
            {
                limited = 0;
            }

            while (reader.Read())
            {
                if (limited == 0 || (limited == 1 && counter == 0))
                {
                    section_mapping[counter] = (int)reader["id"];

                    // section material
                    tab[counter].InnerHtml = "<H2 class=\"red\">" + reader["title"] + "</H2>";

                    // check if it is done or not?
                    string dbstring2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con2 = new SqlConnection(dbstring2);
                    con2.Open();
                    string UserId2 = Membership.GetUser().ProviderUserKey.ToString();
                    string sqlStr2 = "SELECT section_id FROM Done_sections WHERE userid = '" + UserId2 + "' AND section_id = " + reader["id"];
                    SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con2);
                    Object o = sqlCmd2.ExecuteScalar();
                    if (o != null) tab[counter].InnerHtml += "<strong><p class=\"green\">Already done!</p></strong>";
                    con2.Close();

                    // section content
                    tab[counter].InnerHtml += "<br />" + reader["section_content"];

                    // exercises
                    using (conn2 = new SqlConnection())
                    {
                        conn2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                        conn2.Open();
                        SqlCommand command2 = new SqlCommand("SELECT question, question_type, answer_1, answer_2, answer_3, answer_4, correct FROM Questions WHERE section_id = " + reader["id"], conn2);
                        SqlDataReader reader2 = command2.ExecuteReader();
                        int counter2 = 0;

                        tab[counter].InnerHtml += "<div class=\"exercises\">";
                        while (reader2.Read())
                        {

                            if (counter2 == 0) tab[counter].InnerHtml += "<H3 class=\"green\"> Excersises:</H3>";

                            tab[counter].InnerHtml += "<p><b class=\"darkblue\">Question " + (counter2 + 1) + ".</b> " + reader2["question"];

                            if ((byte)reader2["question_type"] == 0)      // open question
                            {
                                tab[counter].InnerHtml += "<input type=\"text\" class=\"input\" name=\"question_" + counter + "_" + counter2 + "\" placeholder=\"_____________________\"/>";
                                tab[counter].InnerHtml += "<span id=\"question_" + counter + "_" + counter2 + "_\"></span>";
                            }
                            else if ((byte)reader2["question_type"] == 1) // multiple choice question
                            {
                                tab[counter].InnerHtml += "<select name=\"question_" + counter + "_" + counter2 + "\" id=\"question_" + counter + "_" + counter2 + "\">";

                                if (reader2["answer_1"] != null)
                                    tab[counter].InnerHtml += "<option value=\"" + reader2["answer_1"] + "\">" + reader2["answer_1"] + "</option>";
                                if (reader2["answer_2"] != null)
                                    tab[counter].InnerHtml += "<option value=\"" + reader2["answer_2"] + "\">" + reader2["answer_2"] + "</option>";
                                if (reader2["answer_3"] != null)
                                    tab[counter].InnerHtml += "<option value=\"" + reader2["answer_3"] + "\">" + reader2["answer_3"] + "</option>";
                                if (reader2["answer_4"] != null)
                                    tab[counter].InnerHtml += "<option value=\"" + reader2["answer_4"] + "\">" + reader2["answer_4"] + "</option>";

                                tab[counter].InnerHtml += "</select><span id=\"question_" + counter + "_" + counter2 + "_\"></span>";
                            }

                            // Checking the correct answer
                            string user_answer = Request.Form["question_" + counter + "_" + counter2];
                            if ((user_answer != null) && tab_index == counter)
                            {
                                current_section = counter;
                                if (user_answer.Equals(reader2["correct"]))
                                {
                                    tab[counter].InnerHtml += "<br /><span class=\"green\"> correct!</span>";
                                    if (correct_answers_counter == -1)
                                        correct_answers_counter = 1;
                                    else
                                        correct_answers_counter++;
                                }
                                else
                                {
                                    tab[counter].InnerHtml += "<br /><span class=\"red\"> wrong!</span>";
                                    tab[counter].InnerHtml += " Correct answer is: " + reader2["correct"];
                                    if (correct_answers_counter == -1) correct_answers_counter = 0;
                                }
                            }

                            tab[counter].InnerHtml += "</p>";
                            counter2++;
                        }
                        section_questions[counter] = counter2; // the number of answers in section nr counter.
                        if (counter2 != 0)
                            tab[counter].InnerHtml += "<input class=\"button\" type=\"submit\" value=\"Check\" />";

                        // showing the statistics of correct answers
                        if (correct_answers_counter != -1 && counter == tab_index)
                        {
                            tab[counter].InnerHtml += "<br /><b>Your gained: " + correct_answers_counter + "/" + counter2 + " points. ";
                            int result = ((correct_answers_counter * 100 / counter2));
                            tab[counter].InnerHtml += "<br />It's " + result + "%</b>";
                            if (result < 50)
                                tab[counter].InnerHtml += "<b><br />Your results are low. <span class=\"red\">You did not pass the section!</span></b>";
                            else if (result < 75)
                                tab[counter].InnerHtml += "<b><br />Your results are quite good. <span class=\"green\">You passed this section!</span></b>";
                            else
                                tab[counter].InnerHtml += "<b><br />Your results are very good! Keep doing this way. <span class=\"green\">You passed this section!</span></b>";

                            if (result >= 50) // update table Done_Sections
                            {
                                string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                                SqlConnection con = new SqlConnection(dbstring);
                                con.Open();

                                string UserId = Membership.GetUser().ProviderUserKey.ToString();

                                string sqlStr = "SELECT count(*) FROM Done_sections WHERE userid='" + UserId + "' AND section_id=" + section_mapping[tab_index];
                                SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
                                Object oo = sqlCmd.ExecuteScalar();
                                int countt = (int)oo;
                                if (countt == 0)
                                {
                                    sqlStr = "INSERT INTO Done_sections (userid, section_id) VALUES (@userid, @section_id)";
                                    sqlCmd = new SqlCommand(sqlStr, con);
                                    sqlCmd.Parameters.AddWithValue("@userid", UserId);
                                    sqlCmd.Parameters.AddWithValue("@section_id", section_mapping[tab_index]);
                                    sqlCmd.ExecuteNonQuery();
                                }
                                con.Close();
                            }
                        }
                        tab[counter].InnerHtml += "</div>";

                        counter++;
                        reader2.Close();
                    } // enf of using statement
                } // end of if
            } // enf of while
            reader.Close();

            // Aditional materials

            //conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            //conn.Open();

            // Choosing the number o sections
            command = new SqlCommand("SELECT id, title, file_path, description FROM Materials WHERE show = 1 ORDER BY id", conn);
            reader = command.ExecuteReader();
            counter = 0;
            while (reader.Read())
            {
                if (counter == 0) // before the first entity, we have to start the definition of table
                {
                    materials.InnerHtml = "<div id=\"additionalmaterial\" class=\"box\">";
                    materials.InnerHtml += "<h2>Additional materials</h2><table><tr><td></td><td><b>Material</b></td><td><b>Description</b></td></tr>";
                }

                materials.InnerHtml += "<tr><td>"+(counter+1)+" </td>";
                materials.InnerHtml += "<td><a href=\"../materials/" + reader["file_path"] + "\">" + reader["title"] + "</a></td>";
                materials.InnerHtml += "<td><p>" + reader["description"] + "</p></td></tr>";

                counter++;
            }
            if (counter != 0) // we added at least one entity
            {
                materials.InnerHtml += "</table></div>";
            }
        }
    }
}