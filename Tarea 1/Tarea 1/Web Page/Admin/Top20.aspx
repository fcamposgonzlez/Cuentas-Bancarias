<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Top20.aspx.cs" Inherits="Web_Page_Admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID ="gvT20" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="codigoCuenta" HeaderText ="Codigo Cuenta" />
                    <asp:BoundField DataField ="monto" HeaderText ="Monto" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
