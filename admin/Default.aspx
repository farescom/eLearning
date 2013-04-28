<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../js/jquery-1.5.2.js" ></script>
    <script type="text/javascript" src="../js/cufon-yui.js"></script>
    <script type="text/javascript" src="../js/cufon-replace.js"></script>
    <script type="text/javascript" src="../js/Molengo_400.font.js"></script>
    <script type="text/javascript" src="../js/Expletus_Sans_400.font.js"></script>
    <style type="text/css">
        .widthTextBox{ width: 105px; }
        .ajax__html_editor_extender_texteditor{ background-color:White; }
    </style> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="pad_left1" style="width: 980px; min-height: 200px;">
        
        <h2>Tables of database</h2>

        <!-- GridView controls display data as rows and columns. 
             This GridView was setup and customized in "Design View" 
        -->
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="980px">
            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Users">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="0" ForeColor="Black" GridLines="Vertical" SkinID="RecordList" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="UsersUpdating">
                    <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Firstname" HeaderStyle-Width="10%" FooterStyle-Width="80%" ControlStyle-Width="80%">
                        <ItemTemplate>
                            <%# Eval("firstname") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="Server" Text='<%# Eval("firstname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtFirstNameFooter" runat="Server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Surname" HeaderStyle-Width="10%" FooterStyle-Width="80%" ControlStyle-Width="80%">
                        <ItemTemplate>
                            <%# Eval("surname") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSurname" runat="Server" Text='<%# Eval("surname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtSurnameFooter" runat="Server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Sex" HeaderStyle-Width="6%" FooterStyle-Width="100%" ControlStyle-Width="100%">
                        <ItemTemplate>
                            <%# Eval("sex").ToString().ToLower().Equals("1") ? "Female" : "Male" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropSex" runat="server">
                                <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="dropSexFooter" runat="server">
                                <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="9%" FooterStyle-Width="90%" ControlStyle-Width="90%" ItemStyle-HorizontalAlign="Center"  HeaderText="Birthday">
                        <ItemTemplate>
                            <%# Eval("birthday").ToString().Equals("") ? Eval("birthday") : Eval("birthday").ToString().Substring(0, 10)%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBirthday" runat="Server" Text='<%# Eval("birthday").ToString().Equals("") ? Eval("birthday") : Eval("birthday").ToString().Substring(0, 10) %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtBirthdayFooter" runat="Server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="9%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="Country">
                        <ItemTemplate>
                            <%# Eval("country") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCountry" Columns="30" runat="Server" Text='<%# Eval("country") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtCountryFooter" runat="Server" Text='<%# Eval("country") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="11%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="City">
                        <ItemTemplate>
                            <%# Eval("city") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCity" Columns="30" runat="Server" Text='<%# Eval("city") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtCityFooter" runat="Server" Text='<%# Eval("city") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="9%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="Postcode">
                        <ItemTemplate>
                            <%# Eval("postcode") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPostcode" Columns="30" runat="Server" Text='<%# Eval("postcode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtPostcodeFooter" runat="Server" Text='<%# Eval("postcode") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="20%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="Address">
                        <ItemTemplate>
                            <%# Eval("address") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" Columns="30" runat="Server" Text='<%# Eval("address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtAddressFooter" runat="Server" Text='<%# Eval("address") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="6%" FooterStyle-Width="100%" ControlStyle-Width="100%" ItemStyle-HorizontalAlign="Center"  HeaderText="Jump">
                        <ItemTemplate>
                            <%# Eval("jump_posibility").ToString().ToLower().Equals("1") ? "Linear" : "Free" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropJump" runat="server">
                            <asp:ListItem Text="Linear" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Free" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="dropJumpFooter" runat="server">
                            <asp:ListItem Text="Linear" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Free" Value="0"></asp:ListItem>
                            </asp:DropDownList> <br />
                            <asp:Button ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Settings">
                <ContentTemplate>
                    <asp:GridView ID="GridView3" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="0" ForeColor="Black" GridLines="Vertical" SkinID="RecordList" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="UsersUpdating">
                    <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Coursename" HeaderStyle-Width="10%" FooterStyle-Width="80%" ControlStyle-Width="80%">
                        <ItemTemplate>
                            <%# Eval("coursename") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCoursename" runat="Server" Text='<%# Eval("coursename") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtCoursename" runat="Server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Slogan" HeaderStyle-Width="10%" FooterStyle-Width="80%" ControlStyle-Width="80%">
                        <ItemTemplate>
                            <%# Eval("slogan") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSlogan" runat="Server" Text='<%# Eval("slogan") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtSlogan" runat="Server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Show opinions" HeaderStyle-Width="6%" FooterStyle-Width="100%" ControlStyle-Width="100%">
                        <ItemTemplate>
                            <%# Eval("show_opinions").ToString().ToLower().Equals("1") ? "Yes" : "No" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropShow" runat="server">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="dropShow" runat="server">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Receive opinions" HeaderStyle-Width="6%" FooterStyle-Width="100%" ControlStyle-Width="100%">
                        <ItemTemplate>
                            <%# Eval("receive_opinions").ToString().ToLower().Equals("1") ? "Yes" : "No" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropReceive" runat="server">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="dropReceive" runat="server">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="9%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="Startpage Content">
                        <ItemTemplate>
                            <%# Eval("startpage_content")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStart" Columns="30" runat="Server" Text='<%# Eval("startpage_content") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtStart" runat="Server" Text='<%# Eval("startpage_content") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="11%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="About Us">
                        <ItemTemplate>
                            <%# Eval("aboutus_content")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAbout" Columns="30" runat="Server" Text='<%# Eval("aboutus_content") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtAbout" runat="Server" Text='<%# Eval("aboutus_content") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="9%" FooterStyle-Width="80%" ControlStyle-Width="80%" ItemStyle-HorizontalAlign="Center"  HeaderText="Active Ver.">
                        <ItemTemplate>
                            <%# Eval("active_version")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtActive" Columns="30" runat="Server" Text='<%# Eval("active_version") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="widthTextBox" ID="txtActive" runat="Server" Text='<%# Eval("active_version") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Receive opinions" HeaderStyle-Width="6%" FooterStyle-Width="100%" ControlStyle-Width="100%">
                        <ItemTemplate>
                            <%# Eval("site_mode").ToString().ToLower().Equals("1") ? "Opened" : "Closed"%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropMode" runat="server">
                                <asp:ListItem Text="Opened" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Closed" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="dropMode" runat="server">
                                <asp:ListItem Text="Opened" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Closed" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Sections">
                <ContentTemplate>
                    <p style="text-align:right;"><asp:Button ID="btnAdd1" runat="Server" Text="Add New Record" OnClick="AddNewSection" /></p>
                    <asp:GridView ID="GridView2" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Vertical" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="SectionsUpdating"> 
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Title" HeaderStyle-Width="25%" FooterStyle-Width="25%" ControlStyle-Width="100%">
                                <ItemTemplate>
                                    <%# Eval("title") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTitle" runat="Server" Text='<%# Eval("title") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTitle" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Section content" HeaderStyle-Width="60%" FooterStyle-Width="60%" ControlStyle-Height="100%" ControlStyle-Width="90%">
                                <ItemTemplate>
                                    <%# Eval("section_content") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSectionContent" TextMode="MultiLine" Rows="10" Text='<%# Eval("section_content") %>' runat="server"></asp:TextBox>
                                    <asp:HtmlEditorExtender ID="HtmlEditorExtender1" TargetControlID="txtSectionContent" runat="server">
                                        <Toolbar>
                                            <asp:Undo /><asp:Redo /><asp:Bold /><asp:Italic /><asp:Underline /><asp:StrikeThrough />
                                            <asp:Subscript /><asp:Superscript /><asp:JustifyLeft /><asp:JustifyCenter /><asp:JustifyRight /><asp:JustifyFull />
                                            <asp:InsertOrderedList /><asp:InsertUnorderedList /><asp:CreateLink /><asp:UnLink /><asp:RemoveFormat /><asp:SelectAll /><asp:UnSelect />
                                            <asp:Delete /><asp:Cut /><asp:Copy /><asp:Paste /><asp:BackgroundColorSelector />
                                            <asp:ForeColorSelector /><asp:FontNameSelector /><asp:FontSizeSelector /><asp:Indent />
                                            <asp:Outdent /><asp:InsertHorizontalRule /><asp:HorizontalSeparator /><asp:InsertImage />
                                        </Toolbar>
                                    </asp:HtmlEditorExtender>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtSectionContent" TextMode="MultiLine" Columns="75" BackColor="White" ForeColor="White" Rows="9" Text='<%# Eval("section_content") %>' runat="server"></asp:TextBox>
                                    <asp:HtmlEditorExtender ID="HtmlEditorExtender1" TargetControlID="txtSectionContent" runat="server">
                                        <Toolbar>
                                            <asp:Undo /><asp:Redo /><asp:Bold /><asp:Italic /><asp:Underline /><asp:StrikeThrough />
                                            <asp:Subscript /><asp:Superscript /><asp:JustifyLeft /><asp:JustifyCenter /><asp:JustifyRight /><asp:JustifyFull />
                                            <asp:InsertOrderedList /><asp:InsertUnorderedList /><asp:CreateLink /><asp:UnLink /><asp:RemoveFormat /><asp:SelectAll /><asp:UnSelect />
                                            <asp:Delete /><asp:Cut /><asp:Copy /><asp:Paste /><asp:BackgroundColorSelector />
                                            <asp:ForeColorSelector /><asp:FontNameSelector /><asp:FontSizeSelector /><asp:Indent />
                                            <asp:Outdent /><asp:InsertHorizontalRule /><asp:HorizontalSeparator /><asp:InsertImage />
                                        </Toolbar>
                                    </asp:HtmlEditorExtender>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Show" HeaderStyle-Width="6%" FooterStyle-Width="6%" ControlStyle-Width="100%">
                                <ItemTemplate>
                                    <%# Eval("show").ToString().ToLower().Equals("1") ? "Yes" : "No" %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropJump" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="dropJump" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList> <br />
                                    <asp:Button ID="btnInsertSection" runat="Server" Text="Insert" OnClick="SectionInserting" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Ratings">
                <ContentTemplate>
                    <asp:GridView ID="GridView4" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Vertical" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="RatingsUpdating"> 
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Username" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("username") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUserName" runat="Server" Text='<%# Eval("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtUserName" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Date" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("date").ToString().Equals("") ? Eval("date") : Eval("date").ToString().Substring(0, 10)%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDate" runat="Server" Text='<%# Eval("date").ToString().Equals("") ? Eval("date") : Eval("date").ToString().Substring(0, 10)%>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDate" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Rating" HeaderStyle-Width="6%" FooterStyle-Width="6%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("rating") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropRating" runat="server">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="dropRating" runat="server">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Description" HeaderStyle-Width="60%" FooterStyle-Width="60%" ControlStyle-Width="100%">
                                <ItemTemplate>
                                    <%# Eval("description") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDesc" runat="Server" Text='<%# Eval("description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDesc" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Acceptance" HeaderStyle-Width="6%" FooterStyle-Width="6%" ControlStyle-Width="100%">
                                <ItemTemplate>
                                    <%# Eval("acceptance").ToString().ToLower().Equals("1") ? "Yes" : "No" %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropAcceptance" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="dropAcceptance" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList> <br />
                                    <asp:Button ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="Questions">
                <ContentTemplate>
                    <p style="text-align:right;"><asp:Button ID="Button2" runat="Server" Text="Add New Record" OnClick="AddNewQuestion" /></p>
                    <asp:GridView ID="GridView5" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Vertical" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="QuestionsUpdating"> 
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="SectionID" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="10%">
                                <ItemTemplate>
                                    <%# Eval("section_id") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSectionID" runat="Server" Text='<%# Eval("section_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox Width="30px" ID="txtSectionID" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Question" HeaderStyle-Width="30%" FooterStyle-Width="30%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("question") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuestion" runat="Server" Text='<%# Eval("question") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtQuestion" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Question Type" HeaderStyle-Width="6%" FooterStyle-Width="6%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("question_type") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropQuestion" runat="server">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="dropQuestion" runat="server">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Answer 1" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="60%">
                                <ItemTemplate>
                                    <%# Eval("answer_1") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer1" runat="Server" Text='<%# Eval("answer_1") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox Width="100px" ID="txtAnswer1" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Answer 2" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="60%">
                                <ItemTemplate>
                                    <%# Eval("answer_2") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer2" runat="Server" Text='<%# Eval("answer_2") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox Width="100px" ID="txtAnswer2" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Answer 3" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="60%">
                                <ItemTemplate>
                                    <%# Eval("answer_3") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer3" runat="Server" Text='<%# Eval("answer_3") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox Width="100px" ID="txtAnswer3" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Answer 4" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="60%">
                                <ItemTemplate>
                                    <%# Eval("answer_4") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer4" runat="Server" Text='<%# Eval("answer_4") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox Width="100px" ID="txtAnswer4" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Correct" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="60%">
                                <ItemTemplate>
                                    <%# Eval("correct") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCorrect" runat="Server" Text='<%# Eval("correct") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox Width="100px" ID="txtCorrect" runat="Server"></asp:TextBox>
                                    <asp:Button ID="btnInsertQuestion" runat="Server" Text="Insert" OnClick="QuestionInserting" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel6" runat="server" HeaderText="Materials">
                <ContentTemplate>
                    <asp:GridView ID="GridView6" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Vertical" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="MaterialsUpdating"> 
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Title" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("title") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTitle" runat="Server" Text='<%# Eval("title") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="File Path" HeaderStyle-Width="30%" FooterStyle-Width="30%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("file_path") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPath" runat="Server" Text='<%# Eval("file_path") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Description" HeaderStyle-Width="70%" FooterStyle-Width="80%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("description") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDesc" runat="Server" Text='<%# Eval("description") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Show" HeaderStyle-Width="6%" FooterStyle-Width="6%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("show").ToString().ToLower().Equals("1") ? "Yes" : "No"%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropShow" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    
                    <h3>Add material</h3>
                    Description: <asp:TextBox Columns="70" Rows="3" ID="txtDescMaterial" runat="Server"></asp:TextBox><br />
                    Show: <asp:DropDownList ID="dropShowMaterial" runat="server">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:AjaxFileUpload OnUploadComplete="UploadComplete" ID="AjaxFileUpload1" MaximumNumberOfFiles="1" runat="server" />
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel8" runat="server" HeaderText="Codes">
                <ContentTemplate>
                    <asp:GridView ID="GridView8" runat="Server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Vertical" Width="100%"
                    ShowFooter="False" AutoGenerateEditButton="true" DataKeyNames="ID" EnableViewState="True" OnRowUpdating="CodesUpdating"> 
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Code" HeaderStyle-Width="10%" FooterStyle-Width="10%" ControlStyle-Width="80%">
                                <ItemTemplate>
                                    <%# Eval("code") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCode" runat="Server" Text='<%# Eval("code") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtCode" runat="Server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Valid" HeaderStyle-Width="6%" FooterStyle-Width="6%" ControlStyle-Width="100%">
                                <ItemTemplate>
                                    <%# Eval("valid").ToString().ToLower().Equals("1") ? "Yes" : "No" %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dropValid" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="dropValid" runat="server">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList> <br />
                                    <asp:Button ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>

        <!-- SQL statement that retrieves all bookings from the database. Also created in "Design View" -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [firstname], [surname], [sex], [birthday], [country], [city], [postcode], [address], [jump_posibility], [code_id] FROM [Users]"
            UpdateCommand="Update Users SET firstname=@firstname, surname=@surname, sex=@sex, birthday=@birthday, country=@country, city=@city, postcode=@postcode,
                            address=@address, jump_posibility=@jump_posibility WHERE ID=@ID"
            DeleteCommand="DELETE FROM Users WHERE ID=@ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [coursename], [slogan], [show_opinions], [receive_opinions], [startpage_content], [aboutus_content], [active_version], [site_mode] FROM [Settings]"
            UpdateCommand="Update Settings SET coursename=@coursename, slogan=@slogan, show_opinions=@show_opinions, receive_opinions=@receive_opinions,
                            startpage_content=@startpage_content, aboutus_content=@aboutus_content, active_version=@active_version, site_mode=@site_mode WHERE ID=@ID"
            DeleteCommand="DELETE FROM Settings WHERE ID=@ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [title], [section_content], [show] FROM [Sections]"
            UpdateCommand="Update Sections SET title=@title, show=@show, section_content=@section_content WHERE ID=@ID"
            DeleteCommand="DELETE FROM Sections WHERE ID=@ID"
            InsertCommand="INSERT INTO Sections (title, section_content, show) VALUES (@title, @section_content, @show)">
            <InsertParameters>
                <asp:Parameter Name="title" />
                <asp:Parameter Name="section_content" />
                <asp:Parameter Name="show" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [username], [date], [rating], [description], [acceptance] FROM [Ratings]"
            UpdateCommand="Update Ratings SET username=@username, date=@date, rating=@rating, description=@description, acceptance=@acceptance WHERE ID=@ID"
            DeleteCommand="DELETE FROM Ratings WHERE ID=@ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [section_id], [question], [question_type], [answer_1], [answer_2], [answer_3], [answer_4], [correct] FROM [Questions]"
            UpdateCommand="Update Questions SET section_id=@section_id, question=@question, question_type=@question_type, answer_1=@answer_1,
                            answer_2=@answer_2, answer_3=@answer_3, answer_4=@answer_4, correct=@correct WHERE ID=@ID"
            DeleteCommand="DELETE FROM Questions WHERE ID=@ID"
            InsertCommand="INSERT INTO Questions (section_id, question, question_type, answer_1, answer_2, answer_3, answer_4, correct)
                            VALUES (@section_id, @question, @question_type, @answer_1, @answer_2, @answer_3, @answer_4, @correct)">
            <InsertParameters>
                <asp:Parameter Name="section_id" />
                <asp:Parameter Name="question" />
                <asp:Parameter Name="question_type" />
                <asp:Parameter Name="answer_1" />
                <asp:Parameter Name="answer_2" />
                <asp:Parameter Name="answer_3" />
                <asp:Parameter Name="answer_4" />
                <asp:Parameter Name="correct" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [title], [file_path], [description], [show] FROM [Materials]"
            UpdateCommand="Update Materials SET title=@title, file_path=@file_path, description=@description, show=@show WHERE ID=@ID"
            DeleteCommand="DELETE FROM Materials WHERE ID=@ID"
            InsertCommand="INSERT INTO Materials (title, file_path, description, show) VALUES (@title, @file_path, @description, @show)">
            <InsertParameters>
                <asp:Parameter Name="title" />
                <asp:Parameter Name="file_path" />
                <asp:Parameter Name="description" />
                <asp:Parameter Name="show" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [userid], [section_id] FROM [Done_sections]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ connectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [code], [valid] FROM [Codes]"
            UpdateCommand="Update Codes SET code=@code, valid=@valid WHERE ID=@ID"
            DeleteCommand="DELETE FROM Codes WHERE ID=@ID">
        </asp:SqlDataSource>   
    </div>
</asp:Content>

