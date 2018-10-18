<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsultarCambios.aspx.cs" Inherits="Web_Page_Admin_ConsultarCambios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID ="gvEvent" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="AdminID" HeaderText ="ID Admin" />
                    <asp:BoundField DataField ="TipoDeEvento" HeaderText ="Tipo de Evento" />
                    <asp:BoundField DataField ="PastIP" HeaderText ="IP Pasado" />
                    <asp:BoundField DataField ="PastTime" HeaderText ="Tiempo Pasado" />
                    <asp:BoundField DataField ="XMLAntes" HeaderText ="XML de Antes" />
                    <asp:BoundField DataField ="XMLDespues" HeaderText ="XML de Despues" />
                    <asp:BoundField DataField ="EntidadID" HeaderText ="ID de Entidad" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
