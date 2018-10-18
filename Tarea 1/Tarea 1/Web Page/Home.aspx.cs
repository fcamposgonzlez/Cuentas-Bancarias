using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Page_Inicio_Admin_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void adminBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin/AdminLogin.aspx");
    }

    protected void userBT_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/UserLogin.aspx");
    }
}