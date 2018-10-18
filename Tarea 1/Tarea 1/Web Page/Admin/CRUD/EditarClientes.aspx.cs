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
            txtNombre.Text = txtValorDocId.Text = txtContrasenna.Text = txtActivo.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("SP_actualizarCliente", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
            sqlCmd.Parameters.AddWithValue("@nombre", txtNombre.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@valorDocId", txtValorDocId.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@contrasenna", txtContrasenna.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@activo", txtActivo.Text.Trim());

            sqlCmd.Parameters.AddWithValue("@pastIP", GetLocalIPAddress());
            sqlCmd.Parameters.AddWithValue("@pastTime", DateTime.Now);
            sqlCmd.Parameters.AddWithValue("@adminDocID", (Session["valorDocId"]).ToString());
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
            SqlDataAdapter sqlDa = new SqlDataAdapter("SP_ViewAllClientes", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gvContact.DataSource = dtbl;
            gvContact.DataBind();

        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SP_ViewAllClientesByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfID.Value = ID.ToString();
            txtNombre.Text = dtbl.Rows[0]["nombre"].ToString();
            txtValorDocId.Text = dtbl.Rows[0]["valorDocId"].ToString();
            txtContrasenna.Text = dtbl.Rows[0]["contrasenna"].ToString();
            txtActivo.Text = dtbl.Rows[0]["Activo"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("SP_ClienteDeleteByID", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@ID", Convert.ToInt32(hfID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }

}