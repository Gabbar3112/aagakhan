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

public partial class ActivityEventTrainingDataEntry : System.Web.UI.Page
{
    public static int PageSize = 10;
    public static string formname = "ActivityEventTrainingDataEntry";
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=ActivityEventTrainingDataEntry.aspx", true);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        if (!IsPostBack)
        {
            BindEvents();
            BindBenificaryDetail();
        }
    }

    private void BindBenificaryDetail()
    {

        DataTable Eventdetail = new DataTable();
        Eventdetail.Columns.Add("RowNumber");
        Eventdetail.Columns.Add("FullName");
        Eventdetail.Columns.Add("Gender");
        Eventdetail.Columns.Add("Age");
        Eventdetail.Columns.Add("Mobileno");
        Eventdetail.Columns.Add("DistrictName");
        Eventdetail.Columns.Add("TalukaName");
        Eventdetail.Columns.Add("VillageName");
        Eventdetail.Columns.Add("Remark");
        
        Eventdetail.Rows.Add();
        gvBenificaryDetail.DataSource = Eventdetail;
        gvBenificaryDetail.DataBind();
    }

    public class BenificaryMember
    {
        public Int64 AETid { get; set; }
        public Int64 AETTypeID { get; set; }     
        public Int64 AETDetailID { get; set; }
        public Int64 DistrictID { get; set; }
        public Int64 TalukaID { get; set; }
        public Int64 VillageID { get; set; }
        public Int64 IsEdit { get; set; }
        public Int64 OtherParticipateID { get; set; }
        public string FullName { get; set; }
        public string Age { get; set; }
        public string MobileNo { get; set; }
        public string Gender { get; set; }
        public string Remarks { get; set; }
    }

    public class ListItem1
    {
        public string HeadText { get; set; }
        public string TypeText { get; set; }
        public string Place { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string Time { get; set; }
        public Int64 ID { get; set; }
        public string Name { get; set; }
        public string MemberType { get; set; }
        public string VillageID { get; set; }
        public string Subject { get; set; }
    }

    public class EventMember
    {
        public Int64 EventID { get; set; }
        public Int64 EventDetailID { get; set; }
        public string Members { get; set; }
        public Int64 ProgramID { get; set; }
        public Int64 IsEdit { get; set; }
    }

    public class EventDetail
    {
        public Int64 EventID { get; set; }
        
        public Int64 ID { get; set; }
        public string Name { get; set; }
        public string MemberType { get; set; }
        public string DetailID { get; set; }

        public Int64 VillageID { get; set; }
        public string MemberID { get; set; }
        public string Members { get; set; }
        public Int64 TalukaID { get; set; }
        public Int64 DistrictID { get; set; }
        public Int64 EventTypeID { get; set; }
    }

    private void BindEvents()
    {
        DataTable Eventdetail = new DataTable();     
        Eventdetail.Columns.Add("RowNumber");
        Eventdetail.Columns.Add("TypeOfEvent");
        Eventdetail.Columns.Add("Program");
        Eventdetail.Columns.Add("Subject");
        Eventdetail.Columns.Add("Place");
        Eventdetail.Columns.Add("VillageCode");
        Eventdetail.Columns.Add("VillageName");
        Eventdetail.Rows.Add();
        gvEvents.DataSource = Eventdetail;
        gvEvents.DataBind();
    }

    [WebMethod]
    [ScriptMethod]
    public static string ManageBanificaryDetail(BenificaryMember BenificaryDetail)
    {
        string msg = string.Empty;
     
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            if (BenificaryDetail.IsEdit == 0)
            {
                SqlCommand cmd = new SqlCommand("BenificaryDetailInsert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = BenificaryDetail.AETid;
                cmd.Parameters.Add("@AETTypeID", SqlDbType.BigInt).Value = BenificaryDetail.AETTypeID;
                cmd.Parameters.Add("@AETDetailID", SqlDbType.BigInt).Value = BenificaryDetail.AETDetailID;
                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar).Value = BenificaryDetail.FullName;
                cmd.Parameters.Add("@Age", SqlDbType.NVarChar).Value = BenificaryDetail.Age;
                cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = BenificaryDetail.Gender;
                cmd.Parameters.Add("@Mobileno", SqlDbType.NVarChar).Value = BenificaryDetail.MobileNo;
                cmd.Parameters.Add("@DistrictID", SqlDbType.BigInt).Value = BenificaryDetail.DistrictID;
                cmd.Parameters.Add("@TalukaID", SqlDbType.BigInt).Value = BenificaryDetail.TalukaID;
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = BenificaryDetail.VillageID;
                cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = BenificaryDetail.Remarks;
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                

                cmd.ExecuteNonQuery();
                cmd.Dispose();

                conn.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("BenificaryDetailUpdate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OtherParticipateID", SqlDbType.BigInt).Value = BenificaryDetail.OtherParticipateID;
                cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = BenificaryDetail.AETid;
                cmd.Parameters.Add("@AETTypeID", SqlDbType.BigInt).Value = BenificaryDetail.AETTypeID;
                cmd.Parameters.Add("@AETDetailID", SqlDbType.BigInt).Value = BenificaryDetail.AETDetailID;
                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar).Value = BenificaryDetail.FullName;
                cmd.Parameters.Add("@Age", SqlDbType.NVarChar).Value = BenificaryDetail.Age;
                cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = BenificaryDetail.Gender;
                cmd.Parameters.Add("@Mobileno", SqlDbType.NVarChar).Value = BenificaryDetail.MobileNo;
                cmd.Parameters.Add("@DistrictID", SqlDbType.BigInt).Value = BenificaryDetail.DistrictID;
                cmd.Parameters.Add("@TalukaID", SqlDbType.BigInt).Value = BenificaryDetail.TalukaID;
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = BenificaryDetail.VillageID;
                cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = BenificaryDetail.Remarks;
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@UpdateBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];


                cmd.ExecuteNonQuery();
                cmd.Dispose();

                conn.Close();
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
    [ScriptMethod]
    public static string ManageEvent(EventMember Events)
    {
        string msg = string.Empty;
        string MemberID = "";
        string MemberDetailID = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            if (Events.IsEdit == 0)
            {           
                if (Events.ProgramID == 2)
                {
                    string Members = Events.Members;
                    string[] AllMember = Members.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string FullID in AllMember)
                    {
                        SqlCommand cmd = new SqlCommand("EventParticipateDetailsInsert", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string[] IDOnly = FullID.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
                        for (int i = 0; i < 1; i++)
                        {
                            if (IDOnly[1] == "MD")
                            {
                                MemberDetailID += IDOnly[0];
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = Convert.ToInt64(MemberDetailID.ToString());
                            }
                            else
                            {
                                MemberID += IDOnly[0];
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = Convert.ToInt64(MemberID.ToString());
                                cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = DBNull.Value;
                            }

                            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Convert.ToInt64(IDOnly[2].ToString());
                            cmd.Parameters.Add("@EventDetailID", SqlDbType.BigInt).Value = Events.EventDetailID;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            MemberDetailID = "";
                            MemberID = "";
                        }
                    }
                    conn.Close();
                }
                else if (Events.ProgramID == 1)
                {
                    string Members = Events.Members;
                    string[] AllMember = Members.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string FullID in AllMember)
                    {
                        SqlCommand cmd = new SqlCommand("ActivityParticipateDetailsInsert", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string[] IDOnly = FullID.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
                        for (int i = 0; i < 1; i++)
                        {
                            if (IDOnly[1] == "MD")
                            {
                                MemberDetailID += IDOnly[0];
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = Convert.ToInt64(MemberDetailID.ToString());
                            }
                            else
                            {
                                MemberID += IDOnly[0];
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = Convert.ToInt64(MemberID.ToString());
                                cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = DBNull.Value;
                            }

                            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Convert.ToInt64(IDOnly[2].ToString());
                            cmd.Parameters.Add("@EventDetailID", SqlDbType.BigInt).Value = Events.EventDetailID;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            MemberDetailID = "";
                            MemberID = "";
                        }
                    }
                    conn.Close();
                }
                else if(Events.ProgramID==3)
                {
                    string Members = Events.Members;
                    string[] AllMember = Members.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string FullID in AllMember)
                    {
                        SqlCommand cmd = new SqlCommand("TrainingParticipateDetailsInsert", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string[] IDOnly = FullID.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
                        for (int i = 0; i < 1; i++)
                        {
                            if (IDOnly[1] == "MD")
                            {
                                MemberDetailID += IDOnly[0];
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = Convert.ToInt64(MemberDetailID.ToString());
                            }
                            else
                            {
                                MemberID += IDOnly[0];
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = Convert.ToInt64(MemberID.ToString());
                                cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = DBNull.Value;
                            }

                            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Convert.ToInt64(IDOnly[2].ToString());
                            cmd.Parameters.Add("@EventDetailID", SqlDbType.BigInt).Value = Events.EventDetailID;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];                            
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            MemberDetailID = "";
                            MemberID = "";
                        }
                    }
                    conn.Close();
                }
                msg = "પ્રોગ્રામની માહિતી દાખલ થઈ ગઈ છે.";
                
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
    [ScriptMethod]
    public static List<EventDetail> GetEventDetail(int EventID, int VillageID, int ProgmID)
    {
        List<EventDetail> list = new List<EventDetail>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("GetDetailsOfEvent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = ProgmID;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = VillageID;
            cmd.Parameters.Add("@EventID", SqlDbType.BigInt).Value = EventID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    list.Add(new EventDetail
                    {           
                 
                    VillageID = Convert.ToInt64(ds.Tables[0].Rows[0]["VillageID"].ToString()),
                    TalukaID = Convert.ToInt64(ds.Tables[0].Rows[0]["TalukaID"].ToString()),
                    DistrictID = Convert.ToInt64(ds.Tables[0].Rows[0]["DistrictID"].ToString()),
                    EventTypeID = Convert.ToInt64(ds.Tables[0].Rows[0]["TypeID"].ToString()),
                   // MemberID = ds.Tables[0].Rows[0]["MemberID"].ToString(),
                    Members = ds.Tables[0].Rows[0]["AllMember"].ToString(),
                    DetailID = ds.Tables[0].Rows[0]["DetailID"].ToString(),
                    ID = Convert.ToInt64(sdr["Members"].ToString()),
                    Name = sdr["Name"].ToString(),
                    MemberType = sdr["Type"].ToString(),
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetEventDetail");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return list;
    }


    [WebMethod]
    public static string LoadGrid(string searchTerm, int pageIndex)
    {
        string query = "ListOfEvents";
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
                        sda.Fill(ds, "EventDetails");
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
    public static string LoadBenificaryGrid(int AETtype, int AETid, int DetailID, int pageIndex)
    {
        string query = "ListBenificaryDetails";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;        
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
        cmd.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = AETtype;
        cmd.Parameters.Add("@AETDetailid", SqlDbType.BigInt).Value = DetailID;
       // cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
        cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        return GetDataBenificary(cmd,pageIndex).GetXml();
    }

    private static DataSet GetDataBenificary(SqlCommand cmd, int pageIndex)
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
                        sda.Fill(ds, "BenificaryDetails");
                        DataTable dt = new DataTable("PagerBenificary");
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
    public static List<BenificaryMember> GetBenificaryDetail(int OtherParticipateID)
    {
        List<BenificaryMember> list = new List<BenificaryMember>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("GetBenificaryDetail", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OtherParticipateID", SqlDbType.BigInt).Value = OtherParticipateID;      
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    list.Add(new BenificaryMember
                    {
                        DistrictID = Convert.ToInt64(ds.Tables[0].Rows[0]["DistrictID"].ToString()),
                        TalukaID = Convert.ToInt64(ds.Tables[0].Rows[0]["TalukaID"].ToString()),
                        VillageID = Convert.ToInt64(ds.Tables[0].Rows[0]["VillageID"].ToString()),
                        FullName = ds.Tables[0].Rows[0]["FullName"].ToString(),
                        Age = ds.Tables[0].Rows[0]["Age"].ToString(),
                        MobileNo = ds.Tables[0].Rows[0]["Mobileno"].ToString(),
                        Remarks = ds.Tables[0].Rows[0]["Remark"].ToString(),
                        Gender = ds.Tables[0].Rows[0]["Gender"].ToString(),
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetEventDetail");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return list;
    }


    [WebMethod]
    public static List<ListItem1> GetDetailsFromSubject(int AETtype, int AETid, int DetailID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem1> list = new List<ListItem1>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetDetailsFromSubject", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@AETtype", SqlDbType.BigInt).Value = AETtype;
            cmd.Parameters.Add("@DetailID", SqlDbType.BigInt).Value = DetailID;
            //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Connection = con;
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new ListItem1
                {
                    HeadText = ds.Tables[0].Rows[0]["HeadText"].ToString(),
                    TypeText = ds.Tables[0].Rows[0]["TypeText"].ToString(),
                    Subject = ds.Tables[0].Rows[0]["SubjectG"].ToString(),
                    Place = ds.Tables[0].Rows[0]["PlaceG"].ToString(),
                    FromDate = ds.Tables[0].Rows[0]["FromDate"].ToString(),
                    ToDate = ds.Tables[0].Rows[0]["ToDate"].ToString(),
                    Time = ds.Tables[0].Rows[0]["Time"].ToString(),

                });
            }
            
        }
        catch (Exception Ex)
        { 
            
        }
        return list;
       
    }


    [WebMethod]
    public static List<ListItem1> ListMember(int Village, int Institute, int DetailID, int AETid, string SearchTerm, int SearchType)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem1> circles = new List<ListItem1>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllMember", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Village;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = Institute;
            cmd.Parameters.Add("@SearchTerm", SqlDbType.VarChar).Value = SearchTerm;
            cmd.Parameters.Add("@SearchType", SqlDbType.BigInt).Value = SearchType;
            cmd.Parameters.Add("@ADid", SqlDbType.BigInt).Value = DetailID;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem1
                    {
                        ID = Convert.ToInt64(sdr["ID"].ToString()),
                        Name = sdr["Name"].ToString(),
                        MemberType = sdr["MemberType"].ToString(),
                        VillageID = sdr["VillageID"].ToString(),
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListCircles");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListInstitute(int TalukaID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllInstituteByUserForMMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClusterID", SqlDbType.BigInt).Value = HttpContext.Current.Session["ClusterID"];

            if (HttpContext.Current.Session["LoginType"].ToString() == "Institute")
            {
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            }
            else
            {
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = 0;
            }

            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["InstituteID"].ToString(),
                        Text = sdr["InstituteNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListInstitute");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListSubjects(int AETtypeid, int AETid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListSubjectOfEventType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = AETtypeid;
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
            Global.ErrorInsert(ex.Message, formname, "ListSubjects");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return circles;
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
    [ScriptMethod]
    public static string DeleteBanificaryDetail(int OtherParticipateID)
    {
        string msg = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {

            SqlCommand cmd = new SqlCommand("DeleteBenificaryDetail", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OtherParticipateID", SqlDbType.BigInt).Value = OtherParticipateID;       
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.ExecuteNonQuery();
            //msg = "વપરાશકર્તાની વિગત  રદ થઇ ગઇ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DelteBenificaryDetails");
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
    [ScriptMethod]
    public static string DeleteEvents(int EventID, int VillageID,int AETid)
    {
        string msg = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {

            SqlCommand cmd = new SqlCommand("EventDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = EventID;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = VillageID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.ExecuteNonQuery();
            msg = "વપરાશકર્તાની વિગત  રદ થઇ ગઇ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteUser");
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
    [ScriptMethod]
    public static string DeleteParticipateDetails(int village, int DeailID, int AETid)
    {
        string msg = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {

            SqlCommand cmd = new SqlCommand("EventPariticipateDetailsDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@DeailID", SqlDbType.BigInt).Value = DeailID;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = village;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.ExecuteNonQuery();
            msg = "વપરાશકર્તાની વિગત  રદ થઇ ગઇ છે";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteUser");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return msg;
    }
}