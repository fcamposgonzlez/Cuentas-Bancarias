<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MovUltimoEstadCuenta.aspx.cs" Inherits="Web_Page_User_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID ="gvUltMov" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="ID_Cuenta" HeaderText ="ID Cuenta" />
                    <asp:BoundField DataField ="tipoMovimiento" HeaderText ="Tipo de Movimiento" />
                    <asp:BoundField DataField ="codigoCuentaMovimiento" HeaderText ="Codigo de Cuenta Movimiento" />
                    <asp:BoundField DataField ="fecha" HeaderText ="Fecha" />
                    <asp:BoundField DataField ="monto" HeaderText ="Monto" />
                    <asp:BoundField DataField ="saldoFinal" HeaderText ="Saldo Final" />
                    <asp:BoundField DataField ="pastIP" HeaderText ="IP Pasado" />
                    <asp:BoundField DataField ="pastUser" HeaderText ="Usuario Pasado" />
                    <asp:BoundField DataField ="pastTime" HeaderText ="Tiempo Pasado" />
                    <asp:BoundField DataField ="invisible" HeaderText ="Invisible" />
                    <asp:BoundField DataField ="descripcion" HeaderText ="Descripcion" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
