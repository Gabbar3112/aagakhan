using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;  

public partial class Map : System.Web.UI.Page
{
    public static string formname = "Map";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=Map.aspx", true);

        if (!Page.IsPostBack)
        {
            BindPiyatMandli();
        }
    }
    private void BindPiyatMandli()
    {
        DataTable pak = new DataTable();
        pak.Columns.Add("RowNumber");
        pak.Columns.Add("InstituteNameG");
        pak.Columns.Add("InstituteCodeG");
        pak.Columns.Add("RegNoG");
        pak.Rows.Add();
        gvInstitute.DataSource = pak;
        gvInstitute.DataBind();
    }

    [WebMethod]
    public static string GetInstitute()
    {
        string query = "GetInstituteForMap";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ClusterID", HttpContext.Current.Session["ClusterID"]);
        return GetData(cmd).GetXml();
    }

    private static DataSet GetData(SqlCommand cmd)
    {
        string strConnString = ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds, "InstituteDetail");
                    return ds;
                }
            }
        }

    }
}