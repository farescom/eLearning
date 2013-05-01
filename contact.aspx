<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="pad_left1">

    <h2>Contact Us</h2>

    <form id="ContactForm" action="#">
    <div>
        <div  class="wrapper"> <strong>Name:</strong>
        <div class="bg">
            <input id="name" runat="server" class="white-blue input" type="text" />
        </div>
        </div>
        <div  class="wrapper"> <strong>Email:</strong>
        <div class="bg">
            <input id="email" runat="server" class="white-blue input" type="text" />
        </div>
        </div>
        <div  class="textarea_box"> <strong>Message:</strong>
        <div class="bg">
            <textarea id="message" runat="server" class="white-blue" name="textarea" cols="72" rows="10"></textarea>
        </div>
        </div>
        <asp:Button id="Send" Width="70px" runat="server" onclick="SendMail" href="#" class="button" Text="Send" />
        <%--<a ><span><span>Send</span></span></a>--%>
        <a href="contact.aspx" class="button"><span><span>Clear</span></span></a>
    </div>
    </form>

</div>
</asp:Content>