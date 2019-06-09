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

public partial class ActivityEventTrainingVigat : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "ActivityEventTrainingVigat";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=ActivityEventTrainingVigat.aspx", true);

        if (!Page.IsPostBack)
        {
            BindTypes();
        }
    }

    private void BindTypes()
    {
        DataTable types = new DataTable();
        types.Columns.Add("RowNumber");
        types.Columns.Add("SubjectG");
        types.Columns.Add("PlaceG");
        types.Columns.Add("FromDate");
        types.Columns.Add("ToDate");
        types.Columns.Add("Time");
        
        types.Rows.Add();
        gvVigat.DataSource = types;
        gvVigat.DataBind();
    }

    public class DataMember
    {
        public Int64 AETid { get; set; }
        public string Place { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string Time { get; set; }
        public string DetailID { get; set; }
        
    }

    [WebMethod]
    public static string ManageType(DataMember Data)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ActivityEventTrainingVigatUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = Data.AETid;
            cmd.Parameters.Add("@DetailID", SqlDbType.BigInt).Value = Data.DetailID;
            cmd.Parameters.Add("@PlaceG", SqlDbType.NVarChar).Value = Data.Place;
            if (Data.FromDate == "")
            {
                cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DBNull.Value;
            }
            else
            {
                cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Data.FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + Data.FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + Data.FromDate.Substring(6, 4));
            }
           
            if (Data.ToDate == "")
            {
                cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DBNull.Value;
            }
            else
            {
                cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Data.ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + Data.ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + Data.ToDate.Substring(6, 4));
            }
           

            cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = Data.Time;
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.ExecuteNonQuery();
            msg = "માહિતી સફળતાથી સુધરાઈ ગઈ છે.";
            con.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "VigatManage");
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
    public static string GetVigat(int AETid,int pageIndex)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("GetActivityEventTrainingVigat", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
        cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        return GetData(cmd,pageIndex).GetXml();
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
                    sda.Fill(ds, "Vigat");
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
    public static bool CheckTypeID(int AETid, int DetailID)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("CheckDetailIDExist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@DetailID", SqlDbType.BigInt).Value = DetailID;
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
    public static string DeleteType(int AETid, int DetailID)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ActivityEventTrainingVigatDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@DetailID", SqlDbType.BigInt).Value = DetailID;
            cmd.ExecuteNonQuery();
            msg = "સફળતાથી રદ થઇ ગયેલ છે.";
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