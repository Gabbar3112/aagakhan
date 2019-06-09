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

public partial class SubDivisionMaster : System.Web.UI.Page
{
    public static string formname = "SubDivisionMaster";
    private static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=SubDivisionMaster.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "SUBDIVISION";
        if (!Page.IsPostBack)
        {
            BindSubDivision();
        }
    }

    public class SubDivision
    {
        public Int64 SubDivisionID { get; set; }
        public Int64 CircleID { get; set; }
        public Int64 DivisionID { get; set; }
        public string SubDivisionName { get; set; }
        public string SubDivisionNameG { get; set; }
        public string ShortCode { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address1G { get; set; }
        public string Address2G { get; set; }
        public string Address3G { get; set; }
        public string PhoneNo { get; set; }
        public string PhoneNoG { get; set; }
        public string MobileNo { get; set; }
        public string MobileNoG { get; set; }
    }


    [WebMethod]
    [ScriptMethod]
    public static string SubDivisionManage(SubDivision subdivision)
    {
        string msg = string.Empty;
        try
        {
            Global.conn.Open();
            if (subdivision.SubDivisionID == 0)
            {
                SqlCommand cmd = new SqlCommand("SubDivisionMasterInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = subdivision.DivisionID;
                cmd.Parameters.Add("@SubDivisionName", SqlDbType.NVarChar).Value = subdivision.SubDivisionName;
                cmd.Parameters.Add("@SubDivisionNameG", SqlDbType.NVarChar).Value = subdivision.SubDivisionNameG;
                cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = subdivision.ShortCode;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = subdivision.Address1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = subdivision.Address2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = subdivision.Address3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = subdivision.Address1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = subdivision.Address2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = subdivision.Address3G;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.NVarChar).Value = subdivision.PhoneNo;
                cmd.Parameters.Add("@PhoneNoG", SqlDbType.NVarChar).Value = subdivision.PhoneNoG;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = subdivision.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = subdivision.MobileNoG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "પેટા વિભાગની માહિતી દાખલ થઇ ગઈ છે.";
               // Global.LogInsert(formname, "Insert", "SubDivisionMaster", "SubDivisionManage");
                Global.conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("SubDivisionMasterUpdate", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = subdivision.SubDivisionID;
                cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = subdivision.DivisionID;
                cmd.Parameters.Add("@SubDivisionName", SqlDbType.NVarChar).Value = subdivision.SubDivisionName;
                cmd.Parameters.Add("@SubDivisionNameG", SqlDbType.NVarChar).Value = subdivision.SubDivisionNameG;
                cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = subdivision.ShortCode;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = subdivision.Address1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = subdivision.Address2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = subdivision.Address3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = subdivision.Address1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = subdivision.Address2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = subdivision.Address3G;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.NVarChar).Value = subdivision.PhoneNo;
                cmd.Parameters.Add("@PhoneNoG", SqlDbType.NVarChar).Value = subdivision.PhoneNoG;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = subdivision.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = subdivision.MobileNoG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "પેટા વિભાગની માહિતી સુધારાઈ ગઈ છે.";
              //  Global.LogInsert(formname, "Update", "SubDivisionMaster", "SubDivisionManage");
                Global.conn.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "SubDivisionManage");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    private void BindSubDivision()
    {
        DataTable subdivision = new DataTable();
        subdivision.Columns.Add("RowNumber");
        subdivision.Columns.Add("SubDivisionID");
        subdivision.Columns.Add("CircleNameG");
        subdivision.Columns.Add("DivisionNameG");
        subdivision.Columns.Add("SubDivisionName");
        subdivision.Columns.Add("SubDivisionNameG");
        subdivision.Columns.Add("ShortCode");
        subdivision.Columns.Add("Address1");
        subdivision.Columns.Add("Address1G");
        subdivision.Columns.Add("Address2");
        subdivision.Columns.Add("Address2G");
        subdivision.Columns.Add("Address3");
        subdivision.Columns.Add("Address3G");
        subdivision.Columns.Add("PhoneNo");
        subdivision.Columns.Add("PhoneNoG");
        subdivision.Columns.Add("MobileNo");
        subdivision.Columns.Add("MobileNoG");
        subdivision.Rows.Add();
        dgvSubDivisionMaster.DataSource = subdivision;
        dgvSubDivisionMaster.DataBind();
    }

    [WebMethod]
    public static string GetSubDivision(string SearchCircleWiseTerm, string SearchDivisionWiseTerm, int pageIndex)
    {
        string msg = string.Empty;
        string query = "SubDivisionMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SubDivisionID", "0");
            cmd.Parameters.AddWithValue("@CircleID", SearchCircleWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            //cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            //return GetData(cmd, pageIndex).GetXml();
          //  Global.LogInsert(formname, "Get", "SubDivisionMaster", "GetSubDivision");
            return GetData(cmd, pageIndex).GetXml();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSubDivision");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return GetData(cmd,pageIndex).GetXml();
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
                    sda.Fill(ds, "SubDivision");
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
    public static List<SubDivision> GetSubDivisionMaster(int SubDivisionID)
    {
        string msg = string.Empty;
        List<SubDivision> list = new List<SubDivision>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListSubDivisionGetByID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = SubDivisionID;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new SubDivision
                {
                    SubDivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    CircleID = Convert.ToInt64(ds.Tables[0].Rows[0]["CircleID"].ToString()),
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionName = ds.Tables[0].Rows[0]["SubDivisionName"].ToString(),
                    SubDivisionNameG = ds.Tables[0].Rows[0]["SubDivisionNameG"].ToString(),
                    ShortCode = ds.Tables[0].Rows[0]["ShortCode"].ToString(),
                    Address1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                    Address2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                    Address3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                    Address1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                    Address2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                    Address3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                    PhoneNo = ds.Tables[0].Rows[0]["PhoneNo"].ToString(),
                    PhoneNoG = ds.Tables[0].Rows[0]["PhoneNoG"].ToString(),
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString(),
                    MobileNoG = ds.Tables[0].Rows[0]["MobileNoG"].ToString()
                });
            }
           // Global.LogInsert(formname, "List", "SubDivisionMaster", "GetSubDivisionMaster");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSubDivisionMaster");
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
    public static string DeleteSubDivision(int SubDivisionID)
    {
        string msg = "";
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("SubDivisionMasterDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = SubDivisionID;
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "પેટા વિભાગની માહિતી રદ થઇ ગઈ છે.";
           // Global.LogInsert(formname, "Delete", "SubDivisionMaster", "DeleteSunDivision");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, "SubDivisionMaster", "DeleteSunDivision");
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
    [ScriptMethod]
    public static bool CheckSubDivisionName(string SubDivisionName, int DivisionID)
    {
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckSubDivisionNameExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SubDivisionName", SqlDbType.NVarChar).Value = SubDivisionName;
            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
            {
                IsExist = false;
            }
            else
            {
                IsExist = true;
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckSubDivisionName");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckSubDivisionNameG(string SubDivisionNameG, int DivisionID)
    {
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckSubDivisionNameExistsInGujarati", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SubDivisionNameG", SqlDbType.NVarChar).Value = SubDivisionNameG;
            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
            {
                IsExist = false;
            }
            else
            {
                IsExist = true;
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckSubDivisionNameG");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckShortCode(string ShortCode)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckSubDivisionShortCodeExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = ShortCode;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
            {
                IsExist = false;
            }
            else
            {
                IsExist = true;
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckShortCode");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }
}