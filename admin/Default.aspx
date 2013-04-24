﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="pad_left1" width="980px">
        
        <!-- GridView controls display data as rows and columns. 
             This GridView was setup and customized in "Design View" 
        -->
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="980px">
            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Users">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="0" CellSpacing="0"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="980px" DataKeyNames="ID"> 
                        <Columns>
                            <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" HeaderStyle-Width="10%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" HeaderStyle-Width="10%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="sex" HeaderText="Sex" SortExpression="sex" HeaderStyle-Width="3%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            
                            <asp:TemplateField HeaderText="Birthday" SortExpression="birthday" ItemStyle-HorizontalAlign="center">
                                <ItemTemplate>
                                    <%# Eval("birthday").ToString().Substring(0, 10) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:textbox id="BirthdayTextBox" text='<%# Eval("birthday").ToString().Substring(0, 10) %>' width="90" runat="server"/>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" HeaderStyle-Width="9%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" HeaderStyle-Width="11%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="postcode" HeaderText="Postcode" SortExpression="postcode" HeaderStyle-Width="9%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" HeaderStyle-Width="20%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="jump_posibility" HeaderText="Jump" SortExpression="jump_posibility" HeaderStyle-Width="3%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                        <EditRowStyle Width="911px" Wrap="True" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
           
            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Settings">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="coursename" HeaderText="Course name" SortExpression="coursename" />
                            <asp:BoundField DataField="slogan" HeaderText="Slogan" SortExpression="slogan" />
                            <asp:BoundField DataField="show_opinions" HeaderText="Show opinions" SortExpression="show_opinions" />
                            <asp:BoundField DataField="receive_opinions" HeaderText="Receive opinions" SortExpression="receive_opinions" />
                            <asp:BoundField DataField="startpage_content" HeaderText="Startpage content" SortExpression="startpage_content" />
                            <asp:BoundField DataField="aboutus_content" HeaderText="About us content" SortExpression="aboutus_content" />
                            <asp:BoundField DataField="active_version" HeaderText="Active version" SortExpression="active_version" />
                            <asp:BoundField DataField="site_mode" HeaderText="Site mode" SortExpression="site_mode" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Sections">
                <ContentTemplate>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                            <asp:BoundField DataField="section_content" HeaderText="Section content" SortExpression="section_content" />
                            <asp:BoundField DataField="show" HeaderText="Show" SortExpression="show" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Ratings">
                <ContentTemplate>
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource4" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                            <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                            <asp:BoundField DataField="acceptance" HeaderText="Acceptance" SortExpression="acceptance" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="Questions">
                <ContentTemplate>
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource5" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="section_id" HeaderText="Sectionid" SortExpression="section_id" />
                            <asp:BoundField DataField="question" HeaderText="Question" SortExpression="question" />
                            <asp:BoundField DataField="question_type" HeaderText="Questiontype" SortExpression="question_type" />
                            <asp:BoundField DataField="answer_1" HeaderText="Answer 1" SortExpression="answer_1" />
                            <asp:BoundField DataField="answer_2" HeaderText="Answer 2" SortExpression="answer_2" />
                            <asp:BoundField DataField="answer_3" HeaderText="Answer 3" SortExpression="answer_3" />
                            <asp:BoundField DataField="answer_4" HeaderText="Answer 4" SortExpression="answer_4" />
                            <asp:BoundField DataField="correct" HeaderText="Correct" SortExpression="correct" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel6" runat="server" HeaderText="Materials">
                <ContentTemplate>
                    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource6" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                            <asp:BoundField DataField="file_path" HeaderText="File path" SortExpression="file_path" />
                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                            <asp:BoundField DataField="show" HeaderText="Show" SortExpression="show" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel7" runat="server" HeaderText="Done sections">
                <ContentTemplate>
                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource7" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="userid" HeaderText="User id" SortExpression="userid" />
                            <asp:BoundField DataField="section_id" HeaderText="Section id" SortExpression="section_id" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel8" runat="server" HeaderText="Codes">
                <ContentTemplate>
                    <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource8" BackColor="White" BorderColor="#3366CC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4"> 
                        <Columns>
                            <asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" />
                            <asp:BoundField DataField="valid" HeaderText="Valid" SortExpression="valid" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>

        <!-- SQL statement that retrieves all bookings from the database. Also created in "Design View" -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [firstname], [surname], [sex], [birthday], [country], [city], [postcode], [address], [jump_posibility], [code_id] FROM [Users]"
            UpdateCommand="Update Users SET firstname=@firstname, surname=@surname, sex=@sex, birthday=@birthday, country=@country, city=@city, postcode=@postcode,
                            address=@address, jump_posibility=@jump_posibility WHERE ID=@ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [coursename], [slogan], [show_opinions], [receive_opinions], [startpage_content], [aboutus_content], [active_version], [site_mode] FROM [Settings]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [title], [section_content], [show] FROM [Sections]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [username], [date], [rating], [description], [acceptance] FROM [Ratings]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [section_id], [question], [question_type], [answer_1], [answer_2], [answer_3], [answer_4], [correct] FROM [Questions]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [title], [file_path], [description], [show] FROM [Materials]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [userid], [section_id] FROM [Done_sections]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [code], [valid] FROM [Codes]">
        </asp:SqlDataSource>

    </div>
</asp:Content>