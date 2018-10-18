<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 62px;
        }
        .auto-style3 {
            width: 224px;
        }
        .auto-style4 {
            width: 284px;
        }
    </style>
</head>
<body style="height: 95px">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Bienvenido:"></asp:Label>
                </td>
                <td>
        <asp:Label ID="lblHola" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Ver los últimos 6 estados de cuenta"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Movimientos desde el último estado de cuenta"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Saldo actual"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="ult6ECBT" runat="server" Text="Ir" Width="130px" OnClick="ult6ECBT_Click" />
                </td>
                <td class="auto-style4">
                    <asp:Button ID="movUECBT" runat="server" Text="Ir" Width="130px" OnClick="movUECBT_Click" />
                </td>
                <td>
                    <asp:Button ID="saldoActualBT" runat="server" Text="Ir" Width="131px" OnClick="saldoActualBT_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
