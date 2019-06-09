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

public partial class PakMaster : System.Web.UI.Page
{
    public static int PageSize =10;
    public static string formname = "PakMaster";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=PakMaster.aspx", true);

        if (!Page.IsPostBack)
        {
            BindPak();
        }
    }
    private void BindPak()
    {
        DataTable pak = new DataTable();
        pak.Columns.Add("RowNumber");
        pak.Columns.Add("PakName");
        pak.Columns.Add("PakNameG");
        pak.Rows.Add();
        gvPak.DataSource = pak;
        gvPak.DataBind();
    }

    //public class UserDetail
    //{
    //    public int UserTypeID { get; set; }
    //    public int UserID { get; set; }
    //    public string RightsID { get; set; }
    //}


    //[WebMethod]
    //[ScriptMethod]
    //public static List<UserDetail> ListRigthsByUser(Int64 UserID, string LoginType)
    //{
    //    List<UserDetail> list = new List<UserDetail>();
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
    //    conn.Open();
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("ListRightsOfUser", conn);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@UserID", UserID).DbType = DbType.Int64;
    //        cmd.Parameters.Add("@FormNameID", "aPakMaster").DbType = DbType.String;
    //        cmd.Parameters.Add("@LoginType", LoginType).DbType = DbType.String;

    //        SqlDataAdapter adp = new SqlDataAdapter(cmd);
    //        DataSet ds = new DataSet();
    //        adp.Fill(ds);

    //        if (ds.Tables[0].Rows.Count > 0)
    //        {
    //            list.Add(new UserDetail
    //            {
    //                RightsID = ds.Tables[0].Rows[0]["RightsID"].ToString(),
    //            });
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListRigthsByUser");
    //    }
    //    finally
    //    {
    //        if (conn.State == ConnectionState.Open)
    //            conn.Close();
    //    }
    //    return list;
    //}

    public class PakDetail
    {
        public int PakID { get; set; }
        public string PakName { get; set; }
        public string PakNameG { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string PakManage(PakDetail pak)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            if (pak.PakID == 0)
            {
                SqlCommand cmd = new SqlCommand("PakMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@PakName", SqlDbType.VarChar).Value = pak.PakName;
                cmd.Parameters.Add("@PakNameG", SqlDbType.NVarChar).Value = pak.PakNameG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                msg = "પાક સફળતાથી દાખલ થઇ ગયો છે.";
                cmd.Dispose();
                con.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("PakMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@PakID", SqlDbType.BigInt).Value = pak.PakID;
                cmd.Parameters.Add("@PakName", SqlDbType.VarChar).Value = pak.PakName;
                cmd.Parameters.Add("@PakNameG", SqlDbType.NVarChar).Value = pak.PakNameG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                msg = "પાક સફળતાથી સુધારાઇ ગયો છે.";
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "PakManage");
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
    public static string GetAllPak(int pageIndex)
    {
        string query = "PakMasterGetAll";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
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
                    sda.Fill(ds, "PakDetail");
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
    public static List<PakDetail> GetPakDetail(int PakID)
    {
        List<PakDetail> list = new List<PakDetail>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

        con.Open();
        SqlCommand cmd = new SqlCommand("PakMasterGetAllByID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@PakID", SqlDbType.BigInt).Value = PakID;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            list.Add(new PakDetail
            {
                PakID = Convert.ToInt32(ds.Tables[0].Rows[0]["PakID"].ToString()),
                PakName = ds.Tables[0].Rows[0]["PakName"].ToString(),
                PakNameG = ds.Tables[0].Rows[0]["PakNameG"].ToString(),
            });
        }

        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckPakName(string PakName)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("PakMasterCheckPakNameExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PakName", SqlDbType.VarChar).Value = PakName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckPakName");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckPakNameG(string PakNameG)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("PakMasterCheckPakNameExistsGujarati", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PakNameG", SqlDbType.NVarChar).Value = PakNameG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckPakNameG");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckPakID(int PakID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckPakIDExist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PakID", SqlDbType.BigInt).Value = PakID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckPakID");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static string DeletePak(int PakID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("PakMasterDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PakID", SqlDbType.BigInt).Value = PakID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "પાક સફળતાથી રદ થઇ ગયો છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteUser");
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