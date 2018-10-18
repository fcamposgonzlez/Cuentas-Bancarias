using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Web_Page_User_Default : System.Web.UI.Page
{
    string connectionString = @"Server=HP-PAVILION-15;Database=BD_1_Tarea;Trusted_Connection=True;";

    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection sqlcon = new SqlConnection(connectionString))
        {
            sqlcon.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("SP_movRecientes", sqlcon);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add("@cliente_vid", SqlDbType.VarChar).Value = (Session["valorDocId"]);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            gvUltMov.DataSource = dtbl;
            gvUltMov.DataBind();
        }
    }
}