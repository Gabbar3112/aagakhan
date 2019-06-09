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

public partial class CanalMaster : System.Web.UI.Page
{
    public static string formname = "CanalMaster";
    public static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=CanalMaster.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "નહેરની માહિતી";
        if (!Page.IsPostBack)
        {
            BindCanal();
        }
    }

    private void BindCanal()
    {
        DataTable canalbind = new DataTable();
        canalbind.Columns.Add("RowNumber");
        canalbind.Columns.Add("CanalID");
        canalbind.Columns.Add("CanalName");
        canalbind.Columns.Add("CanalNameG");
        canalbind.Columns.Add("CanalTypeG");
        canalbind.Columns.Add("HasParent");
        canalbind.Columns.Add("ParentType");
        canalbind.Columns.Add("ParentName");
        canalbind.Columns.Add("Length");
        canalbind.Columns.Add("Perimeter");
        canalbind.Rows.Add();
        dgvCanalMaster.DataSource = canalbind;
        dgvCanalMaster.DataBind();
    }

    public class CanalDetail
    {
        public Int64 CanalID { get; set; }
        public string CanalName { get; set; }
        public string CanalNameG { get; set; }
        public Int64 CanalTypeID { get; set; }
        public bool HasParent { get; set; }
        public Int64 ParentTypeID { get; set; }
        public Int64 ParentID { get; set; }
        public string Length { get; set; }
        public string Perimeter { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string CanalManage(CanalDetail canal)
    {
        string msg = string.Empty;
        try
        {
            Global.conn.Open();
            if (canal.CanalID == 0)
            {

                SqlCommand cmd = new SqlCommand("CanalMasterInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CanalName", SqlDbType.NVarChar).Value = canal.CanalName;
                cmd.Parameters.Add("@CanalNameG", SqlDbType.NVarChar).Value = canal.CanalNameG;
                cmd.Parameters.Add("@CanalTypeID", SqlDbType.BigInt).Value = canal.CanalTypeID;
                //cmd.Parameters.Add("@HasParent", canal.HasParent).DbType = DbType.Boolean;
                cmd.Parameters.Add("@HasParent", SqlDbType.Bit).Value = canal.HasParent;
                cmd.Parameters.Add("@ParentID", SqlDbType.BigInt).Value = canal.ParentID;
                cmd.Parameters.Add("@ParentTypeID", SqlDbType.BigInt).Value = canal.ParentTypeID;
                if (canal.Length == "")
                    cmd.Parameters.Add("@Length", SqlDbType.Decimal).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@Length", SqlDbType.Decimal).Value = Convert.ToDecimal(canal.Length);
                if (canal.Perimeter == "")
                    cmd.Parameters.Add("@Perimeter", SqlDbType.Decimal).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@Perimeter", SqlDbType.Decimal).Value = Convert.ToDecimal(canal.Perimeter);

                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "નહેરની માહિતી દાખલ થઇ ગઈ છે.";
                //Global.LogInsert(formname, "Insert", "CanalMaster", "CanalManage");
                Global.conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("CanalMasterUpdate", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = canal.CanalID;
                cmd.Parameters.Add("@CanalName", SqlDbType.NVarChar).Value = canal.CanalName;
                cmd.Parameters.Add("@CanalNameG", SqlDbType.NVarChar).Value = canal.CanalNameG;
                cmd.Parameters.Add("@CanalTypeID", SqlDbType.BigInt).Value = canal.CanalTypeID;
                //cmd.Parameters.Add("@HasParent", canal.HasParent).DbType = DbType.Boolean;
                cmd.Parameters.Add("@HasParent", SqlDbType.Bit).Value = canal.HasParent;
                cmd.Parameters.Add("@ParentID", SqlDbType.BigInt).Value = canal.ParentID;
                cmd.Parameters.Add("@ParentTypeID", SqlDbType.BigInt).Value = canal.ParentTypeID;
                if (canal.Length == "")
                    cmd.Parameters.Add("@Length", SqlDbType.Decimal).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@Length", SqlDbType.Decimal).Value = Convert.ToDecimal(canal.Length);
                if (canal.Perimeter == "")
                    cmd.Parameters.Add("@Perimeter", SqlDbType.Decimal).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@Perimeter", SqlDbType.Decimal).Value = Convert.ToDecimal(canal.Perimeter);

                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "નહેરની માહિતી સુધારાઈ ગઈ છે.";
               // Global.LogInsert(formname, "Update", "CanalMaster", "CanalManage");
                Global.conn.Close();
            }
           // msg = "Success";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CanalManage");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    [WebMethod]
    public static string GetCanalMaster(string SearchCanalWiseTerm, string SearchCanalTypeWiseTerm, string searchTerm,int pageIndex)
    {
        string msg = string.Empty;
        string query = "CanalMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CanalID", SearchCanalWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@CanalTypeID", SearchCanalTypeWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
         //   Global.LogInsert(formname, "Get", "CanalMaster", "GetCanalMaster");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetCanalMaster");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return GetData(cmd, pageIndex).GetXml();
    }

    private static DataSet GetData(SqlCommand cmd, int pageIndex)
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
                    sda.Fill(ds, "CanalDetail");
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
    [ScriptMethod]
    public static List<CanalDetail> GetCanalDetail(int CanalID)
    {
        string msg = string.Empty;
        List<CanalDetail> list = new List<CanalDetail>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListCanalGetByID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = CanalID;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new CanalDetail
                {
                    CanalID = Convert.ToInt64(ds.Tables[0].Rows[0]["CanalID"].ToString()),
                    CanalName = ds.Tables[0].Rows[0]["CanalName"].ToString(),
                    CanalNameG = ds.Tables[0].Rows[0]["CanalNameG"].ToString(),
                    CanalTypeID = Convert.ToInt64(ds.Tables[0].Rows[0]["CanalTypeID"].ToString()),
                    HasParent = Convert.ToBoolean(ds.Tables[0].Rows[0]["HasParent"]),
                    ParentID = Convert.ToInt64(ds.Tables[0].Rows[0]["ParentID"].ToString()),
                    ParentTypeID = Convert.ToInt32(ds.Tables[0].Rows[0]["ParentTypeID"].ToString()),
                    Length = ds.Tables[0].Rows[0]["Length"].ToString(),
                    Perimeter = ds.Tables[0].Rows[0]["Perimeter"].ToString(),
                });

            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetCanalDetail");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static string DeleteCanal(int CanalID)
    {
        string msg = "";
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CanalMasterDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = CanalID;
            //cmd.Parameters.Add("@ParentTypeID", SqlDbType.BigInt).Value = ParentTypeID;
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
       //     Global.LogInsert(formname, "Delete", "CanalMaster", "DeleteCanal");
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteCanal");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    [WebMethod]
    public static List<ListItem> ListParentNameByParent(int CanalTypeID)
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListParentNameByParent", Global.conn);
        List<ListItem> parents = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CanalTypeID", SqlDbType.BigInt).Value = CanalTypeID;
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    parents.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListParentNameByParent");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return parents;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckDataInCanal(int CanalID)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckParentExistInCanal", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CanalID", SqlDbType.Int).Value = CanalID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckDataInCanal");

        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }
}