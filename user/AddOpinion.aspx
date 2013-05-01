<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddOpinion.aspx.cs" Inherits="AddOpinion" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>

    <link rel="stylesheet" href="../css/ratingStar.css" type="text/css"/>
    <link rel="stylesheet" href="../css/addOpinion.css" type="text/css"/>
    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('btnCancel').click();
        }
    </script>

</head>
<body style="margin: 0px; padding: 0px;">
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true"></asp:ToolkitScriptManager>
    <div class="popup_Container">
        <div class="popup_Titlebar" id="PopupHeader">
            <div class="TitlebarLeft">
                Add own opinion
            </div>
            <div class="TitlebarRight" onclick="cancel();"></div>
        </div>
        <div class="popup_Body">

            <asp:TextBox ID="TextBox1" Height="100px" Width="600px" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            ControlToValidate="TextBox1" runat="server" 
            ErrorMessage="Please type your opinion" 
            SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>

            <table><tr>
                <td><p>Rating: </p></td>
                <td>
                    <asp:Rating style="margin-left: 20px;" ID="Rating" runat="server"
                        CurrentRating="5"
                        MaxRating="5"
                        StarCssClass="starRating"
                        WaitingStarCssClass="waitingStarRating"
                        FilledStarCssClass="filledStarRating"
                        EmptyStarCssClass="emptyStarRating" /> 
                </td>
            </tr></table>

        </div>
        <div class="popup_Buttons">
            <asp:Button ID="btnOK" OnClick="AddOwnOpinion" Text="Done" runat="server" />
        </div>
    </div>
    </form>
</body>
