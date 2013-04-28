<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../js/jquery-1.5.2.js" ></script>
    <script type="text/javascript" src="../js/cufon-yui.js"></script>
    <script type="text/javascript" src="../js/cufon-replace.js"></script>
    <script type="text/javascript" src="../js/Molengo_400.font.js"></script>
    <script type="text/javascript" src="../js/Expletus_Sans_400.font.js"></script> 
    <script type="text/javascript">
        var seasonalSports = new Array("None selected",
                                 "Tennis",
                                 "Volleyball",
                                 "Baseball",
                                 "Skiing");

        function DisplaySport(x)
        {
            var a = document.getElementById("answers_1_a");
            var answer_a = a.options[e.selectedIndex].value;
            var answer_b = a.options[e.selectedIndex].text;

            var c = document.getElementById("answers_1_c");
            c.appendChild("hi");
            
            //document.getElementById("").innerHTML = seasonalSports[x];
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="pad_left1">

         <div id = "sections" style="text-align: left"> 
         
            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" TabStripPlacement="Top" Width="600">
               <asp:TabPanel ID="TabPanel1" runat="server">
                  <HeaderTemplate>
                     Section 1
                  </HeaderTemplate>
                  <ContentTemplate>
                     <div id="Tab_Panel_1" runat="server" />
                  </ContentTemplate>
               </asp:TabPanel>
                  
               <asp:TabPanel ID="TabPanel2" runat="server">
                  <HeaderTemplate>
                     Section 2
                  </HeaderTemplate>
                  <ContentTemplate>
                     <div id="Tab_Panel_2" runat="server"/>
                  </ContentTemplate>
               </asp:TabPanel>

               <asp:TabPanel ID="TabPanel3" runat="server">
                  <HeaderTemplate>
                     Section 3
                  </HeaderTemplate>
                  <ContentTemplate>
                     <div id="Tab_Panel_3" runat="server"/>
                  </ContentTemplate>
               </asp:TabPanel>

               <asp:TabPanel ID="TabPanel4" runat="server">
                  <HeaderTemplate>
                     Section 4
                  </HeaderTemplate>
                  <ContentTemplate>
                     <div id="Tab_Panel_4" runat="server"/>
                  </ContentTemplate>
               </asp:TabPanel>

               <asp:TabPanel ID="TabPanel5" runat="server">
                  <HeaderTemplate>
                     Section 5
                  </HeaderTemplate>
                  <ContentTemplate>
                     <div id="Tab_Panel_5" runat="server"/>
                  </ContentTemplate>
               </asp:TabPanel>

               <asp:TabPanel ID="TabPanel6" runat="server">
                  <HeaderTemplate>
                     Section 6
                  </HeaderTemplate>
                  <ContentTemplate>
                     <div id="Tab_Panel_6" runat="server"/>
                  </ContentTemplate>
               </asp:TabPanel>

            </asp:TabContainer>
         </div>

    </div>
</asp:Content>