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

public partial class CircleMaster : System.Web.UI.Page
{
    public static string formname = "CircleMaster";
    private static int PageSize =10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=CircleMaster.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "CIRCLE";
        if (!Page.IsPostBack)
        {
            BindCircle();
        }
    }

    public class Circle
    {
        public Int64 CircleID { get; set; }
        public string CircleName { get; set; }
        public string CircleNameG { get; set; }
        public string ShortCode { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address1G { get; set; }
        public string Address2G { get; set; }
        public string Address3G { get; set; }
        public string EmailID { get; set; }
        public string PhoneNo { get; set; }
        public string PhoneNoG { get; set; }
        public string MobileNo { get; set; }
        public string MobileNoG { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string CircleManage(Circle circle)
    {
        string msg = string.Empty;
        try
        {
            Global.conn.Open();
            if (circle.CircleID == 0)
            {
                SqlCommand cmd = new SqlCommand("CircleMasterInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CircleName", SqlDbType.NVarChar).Value = circle.CircleName;
                cmd.Parameters.Add("@CircleNameG", SqlDbType.NVarChar).Value = circle.CircleNameG;
                cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = circle.ShortCode;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = circle.Address1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = circle.Address2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = circle.Address3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = circle.Address1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = circle.Address2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = circle.Address3G;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = circle.EmailID;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.NVarChar).Value = circle.PhoneNo;
                cmd.Parameters.Add("@PhoneNoG", SqlDbType.NVarChar).Value = circle.PhoneNoG;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = circle.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = circle.MobileNoG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "વર્તુળ ની માહિતી દાખલ થઇ ગઈ છે.";
               // Global.LogInsert(formname, "Insert", "CircleMaster", "CircleManage");
                Global.conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("CircleMasterUpdate", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = circle.CircleID;
                cmd.Parameters.Add("@CircleName", SqlDbType.NVarChar).Value = circle.CircleName;
                cmd.Parameters.Add("@CircleNameG", SqlDbType.NVarChar).Value = circle.CircleNameG;
                cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = circle.ShortCode;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = circle.Address1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = circle.Address2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = circle.Address3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = circle.Address1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = circle.Address2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = circle.Address3G;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = circle.EmailID;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.NVarChar).Value = circle.PhoneNo;
                cmd.Parameters.Add("@PhoneNoG", SqlDbType.NVarChar).Value = circle.PhoneNoG;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = circle.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = circle.MobileNoG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "વર્તુળ ની માહિતી સુધરાઈ ગઈ છે.";
                //Global.LogInsert(formname, "Update", "CircleMaster", "CircleManage");
                Global.conn.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CircleManage");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    private void BindCircle()
    {
        DataTable circle = new DataTable();
        circle.Columns.Add("RowNumber");
        circle.Columns.Add("CircleID");
        circle.Columns.Add("CircleName");
        circle.Columns.Add("CircleNameG");
        circle.Columns.Add("ShortCode");
        circle.Columns.Add("Address1");
        circle.Columns.Add("Address1G");
        circle.Columns.Add("Address2");
        circle.Columns.Add("Address2G");
        circle.Columns.Add("Address3");
        circle.Columns.Add("Address3G");
        circle.Columns.Add("EmailID");
        circle.Columns.Add("PhoneNo");
        circle.Columns.Add("PhoneNoG");
        circle.Columns.Add("MobileNo");
        circle.Columns.Add("MobileNoG");
        circle.Rows.Add();
        dgvCircleMaster.DataSource = circle;
        dgvCircleMaster.DataBind();
    }

    [WebMethod]
    public static string GetCircle(string searchTerm, int pageIndex)
    {
        string msg = string.Empty;
        string query = "CircleMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]);
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.Add("@PageIndex", SqlDbType.BigInt).Value = pageIndex;
            cmd.Parameters.Add("@PageSize", SqlDbType.BigInt).Value = PageSize;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            return GetData(cmd,pageIndex).GetXml();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetCircle");
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
                    sda.Fill(ds, "Circle");
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
    public static List<Circle> GetCircleMaster(int CircleID)
    {
        string msg = string.Empty;
        List<Circle> list = new List<Circle>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListCircleGetByID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new Circle
                {
                    CircleID = Convert.ToInt64(ds.Tables[0].Rows[0]["CircleID"].ToString()),
                    CircleName = ds.Tables[0].Rows[0]["CircleName"].ToString(),
                    CircleNameG = ds.Tables[0].Rows[0]["CircleNameG"].ToString(),
                    ShortCode = ds.Tables[0].Rows[0]["ShortCode"].ToString(),
                    Address1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                    Address2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                    Address3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                    Address1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                    Address2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                    Address3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                    EmailID = ds.Tables[0].Rows[0]["EmailID"].ToString(),
                    PhoneNo = ds.Tables[0].Rows[0]["PhoneNo"].ToString(),
                    PhoneNoG = ds.Tables[0].Rows[0]["PhoneNoG"].ToString(),
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString(),
                    MobileNoG = ds.Tables[0].Rows[0]["MobileNoG"].ToString()
                });
            }
           // Global.LogInsert(formname, "List", "CircleMaster", "GetCircleMaster");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetCircleMaster");
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
    public static string DeleteCircle(int CircleID)
    {
        string msg = "";
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CircleMasterDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@DeleteBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "વર્તુળની માહિતી રદ થઇ ગઈ છે.";
           // Global.LogInsert(formname, "Delete", "CircleMaster", "DeleteCircle");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, "CircleMaster", "DeleteCircle");
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
    public static bool CheckCircleID(int CircleID)
    {
        Global.conn.Open();
        bool IsExist = false;
        try
        {
            SqlCommand cmd = new SqlCommand("CheckCircleIDExist", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckCircleID");
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
    public static bool CheckCircleName(string CircleName)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckCircleExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CircleName", SqlDbType.NVarChar).Value = CircleName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckCircleName");
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
    public static bool CheckCircleNameG(string CircleNameG)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckCircleExistsInGujarati", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CircleNameG", SqlDbType.NVarChar).Value = CircleNameG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckCircleNameG");
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
            SqlCommand cmd = new SqlCommand("CheckShortCodeExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ShortCode", SqlDbType.NVarChar).Value = ShortCode;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
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