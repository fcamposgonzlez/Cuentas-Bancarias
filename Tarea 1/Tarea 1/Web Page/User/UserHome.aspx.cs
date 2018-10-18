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

    protected void ult6ECBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ult6EstadCuentas.aspx");
    }

    protected void movUECBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("MovUltimoEstadCuenta.aspx");
    }

    protected void saldoActualBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("SaldoActual.aspx");
    }
}