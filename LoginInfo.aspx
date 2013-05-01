<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginInfo.aspx.cs" Inherits="LoginInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="css/addOpinion.css" type="text/css"/>
    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('btnCancel').click();
        }
    </script>
</head>
<body style="margin: 0px; padding: 0px;">
    <form id="form1" runat="server">
    <div class="popup_Container">
        <div class="popup_Titlebar" id="PopupHeader">
            <div class="TitlebarLeft">
                Information
            </div>
            <div class="TitlebarRight" onclick="cancel();"></div>
        </div>
        <div class="popup_Body">

            <p>You must be logged in to add own opinion!</p>
            
        </div>
    </div>
    </form>
</body>
</html>
