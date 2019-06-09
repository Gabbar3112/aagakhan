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

public partial class ActivityEventTrainingMaster : System.Web.UI.Page
{
    public static int PageSize =10;
    public static string formname = "ActivityEventTrainingMaster";
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=ActivityEventTrainingMaster.aspx", true);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        if (!IsPostBack)
        {
            BindMember();
        }
    }

    private void BindMember()
    {
        DataTable member = new DataTable();
        member.Columns.Add("RowNumber");
        member.Columns.Add("TypeName");
        member.Columns.Add("SubjectG");
       
        member.Columns.Add("ProgramNameG");
     
        member.Rows.Add();
        gvMember.DataSource = member;
        gvMember.DataBind();
    }

    public class MemberParameters
    {       
        public Int64 ProgramID { get; set; }
        public Int64 ID { get; set; }
        public Int64 ProgramTypeID { get; set; }       

        public string NewProgramType { get; set; }
        public string Subject { get; set; }

        public string SubjectG { get; set; }
        public string Place { get; set; }
        public string PlaceG { get; set; }
        public string Program { get; set; }
        public string ProgramG { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }

        public Int64 IsEdit { get; set; }
    }

    [WebMethod]
    public static string RecordsManage(MemberParameters member)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            if (member.ProgramID != 0)
            {
                SqlCommand cmd;
                if (member.ProgramTypeID == 0) {
                    try
                    {
                        cmd = new SqlCommand("AddNewType", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@ProgramID", SqlDbType.VarChar).Value = member.ProgramID;
                        cmd.Parameters.Add("@NewType", SqlDbType.NVarChar).Value = member.NewProgramType;
                        var table = string.Empty;
                        if (member.ProgramID == 1)
                            table = "ActivityMaster";
                        else if (member.ProgramID == 2)
                            table = "EventMaster";
                        else
                            table = "TrainingMaster";
                        cmd.Parameters.Add("@TableName", SqlDbType.VarChar).Value = table.ToString();                       
                        cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];                        
                        cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                        cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];

                        msg = cmd.ExecuteScalar().ToString();
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "NewCast");
                        msg = "Error" + ex.Message;
                    }
                    member.ProgramTypeID = Convert.ToInt64(msg);
                }

                if (member.IsEdit == 0)
                {
                    cmd = new SqlCommand("ActivityEventTrainingMasterInsert", con);
                    cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = member.ProgramID;
                    cmd.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = member.ProgramTypeID;
                    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                    cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["Date"];
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    msg = "માહિતી સફળતા થી દાખલ થઇ ગઈ છે.";
                }
                else {
                    cmd = new SqlCommand("ActivityEventTrainingMasterUpdate", con);
                    cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = member.ProgramID;
                    cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = member.ID;
                    cmd.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = member.ProgramTypeID;
                    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                    //cmd.Parameters.Add("@UpdatedTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["Date"];
                    cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    msg = "માહિતી સફળતા થી સુધારાઈ ગઈ છે.";
                }
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Subject", SqlDbType.VarChar).Value = member.Subject;
                cmd.Parameters.Add("@SubjectG", SqlDbType.NVarChar).Value = member.SubjectG;

             
                cmd.Parameters.Add("@ProgramName", SqlDbType.VarChar).Value = member.Program;
                cmd.Parameters.Add("@ProgramNameG", SqlDbType.NVarChar).Value = member.ProgramG;
              

                var table1 = string.Empty;
                if (member.ProgramID == 1)
                    table1 = "ActivityMaster";
                else if (member.ProgramID == 2)
                    table1 = "EventMaster";
                else
                    table1 = "TrainingMaster";

                cmd.Parameters.Add("@TableName", SqlDbType.VarChar).Value = table1.ToString();
                cmd.Parameters.Add("@FormName", SqlDbType.VarChar).Value = formname.ToString();
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
               
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                
                con.Close();
                

            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "MemberManage");
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
    public static string DeleteActivity(int ID, int ProgramID)
    {

        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ActivityEventTrainingMasterDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = ProgramID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "માહિતી સફળતા થી રદ થઇ ગઈ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteActivity");
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
    public static List<MemberParameters> GetActivityByID(int ID, int AETid)
    {
        List<MemberParameters> list = new List<MemberParameters>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("GetActivityByID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;
        cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
        //cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            list.Add(new MemberParameters
            {
                ProgramID = Convert.ToInt64(ds.Tables[0].Rows[0]["ID"].ToString()),
                ProgramTypeID = Convert.ToInt64(ds.Tables[0].Rows[0]["TypeID"].ToString()),
                Subject = ds.Tables[0].Rows[0]["Subject"].ToString(),
                SubjectG = ds.Tables[0].Rows[0]["SubjectG"].ToString(),
                //Place = ds.Tables[0].Rows[0]["Place"].ToString(),
                //PlaceG = ds.Tables[0].Rows[0]["PlaceG"].ToString(),
                Program = ds.Tables[0].Rows[0]["ProgramName"].ToString(),
                ProgramG = ds.Tables[0].Rows[0]["ProgramNameG"].ToString(),
                //FromDate = ds.Tables[0].Rows[0]["Fromdate"].ToString(),
                //ToDate = ds.Tables[0].Rows[0]["Todate"].ToString(),
                IsEdit = 1
            });
        }
        return list;
    }

    [WebMethod]
    public static List<ListItem> ListTypes(int ProgramID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListTypesOfProgram", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = ProgramID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["ID"].ToString(),
                        Text = sdr["NameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListTypes");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return circles;
    }

    [WebMethod]
    public static string LoadGrid(string searchTerm, int pageIndex)
    {
        string query = "GetAllActivityEventTraining";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@AETid", searchTerm).DbType = DbType.String;
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
                    try
                    {
                        sda.Fill(ds, "ActivityEventTrainingMaster");
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
                        if (con.State == ConnectionState.Open)
                            con.Close();
                    }
                    return ds;
                }
            }
        }
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckNewProgramType(string PrgTy, int AETid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckProgramTypeExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@NewType", SqlDbType.VarChar).Value = PrgTy;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckNewProgramType");
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
    public static bool CheckProgramSubject(string PrgSub, int AETid,int ID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckProgramSubjectExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;
            cmd.Parameters.Add("@NewSubj", SqlDbType.VarChar).Value = PrgSub;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckProgramSubject");
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
    public static bool CheckProgramSubjectG(string PrgSubG, int AETid, int ID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckProgramSubjectExistsG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;
            cmd.Parameters.Add("@NewSubj", SqlDbType.VarChar).Value = PrgSubG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckProgramSubject");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


}