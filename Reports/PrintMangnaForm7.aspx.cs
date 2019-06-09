using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Reports_PrintMangnaForm7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

        if (!Page.IsPostBack)
        {

            try
            {
                #region Bill For Magana Detail Withoot Shardi
                if (Request.QueryString["MangnaPatrakID"] != null && Request.QueryString["MangnaPatrakID"] != "")
                {
                    SqlCommand cmd = new SqlCommand("RptMangnaForm7", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = Request.QueryString["MangnaPatrakID"];
                    DataSet ds = new DataSet();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(ds);
                    cmd.Dispose();

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lblAcNo.Text = ds.Tables[0].Rows[0]["AccountNo"].ToString();
                        lblInstiNameG.Text = ds.Tables[0].Rows[0]["InstituteNameG"].ToString();
                        lblRegNo.Text = ds.Tables[0].Rows[0]["RegNoG"].ToString();
                        lblfgam.Text = ds.Tables[0].Rows[0]["FarmerVillage"].ToString();
                        lblfphoneno.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                        lblfrmer.Text = ds.Tables[0].Rows[0]["FarmerName"].ToString();
                        lblftaluko.Text = ds.Tables[0].Rows[0]["FarmerTaluka"].ToString();
                        lblGam.Text = ds.Tables[0].Rows[0]["MemberVillage"].ToString();
                        lblMalik.Text = ds.Tables[0].Rows[0]["PersonName"].ToString();
                        lblMDate.Text = ds.Tables[0].Rows[0]["MangnaDate"].ToString();
                        lblMNumber.Text = ds.Tables[0].Rows[0]["MangnaNo"].ToString();
                        lblMPhone.Text = ds.Tables[0].Rows[0]["MobileNo1"].ToString();
                        lblTaluko.Text = ds.Tables[0].Rows[0]["MemberTaluka"].ToString();
                        dsShrdiDetail.SelectParameters["MangnaPatrakID"].DefaultValue = Request.QueryString["MangnaPatrakID"].ToString();
                        dsSeasonDetail.SelectParameters["MangnaPatrakID"].DefaultValue = Request.QueryString["MangnaPatrakID"].ToString();
                        lblTotalLocAmt.Text = ds.Tables[0].Rows[0]["TotalLocalFund"].ToString();
                        lbltotalPiyavo.Text = ds.Tables[0].Rows[0]["TotalPiyavo"].ToString();
                        lblFinalTotal.Text = ds.Tables[0].Rows[0]["TotalKulAmount"].ToString();
                        lblShree.Text = ds.Tables[0].Rows[0]["PersonName"].ToString();
                        lblKhataNo.Text = ds.Tables[0].Rows[0]["AccountNo"].ToString();
                        lblVillage.Text = ds.Tables[0].Rows[0]["MemberVillage"].ToString();
                        lblRemark.Text = ds.Tables[0].Rows[0]["Remark"].ToString();
                        //lblCropName.Text = ds.Tables[0].Rows[0]["CropName"].ToString();
                        //lblFormDate.Text = ds.Tables[0].Rows[0]["FormDate"].ToString();
                        //lblFormNumber.Text = ds.Tables[0].Rows[0]["FormNo"].ToString();
                        lblChBaki.Text = ds.Tables[0].Rows[0]["TotalKulAmount"].ToString();
                        lblFromDate.Text = ds.Tables[0].Rows[0]["FromDate"].ToString();
                        lblToDate.Text = ds.Tables[0].Rows[0]["ToDate"].ToString();
                        lblOutstanding.Text = ds.Tables[0].Rows[0]["LastOutstanding"].ToString();
                        tblLam.Visible = false;
                    }
                }
                #endregion
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert(\"" + ex.Message + "\");", true);
            }
            finally
            {
                if (conn.State.Equals(ConnectionState.Open))
                    conn.Close();
            }
        }
    }
}