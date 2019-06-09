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

public partial class FarmerMaster : System.Web.UI.Page
{
    SqlConnection con;
    public static int PageSize = 10;
    public static string formname = "FarmerMaster";
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
    public static string MachineName = System.Environment.MachineName.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=FarmerMaster.aspx", true);

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        Session["MachineName"] = MachineName;
        Session["date"] = indianTime;

        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DataTable user = new DataTable();
        user.Columns.Add("RowNumber");
        user.Columns.Add("FullName");
        user.Columns.Add("FullAddress");
        user.Columns.Add("MobileNo");
        user.Columns.Add("TalukaName");
        user.Columns.Add("VillageName");
        user.Rows.Add();
        gvFarmerInfoMaster.DataSource = user;
        gvFarmerInfoMaster.DataBind();
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckMobileNo(string MobileNo)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckMobileNoExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = MobileNo;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckMobileNo");
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
    public static bool CheckMobileNoG(string MobileNoG)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckMobileNoGExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = MobileNoG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckMobileNoG");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }


    private void BindFarmer()
    {
        DataTable user = new DataTable();
        user.Columns.Add("RowNumber");
        user.Columns.Add("FullName");
        user.Columns.Add("FullAddress");
        user.Columns.Add("MobileNo");
        user.Columns.Add("TalukaName");
        user.Columns.Add("VillageName");
        user.Rows.Add();
    }

    public class Farmer
    {
        public Int64 FarmerID { get; set; }
        public int TalukaID { get; set; }
        public int DistrictID { get; set; }
        public Int64 VillageID { get; set; }
        public Int64 SectionVillageMappingID { get; set; }
        public string FName { get; set; }
        public string MName { get; set; }
        public string LName { get; set; }
        public string FNameG { get; set; }
        public string MNameG { get; set; }
        public string LNameG { get; set; }
        public string Add1 { get; set; }
        public string Add2 { get; set; }
        public string Add3 { get; set; }
        public string Add1G { get; set; }
        public string Add2G { get; set; }
        public string Add3G { get; set; }
        public string MobileNo { get; set; }
        public string MobileNoG { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string FarmerManage(Farmer user)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        try
        {
            if (user.FarmerID == 0)
            {
                SqlCommand cmd = new SqlCommand("FarmerMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@FName", SqlDbType.NVarChar).Value = user.FName;
                cmd.Parameters.Add("@MName", SqlDbType.NVarChar).Value = user.MName;
                cmd.Parameters.Add("@LName", SqlDbType.NVarChar).Value = user.LName;
                cmd.Parameters.Add("@FNameG", SqlDbType.NVarChar).Value = user.FNameG;
                cmd.Parameters.Add("@MNameG", SqlDbType.NVarChar).Value = user.MNameG;
                cmd.Parameters.Add("@LNameG", SqlDbType.NVarChar).Value = user.LNameG;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = user.Add1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = user.Add2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = user.Add3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = user.Add1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = user.Add2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = user.Add3G;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = user.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = user.MobileNoG;
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = user.VillageID;
                cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = HttpContext.Current.Session["MachineName"];
                cmd.ExecuteNonQuery();
                msg = "ખેડૂતની માહિતી સફળતાથી દાખલ થઈ ગઈ છે.";
               // Global.LogInsert(formname, "Insert", "FarmerMaster", "FarmerManage");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("FarmerMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@FarmerID",SqlDbType.BigInt).Value=user.FarmerID;
                cmd.Parameters.Add("@FName", SqlDbType.NVarChar).Value = user.FName;
                cmd.Parameters.Add("@MName", SqlDbType.NVarChar).Value = user.MName;
                cmd.Parameters.Add("@LName", SqlDbType.NVarChar).Value = user.LName;
                cmd.Parameters.Add("@FNameG", SqlDbType.NVarChar).Value = user.FNameG;
                cmd.Parameters.Add("@MNameG", SqlDbType.NVarChar).Value = user.MNameG;
                cmd.Parameters.Add("@LNameG", SqlDbType.NVarChar).Value = user.LNameG;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = user.Add1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = user.Add2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = user.Add3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = user.Add1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = user.Add2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = user.Add3G;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = user.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = user.MobileNoG;
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = user.VillageID;
                cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = HttpContext.Current.Session["MachineName"];
                cmd.ExecuteNonQuery();

                msg = "ખેડૂતની માહિતી સફળતાથી સુધારાઈ ગઈ છે.";
              //  Global.LogInsert(formname, "Update", "FarmerMaster", "FarmerManage");
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "FarmerManage");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return msg;
    }


    [WebMethod]
    public static string FarmerMasterGet(string searchTerm, int DistrictID, int TalukaID, int VillageID, int pageIndex)
    {
        string query = "FarmerMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@DistrictID", DistrictID).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@TalukaID", TalukaID).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@VillageID", VillageID).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@SearchTerm", searchTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
        cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

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
                    sda.Fill(ds, "Farmer");
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
    public static List<Farmer> FarmerMasterUpdate(int FarmerID)
    {
        List<Farmer> list = new List<Farmer>();
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ListAllFarmerByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FarmerID", SqlDbType.VarChar).Value = FarmerID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                list.Add(new Farmer
                {
                    FarmerID = Convert.ToInt64(ds.Tables[0].Rows[0]["FarmerID"].ToString()),
                    FName = ds.Tables[0].Rows[0]["FName"].ToString(),
                    MName = ds.Tables[0].Rows[0]["MName"].ToString(),
                    LName = ds.Tables[0].Rows[0]["LName"].ToString(),
                    FNameG = ds.Tables[0].Rows[0]["FNameG"].ToString(),
                    MNameG = ds.Tables[0].Rows[0]["MNameG"].ToString(),
                    LNameG = ds.Tables[0].Rows[0]["LNameG"].ToString(),
                    Add1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                    Add2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                    Add3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                    Add1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                    Add2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                    Add3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo1"].ToString(),
                    MobileNoG = ds.Tables[0].Rows[0]["MobileNo1G"].ToString(),
                    TalukaID = Convert.ToInt32(ds.Tables[0].Rows[0]["TalukaID"].ToString()),
                    VillageID = Convert.ToInt32(ds.Tables[0].Rows[0]["VillageID"].ToString()),
                    DistrictID = Convert.ToInt32(ds.Tables[0].Rows[0]["DistrictID"].ToString())
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "FarmerMasterUpdate");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
       // Global.LogInsert(formname, "List", "FarmerMaster", "FarmerMasterUpdate");
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static string FarmerMasterDelete(int FarmerID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand cmd = new SqlCommand("FarmerMasterDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = FarmerID;
            cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;

            int i = Convert.ToInt32(cmd.ExecuteScalar());
        //    Global.LogInsert(formname, "Delete", "FarmerMaster", "FarmerMasterDelete");

        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "FarmerMasterDelete");
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