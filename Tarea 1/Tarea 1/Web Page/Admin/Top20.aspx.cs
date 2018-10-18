﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Web_Page_Admin_Default : System.Web.UI.Page
{
    string connectionString = @"Server=HP-PAVILION-15;Database=BD_1_Tarea;Trusted_Connection=True;";

    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection sqlcon = new SqlConnection(connectionString))
        {
            sqlcon.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("SP_top20_CD", sqlcon);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            gvT20.DataSource = dtbl;
            gvT20.DataBind();
        }
    }
}