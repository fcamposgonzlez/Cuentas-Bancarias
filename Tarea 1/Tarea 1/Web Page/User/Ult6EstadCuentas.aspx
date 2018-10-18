<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ult6EstadCuentas.aspx.cs" Inherits="Web_Page_User_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID ="gvEC6" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="Fecha" HeaderText ="Numero de Cuenta" />
                    <asp:BoundField DataField ="SaldoInicial" HeaderText ="Saldo Inicial" />
                    <asp:BoundField DataField ="SaldoFinal" HeaderText ="Saldo Final" />
                    <asp:BoundField DataField ="SaldoMinimo" HeaderText ="Saldo Minimo" />
                    <asp:BoundField DataField ="QOpManuales" HeaderText ="Cantidad Operaciones Manuales" />
                    <asp:BoundField DataField ="QOpATM" HeaderText ="Cantidad Operaciones ATM" />
                    <asp:BoundField DataField ="ID_Cuenta" HeaderText ="Cuenta ID" />
                    <asp:BoundField DataField ="abierto" HeaderText ="Abierto" />
                    <asp:BoundField DataField ="codigoCuenta" HeaderText ="Codigo Cuenta" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
