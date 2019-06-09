using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RptCanalDetail : System.Web.UI.Page
{
    SqlConnection con;
    private static int PageSize = 20;
    public static string formname = "RptCanalDetail";
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
    public static string MachineName = System.Environment.MachineName.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=RptCanalDetail.aspx", true);

        Session.Add("filename", "RPTCanalDetail.aspx");
        Session["date"] = indianTime;
        if (!Page.IsPostBack)
        {

        }
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        string msg = string.Empty;
        try
        {
            dsRptBeatWiseCanalDetailTableAdapters.RptBeatWiseCanalDetailTableAdapter ds = new dsRptBeatWiseCanalDetailTableAdapters.RptBeatWiseCanalDetailTableAdapter();
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource("dsRptBeatWiseCanalDetail", (DataTable)ds.GetData(Convert.ToInt64(ddlSubDiv.SelectedValue), Convert.ToInt64(ddlDivision.SelectedValue)));
            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = Server.MapPath("Reports/rptBeatWiseCanalDetail.rdlc");
            viewer.LocalReport.DataSources.Add(rds);
            Warning[] warnings;
            string[] streamids;
            string mimeType;
            string encoding;
            string extension;
            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamids, out warnings);
            using (System.IO.FileStream fs = new System.IO.FileStream(Server.MapPath("Reports/BeatWiseCanalDetail.pdf"), System.IO.FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);
            }
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "newWindow", "window.open('Reports/BeatWiseCanalDetail.pdf','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=800,height=600');", true);
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "btnPrint_Click");
            msg = "Error" + ex.Message;
        }
    }
}