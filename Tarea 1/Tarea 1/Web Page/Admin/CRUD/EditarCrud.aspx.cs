using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Page_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void editTCuentabt_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditarTCuentas.aspx");
    }

    protected void editCuentabt_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditarCuentas.aspx");
    }

    protected void editClientebt_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditarClientes.aspx");
    }
}