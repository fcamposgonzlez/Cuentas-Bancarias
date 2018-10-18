<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditarTCuentas.aspx.cs" Inherits="Web_Page_Admin_CRUD_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
    <div>
        <asp:HiddenField ID="hfID" runat="server"/>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Tasa de Interes"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txttasaInteres" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Saldo Minimo"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtsaldoMinimo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Cantidad de operaciones manuales maxima"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtQMaxManual" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Cantidad de operaciones en ATM maximas"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtQMaxATM" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Multa por saldo minimo"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtmultaSaldoMinimo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Multa por cantidad maxima manual"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtmultaQMaxManual" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Multa por cantidad maxima en ATM"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtmultaQMaxAtm" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Multa por saldo negativo"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtmultaSaldoNegativo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Cargo por servicio"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtcargoXservicio" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Activo"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtactivo" runat="server"></asp:TextBox>
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
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="tasaInteres" HeaderText="Tasa de Interes" />
                <asp:BoundField DataField="saldoMinimo" HeaderText="Saldo Minimo" />
                <asp:BoundField DataField="QMAxManual" HeaderText="Cantidad Maxima Operaciones Manuales" />
                <asp:BoundField DataField="QMAxATM" HeaderText="Cantidad Maxima Operaciones en ATM" />
                <asp:BoundField DataField="multaSaldoMinimo" HeaderText="Multas Saldo Minimo" />
                <asp:BoundField DataField="multaQMaxManual" HeaderText="Multa Cantidad Maxima Manual" />
                <asp:BoundField DataField="multaQMaxAtm" HeaderText="Multa Cantidad Maxima ATM" />
                <asp:BoundField DataField="multaSaldoNegativo" HeaderText="Multa SAldo Negativo" />
                <asp:BoundField DataField="cargoXservicio" HeaderText="Cargo Por Servicio" />
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
