<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Consultas.aspx.cs" Inherits="Web_Page_Admin_Consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID ="gvListCu" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="CodigoCuenta" HeaderText ="Codigo Cuenta" />
                    <asp:BoundField DataField ="PromSaldoFin" HeaderText ="Promedio de Saldos" />
                    <asp:BoundField DataField ="PromSaldoMin" HeaderText ="Promedio de Saldo Minimo" />
                    <asp:BoundField DataField ="CantMovimiento" HeaderText ="Cantidad de Movimientos" />
                    <asp:BoundField DataField ="CantPromMov" HeaderText ="Cantidad de Movimientos Promedio" />
                    <asp:BoundField DataField ="CantMultas" HeaderText ="Cantidad de multas" />
                    <asp:BoundField DataField ="SumMultas" HeaderText ="Suma de multas" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
