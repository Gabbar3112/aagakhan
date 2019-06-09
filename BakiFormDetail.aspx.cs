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


public partial class BakiFormDetail : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "BakiFormDetail";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=BakiFormDetail.aspx", true);
        if (!Page.IsPostBack)
        {
            BindFormDetail();
            BindBlockDetailsPopUp();
        }
    }

    private void BindFormDetail()
    {
        DataTable Fdetail = new DataTable();
        Fdetail.Columns.Add("RowNumber");
        Fdetail.Columns.Add("MemberName");
        Fdetail.Columns.Add("MangnaNo");
        Fdetail.Columns.Add("MangnaDate");
        Fdetail.Columns.Add("FinancialYear");
        Fdetail.Rows.Add();
        gvFormDetail.DataSource = Fdetail;
        gvFormDetail.DataBind();
    }

    [WebMethod]
    public static List<ListItem> ListFinYear()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListFinancialYearForBakiForm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["YearID"].ToString(),
                        Text = sdr["FinancialYear"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListFinYear");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    private void BindBlockDetailsPopUp()
    {
        DataTable search = new DataTable();
        search.Columns.Add("SeasonNameG");
        search.Columns.Add("FinancialYear");
        search.Columns.Add("BlockNo");
        search.Columns.Add("BlockArea");
        search.Columns.Add("PiyatArea");
        search.Columns.Add("KLPiyatArea");
        search.Columns.Add("BinPiyatArea");
        search.Columns.Add("VPiyatArea");
        search.Columns.Add("UPiyatArea");
        search.Columns.Add("Total");
       
        search.Rows.Add();
        gvBlockDetail.DataSource = search;
        gvBlockDetail.DataBind();
    }

    [WebMethod]
    public static string GetPersonBlockDetail(string PersonInfoID)
    {
        string query = "RemainReceiptBlockDetail";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MangnaPatrakID", PersonInfoID);
        return GetDataForm(cmd).GetXml();
    }

    private static DataSet GetDataForm(SqlCommand cmd)
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
                        sda.Fill(ds, "BlockDetail");
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetUser");

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
    public static string GetFromDetail(Int64 FinYearID, string MemberName, string MangnaNo,int pageIndex)
    {
        string query = "RemainReceiptDetail";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@YearID", FinYearID);
        cmd.Parameters.AddWithValue("@MemberName", MemberName);
        cmd.Parameters.AddWithValue("@MangnaNo", MangnaNo);
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
                    sda.Fill(ds, "FormDetail");
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
            }
        }

    }


    [WebMethod]
    public static string GetBlockDetail(string mId)
    {
        string query = "RemainReceiptBlockDetail";
        string strConnString = ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@MangnaPatrakID", mId);
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds.GetXml();
                    }
                }
            }
        }

    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckMangnaPatrakID(int MangnaPatrakID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckMangnaPatrakIDExist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = MangnaPatrakID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckMangnaPatrakID");
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
    public static string DeletePiyatDetail(int MangnaPatrakID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DeleteMangnaPatrak", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = MangnaPatrakID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.ExecuteNonQuery();
            msg = "પિયત ની માહિતી સફળતા થી રદ થઇ ગઈ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeletePiyatDetail");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return msg;
    }
}