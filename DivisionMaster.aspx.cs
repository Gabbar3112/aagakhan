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

public partial class DivisionMaster : System.Web.UI.Page
{
    public static string formname = "DivisionMaster";
    private static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=DivisionMaster.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "DIVISION";
        if (!Page.IsPostBack)
        {
            BindDivision();
        }
    }

    public class Division
    {
        public Int64 DivisionID { get; set; }
        public Int64 CircleID { get; set; }
        public string DivisionName { get; set; }
        public string DivisionNameG { get; set; }
        public string ShortCode { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address1G { get; set; }
        public string Address2G { get; set; }
        public string Address3G { get; set; }
        public string Pincode { get; set; }
        public string PincodeG { get; set; }
        public string EmailID { get; set; }
        public string OPhoneNo1 { get; set; }
        public string OPhoneNo1G { get; set; }
        public string OPhoneNo2 { get; set; }
        public string OPhoneNo2G { get; set; }
        public string PPhoneNo { get; set; }
        public string PPhoneNoG { get; set; }
        public string MobileNo { get; set; }
        public string MobileNoG { get; set; }
        public string FaxNo { get; set; }
        public string FaxNoG { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string DivisionManage(Division division)
    {
        string msg = string.Empty;
        try
        {
            Global.conn.Open();
            if (division.DivisionID == 0)
            {
                SqlCommand cmd = new SqlCommand("DivisionMasterInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = division.CircleID;
                cmd.Parameters.Add("@DivisionName", SqlDbType.NVarChar).Value = division.DivisionName;
                cmd.Parameters.Add("@DivisionNameG", SqlDbType.NVarChar).Value = division.DivisionNameG;
                cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = division.ShortCode;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = division.Address1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = division.Address2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = division.Address3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = division.Address1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = division.Address2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = division.Address3G;
                cmd.Parameters.Add("@Pincode", SqlDbType.NVarChar).Value = division.Pincode;
                cmd.Parameters.Add("@PincodeG", SqlDbType.NVarChar).Value = division.PincodeG;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = division.EmailID;
                cmd.Parameters.Add("@OPhoneNo1", SqlDbType.NVarChar).Value = division.OPhoneNo1;
                cmd.Parameters.Add("@OPhoneNo1G", SqlDbType.NVarChar).Value = division.OPhoneNo1G;
                cmd.Parameters.Add("@OPhoneNo2", SqlDbType.NVarChar).Value = division.OPhoneNo2;
                cmd.Parameters.Add("@OPhoneNo2G", SqlDbType.NVarChar).Value = division.OPhoneNo2G;
                cmd.Parameters.Add("@PPhoneNo", SqlDbType.NVarChar).Value = division.PPhoneNo;
                cmd.Parameters.Add("@PPhoneNoG", SqlDbType.NVarChar).Value = division.PPhoneNoG;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = division.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = division.MobileNoG;
                cmd.Parameters.Add("@FaxNo", SqlDbType.NVarChar).Value = division.FaxNo;
                cmd.Parameters.Add("@FaxNoG", SqlDbType.NVarChar).Value = division.FaxNoG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "વિભાગની માહિતી દાખલ થઇ ગઈ છે.";
             //   Global.LogInsert(formname, "Insert", "DivisionMaster", "DivisionManage");
                Global.conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("DivisionMasterUpdate", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = division.DivisionID;
                cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = division.CircleID;
                cmd.Parameters.Add("@DivisionName", SqlDbType.NVarChar).Value = division.DivisionName;
                cmd.Parameters.Add("@DivisionNameG", SqlDbType.NVarChar).Value = division.DivisionNameG;
                cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = division.ShortCode;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = division.Address1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = division.Address2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = division.Address3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = division.Address1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = division.Address2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = division.Address3G;
                cmd.Parameters.Add("@Pincode", SqlDbType.NVarChar).Value = division.Pincode;
                cmd.Parameters.Add("@PincodeG", SqlDbType.NVarChar).Value = division.PincodeG;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = division.EmailID;
                cmd.Parameters.Add("@OPhoneNo1", SqlDbType.NVarChar).Value = division.OPhoneNo1;
                cmd.Parameters.Add("@OPhoneNo1G", SqlDbType.NVarChar).Value = division.OPhoneNo1G;
                cmd.Parameters.Add("@OPhoneNo2", SqlDbType.NVarChar).Value = division.OPhoneNo2;
                cmd.Parameters.Add("@OPhoneNo2G", SqlDbType.NVarChar).Value = division.OPhoneNo2G;
                cmd.Parameters.Add("@PPhoneNo", SqlDbType.NVarChar).Value = division.PPhoneNo;
                cmd.Parameters.Add("@PPhoneNoG", SqlDbType.NVarChar).Value = division.PPhoneNoG;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = division.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = division.MobileNoG;
                cmd.Parameters.Add("@FaxNo", SqlDbType.NVarChar).Value = division.FaxNo;
                cmd.Parameters.Add("@FaxNoG", SqlDbType.NVarChar).Value = division.FaxNoG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "વિભાગની માહિતી સુધારાઈ ગઈ છે.";
             //   Global.LogInsert(formname, "Update", "DivisionMaster", "DivisionManage");
                Global.conn.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DivisionManage");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    private void BindDivision()
    {
        DataTable division = new DataTable();
        division.Columns.Add("RowNumber");
        division.Columns.Add("DivisionID");
        division.Columns.Add("CircleName");
        division.Columns.Add("DivisionName");
        division.Columns.Add("DivisionNameG");
        division.Columns.Add("ShortCode");
        division.Columns.Add("Address1");
        division.Columns.Add("Address1G");
        division.Columns.Add("Address2");
        division.Columns.Add("Address2G");
        division.Columns.Add("Address3");
        division.Columns.Add("Address3G");
        division.Columns.Add("Pincode");
        division.Columns.Add("PincodeG");
        division.Columns.Add("EmailID");
        division.Columns.Add("OPhoneNo1");
        division.Columns.Add("OPhoneNo1G");
        division.Columns.Add("OPhoneNo2");
        division.Columns.Add("OPhoneNo2G");
        division.Columns.Add("PPhoneNo");
        division.Columns.Add("PPhoneNoG");
        division.Columns.Add("MobileNo");
        division.Columns.Add("MobileNoG");
        division.Columns.Add("FaxNo");
        division.Columns.Add("FaxNoG");
        division.Rows.Add();
        dgvDivisionMaster.DataSource = division;
        dgvDivisionMaster.DataBind();
    }

    [WebMethod]
    public static string GetDivision(string searchTerm, int pageIndex)
    {
        string msg = string.Empty;
        string query = "DivisionMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
       //     cmd.Parameters.AddWithValue("@DivisionID", "0");
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", PageSize);
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            //return GetData(cmd, pageIndex).GetXml();
         //   Global.LogInsert(formname, "Get", "DivisionMaster", "GetDivision");
            return GetData(cmd, pageIndex).GetXml();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetDivision");
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
                    sda.Fill(ds, "Division");
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
    public static List<Division> GetDivisionMaster(int DivisionID)
    {
        string msg = string.Empty;
        List<Division> list = new List<Division>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListDivisionGetByID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new Division
                {
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    CircleID = Convert.ToInt64(ds.Tables[0].Rows[0]["CircleID"].ToString()),
                    DivisionName = ds.Tables[0].Rows[0]["DivisionName"].ToString(),
                    DivisionNameG = ds.Tables[0].Rows[0]["DivisionNameG"].ToString(),
                    ShortCode = ds.Tables[0].Rows[0]["ShortCode"].ToString(),
                    Address1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                    Address2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                    Address3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                    Address1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                    Address2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                    Address3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                    Pincode = ds.Tables[0].Rows[0]["Pincode"].ToString(),
                    PincodeG = ds.Tables[0].Rows[0]["PincodeG"].ToString(),
                    EmailID = ds.Tables[0].Rows[0]["EmailID"].ToString(),
                    OPhoneNo1 = ds.Tables[0].Rows[0]["OPhoneNo1"].ToString(),
                    OPhoneNo1G = ds.Tables[0].Rows[0]["OPhoneNo1G"].ToString(),
                    OPhoneNo2 = ds.Tables[0].Rows[0]["OPhoneNo2"].ToString(),
                    OPhoneNo2G = ds.Tables[0].Rows[0]["OPhoneNo2G"].ToString(),
                    PPhoneNo = ds.Tables[0].Rows[0]["PPhoneNo"].ToString(),
                    PPhoneNoG = ds.Tables[0].Rows[0]["PPhoneNoG"].ToString(),
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString(),
                    MobileNoG = ds.Tables[0].Rows[0]["MobileNoG"].ToString(),
                    FaxNo = ds.Tables[0].Rows[0]["FaxNo"].ToString(),
                    FaxNoG = ds.Tables[0].Rows[0]["FaxNoG"].ToString()
                });
            }
           // Global.LogInsert(formname, "List", "DivisionMaster", "GetDivisionMaster");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetDivisionMaster");
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
    public static string DeleteDivision(int DivisionID)
    {
        string msg = "";
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("DivisionMasterDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@DeleteBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "વિભાગની માહિતી રદ થઇ ગઈ છે.";
        //    Global.LogInsert(formname, "Delete", "DivisionMaster", "DeleteDivision");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, "DivisionMaster", "DeleteDivision");
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
    public static bool CheckDivisionID(int DivisionID)
    {
        Global.conn.Open();
        bool IsExist = false;
        try
        {
            SqlCommand cmd = new SqlCommand("CheckDivisionIDExist", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckDivisionID");
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
    public static bool CheckDivisionName(string DivisionName, int CircleID)
    {
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckDivisionNameExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DivisionName", SqlDbType.NVarChar).Value = DivisionName;
            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
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
            Global.ErrorInsert(ex.Message, formname, "CheckDivisionName");
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
    public static bool CheckDivisionNameG(string DivisionNameG, int CircleID)
    {
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckDivisionNameExistsInGujarati", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DivisionNameG", SqlDbType.NVarChar).Value = DivisionNameG;
            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
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
            Global.ErrorInsert(ex.Message, formname, "CheckDivisionNameG");
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
            SqlCommand cmd = new SqlCommand("CheckDivisionShortCodeExists", Global.conn);
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