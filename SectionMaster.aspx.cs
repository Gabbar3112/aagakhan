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

public partial class SectionMaster : System.Web.UI.Page
{
    public static string formname = "SectionMaster";
    public static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=SectionMaster.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        
        if (!Page.IsPostBack)
        {
            
            BindSection();
        }
    }

    public class SectionDetail
    {
        public Int64 SectionID { get; set; }
        public Int64 CircleID { get; set; }
        public Int64 DivisionID { get; set; }
        public Int64 SubDivisionID { get; set; }
        public string SectionName { get; set; }
        public string SectionNameG { get; set; }
    }


    [WebMethod]
    [ScriptMethod]
    public static string SectionManage(SectionDetail section)
    {
        string IsExist = string.Empty;
        string msg = string.Empty;
        try
        {
            Global.conn.Open();
            if (section.SectionID == 0)
            {
                SqlCommand cmd = new SqlCommand("SectionMasterInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = section.SubDivisionID;
                cmd.Parameters.Add("@SectionName", SqlDbType.NVarChar).Value = section.SectionName;
                cmd.Parameters.Add("@SectionNameG", SqlDbType.NVarChar).Value = section.SectionNameG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                string result = cmd.ExecuteScalar().ToString();
                cmd.Dispose();

                //cmd = new SqlCommand("CheckSectionAccessFromSubDivision", Global.conn);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = section.SubDivisionID;
                //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];

                //int i = Convert.ToInt32(cmd.ExecuteScalar());

                //if (i == 0)
                //    IsExist = "0";
                //else
                //{
                //    IsExist = "1";
                //    cmd = new SqlCommand("DELETE FROM UserSectionMaster WHERE UserID =" + HttpContext.Current.Session["UserID"] + " AND SectionID =" + result + " AND LoginType = '" + HttpContext.Current.Session["LoginType"] + "'   ", Global.conn);
                //    cmd.ExecuteNonQuery();

                //    cmd = new SqlCommand("UserSectionMasterInsert", Global.conn);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = result;
                //    cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                //    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                //    cmd.ExecuteNonQuery();
                //}
                msg = "સેક્શનની માહિતી દાખલ થઇ ગઈ છે.";
               // Global.LogInsert(formname, "Insert", "SectionMaster", "SectionManage");
                Global.conn.Close();
            }
            else
            {
                if (Global.conn.State == ConnectionState.Closed)
                    Global.conn.Open();
                SqlCommand cmd = new SqlCommand("SectionMasterUpdate", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = section.SectionID;
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = section.SubDivisionID;
                cmd.Parameters.Add("@SectionName", SqlDbType.NVarChar).Value = section.SectionName;
                cmd.Parameters.Add("@SectionNameG", SqlDbType.NVarChar).Value = section.SectionNameG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();

                //cmd = new SqlCommand("CheckSectionAccessFromSubDivision", Global.conn);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = section.SubDivisionID;
                //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];

                //int i = Convert.ToInt32(cmd.ExecuteScalar());
                //if (i == 0)
                //    IsExist = "0";
                //else
                //{
                //    IsExist = "1";
                //    cmd = new SqlCommand("DELETE FROM UserSectionMaster WHERE UserID =" + HttpContext.Current.Session["UserID"] + " AND SectionID =" + section.SectionID + " AND LoginType = '" + HttpContext.Current.Session["LoginType"] + "'    ", Global.conn);
                //    cmd.ExecuteNonQuery();

                //    cmd = new SqlCommand("UserSectionMasterInsert", Global.conn);
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = section.SectionID;
                //    cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                //    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                //    cmd.ExecuteNonQuery();

                //    cmd.Dispose();
                //}
                msg = "સેક્શનની માહિતી સુધારાઈ ગઈ છે.";
             //   Global.LogInsert(formname, "Update", "SectionMaster", "SectionManage");
                Global.conn.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "SectionManage");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    private void BindSection()
    {
        DataTable sectionbind = new DataTable();
        sectionbind.Columns.Add("RowNumber");
        sectionbind.Columns.Add("SectionID");
        sectionbind.Columns.Add("CircleNameG");
        sectionbind.Columns.Add("DivisionNameG");
        sectionbind.Columns.Add("SubDivisionNameG");
        sectionbind.Columns.Add("SectionName");
        sectionbind.Columns.Add("SectionNameG");
        sectionbind.Rows.Add();
        dgvSectionMaster.DataSource = sectionbind;
        dgvSectionMaster.DataBind();
    }

    [WebMethod]
    public static string GetSection(string SearchCircleWiseTerm, string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm,int pageIndex)
    {
        string msg = string.Empty;
        string query = "SectionMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
           // cmd.Parameters.AddWithValue("@SectionID", "0");
            //cmd.Parameters.AddWithValue("@UserID", "1").DbType = DbType.String;
            cmd.Parameters.AddWithValue("@CircleID", SearchCircleWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
          //  Global.LogInsert(formname, "Get", "SectionMaster", "GetSection");
            return GetData(cmd, pageIndex).GetXml();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSection");
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
                    sda.Fill(ds, "Section");
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
    public static List<SectionDetail> GetSectionDetail(int SectionID)
    {
        string msg = string.Empty;
        List<SectionDetail> list = new List<SectionDetail>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListSectionGetByID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = SectionID;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new SectionDetail
                {
                    CircleID = Convert.ToInt64(ds.Tables[0].Rows[0]["CircleID"].ToString()),
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    SectionName = ds.Tables[0].Rows[0]["SectionName"].ToString(),
                    SectionNameG = ds.Tables[0].Rows[0]["SectionNameG"].ToString(),
                    SectionID = Convert.ToInt32(ds.Tables[0].Rows[0]["SectionID"].ToString()),

                });
            }
          //  Global.LogInsert(formname, "List", "SectionMaster", "GetSectionDetail");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSectionDetail");
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
    public static string DeleteSection(int SectionID)
    {
        string msg = "";
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("SectionMasterDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = SectionID;
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
       //     Global.LogInsert(formname, "Delete", "SectionMaster", "DeleteSection");
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteSection");
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
    public static bool CheckDataInSection(int SectionID)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckBeatExistInSection", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.Int).Value = SectionID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckDataInSection");
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
    public static bool CheckSectionName(int SubDivisionID, string SectionName)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckSectionNameExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SubDivisionID", SqlDbType.Int).Value = SubDivisionID;
            cmd.Parameters.Add("@SectionName", SqlDbType.NVarChar).Value = SectionName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckSectionName");
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
    public static bool CheckSectionNameG(int SubDivisionID, string SectionNameG)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckSectionNameExistsInGujarati", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SubDivisionID", SqlDbType.Int).Value = SubDivisionID;
            cmd.Parameters.Add("@SectionNameG", SqlDbType.NVarChar).Value = SectionNameG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckSectionNameG");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }
}