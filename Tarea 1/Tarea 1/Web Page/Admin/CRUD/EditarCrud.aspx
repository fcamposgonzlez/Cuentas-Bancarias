<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditarCrud.aspx.cs" Inherits="Web_Page_Admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 247px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Edit<span style="display: inline !important; float: none; background-color: transparent; color: rgb(34, 34, 34); font-family: &quot;Arial&quot;,&quot;Helvetica&quot;,sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">arTipos de Cuenta</span></td>
                    <td><span style="display: inline !important; float: none; background-color: transparent; color: rgb(34, 34, 34); font-family: &quot;Arial&quot;,&quot;Helvetica&quot;,sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">&nbsp;Editar Cuentas</span></td>
                    <td>Editar <span style="display: inline !important; float: none; background-color: transparent; color: rgb(34, 34, 34); font-family: &quot;Arial&quot;,&quot;Helvetica&quot;,sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">clientes</span></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="editTCuentabt" runat="server" OnClick="editTCuentabt_Click" Text="Ir" Width="114px" />
                    </td>
                    <td>
                        <asp:Button ID="editCuentabt" runat="server" OnClick="editCuentabt_Click" Text="Ir" Width="118px" />
                    </td>
                    <td>
                        <asp:Button ID="editClientebt" runat="server" OnClick="editClientebt_Click" Text="Ir" Width="114px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
