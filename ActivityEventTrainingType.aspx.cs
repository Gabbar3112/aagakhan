using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActivityEventTrainingType : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "ActivityEventTrainingType";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=ActivityEventTrainingType.aspx", true);

        if (!Page.IsPostBack) {
            BindTypes();
        }
    }

    private void BindTypes()
    {
        DataTable types = new DataTable();
        types.Columns.Add("RowNumber");
        types.Columns.Add("TypeName");
        types.Columns.Add("TypeNameG");
        types.Rows.Add();
        gvType.DataSource = types;
        gvType.DataBind();
    }

    public class Type {
        public int TypeMasterID { get; set; }
        public int TypeID { get; set; }
        public string Name { get; set; }
        public string NameG { get; set; }
    }

    [WebMethod]
    public static string GetTypes(int TypeMasterID,int pageIndex)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("GetActivityEventTrainingType",con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@TypeMasterID", SqlDbType.BigInt).Value = TypeMasterID;
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
                    sda.Fill(ds, "Types");
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
    public static bool CheckTypeID(int TypeMasterID, int TypeID) {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CheckTypeIDExist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TypeMasterID", SqlDbType.BigInt).Value = TypeMasterID;
            cmd.Parameters.Add("@TypeID", SqlDbType.BigInt).Value = TypeID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckTypeID");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    public static string ManageType(Type data) {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ActivityEventTrainingUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TypeMasterID", SqlDbType.BigInt).Value = data.TypeMasterID;
            cmd.Parameters.Add("@TypeID", SqlDbType.BigInt).Value = data.TypeID;
            cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = data.Name;
            cmd.Parameters.Add("@NameG", SqlDbType.NVarChar).Value = data.NameG;
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.ExecuteNonQuery();
            msg = "માહિતી સફળતાથી સુધરાઈ ગઈ છે.";
            con.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "TypeManage");
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
    public static string DeleteType(int TypeMasterID,int TypeID) {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ActivityEventTrainingDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TypeMasterID", SqlDbType.BigInt).Value = TypeMasterID;
            cmd.Parameters.Add("@TypeID", SqlDbType.BigInt).Value = TypeID;
            cmd.ExecuteNonQuery();
            msg = "માહિતી સફળતાથી રદ થઇ ગઈ છે.";
            con.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "TypeDelete");
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