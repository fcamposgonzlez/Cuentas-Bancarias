using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      lblHola.Text = (Session["usuario"]).ToString();
    }

    protected void editCrudBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("CRUD/EditarCrud.aspx");
    }

    protected void imperClieBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("ImpersonarCliente.aspx");
    }

    protected void consulCamBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConsultarCambios.aspx");
    }

    protected void consultasBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("Consultas.aspx");
    }

    protected void Top20BT_Click(object sender, EventArgs e)
    {
        Response.Redirect("Top20.aspx");
    }
}