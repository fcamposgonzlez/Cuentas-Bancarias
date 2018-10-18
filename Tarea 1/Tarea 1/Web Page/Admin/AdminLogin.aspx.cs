using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Loginaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
        int numero;
        numero = 0;
        System.Data.DataView dvSql = (System.Data.DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dvSql.Count > 0)
        {
            numero = 1;
        }
        if (numero == 1)
        {
            //Session["usuario"] = dvSql[0].DataView[0];
            Session["usuario"] = dvSql[0].Row[0];
            Session["valorDocID"] = dvSql[0].Row[1];
            Session["contrasenna"] = dvSql[0].Row[2];
            Response.Redirect("AdminHome.aspx");
        }


    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}