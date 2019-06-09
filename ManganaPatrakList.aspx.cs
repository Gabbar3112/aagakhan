using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ManganaPatrakList : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "ManganaPatrakList";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=PakMaster.aspx", true);

        if (!Page.IsPostBack)
        {
            BindTypes();
        }
    }

    private void BindTypes()
    {
        DataTable types = new DataTable();
        types.Columns.Add("RowNumber");
        types.Columns.Add("Name");
        types.Columns.Add("AccountNo");
        types.Columns.Add("MangnaNo");
        types.Columns.Add("HouseholdNo");
        types.Columns.Add("MangnaDate");
        types.Columns.Add("Year");

        types.Rows.Add();
        gvMangnalist.DataSource = types;
        gvMangnalist.DataBind();
    }

    [WebMethod]
    public static string GetDetails(string Name, string AcctNo, string MangnaNo,int pageIndex)
    {
        string query = "GetMangnaPatrakList";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Name;
        cmd.Parameters.Add("@AccountNo", SqlDbType.VarChar).Value = AcctNo;
        cmd.Parameters.Add("@MangnaNo", SqlDbType.VarChar).Value = MangnaNo;
        cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
        cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
        cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        return GetData(cmd,pageIndex).GetXml();
    }

    private static DataSet GetData(SqlCommand cmd,int pageIndex)
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
                    try
                    {
                        sda.Fill(ds, "MemberMaster");
                        DataTable dt = new DataTable("Pager");
                        dt.Columns.Add("PageIndex");
                        dt.Columns.Add("PageSize");
                        dt.Columns.Add("RecordCount");
                        dt.Rows.Add();
                        dt.Rows[0]["PageIndex"] = pageIndex;
                        dt.Rows[0]["PageSize"] = PageSize;
                        dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                        ds.Tables.Add(dt);
                        return ds;
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetData");
                    }
                    finally
                    {
                        if (con.State == ConnectionState.Open)
                            con.Close();
                    }
                    return ds;
                }
            }
        }
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckID(string MangnaPatrakID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckMagnaIDInReceipt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.VarChar).Value = MangnaPatrakID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckID");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static string DeleteMangna(string MangnaPatrakID)
    {
        string msg = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {

            SqlCommand cmd = new SqlCommand("DeleteMangnaPatrak", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = MangnaPatrakID;       
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.ExecuteNonQuery();
            msg = "માંગણા ની માહિતી રદ થઇ ગઇ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteMangna");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return msg;
    }
}