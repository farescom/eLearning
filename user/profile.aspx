<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../js/jquery-1.5.2.js" ></script>
    <script type="text/javascript" src="../js/cufon-yui.js"></script>
    <script type="text/javascript" src="../js/cufon-replace.js"></script>
    <script type="text/javascript" src="../js/Molengo_400.font.js"></script>
    <script type="text/javascript" src="../js/Expletus_Sans_400.font.js"></script> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="pad_left1">

    <h2>My profile</h2>

        <asp:CreateUserWizard ID="CreateUserWizard2" runat="server" oncreatinguser="UpdateUser"
            BackColor="#DDDDDD" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Verdana" Font-Size="0.8em" 
            PasswordRegularExpressionErrorMessage="Enter another password" 
            EmailRequiredErrorMessage="Email address is required" 
            EmailRegularExpressionErrorMessage="Enter another email address" 
            PasswordRequiredErrorMessage="Password is required" 
            QuestionRequiredErrorMessage="Secret question is required" 
            UserNameRequiredErrorMessage="Login field is required" 
            AnswerLabelText="Secret question answer:" 
            CompleteSuccessText="The account was created successfully!" 
            ConfirmPasswordLabelText="Password again:" 
            CreateUserButtonText="Register" 
            DuplicateEmailErrorMessage="This email address is already used. Enter another email address" 
            DuplicateUserNameErrorMessage="Enter another login" 
            InvalidAnswerErrorMessage="Enter another answer" 
            InvalidEmailErrorMessage="Enter a valid email address" 
            InvalidPasswordErrorMessage="Minimum password length: {0}. Required non alphabetical characters: {1}." 
            InvalidQuestionErrorMessage="Enter another answer" 
            QuestionLabelText="Secret question:" 
            UnknownErrorMessage="The account was not created. Try again." 
            UserNameLabelText="Login:" 
            AnswerRequiredErrorMessage="Secret question answer is required" 
            ConfirmPasswordCompareErrorMessage="Password and password confirmation should be the same." 
            ConfirmPasswordRequiredErrorMessage="Password confirmation is required" 
            ContinueDestinationPageUrl="~/about.aspx" Width="500px">
            <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284775" />
            <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284775" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Creating new account">
                    <ContentTemplate>
                        <table class="registration">
                            <tr>
                                <td colspan="3">
                                    <strong><asp:Label ID="Label1" runat="server">User data: </asp:Label></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Login:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required" 
                                        ToolTip="Password is required" ValidationGroup="CreateUserWizard2">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                        AssociatedControlID="NewPassword">New password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmNewPassword">New password again:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Secret question:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">New secret question answer:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="Password and password confirmation should be the same." 
                                        ValidationGroup="CreateUserWizard2"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <br />
                                    <strong><asp:Label ID="Label2" runat="server">Personal data: </asp:Label></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstName">Firstname:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="FirstName1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="SurnameLabel" runat="server" AssociatedControlID="Surname">Surname:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Surname1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="SexLabel" runat="server" AssociatedControlID="Sex">Sex:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="Sex" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="BirthdateLabel" runat="server" AssociatedControlID="Birthdate">Birth date:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Birthdate1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Birthdate" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <br />
                                    <strong><asp:Label ID="Label3" runat="server">Address data: </asp:Label></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="CountryLabel" runat="server" AssociatedControlID="Country">Country:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Country1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Country" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="CityLabel" runat="server" AssociatedControlID="City">City:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="City1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="City" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PostCodeLabel" runat="server" AssociatedControlID="PostCode">Postal code:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="PostCode1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="PostCode" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                                <tr>
                                <td>
                                    <asp:Label ID="AddressLabel" runat="server" AssociatedControlID="Address">Address:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Address1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Address" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <strong><asp:Label ID="Label4" runat="server">Study settings: </asp:Label></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LearningModeLebel" runat="server" AssociatedControlID="LearningMode">Learning Mode:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="LearningMode" runat="server">
                                        <asp:ListItem>Linear</asp:ListItem>
                                        <asp:ListItem>Free</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="white_grey"><b class="red">Explanation:</b> <br /><ul><li> <strong>Linear mode:</strong> means, that you will be following the course step by step without the possibily to jump between different sections.</li><li> <strong>Free mode:</strong> allows you to jump between different sections of the course.</li></ul></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <br />
                                    <strong><asp:Label ID="Label5" runat="server">Activation data: </asp:Label></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="CodeLabel" runat="server" AssociatedControlID="Code">Activation code:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Code1" disabled="disabled" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="Code" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="white_grey"><b class="red">Explanation:</b><br />If you have activation code enter it here, then you will gain an access to all the functionality of site. If you don't have it just leave this text box empty.</div>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width:100%;height:100%;">
                            <tr align="right">
                                <td align="right" colspan="0">
                                    <asp:Button ID="StepNextButton" runat="server" BackColor="#FFFBFF" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                        CommandName="MoveNext" Font-Names="Verdana" ForeColor="#284775" 
                                        Text="Update profile" ValidationGroup="CreateUserWizard2" />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                ForeColor="#284775" />
            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
            <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" 
                VerticalAlign="Top" />
            <StepStyle BorderWidth="0px" />
        </asp:CreateUserWizard>

</div>
</asp:Content>