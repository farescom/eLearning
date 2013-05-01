using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SendMail(object sender, EventArgs e)
    {
        MailMessage mail = new MailMessage();
        mail.To.Add("atomek12@op.pl");
        mail.From = new MailAddress("tomaszadrianowski@gmail.com");
        mail.Subject = "Email from E-Learning Platform";

        string Body = "Email: " + email.Value + "<br /><br />Title: " + name.Value + "<br /><br />Message: <br/><br/>" + message.Value;
        mail.Body = Body;

        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
        smtp.Credentials = new System.Net.NetworkCredential
             ("tomaszadrianowski@gmail.com", "gmailma16psa");
        //Or your Smtp Email ID and Password
        smtp.EnableSsl = true;
        smtp.Send(mail);
    }
}