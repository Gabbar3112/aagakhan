using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BeatCanalMapping : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "BeatCanalMapping";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=BeatCanalMapping.aspx", true);
        if (!Page.IsPostBack)
        {
            BindBeatCanalMapping();
        }
    }
    private void BindBeatCanalMapping()
    {
        DataTable BeatCanalMap = new DataTable();
        BeatCanalMap.Columns.Add("RowNumber");
        BeatCanalMap.Columns.Add("CircleNameG");
        BeatCanalMap.Columns.Add("DivisionNameG");
        BeatCanalMap.Columns.Add("SubDivisionNameG");
        BeatCanalMap.Columns.Add("SectionNameG");
        BeatCanalMap.Columns.Add("BeatNameG");
        BeatCanalMap.Columns.Add("CanalTypeG");
        BeatCanalMap.Columns.Add("CanalNameG");
        BeatCanalMap.Rows.Add();
        gvBeatCanalMapping.DataSource = BeatCanalMap;
        gvBeatCanalMapping.DataBind();
    }

    public class BeatCanalDetail
    {
        public int UserID { get; set; }
        public int CircleID { get; set; }
        public int DivisionID { get; set; }
        public int SubDivisionID { get; set; }
        public int SectionID { get; set; }
        public string RightsID { get; set; }
        public string CanalID { get; set; }
        public int BeatID { get; set; }
        public int UserTypeID { get; set; }
        public int CanalIDD { get; set; }
        public int CanalTypeID { get; set; }
        public string CanalNameG { get; set; }
    }

    [WebMethod]
    public static List<ListItem> ListCanalByType(int CanalTypeID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListCanalByType", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CanalTypeID", SqlDbType.BigInt).Value = CanalTypeID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListCanalByType");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListSakha(string CanalID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListSakha", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ParentID", SqlDbType.NVarChar).Value = CanalID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSakha");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListDistry(string CanalID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListDistry", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ParentID", SqlDbType.NVarChar).Value = CanalID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDistry");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListMinor(string CanalID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListMinor", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ParentID", SqlDbType.NVarChar).Value = CanalID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListMinor");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }

    // START - Start ListSubMinor
    //[WebMethod]
    //public static List<ListItem> ListSubMinor(string CanalID)
    //{
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
    //    List<ListItem> circles = new List<ListItem>();
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("ListSubMinor", conn);

    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@ParentID", SqlDbType.NVarChar).Value = CanalID;
    //        cmd.Connection = conn;
    //        conn.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                circles.Add(new ListItem
    //                {
    //                    Value = sdr["CanalID"].ToString(),
    //                    Text = sdr["CanalNameG"].ToString(),
    //                });
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListSubMinor");

    //    }
    //    finally
    //    {
    //        if (conn.State == ConnectionState.Open)
    //            conn.Close();
    //    }

    //    return circles;
    //}
    // END - Old ListSubMinor


    [WebMethod]
    [ScriptMethod]
    public static List<BeatCanalDetail> ListSubMinor(string CanalID)
    {
        List<BeatCanalDetail> list = new List<BeatCanalDetail>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("ListSubMinor", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ParentID", SqlDbType.NVarChar).Value = CanalID;
            cmd.Connection = conn;
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    list.Add(new BeatCanalDetail
                    {
                        CanalIDD = Convert.ToInt32(sdr["CanalID"].ToString()),
                        CanalTypeID = Convert.ToInt32(sdr["CanalTypeID"].ToString()),
                        CanalNameG = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSubMinorNew");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static string DeleteBeatCanal(int BeatID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("BeatCanalMappingDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = BeatID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            //int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "વિગત રદ થઇ ગઈ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteBeatCanal");
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
    [ScriptMethod]
    public static string BeatCanalManage(BeatCanalDetail user)
    {
        string msg = string.Empty;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            if (user.UserID == 0)
            {
                string[] stringSeparators = new string[] { "," };

                string circle = user.CanalID;

                string[] resultcircle;

                resultcircle = circle.Split(stringSeparators, StringSplitOptions.None);

                foreach (string s in resultcircle)
                {
                    if (s != "")
                    {
                        SqlCommand cmd = new SqlCommand("BeatCanalMappingInsert", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = user.BeatID;
                        cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = s;
                        cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                        cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
                        cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                        cmd.ExecuteNonQuery();
                    }
                }
                conn.Close();
                msg = "";
            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "UserManage");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return msg;
    }

    [WebMethod]
    public static string GetBeatWiseCanalDetail(int pageIndex,string SearchCircleWiseTerm, string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm, string SearchSectionTerm, string SearchBeatTerm)
    
    {
        string query = "ListBeatCanalMapping";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CircleID", SearchCircleWiseTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@SectionID", SearchSectionTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@BeatID", SearchBeatTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
        cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
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
                    sda.Fill(ds, "BeatWiseCanalDetail");
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
    public static List<BeatCanalDetail> GetBeatCanalDetail(int BeatID)
    {
        List<BeatCanalDetail> list = new List<BeatCanalDetail>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("BeatCanalMappingGet", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = BeatID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new BeatCanalDetail
                {
                    CircleID = Convert.ToInt32(ds.Tables[0].Rows[0]["CircleID"].ToString()),
                    DivisionID = Convert.ToInt32(ds.Tables[0].Rows[0]["DivisionID"].ToString()),
                    SubDivisionID = Convert.ToInt32(ds.Tables[0].Rows[0]["SubDivisionID"].ToString()),
                    SectionID = Convert.ToInt32(ds.Tables[0].Rows[0]["SectionID"].ToString()),
                    BeatID = Convert.ToInt32(ds.Tables[0].Rows[0]["BeatID"].ToString()),
                    CanalID = ds.Tables[0].Rows[0]["CanalID"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetBeatCanalDetail");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return list;
    }

}