<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImpersonarCliente.aspx.cs" Inherits="Loginaspx" %>

<!DOCTYPE html>
<script runat="server">


</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 95px;
        }
        .auto-style2 {
            width: 95px;
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style2">Usuario:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="usuUserTB" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="login" runat="server" OnClick="login_Click" Text="Login" />
                        <asp:SqlDataSource ID="DataSourceImper" runat="server" ConnectionString="Data Source=HP-PAVILION-15;Initial Catalog=BD_1_Tarea;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SP_Impersonar" SelectCommandType="StoredProcedure" OnSelecting="SqlUserDataSource_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="usuUserTB" Name="usu" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
