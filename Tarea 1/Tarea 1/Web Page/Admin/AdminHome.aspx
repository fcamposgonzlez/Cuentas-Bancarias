<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 74px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style11 {
            width: 205px;
            height: 23px;
        }
        .auto-style12 {
            width: 205px;
        }
        .auto-style13 {
            width: 100%;
        }
        .auto-style14 {
            height: 23px;
            width: 249px;
        }
        .auto-style15 {
            width: 249px;
        }
        .auto-style18 {
            height: 23px;
            width: 282px;
        }
        .auto-style19 {
            width: 282px;
        }
        .auto-style20 {
            height: 23px;
            width: 287px;
        }
        .auto-style21 {
            width: 287px;
        }
    </style>
</head>
<body style="height: 86px">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="Bienvenido:"></asp:Label>
                </td>
                <td>
        <asp:Label ID="lblHola" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table class="auto-style13">
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" Text="Editar (CRUD)"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:Label ID="Label3" runat="server" Text="Impersonar Cleinte"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label4" runat="server" Text="Consultar Cambios"></asp:Label>
                </td>
                <td class="auto-style14">
                    Lista Cuentas</td>
                <td class="auto-style8">
                    Top 20</td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Button ID="editCrudBT" runat="server" OnClick="editCrudBT_Click" Text="Ir" Width="102px" />
                </td>
                <td class="auto-style21">
                    <asp:Button ID="imperClieBT" runat="server" OnClick="imperClieBT_Click" Text="Ir" Width="105px" />
                </td>
                <td class="auto-style19">
                    <asp:Button ID="consulCamBT" runat="server" OnClick="consulCamBT_Click" Text="Ir" Width="104px" />
                </td>
                <td class="auto-style15">
                    <asp:Button ID="consultasBT" runat="server" OnClick="consultasBT_Click" Text="Ir" Width="102px" />
                </td>
                <td>
                    <asp:Button ID="Top20BT" runat="server" OnClick="Top20BT_Click" Text="Ir" Width="94px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
