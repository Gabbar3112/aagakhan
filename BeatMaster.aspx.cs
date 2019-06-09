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

public partial class BeatMaster : System.Web.UI.Page
{
    public static string formname = "BeatMaster";
    public static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=BeatMaster.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "બીટની માહિતી";
        if (!Page.IsPostBack)
        {
           
            BindBeat();
        }
    }

    private void BindBeat()
    {
        DataTable beatbind = new DataTable();
        beatbind.Columns.Add("RowNumber");
        beatbind.Columns.Add("BeatID");
        beatbind.Columns.Add("CircleNameG");
        beatbind.Columns.Add("DivisionNameG");
        beatbind.Columns.Add("SubDivisionNameG");
        beatbind.Columns.Add("SectionNameG");
        beatbind.Columns.Add("BeatName");
        beatbind.Columns.Add("BeatNameG");
        beatbind.Columns.Add("BeatCode");
        beatbind.Columns.Add("BeatCodeG");
        beatbind.Rows.Add();
        dgvBeatMaster.DataSource = beatbind;
        dgvBeatMaster.DataBind();
    }

    public class BeatDetail
    {
        public Int64 BeatID { get; set; }
        public Int64 CircleID { get; set; }
        public Int64 DivisionID { get; set; }
        public int SubDivisionID { get; set; }
        public Int64 SectionID { get; set; }
        public string BeatName { get; set; }
        public string BeatNameG { get; set; }
        public string BeatCode { get; set; }
        public string BeatCodeG { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string BeatManage(BeatDetail beat)
    {
        string IsExist = string.Empty;
        string msg = string.Empty;
        try
        {
            Global.conn.Open();
            if (beat.BeatID == 0)
            {

                SqlCommand cmd = new SqlCommand("BeatMasterInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = beat.SectionID;
                cmd.Parameters.Add("@BeatName", SqlDbType.NVarChar).Value = beat.BeatName;
                cmd.Parameters.Add("@BeatNameG", SqlDbType.NVarChar).Value = beat.BeatNameG;
                cmd.Parameters.Add("@BeatCode", SqlDbType.NVarChar).Value = beat.BeatCode;
                cmd.Parameters.Add("@BeatCodeG", SqlDbType.NVarChar).Value = beat.BeatCodeG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                string result = cmd.ExecuteScalar().ToString();
                cmd.Dispose();

                //cmd = new SqlCommand("CheckBeatAccessFromSection", Global.conn);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = beat.SectionID;
                //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];


                //int i = Convert.ToInt32(cmd.ExecuteScalar());
                //if (i == 0)
                //    IsExist = "0";
                //else
                //{
                //    IsExist = "1";

                //    cmd = new SqlCommand("DELETE FROM UserBeatMaster WHERE UserID =" + HttpContext.Current.Session["UserID"] + " AND BeatID =" + result + " AND LoginType = '" + HttpContext.Current.Session["LoginType"] + "'    ", Global.conn);
                //    cmd.ExecuteNonQuery();

                //    cmd = new SqlCommand("UserBeatMasterInsert", Global.conn);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = result;
                //    cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                //    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                //    cmd.ExecuteNonQuery();
                //}
               // Global.LogInsert(formname, "Insert", "BeatMaster", "BeatManage");
                Global.conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("BeatMasterUpdate", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = beat.BeatID;
                cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = beat.SectionID;
                cmd.Parameters.Add("@BeatName", SqlDbType.NVarChar).Value = beat.BeatName;
                cmd.Parameters.Add("@BeatNameG", SqlDbType.NVarChar).Value = beat.BeatNameG;
                cmd.Parameters.Add("@BeatCode", SqlDbType.NVarChar).Value = beat.BeatCode;
                cmd.Parameters.Add("@BeatCodeG", SqlDbType.NVarChar).Value = beat.BeatCodeG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                //cmd = new SqlCommand("CheckBeatAccessFromSection", Global.conn);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = beat.SectionID;
                //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];

                //int i = Convert.ToInt32(cmd.ExecuteScalar());
                //if (i == 0)
                //    IsExist = "0";
                //else
                //{
                //    IsExist = "1";
                //    cmd = new SqlCommand("DELETE FROM UserBeatMaster WHERE UserID =" + HttpContext.Current.Session["UserID"] + " AND BeatID =" + beat.BeatID + " AND LoginType = '" + HttpContext.Current.Session["LoginType"] + "'  ", Global.conn);
                    
                //    cmd.ExecuteNonQuery();

                //    cmd = new SqlCommand("UserBeatMasterInsert", Global.conn);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = beat.BeatID;
                //    cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                //    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                //    cmd.ExecuteNonQuery();
                //}
               // Global.LogInsert(formname, "Update", "BeatMaster", "BeatManage");
                Global.conn.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "BeatManage");
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
    public static string GetBeatMaster(string SearchCircleWiseTerm, string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm, string SearchSectionTerm,int pageIndex)
    {
        string msg = string.Empty;
        string query = "BeatMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BeatID","0");
            //cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@CircleID", SearchCircleWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SectionID", SearchSectionTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            //Global.LogInsert(formname, "Get", "BeatMaster", "GetBeatMaster");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetBeatMaster");
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
                    sda.Fill(ds, "BeatDetail");
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
    public static List<BeatDetail> GetBeatDetail(int BeatID)
    {
        string msg = string.Empty;
        List<BeatDetail> list = new List<BeatDetail>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListBeatGetByID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = BeatID;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new BeatDetail
                {
                    BeatID = Convert.ToInt64(ds.Tables[0].Rows[0]["BeatID"].ToString()),
                    CircleID = Convert.ToInt64(ds.Tables[0].Rows[0]["CircleID"].ToString()),
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionID = Convert.ToInt32(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    SectionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionID"].ToString()),
                    BeatName = ds.Tables[0].Rows[0]["BeatName"].ToString(),
                    BeatNameG = ds.Tables[0].Rows[0]["BeatNameG"].ToString(),
                    BeatCode = ds.Tables[0].Rows[0]["BeatCode"].ToString(),
                    BeatCodeG = ds.Tables[0].Rows[0]["BeatCodeG"].ToString(),
                });

            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetBeatDetail");
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
    public static string DeleteBeat(int BeatID)
    {
        string msg = "";
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("BeatMasterDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = BeatID;
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            //Global.LogInsert(formname, "Delete", "BeatMaster", "DeleteBeat");
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteBeat");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    //[WebMethod]
    //public static List<ListItem> ListCircle()
    //{
    //    string msg = string.Empty;
    //    SqlCommand cmd = new SqlCommand("AGRIListCircleByUserForFilter", Global.conn);
    //    List<ListItem> circles = new List<ListItem>();
    //    try
    //    {
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Connection = Global.conn;
    //        Global.conn.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                circles.Add(new ListItem
    //                {
    //                    Value = sdr["CircleID"].ToString(),
    //                    Text = sdr["CircleName"].ToString()
    //                });
    //            }
    //        }
    //        Global.conn.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListCircle");
    //        msg = ex.Message;
    //    }
    //    finally
    //    {
    //        if (Global.conn.State == ConnectionState.Open)
    //            Global.conn.Close();
    //    }
    //    return circles;
    //}

    //[WebMethod]
    //public static List<ListItem> ListDivision(int CircleID)
    //{
    //    string msg = string.Empty;
    //    SqlCommand cmd = new SqlCommand("ListDivisionFromCircle", Global.conn);
    //    List<ListItem> divisions = new List<ListItem>();
    //    try
    //    {
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
    //        cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
    //        cmd.Connection = Global.conn;
    //        Global.conn.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                divisions.Add(new ListItem
    //                {
    //                    Value = sdr["DivisionID"].ToString(),
    //                    Text = sdr["DivisionNameG"].ToString()
    //                });
    //            }
    //        }
    //        Global.conn.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListDivision");
    //        msg = ex.Message;
    //    }
    //    finally
    //    {
    //        if (Global.conn.State == ConnectionState.Open)
    //            Global.conn.Close();
    //    }
    //    return divisions;
    //}

    //[WebMethod]
    //public static List<ListItem> ListSubDivision(int DivisionID)
    //{
    //    string msg = string.Empty;
    //    SqlCommand cmd = new SqlCommand("ListSubDivisionFromDivision", Global.conn);
    //    List<ListItem> subdivisions = new List<ListItem>();
    //    try
    //    {
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        if (DivisionID == 0)
    //            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = 0;
    //        else
    //            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
    //        cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
    //        cmd.Connection = Global.conn;
    //        Global.conn.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                subdivisions.Add(new ListItem
    //                {
    //                    Value = sdr["SubDivisionID"].ToString(),
    //                    Text = sdr["SubDivisionNameG"].ToString()
    //                });
    //            }
    //        }
    //        Global.conn.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListSubDivision");
    //        msg = ex.Message;
    //    }
    //    finally
    //    {
    //        if (Global.conn.State == ConnectionState.Open)
    //            Global.conn.Close();
    //    }
    //    return subdivisions;
    //}

    //[WebMethod]
    //public static List<ListItem> ListSection(int SubDivisionID)
    //{
    //    string msg = string.Empty;
    //    SqlCommand cmd = new SqlCommand("ListSectionFromSubDivision", Global.conn);
    //    List<ListItem> sections = new List<ListItem>();
    //    try
    //    {
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = SubDivisionID;
    //        cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
    //        cmd.Connection = Global.conn;
    //        Global.conn.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                sections.Add(new ListItem
    //                {
    //                    Value = sdr["SectionID"].ToString(),
    //                    Text = sdr["SectionNameG"].ToString()
    //                });
    //            }
    //        }
    //        Global.conn.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListSection");
    //        msg = ex.Message;
    //    }
    //    finally
    //    {
    //        if (Global.conn.State == ConnectionState.Open)
    //            Global.conn.Close();
    //    }
    //    return sections;
    //}

    [WebMethod]
    [ScriptMethod]
    public static bool CheckBeatName(Int64 SectionID, string BeatName)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckBeatNameExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.Int).Value = SectionID;
            cmd.Parameters.Add("@BeatName", SqlDbType.NVarChar).Value = BeatName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckBeatName");

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
    public static bool CheckBeatNameG(Int64 SectionID, string BeatNameG)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckBeatNameExistsInGujarati", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.Int).Value = SectionID;
            cmd.Parameters.Add("@BeatNameG", SqlDbType.NVarChar).Value = BeatNameG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckBeatNameG");

        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }
}