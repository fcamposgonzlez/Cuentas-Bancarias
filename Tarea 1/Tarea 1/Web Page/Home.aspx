<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Web_Page_Inicio_Admin_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 318px;
            height: 19px;
        }
        .auto-style3 {
            height: 19px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style2">Seleccione el tipo de usuario al que desea ingresar:</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="adminBT" runat="server" Text="Administrador" OnClick="adminBT_Click" />
                        <asp:Button ID="userBT" runat="server" Text="Usuario" Width="119px" OnClick="userBT_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
