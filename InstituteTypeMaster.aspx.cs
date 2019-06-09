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

public partial class InstituteTypeMaster : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "InstituteTypeMaster";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=InstituteTypeMaster.aspx", true);

        if (!Page.IsPostBack)
        {
            BindInstituteType();
        }
    }

    private void BindInstituteType()
    {
        DataTable InstituteType = new DataTable();
        InstituteType.Columns.Add("RowNumber");
        InstituteType.Columns.Add("InstituteTypeName");
        InstituteType.Columns.Add("InstituteTypeNameG");
        InstituteType.Rows.Add();
        gvInstituteType.DataSource = InstituteType;
        gvInstituteType.DataBind();
    }

    public class InstituteTypedetail
    {
        public int InstituteTypeID { get; set; }
        public string InstituteTypeName { get; set; }
        public string InstituteTypeNameG { get; set; }
    }


    [WebMethod]
    public static string GetAllInstituteType(int pageIndex)
    {
        string query = "InstituteTypeMasterGetAll";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
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
                    sda.Fill(ds, "InstituteTypeDetail");
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
    public static List<InstituteTypedetail> GetInstituteTypeDetail(int InstituteTypeID)
    {
        List<InstituteTypedetail> list = new List<InstituteTypedetail>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("InstituteTypeMasterGetAllByID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@InstituteTypeID", SqlDbType.BigInt).Value = InstituteTypeID;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            list.Add(new InstituteTypedetail
            {
                InstituteTypeID = Convert.ToInt32(ds.Tables[0].Rows[0]["InstituteTypeID"].ToString()),
                InstituteTypeName = ds.Tables[0].Rows[0]["InstituteTypeName"].ToString(),
                InstituteTypeNameG = ds.Tables[0].Rows[0]["InstituteTypeNameG"].ToString(),
            });
        }
        return list;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckInstituteTypeName(string InstituteTypeName)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("InstituteTypeMasterCheckTypeNameExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteTypeName", SqlDbType.NVarChar).Value = InstituteTypeName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInstituteTypeName");
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
    public static bool CheckInstituteTypeNameG(string InstituteTypeNameG)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("InstituteTypeMasterCheckTypeNameExistsGujarati", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteTypeNameG", SqlDbType.NVarChar).Value = InstituteTypeNameG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInstituteTypeNameG");
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
    public static string InstituteTypeManage(InstituteTypedetail institutetype)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            if (institutetype.InstituteTypeID == 0)
            {
                SqlCommand cmd = new SqlCommand("InstituteTypeMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InstituteTypeName", SqlDbType.VarChar).Value = institutetype.InstituteTypeName;
                cmd.Parameters.Add("@InstituteTypeNameG", SqlDbType.NVarChar).Value = institutetype.InstituteTypeNameG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "પિયત મંડળી પ્રકાર સફળતાથી દાખલ થઇ ગઈ છે.";
                con.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("InstituteTypeMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InstituteTypeID", SqlDbType.BigInt).Value = institutetype.InstituteTypeID;
                cmd.Parameters.Add("@InstituteTypeName", SqlDbType.VarChar).Value = institutetype.InstituteTypeName;
                cmd.Parameters.Add("@InstituteTypeNameG", SqlDbType.NVarChar).Value = institutetype.InstituteTypeNameG;
                cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                msg = "પિયત મંડળી પ્રકાર સફળતાથી સુધારાઇ ગઈ છે.";
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteTypeManage");
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
    public static bool CheckInstituteTypeID(int InstituteTypeID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CheckInstituteTypeIDExist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteTypeID", SqlDbType.BigInt).Value = InstituteTypeID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInstituteTypeID");
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
    public static string DeleteInstituteType(int InstituteTypeID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("InstituteTypeMasterDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteTypeID", SqlDbType.BigInt).Value = InstituteTypeID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "સંસ્થા પ્રકાર સફળતાથી રદ થઇ ગઈ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteInstituteType");
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