using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System;
using System.Configuration;
using System.Data;

public partial class Reports_PrintFormNo12 : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
    int tempcounter = 0;
    int serialNo = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Default.aspx?RedirectTo=Reports/PrintFormNo12.aspx", true);
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["VillageID"] != null && Request.QueryString["SeasonID"] != null)
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("RptForm12", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = Request.QueryString["InstituteID"];
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Request.QueryString["VillageID"];
                cmd.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = Request.QueryString["SeasonID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    //if (ds.Tables[0].Rows.Count % 25 != 0)
                    //{
                        //int i = 25 - (ds.Tables[0].Rows.Count % 25);

                        //for (int j = 0; j < i; j++)
                        //{
                        //    DataRow dr = ds.Tables[0].NewRow();
                        //    //ds.Tables[0].Rows.Add("");
                        //}
                        dgvDetail.DataSource = ds;
                        dgvDetail.DataBind();
                    //}
                    //else
                    //{
                    //    dgvDetail.DataSource = ds;
                    //    dgvDetail.DataBind();
                    //}
                    lblDistrict.Text = ds.Tables[0].Rows[0]["DistrictNameG"].ToString();
                    lblTaluka.Text = ds.Tables[0].Rows[0]["TalukaNameG"].ToString();
                    lblVillage.Text = ds.Tables[0].Rows[0]["VillageNameG"].ToString();
                    lblYear.Text = ds.Tables[0].Rows[0]["YearGroup"].ToString();
                    //if (dgvDetail.Rows.Count > 0)
                    //{
                    //    dgvDetail.UseAccessibleHeader = true;
                    //    dgvDetail.HeaderRow.TableSection = TableRowSection.TableHeader;
                    //}
                    //for (int i = 0; i < dgvDetail.Rows.Count; i++)
                    //{
                    //    if (dgvDetail.DataKeys[i].Value != DBNull.Value)
                    //    {
                    //        //if (Convert.ToBoolean(dgvDetail.DataKeys[i].Value) == true)
                    //        //    dgvDetail.Rows[i].BackColor = System.Drawing.Color.LightGray;
                    //    }
                    //}
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Inserted", "alert('માંગણા નથી.');", true);
                }

            }

        }
    }

    protected void dgvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            tempcounter = tempcounter + 1;
            if (tempcounter == 25)
            {
                e.Row.Attributes.Add("style", "page-break-after: always;");
                tempcounter = 0;
            }
            Label lblSerial1 = (Label)e.Row.FindControl("lblNo1");
            lblSerial1.Text = serialNo.ToString();
            serialNo = serialNo + 1;
        }
    }
}