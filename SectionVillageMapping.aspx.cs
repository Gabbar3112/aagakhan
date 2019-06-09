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

public partial class SectionVillageMapping : System.Web.UI.Page
{
    public static string formname = "SectionVillageMapping";
    private static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=SectionVillageMapping.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "ગામ પ્રમાણે સેક્સનની માહિતી";
        if (!Page.IsPostBack)
        {
            BindSectionVillageMapping();
        }
    }

    public static IEnumerable<string> resultsection { get; set; }
    private void BindSectionVillageMapping()
    {
        DataTable sectionvillagemapping = new DataTable();
        sectionvillagemapping.Columns.Add("RowNumber");
        sectionvillagemapping.Columns.Add("DistrictNameG");
        sectionvillagemapping.Columns.Add("TalukaNameG");
        sectionvillagemapping.Columns.Add("VillageNameG");
        sectionvillagemapping.Columns.Add("DivisionNameG");
        sectionvillagemapping.Columns.Add("SubDivisionNameG");
        sectionvillagemapping.Columns.Add("SectionNames");
        sectionvillagemapping.Rows.Add();
        dgvSectionVillageMapping.DataSource = sectionvillagemapping;
        dgvSectionVillageMapping.DataBind();
    }

    public class SectionVillageMap
    {
        public Int64 SectionVillageMappingID { get; set; }
        public Int64 DistrictID { get; set; }
        public Int64 TalukaID { get; set; }
        public Int64 VillageID { get; set; }
        public Int64 DivisionID { get; set; }
        public Int64 SubDivisionID { get; set; }
        public Int64 SectionID { get; set; }
        public string Sections { get; set; }
    }


    [WebMethod]
    public static List<ListItem> ListSections(int SubDivisionID)
    {
        string msg = string.Empty;
        Global.conn.Open();
        List<ListItem> sections = new List<ListItem>();
        SqlCommand cmd = new SqlCommand("ListSectionBySubDivisionCheckbox", Global.conn);
        try
        {
            cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = SubDivisionID;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Global.conn;
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    sections.Add(new ListItem
                    {
                        Value = sdr["SectionID"].ToString(),
                        Text = sdr["SectionName"].ToString()
                    });
                }
            }

            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSections");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return sections;
    }

    [WebMethod]
    public static List<ListItem> ListSectionsBySuBDiv(int SubDivisionID)
    {
        string msg = string.Empty;
        Global.conn.Open();
        SqlCommand cmd = new SqlCommand("ListSectionFromSubDivision", Global.conn);
        List<ListItem> sectionsbysubdiv = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            if (SubDivisionID != 0)
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.NVarChar).Value = SubDivisionID;
            else
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = 0;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Connection = Global.conn;
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    sectionsbysubdiv.Add(new ListItem
                    {
                        Value = sdr["SectionID"].ToString(),
                        Text = sdr["SectionNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSectionsBySuBDiv");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return sectionsbysubdiv;
    }

    [WebMethod]
    [ScriptMethod]
    public static string SectionVillageMappingManage(SectionVillageMap sectionvillagemapping)
    {

        string msg = string.Empty;
        Global.conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("Delete From  SectionVillageMapping WHERE VillageID =" + sectionvillagemapping.VillageID + "", Global.conn);
            cmd.ExecuteNonQuery();
           
            string section = sectionvillagemapping.Sections;
            string[] stringSeparators = new string[] { "," };
            string[] sectionresultsource;
            sectionresultsource = section.Split(stringSeparators, StringSplitOptions.None);
            foreach (string s in sectionresultsource)
            {
                if (s != "")
                {
                    if (Global.conn.State.Equals(ConnectionState.Closed))
                        Global.conn.Open();
                    cmd = new SqlCommand("SectionVillageMappingInsert", Global.conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = sectionvillagemapping.VillageID;
                    cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = Convert.ToInt64(s);
                    cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                    cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                    cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                  //  Global.LogInsert(formname, "Insert", "SectionVillageMapping", "SectionVillageMappingManage");
                }
            }
            Global.conn.Close();
            msg = "ગામ પ્રમાણે સેક્સનની માહિતી દાખલ થઇ ગઈ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "SectionVillageMappingManage");
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
    public static string GetSectionVillageMapping(int pageIndex,string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm, string SearchSectionTerm, string SearchDistrictTerm, string SearchTalukaTerm)
    {
        string msg = string.Empty;
        string query = "SectionVillageMappingGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SectionID", SearchSectionTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@DistrictID", SearchDistrictTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@TalukaID", SearchTalukaTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSectionVillageMapping");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
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
                    sda.Fill(ds, "SectionVillageMapping");
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
    public static List<SectionVillageMap> GetSectionVillageMappingDetail(int VillageID)
    {
        string msg = string.Empty;
        List<SectionVillageMap> list = new List<SectionVillageMap>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListSectionVillageMappingGetByVillageID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = VillageID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                list.Add(new SectionVillageMap
                {
                    SectionVillageMappingID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionVillageMappingID"].ToString()),
                    DistrictID = Convert.ToInt64(ds.Tables[0].Rows[0]["DistrictID"].ToString()),
                    TalukaID = Convert.ToInt64(ds.Tables[0].Rows[0]["TalukaID"].ToString()),
                    VillageID = Convert.ToInt64(ds.Tables[0].Rows[0]["VillageID"].ToString()),
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    SectionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionID"].ToString()),
                    Sections = ds.Tables[0].Rows[0]["SectionNames"].ToString(),

                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSectionVillageMapping");
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
    public static string SectionVillageMappingDelete(int VillageID)
    {
        string msg = "";
        Global.conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("SectionVillageMappingDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = VillageID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            msg = "ગામ પ્રમાણે સેક્સનની માહિતી રદ થઇ ગઇ છે";
          //  Global.LogInsert(formname, "Delete", "SectionVillageMapping", "DeleteSectionVillageMapping");
            Global.conn.Close();

        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteSectionVillageMapping");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;

    }
}