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

public partial class InstituteMaster : System.Web.UI.Page
{
    SqlConnection con;
    private static int PageSize = 10;
    public static string formname = "InstituteMaster";
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
    public static string MachineName = System.Environment.MachineName.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=InstituteMaster.aspx", true);
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        Session["MachineName"] = MachineName;
        Session["date"] = indianTime;

        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DataTable user = new DataTable();
        user.Columns.Add("RowNumber");
        user.Columns.Add("DistrictNameG");
        user.Columns.Add("TalukaNameG");
        user.Columns.Add("InstituteNameG");
        user.Columns.Add("InstituteCodeG");
        user.Columns.Add("Address");
        user.Columns.Add("RegNo");
        user.Columns.Add("RegDate");
        user.Columns.Add("Area");
        user.Columns.Add("EmailID");
        user.Rows.Add();
        gvInstituteMaster.DataSource = user;
        gvInstituteMaster.DataBind();
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckInsituteName(string InstituteName)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckInstituteNameExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteName", SqlDbType.NVarChar).Value = InstituteName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInsituteName");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckInsituteNameG(string InstituteNameG)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckInstituteNameGExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteNameG", SqlDbType.NVarChar).Value = InstituteNameG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInsituteNameG");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckInsituteNumber(string InstituteNumber)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckInstituteNumberExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteNumber", SqlDbType.NVarChar).Value = InstituteNumber;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInsituteNumber");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckInsituteNumberG(string InstituteNumberG)
    {
        bool IsExist = false;
        try
        {
            Global.conn.Open();
            SqlCommand cmd = new SqlCommand("CheckInstituteNumberGExists", Global.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteNumberG", SqlDbType.NVarChar).Value = InstituteNumberG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckInsituteNumberG");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return IsExist;
    }

    [WebMethod]
    public static List<ListItem> ListTaluka(int DistrictID)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("ListAllTalukaByDistrict", con);
        List<ListItem> Talukas = new List<ListItem>();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@DistrictID", SqlDbType.BigInt).Value = DistrictID;
        cmd.Connection = con;
        con.Open();
        try
        {
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    Talukas.Add(new ListItem
                    {
                        Value = sdr["TalukaID"].ToString(),
                        Text = sdr["TalukaNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListTaluka");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return Talukas;
    }

    [WebMethod]
    public static List<ListItem> ListInstituteType()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllInstituteType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (HttpContext.Current.Session["LoginType"].ToString() == "Institute")
            {
                cmd.Parameters.Add("@InstituteTypeID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserTypeID"];
            }
            else
            {
                cmd.Parameters.Add("@InstituteTypeID", SqlDbType.BigInt).Value = 0;
            }
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["InstituteTypeID"].ToString(),
                        Text = sdr["InstituteTypeNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListInstituteType");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListCluster()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllCluster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClusterID", SqlDbType.BigInt).Value = HttpContext.Current.Session["ClusterID"];
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["ClusterID"].ToString(),
                        Text = sdr["ClusterName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListCluster");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static string InstituteMasterGet(string searchTerm, int pageIndex, int DistrictID, int TalukaID, int InstituteTypeID, int ClusterID)
    {
        string query = "InstituteMasterGet";
        SqlCommand cmd = new SqlCommand(query);
        try
        {

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]).DbType = DbType.Int64;
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm).DbType = DbType.String;
            cmd.Parameters.AddWithValue("@DistrictID", DistrictID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@TalukaID", TalukaID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@InstituteTypeID", InstituteTypeID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@ClusterID", ClusterID).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
            cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            
      //      Global.LogInsert(formname, "Get", "InstituteMaster", "InstituteMasterGet");
            return GetData(cmd, pageIndex).GetXml();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteMasterGet");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
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
                    sda.Fill(ds, "Institute");
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

    public class Institute
    {
        public Int64 InstituteID { get; set; }
        public int TalukaID { get; set; }
        public int DistrictID { get; set; }
        public Int64 InstituteTypeID { get; set; }
        public Int64 ClusterID { get; set; }
        public string InstituteName { get; set; }
        public string InstituteCode { get; set; }
        public string InstituteNameG { get; set; }
        public string InstituteCodeG { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Add1 { get; set; }
        public string Add2 { get; set; }
        public string Add3 { get; set; }
        public string Add1G { get; set; }
        public string Add2G { get; set; }
        public string Add3G { get; set; }
        public string MobileNo { get; set; }
        public string MobileNoG { get; set; }
        public string Phone { get; set; }
        public string PhoneG { get; set; }
        public string RegNo { get; set; }
        public string RegNoG { get; set; }
        public string RegDate { get; set; }
        public Decimal Area { get; set; }
        public string EmailID { get; set; }
        public string FormationDate { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public string AccountNumber { get; set; }
        public string RegStatus { get; set; }
        public bool rbtStatusY { get; set; }
        public bool rbtStatusN { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string InstituteManage(Institute institute)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        try
        {
            if (institute.InstituteID == 0)
            {
                SqlCommand cmd = new SqlCommand("InstituteMasterInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@InstituteTypeID", SqlDbType.NVarChar).Value = institute.InstituteTypeID;
                cmd.Parameters.Add("@TalukaID", SqlDbType.NVarChar).Value = institute.TalukaID;
                cmd.Parameters.Add("@ClusterID", SqlDbType.NVarChar).Value = institute.ClusterID;
                cmd.Parameters.Add("@InstituteName", SqlDbType.NVarChar).Value = institute.InstituteName;
                cmd.Parameters.Add("@InstituteCode", SqlDbType.NVarChar).Value = institute.InstituteCode;
                cmd.Parameters.Add("@InstituteNameG", SqlDbType.NVarChar).Value = institute.InstituteNameG;
                cmd.Parameters.Add("@InstituteCodeG", SqlDbType.NVarChar).Value = institute.InstituteCodeG;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = institute.UserName;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = institute.Password;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = institute.Add1;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = institute.Add1G;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = institute.Add2;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = institute.Add2G;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = institute.Add3;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = institute.Add3G;
                cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = institute.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = institute.MobileNoG;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar).Value = institute.Phone;
                cmd.Parameters.Add("@PhoneNoG", SqlDbType.NVarChar).Value = institute.PhoneG;
                cmd.Parameters.Add("@RegNo", SqlDbType.NVarChar).Value = institute.RegNo;
                cmd.Parameters.Add("@RegNoG", SqlDbType.NVarChar).Value = institute.RegNoG;
                cmd.Parameters.Add("@RegDate", SqlDbType.DateTime).Value = Convert.ToDateTime(institute.RegDate.Substring(3, 2).PadLeft(2, '0') + "/" + institute.RegDate.Substring(0, 2).PadLeft(2, '0') + "/" + institute.RegDate.Substring(6, 4));
                cmd.Parameters.Add("@Area", SqlDbType.Decimal).Value = institute.Area;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = institute.EmailID;
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@InsertTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = HttpContext.Current.Session["MachineName"];
                cmd.Parameters.Add("@FormationDate", SqlDbType.DateTime).Value = Convert.ToDateTime(institute.FormationDate.Substring(3, 2).PadLeft(2, '0') + "/" + institute.FormationDate.Substring(0, 2).PadLeft(2, '0') + "/" + institute.FormationDate.Substring(6, 4));
                cmd.Parameters.Add("@BankName", SqlDbType.NVarChar).Value = institute.BankName;
                cmd.Parameters.Add("@BranchName", SqlDbType.NVarChar).Value = institute.BranchName;
                cmd.Parameters.Add("@AccountNumber", SqlDbType.NVarChar).Value = institute.AccountNumber;
               

                if (institute.rbtStatusY == true)
                {
                    cmd.Parameters.Add("@RegStatus", SqlDbType.NVarChar).Value = "Yes";
                }
                else if (institute.rbtStatusN == true)
                {
                    cmd.Parameters.Add("@RegStatus", SqlDbType.NVarChar).Value = "No";
                }
                
                cmd.ExecuteNonQuery();
                msg = "સંસ્થાની માહિતી સફળતાથી દાખલ થઈ ગઈ છે.";
               // Global.LogInsert(formname, "Insert", "InstituteMaster", "InstituteManage");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("InstituteMasterUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@InstituteID", SqlDbType.NVarChar).Value = institute.InstituteID;
                cmd.Parameters.Add("@InstituteTypeID", SqlDbType.NVarChar).Value = institute.InstituteTypeID;
                cmd.Parameters.Add("@TalukaID", SqlDbType.NVarChar).Value = institute.TalukaID;
                cmd.Parameters.Add("@ClusterID", SqlDbType.NVarChar).Value = institute.ClusterID;
                cmd.Parameters.Add("@InstituteName", SqlDbType.NVarChar).Value = institute.InstituteName;
                cmd.Parameters.Add("@InstituteNameG", SqlDbType.NVarChar).Value = institute.InstituteNameG;
                cmd.Parameters.Add("@InstituteCode", SqlDbType.NVarChar).Value = institute.InstituteCode;
                cmd.Parameters.Add("@InstituteCodeG", SqlDbType.NVarChar).Value = institute.InstituteCodeG;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = institute.UserName;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = institute.Password;
                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = institute.Add1;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = institute.Add1G;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = institute.Add2;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = institute.Add2G;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = institute.Add3;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = institute.Add3G;
                cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = institute.MobileNo;
                cmd.Parameters.Add("@MobileNoG", SqlDbType.NVarChar).Value = institute.MobileNoG;
                cmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar).Value = institute.Phone;
                cmd.Parameters.Add("@PhoneNoG", SqlDbType.NVarChar).Value = institute.PhoneG;
                cmd.Parameters.Add("@RegNo", SqlDbType.NVarChar).Value = institute.RegNo;
                cmd.Parameters.Add("@RegNoG", SqlDbType.NVarChar).Value = institute.RegNoG;
                cmd.Parameters.Add("@RegDate", SqlDbType.DateTime).Value = Convert.ToDateTime(institute.RegDate.Substring(3, 2).PadLeft(2, '0') + "/" + institute.RegDate.Substring(0, 2).PadLeft(2, '0') + "/" + institute.RegDate.Substring(6, 4));
                cmd.Parameters.Add("@Area", SqlDbType.Decimal).Value = institute.Area;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = institute.EmailID;
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@UpdateTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = HttpContext.Current.Session["MachineName"];
                cmd.Parameters.Add("@FormationDate", SqlDbType.DateTime).Value = Convert.ToDateTime(institute.FormationDate.Substring(3, 2).PadLeft(2, '0') + "/" + institute.FormationDate.Substring(0, 2).PadLeft(2, '0') + "/" + institute.FormationDate.Substring(6, 4));
                cmd.Parameters.Add("@BankName", SqlDbType.NVarChar).Value = institute.BankName;
                cmd.Parameters.Add("@BranchName", SqlDbType.NVarChar).Value = institute.BranchName;
                cmd.Parameters.Add("@AccountNumber", SqlDbType.NVarChar).Value = institute.AccountNumber;           

                if (institute.rbtStatusY == true)
                {
                    cmd.Parameters.Add("@RegStatus", SqlDbType.NVarChar).Value = "Yes";
                }
                else if (institute.rbtStatusN == true)
                {
                    cmd.Parameters.Add("@RegStatus", SqlDbType.NVarChar).Value = "No";
                }

                cmd.ExecuteNonQuery();
                msg = "સંસ્થાની માહિતી સફળતાથી બદલાઈ ગઈ છે.";
             //   Global.LogInsert(formname, "Update", "InstituteMaster", "InstituteManage");
            }
           
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteManage");
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
    public static List<Institute> InstituteMasterUpdate(int ID)
    {
        List<Institute> list = new List<Institute>();
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ListAllInstituteByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteID", SqlDbType.VarChar).Value = ID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new Institute
                {
                    InstituteID = Convert.ToInt64(ds.Tables[0].Rows[0]["InstituteID"].ToString()),
                    InstituteName = ds.Tables[0].Rows[0]["InstituteName"].ToString(),
                    InstituteCode = ds.Tables[0].Rows[0]["InstituteCode"].ToString(),
                    InstituteNameG = ds.Tables[0].Rows[0]["InstituteNameG"].ToString(),
                    InstituteCodeG = ds.Tables[0].Rows[0]["InstituteCodeG"].ToString(),
                    UserName = ds.Tables[0].Rows[0]["UserName"].ToString(),
                    Password = ds.Tables[0].Rows[0]["Password"].ToString(),
                    Add1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                    Add2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                    Add3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                    Add1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                    Add2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                    Add3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString(),
                    MobileNoG = ds.Tables[0].Rows[0]["MobileNoG"].ToString(),
                    Phone = ds.Tables[0].Rows[0]["PhoneNo"].ToString(),
                    PhoneG = ds.Tables[0].Rows[0]["PhoneNoG"].ToString(),
                    RegNo = ds.Tables[0].Rows[0]["RegNo"].ToString(),
                    RegNoG = ds.Tables[0].Rows[0]["RegNoG"].ToString(),
                    RegDate = ds.Tables[0].Rows[0]["RegDate"].ToString(),
                    Area = Convert.ToDecimal(ds.Tables[0].Rows[0]["Area"].ToString()),
                    EmailID = ds.Tables[0].Rows[0]["EmailID"].ToString(),
                    TalukaID = Convert.ToInt32(ds.Tables[0].Rows[0]["TalukaID"].ToString()),
                    DistrictID = Convert.ToInt32(ds.Tables[0].Rows[0]["DistrictID"].ToString()),
                    InstituteTypeID = Convert.ToInt32(ds.Tables[0].Rows[0]["InstituteTypeID"].ToString()),
                    ClusterID = Convert.ToInt32(ds.Tables[0].Rows[0]["ClusterID"].ToString()),
                    FormationDate = ds.Tables[0].Rows[0]["FormationDate"].ToString(),
                    BankName = ds.Tables[0].Rows[0]["BankName"].ToString(),
                    BranchName = ds.Tables[0].Rows[0]["BranchName"].ToString(),
                    AccountNumber = ds.Tables[0].Rows[0]["AccountNumber"].ToString(),
                    RegStatus=ds.Tables[0].Rows[0]["RegStatus"].ToString(),
                });
            }
         //   Global.LogInsert(formname, "List", "InstituteMaster", "InstituteMasterUpdate");
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteMasterUpdate");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static string InstituteMasterDelete(int ID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlCommand cmd = new SqlCommand("InstituteMasterDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = ID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@DeleteTime", SqlDbType.DateTime).Value = HttpContext.Current.Session["date"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;

            int i = Convert.ToInt32(cmd.ExecuteScalar());
         //   Global.LogInsert(formname, "Delete", "InstituteMaster", "InstituteMasterDelete");

        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "InstituteMasterDelete");
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