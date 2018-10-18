<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditarCuentas.aspx.cs" Inherits="Web_Page_Admin_CRUD_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField ID="hfID" runat="server"/>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="ID Cliente"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtClienteID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Documento ID Cliente"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtDocIdCliente" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Tipo de Cuenta"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtTipoCuenta" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Codigo de Cuenta"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtCodigoCuenta" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Saldo"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtSaldo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Fecha de Creación"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtFechaCreacion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Interes Acumulado"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtInteresAcum" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Activo"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtActivo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                </td>
                <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            </tr>
        </table>
        <br />
        <asp:GridView ID="gvCuenta" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="docIDCliente" HeaderText="Documento Identificación" />
                <asp:BoundField DataField="tipoCuenta" HeaderText="Tipo de Cuenta" />
                <asp:BoundField DataField="codigoCuenta" HeaderText="Codigo de Cuenta" />
                <asp:BoundField DataField="saldo" HeaderText="Saldo" />
                <asp:BoundField DataField="fechaCreacion" HeaderText="Fecha de Creación" />
                <asp:BoundField DataField="interesesAcum" HeaderText="Interes Acumulado" />
                <asp:BoundField DataField="activo" HeaderText="Activo" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>


