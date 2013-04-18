<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="pad_left1">

    <h2>My profile</h2>

    <form id="ProfileForm" action="#">
    <div>
        <div  class="wrapper"> <strong>Firstname:</strong>
        <div class="bg">
            <input id="Firstname" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Surname:</strong>
        <div class="bg">
            <input id="Surname" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Participation date:</strong>
        <div class="bg">
            <input id="PariticpationDate" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Email:</strong>
        <div class="bg">
            <input id="Email" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Birthday:</strong>
        <div class="bg">
            <input id="Birthday" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Country:</strong>
        <div class="bg">
            <input id="Country" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>City:</strong>
        <div class="bg">
            <input id="City" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Postcode:</strong>
        <div class="bg">
            <input id="Postcode" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Address:</strong>
        <div class="bg">
            <input id="Address" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Jump possibility:</strong>
        <div class="bg">
            <input id="JumpPossibility" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <div  class="wrapper"> <strong>Your code:</strong>
        <div class="bg">
            <input id="Code" class="white-blue" type="text" class="input" >
        </div>
        </div>
        <a href="#" class="button"><span><span>Send</span></span></a>
        <a href="profile.aspx" class="button"><span><span>Clear</span></span></a>
    </div>
    </form>

</div>
</asp:Content>