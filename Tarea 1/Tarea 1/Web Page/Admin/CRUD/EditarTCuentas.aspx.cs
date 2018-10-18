using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Web_Page_Admin_CRUD_Default : System.Web.UI.Page
{

    SqlConnection sqlCon = new SqlConnection(@"Server=HP-PAVILION-15;Database=BD_1_Tarea;Trusted_Connection=True;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnDelete.Enabled = false;
            FillGridView();
        }
    }

    public static string GetLocalIPAddress()
    {
        var host = Dns.GetHostEntry(Dns.GetHostName());
        foreach (var ip in host.AddressList)
        {
            if (ip.AddressFamily == AddressFamily.InterNetwork)
            {
                return ip.ToString();
            }
        }
        throw new Exception("No network adapters with an IPv4 address in the system!");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    public void Clear()
    {
        hfID.Value = "";
        txtnombre.Text = txttasaInteres.Text = txtsaldoMinimo.Text = txtQMaxManual.Text = txtQMaxATM.Text = txtmultaSaldoMinimo.Text = txtmultaQMaxManual.Text = txtmultaQMaxAtm.Text = txtmultaSaldoNegativo.Text = txtcargoXservicio.Text = "";
        lblSuccessMessage.Text = lblErrorMessage.Text = "";
        btnSave.Text = "Save";
        btnDelete.Enabled = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("SP_actualizarTipoCuenta", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
        sqlCmd.Parameters.AddWithValue("@nombre", txtnombre.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@tasaInteres", txttasaInteres.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@saldoMinimo", txtsaldoMinimo.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@QMaxManual", txtQMaxManual.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@QMaxATM", txtQMaxATM.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@multaSaldoMinimo", txtmultaSaldoMinimo.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@multaQMaxManual", txtmultaQMaxManual.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@multaQMaxAtm", txtmultaQMaxAtm.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@multaSaldoNegativo", txtmultaSaldoNegativo.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@cargoXservicio", txtcargoXservicio.Text.Trim());
        sqlCmd.Parameters.AddWithValue("@activo", txtactivo.Text.Trim());

        sqlCmd.Parameters.AddWithValue("@pastIP", GetLocalIPAddress());
        sqlCmd.Parameters.AddWithValue("@pastTime", DateTime.Now);
        sqlCmd.Parameters.AddWithValue("@adminDocID", (Session["valorDocId"]));

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        string ID = hfID.Value;
        Clear();
        if (ID == "")
            lblSuccessMessage.Text = "Saved Successfully";
        else
            lblSuccessMessage.Text = "Updated Successfully";
        FillGridView();
    }

    void FillGridView()
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("SP_ViewAllTipoCuentas", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        gvCuenta.DataSource = dtbl;
        gvCuenta.DataBind();

    }

    protected void lnk_OnClick(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("SP_ViewAllTipoCuentasByID", sqlCon);
        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlDa.SelectCommand.Parameters.AddWithValue("@ID", ID);
        DataTable dtbl = new DataTable();
        sqlDa.Fill(dtbl);
        sqlCon.Close();
        hfID.Value = ID.ToString();
        txtnombre.Text = dtbl.Rows[0]["nombre"].ToString();
        txttasaInteres.Text = dtbl.Rows[0]["tasaInteres"].ToString();
        txtsaldoMinimo.Text = dtbl.Rows[0]["saldoMinimo"].ToString();
        txtQMaxManual.Text = dtbl.Rows[0]["QMaxManual"].ToString();
        txtQMaxATM.Text = dtbl.Rows[0]["QMaxATM"].ToString();
        txtmultaSaldoMinimo.Text = dtbl.Rows[0]["multaSaldoMinimo"].ToString();
        txtmultaQMaxManual.Text = dtbl.Rows[0]["multaQMaxManual"].ToString();
        txtmultaQMaxAtm.Text = dtbl.Rows[0]["multaQMaxAtm"].ToString();
        txtmultaSaldoNegativo.Text = dtbl.Rows[0]["multaSaldoNegativo"].ToString();
        txtcargoXservicio.Text = dtbl.Rows[0]["cargoXservicio"].ToString();
        txtactivo.Text = dtbl.Rows[0]["activo"].ToString();
        btnSave.Text = "Update";
        btnDelete.Enabled = true;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (sqlCon.State == ConnectionState.Closed)
            sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("SP_TipoCuentaDeleteByID", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@ID", Convert.ToInt32(hfID.Value));
        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        Clear();
        FillGridView();
        lblSuccessMessage.Text = "Deleted Successfully";
    }

}