<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaldoActual.aspx.cs" Inherits="Web_Page_User_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID ="gvSaldos" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="codigoCuenta" HeaderText ="Numero de Cuenta" />
                    <asp:BoundField DataField ="saldo" HeaderText ="Saldo" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
