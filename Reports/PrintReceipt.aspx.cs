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

public partial class Reports_PrintReceipt : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
    public static double sum = 0.00;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["RID"] != "" && Request.QueryString["RID"] != null)
            {
                try
                {
                    Session["TotalPiyavo"] = null;
                    Session["TotalLocalFund"] = null;
                    Session["FinalTotal"] = null;
                    Session["TotalDiscountAmount"] = null;
                    Session["FinalIntTotal"] = null;
                    Session["TotalInterestAmt"] = null;
                    if (conn.State.Equals(ConnectionState.Closed))
                        conn.Open();
                    SqlCommand cmd = new SqlCommand("ReceiptReport", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ReceiptID", SqlDbType.BigInt).Value = Request.QueryString["RID"];
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lblDate.Text = ds.Tables[0].Rows[0]["ReceiveDate"].ToString();
                        lblRceipt.Text = ds.Tables[0].Rows[0]["ReceiptNumber"].ToString();
                        lblPerson.Text = ds.Tables[0].Rows[0]["PersonName"].ToString();
                        lblPersonGam.Text = ds.Tables[0].Rows[0]["PersonVillage"].ToString();

                        lbrRegNo.Text = ds.Tables[0].Rows[0]["RegNoG"].ToString();
                        lbrAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                        lblPhoneNo.Text = ds.Tables[0].Rows[0]["PhoneNo"].ToString();
                        lblInstituteName.Text = ds.Tables[0].Rows[0]["InstituteNameG"].ToString();

                        lblMagnaDate.Text = ds.Tables[0].Rows[0]["MangnaDate"].ToString();
                        lblMagnaNo.Text = ds.Tables[0].Rows[0]["MangnaNo"].ToString();
                     
                        lblBankName.Text = ds.Tables[0].Rows[0]["BankName"].ToString();
                        lblChequeNo.Text = ds.Tables[0].Rows[0]["ChequeNo"].ToString();
                        lblChequeDate.Text = ds.Tables[0].Rows[0]["ChequeDate"].ToString();

                        lblReceiveRs.Text = ds.Tables[0].Rows[0]["ReceiveAmount"].ToString();
                        string number = Global.NumberToGujarati.changeNumericToWords(Math.Round((Convert.ToDouble(lblReceiveRs.Text)), 0));
                        lblRsWord.Text = number + ' ' + '(' + lblReceiveRs.Text + ')';

                        if (ds.Tables[0].Rows[0]["ReceiptNumber"].ToString() != "")
                        {
                            lblPrevReceiptNumbers.Text = ds.Tables[0].Rows[0]["ReceiptNumber"].ToString();
                            trPrevRecptHeading.Visible = true;
                            trPrevRecptNo.Visible = true;
                        }
                     
                    }

                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    if (conn.State.Equals(ConnectionState.Open))
                        conn.Close();
                }
            }
    
        }
    }

    protected void dgvSeasonDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblTotalPiyavo = (Label)e.Row.FindControl("lblTotalPiyavo");
            Label lblTotalLocalFund = (Label)e.Row.FindControl("lblTotalLocalFund");
            Label lblTotalRakam = (Label)e.Row.FindControl("lblTotalRakam");
          
            Label lblFinalAmt = (Label)e.Row.FindControl("lblFinalAmt");
          
            if (lblTotalPiyavo != null)
            {
                Session["TotalPiyavo"] = (Convert.ToDecimal(Session["TotalPiyavo"]) + Convert.ToDecimal(lblTotalPiyavo.Text)).ToString();
            }
            if (lblTotalLocalFund != null)
            {
                Session["TotalLocalFund"] = (Convert.ToDecimal(Session["TotalLocalFund"]) + Convert.ToDecimal(lblTotalLocalFund.Text)).ToString();
            }
            if (lblTotalRakam != null)
            {
                Session["FinalTotal"] = (Convert.ToDecimal(Session["FinalTotal"]) + Convert.ToDecimal(lblTotalRakam.Text)).ToString();
            }
           
            if (lblFinalAmt != null)
            {
                Session["FinalIntTotal"] = (Convert.ToDecimal(Session["FinalIntTotal"]) + Convert.ToDecimal(lblFinalAmt.Text)).ToString();
            }
          
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblKulPiyavo = (Label)e.Row.FindControl("lblKulPiyavo");
            Label lblKulFund = (Label)e.Row.FindControl("lblKulFund");
            Label lblKulRakam = (Label)e.Row.FindControl("lblKulRakam");
          
            Label lblCRakam = (Label)e.Row.FindControl("lblCRakam");
           
            lblKulPiyavo.Text = Session["TotalPiyavo"].ToString();
            lblKulFund.Text = Session["TotalLocalFund"].ToString();
            lblKulRakam.Text = Session["FinalTotal"].ToString();
           
            lblCRakam.Text = Session["FinalIntTotal"].ToString();
           
        }
    }
  
}