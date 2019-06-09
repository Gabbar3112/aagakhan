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

public partial class VillageBeatMapping : System.Web.UI.Page
{
    public static string formname = "VillageBeatMapping";
    private static int PageSize = 20;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=VillageBeatMapping.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "ગામ પ્રમાણે બીટની માહિતી";
        if (!Page.IsPostBack)
        {
            BindVillageBeatMapping();
        }
    }

    private void BindVillageBeatMapping()
    {
        DataTable villagebeatmapping = new DataTable();
        villagebeatmapping.Columns.Add("RowNumber");
        villagebeatmapping.Columns.Add("DivisionNameG");
        villagebeatmapping.Columns.Add("SubDivisionNameG");
        villagebeatmapping.Columns.Add("SectionNames");
        villagebeatmapping.Columns.Add("BeatNames");
        villagebeatmapping.Columns.Add("VillageNames");
        villagebeatmapping.Rows.Add();
        dgvVillageBeatMapping.DataSource = villagebeatmapping;
        dgvVillageBeatMapping.DataBind();
    }

    public class VillageBeatMap
    {
        public Int64 DivisionID { get; set; }
        public Int64 SubDivisionID { get; set; }
        public Int64 SectionID { get; set; }
        public Int64 BeatID { get; set; }
        public string Villages { get; set; }
    }

    //[WebMethod]
    //public static List<ListItem> ListDivisionByCircle()
    //{
    //    Global.conn.Open();
    //    List<ListItem> circles = new List<ListItem>();
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("ListDivisionByUser", Global.conn);

    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = HttpContext.Current.Session["UserID"];
    //        cmd.Connection = Global.conn;
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                circles.Add(new ListItem
    //                {
    //                    Value = sdr["DivisionID"].ToString(),
    //                    Text = sdr["DivisionNameG"].ToString()
    //                });
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListSectionBySubDivision");

    //    }
    //    finally
    //    {
    //        if (conn.State == ConnectionState.Open)
    //            conn.Close();
    //    }

    //    return circles;
    //}


    [WebMethod]
    public static List<ListItem> ListVillageBySection(string SectionID)
    {
        Global.conn.Open();
        List<ListItem> villages = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListVillageBySection", Global.conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (SectionID == "")
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = SectionID;
            cmd.Connection = Global.conn;
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    villages.Add(new ListItem
                    {
                        Value = sdr["VillageID"].ToString(),
                        Text = sdr["VillageNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListVillageBySection");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return villages;
    }

    [WebMethod]
    [ScriptMethod]
    public static string VillageBeatMappingManage(VillageBeatMap villagebeatmapping)
    {

        string msg = string.Empty;
        Global.conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("Delete From VillageBeatMapping WHERE BeatID = " + villagebeatmapping.BeatID + "", Global.conn);
            cmd.ExecuteNonQuery();
          
            string section = villagebeatmapping.Villages;
            string[] stringSeparators = new string[] { "," };
            string[] sectionresultsource;
            sectionresultsource = section.Split(stringSeparators, StringSplitOptions.None);
            foreach (string s in sectionresultsource)
            {
                if (s != "")
                {
                    cmd = new SqlCommand("VillageBeatMappingInsert", Global.conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Convert.ToInt64(s);
                    cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = villagebeatmapping.BeatID;
                    cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                    cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                    cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
            }
            Global.conn.Close();
            msg = "ગામ પ્રમાણે બીટની માહિતી દાખલ થઇ ગઈ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "VillageBeatMappingManage");
            msg = "Error: " + ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return msg;
    }

    [WebMethod]
    public static string GetVillageBeatMapping(string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm, string SearchSectionTerm, string SearchBeatTerm)
    {
        string msg = string.Empty;
        string query = "VillageBeatMappingGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SectionID", SearchSectionTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@BeatID", SearchBeatTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            //cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            //cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            //cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetVillageBeatMapping");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return GetData(cmd).GetXml();

    }

    private static DataSet GetData(SqlCommand cmd)
    {
        string strConnString = ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(strConnString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;

                using (DataSet ds = new DataSet())
                {
                    try
                    {
                        sda.Fill(ds, "VillageBeatMapping");
                        //DataTable dt = new DataTable("Pager");
                        //dt.Columns.Add("PageIndex");
                        //dt.Columns.Add("PageSize");
                        //dt.Columns.Add("RecordCount");
                        //dt.Rows.Add();
                        //dt.Rows[0]["PageIndex"] = pageIndex;
                        //dt.Rows[0]["PageSize"] = PageSize;
                        //dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                        //ds.Tables.Add(dt);

                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetData");

                    }
                    finally
                    {
                        if (conn.State == ConnectionState.Open)
                            conn.Close();
                    }
                    return ds;
                }
            }
        }
    }

    [WebMethod]
    [ScriptMethod]
    public static List<VillageBeatMap> GetVillageBeatMappingDetailByVillage(int BeatID)
    {
        string msg = string.Empty;
        List<VillageBeatMap> list = new List<VillageBeatMap>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListVillageBeatMappingGetByBeatID", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = Convert.ToInt64(BeatID);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                list.Add(new VillageBeatMap
                {
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    SectionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionID"].ToString()),
                    BeatID = Convert.ToInt64(ds.Tables[0].Rows[0]["BeatID"].ToString()),
                    Villages = ds.Tables[0].Rows[0]["VillageID"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetVillageBeatMappingDetailByVillage");
            msg = "Error" + ex.Message;
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
    public static string VillageBeatMappingDelete(int BeatID)
    {
        string msg = "";
        Global.conn.Open();
        try
        {
            if (Global.conn.State == ConnectionState.Closed)
                Global.conn.Open();

            SqlCommand cmd = new SqlCommand("VillageBeatMappingDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = BeatID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            msg = "ગામ પ્રમાણે બીટની માહિતી રદ થઇ ગઇ છે";
            Global.LogInsert(formname, "Delete", "VillageBeatMapping", "VillageBeatMappingDelete");
            Global.conn.Close();

        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "VillageBeatMappingDelete");
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