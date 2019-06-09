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

public partial class InstituteVillageMapping : System.Web.UI.Page
{
    public static string formname = "InstituteVillageMapping";
    private static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=InstituteVillageMapping.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "સંસ્થા પ્રમાણે ગામની માહિતી";
        if (!Page.IsPostBack)
        {
            BindInstituteVillageMapping();
        }
    }

    private void BindInstituteVillageMapping()
    {
        DataTable institutevillagemapping = new DataTable();
        institutevillagemapping.Columns.Add("RowNumber");
        institutevillagemapping.Columns.Add("InstituteNameG");
        institutevillagemapping.Columns.Add("SectionNameG");
        institutevillagemapping.Columns.Add("Villages");
        institutevillagemapping.Columns.Add("VillageAreas");
        institutevillagemapping.Rows.Add();
        dgvInstituteVillageMapping.DataSource = institutevillagemapping;
        dgvInstituteVillageMapping.DataBind();
    }


    public class InstituteVillageMap
    {
        public Int64 DivisionID { get; set; }
        public Int64 SubDivisionID { get; set; }
        public Int64 SectionID { get; set; }
        public Int64 InstituteID { get; set; }
        public string Villages { get; set; }
        public string VillagesArea { get; set; }
    }

    //[WebMethod]
    //public static List<ListItem> ListInstituteByUser()
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
    //    List<ListItem> circles = new List<ListItem>();
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("ListAllInstituteByUser", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@ClusterID", SqlDbType.BigInt).Value = HttpContext.Current.Session["ClusterID"];
    //        cmd.Connection = con;
    //        con.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                circles.Add(new ListItem
    //                {
    //                    Value = sdr["InstituteID"].ToString(),
    //                    Text = sdr["InstituteNameG"].ToString()
    //                });
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListFinYear");
    //    }
    //    finally
    //    {
    //        if (con.State == ConnectionState.Open)
    //            con.Close();
    //    }

    //    return circles;
    //}

    [WebMethod]
    [ScriptMethod]
    public static string InstituteVillageMappingManage(InstituteVillageMap institutevillagemapping)
    {

        string msg = string.Empty;
        Global.conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("Delete From InstituteVillageMapping WHERE SectionID = " + institutevillagemapping.SectionID + "", Global.conn);
            cmd.ExecuteNonQuery();

            string section = institutevillagemapping.Villages;
            string villagearea = institutevillagemapping.VillagesArea;
            string[] stringSeparators = new string[] { "," };
            string[] villageSeparators = new string[] { ":" };
            string[] sectionresultsource;
            string[] villagesource;
            sectionresultsource = section.Split(stringSeparators, StringSplitOptions.None);
            foreach (string s in sectionresultsource)
            {
                villagesource = s.Split(villageSeparators, StringSplitOptions.None);
                string villageid = villagesource[0];
                string villageareas = villagesource[1];

                if (Global.conn.State.Equals(ConnectionState.Closed))
                    Global.conn.Open();
                cmd = new SqlCommand("InstituteVillageMappingInsert", Global.conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Convert.ToInt64(villageid);
                cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = institutevillagemapping.SectionID;
                cmd.Parameters.Add("@VillageArea", SqlDbType.Decimal).Value = Convert.ToDecimal(villageareas);
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = institutevillagemapping.InstituteID;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                //Global.LogInsert(formname, "Insert", "InstituteVillageMapping", "InstituteVillageMappingManage");
            }
            Global.conn.Close();
            msg = "સંસ્થા પ્રમાણે ગામની માહિતી દાખલ થઇ ગઈ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteVillageMappingManage");
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
    public static string GetInstituteVillageMapping(int pageIndex,string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm, string SearchSectionTerm)
    {
        string msg = string.Empty;
        string query = "InstituteVillageMappingGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@SectionID", SearchSectionTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
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
        return GetData(cmd, pageIndex).GetXml();

    }

    private static DataSet GetData(SqlCommand cmd,int pageIndex)
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
                        sda.Fill(ds, "InstituteVillageMapping");
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
    public static List<InstituteVillageMap> GetInstituteVillageMappingDetailBySection(int SectionID)
    {
        string msg = string.Empty;
        List<InstituteVillageMap> list = new List<InstituteVillageMap>();
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("ListInstituteVillageMappingGetBySection", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = Convert.ToInt64(SectionID);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                list.Add(new InstituteVillageMap
                {
                    InstituteID = Convert.ToInt64(ds.Tables[0].Rows[0]["InstituteID"].ToString()),
                    DivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    SectionID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionID"].ToString()),
                    Villages = ds.Tables[0].Rows[0]["VillageID"].ToString(),
                    VillagesArea = ds.Tables[0].Rows[0]["VillageArea"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetInstituteVillageMappingDetailBySection");
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
    public static string ListVillageBySection(string SectionID)
    {
        string msg = string.Empty;
        string query = "ListVillageAndAreaBySection";
        SqlCommand cmd = new SqlCommand(query);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            if (SectionID == "")
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = SectionID;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListVillageBySection");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return GetInstituteData(cmd).GetXml();
    }

    private static DataSet GetInstituteData(SqlCommand cmd)
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
                        sda.Fill(ds, "Institute");

                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetInstituteData");
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
    public static string InstituteVillageMappingDelete(int SectionID)
    {
        string msg = "";
        Global.conn.Open();
        try
        {
            if (Global.conn.State == ConnectionState.Closed)
                Global.conn.Open();
            SqlCommand cmd = new SqlCommand("InstituteVillageMappingDelete", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = SectionID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@DeleteTime ", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            msg = "સંસ્થા પ્રમાણે ગામની માહિતી રદ થઇ ગઇ છે";
        //    Global.LogInsert(formname, "Delete", "InstituteVillageMapping", "InstituteVillageMappingDelete");
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteVillageMappingDelete");
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
    public static string CheckInstituteMappingExist(int InstituteID)
    {
        string msg = "";
        Global.conn.Open();
        try
        {
            if (Global.conn.State == ConnectionState.Closed)
                Global.conn.Open();

            SqlCommand cmd = new SqlCommand("GetDivisionByInstitute", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = InstituteID;
            cmd.ExecuteNonQuery();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                msg = ds.Tables[0].Rows[0]["DivisionID"].ToString();
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInstituteMappingExist");
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
    public static bool CheckInstituteMappingFromSectionExist(int InstituteID, int SectionID)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckInstituteSectionMappingExist", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = InstituteID;
            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = SectionID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInstituteMappingFromSectionExist");

        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }
}