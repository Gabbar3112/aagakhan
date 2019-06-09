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

public partial class UserMaster : System.Web.UI.Page
{
    public static string formname = "UserMaster";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=UserMaster.aspx", true);
        if (!Page.IsPostBack)
        {
            BindUser();
        }
    }

    private void BindUser()
    {
        DataTable user = new DataTable();
        user.Columns.Add("RowNumber");
        user.Columns.Add("FullName");
        user.Columns.Add("Address");
        user.Columns.Add("CircleName");
        user.Columns.Add("DivisionName");
        user.Columns.Add("SubDivisionName");
        user.Columns.Add("SectionName");
        user.Columns.Add("BeatName");
        user.Columns.Add("UserType");
        user.Columns.Add("UserName");
        user.Rows.Add();
        gvUser.DataSource = user;
        gvUser.DataBind();
    }

    public class UserDetail
    {
        public int UserTypeID { get; set; }
        public int Cluster { get; set; }
        public int UserID { get; set; }

        public string FullName { get; set; }
        public string Address { get; set; }
        public string MobileNo { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Photo { get; set; }
        public string EmailID { get; set; }
        public string ShortCode { get; set; }

        public string CircleID { get; set; }
        public string Division { get; set; }
        public string SubDivision { get; set; }
        public string Section { get; set; }
        public string Beat { get; set; }


        public string DivisionID { get; set; }
        public string SubDivisionID { get; set; }
        public string SectionID { get; set; }
        public string BeatID { get; set; }



        public string RightsID { get; set; }

        public string SystemID { get; set; }
    }

    [WebMethod]
    public static List<ListItem> ListCircles()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetCircleForUserCheckbox", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CircleID"].ToString(),
                        Text = sdr["CircleName"].ToString()
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
    public static List<ListItem> ListDivisionByCircle(string CircleID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListDivisionByCircleCheckbox", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (CircleID == "")
                cmd.Parameters.Add("@CircleID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@CircleID", SqlDbType.NVarChar).Value = CircleID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["DivisionID"].ToString(),
                        Text = sdr["DivisionName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDivisionByCircle");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListSubDivisionByDivision(string DivisionID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListSubDivisionByDivisionCheckbox", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (DivisionID == "")
                cmd.Parameters.Add("@DivisionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@DivisionID", SqlDbType.NVarChar).Value = DivisionID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["SubDivisionID"].ToString(),
                        Text = sdr["SubDivisionName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSubDivisionByDivision");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListSectionBySubDivision(string SubDivisionID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListSectionBySubDivisionCheckbox", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (SubDivisionID == "")
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.NVarChar).Value = SubDivisionID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["SectionID"].ToString(),
                        Text = sdr["SectionName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSectionBySubDivision");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListBeatBySection(string SectionID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListBeatBySectionCheckbox", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (SectionID == "")
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = SectionID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["BeatID"].ToString(),
                        Text = sdr["BeatName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSectionBySubDivision");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }

    [WebMethod]
    [ScriptMethod]
    public static string UserManage(UserDetail user)
    {
        string msg = string.Empty;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            if (user.UserID == 0)
            {
                SqlCommand cmd = new SqlCommand("UserMasterInsert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserTypeID", SqlDbType.BigInt).Value = user.UserTypeID;
                cmd.Parameters.Add("@Cluster", SqlDbType.BigInt).Value = user.Cluster;
                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar).Value = user.FullName;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = user.Address;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = user.MobileNo;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = user.UserName;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = user.Password;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = user.EmailID;
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@ShortCode", SqlDbType.VarChar).Value = user.ShortCode;
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                int uid = 0;
                cmd = new SqlCommand("Select Ident_Current('UserMaster')", conn);
                uid = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Dispose();
                if (uid != 0)
                {
                    string[] stringSeparators = new string[] { "," };
                    string circle = user.CircleID;
                    string[] resultcircle;
                    resultcircle = circle.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in resultcircle)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserCircleMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = uid;
                            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string divison = user.Division;
                    string[] divisonSeparators = new string[] { "," };
                    string[] resultsource;
                    resultsource = divison.Split(divisonSeparators, StringSplitOptions.None);
                    foreach (string s in resultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserDivisionMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = uid;
                            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string subdivison = user.SubDivision;
                    string[] subdivisonSeparators = new string[] { "," };
                    string[] subresultsource;
                    subresultsource = subdivison.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in subresultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserSubDivisionMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = uid;
                            cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }


                    string section = user.Section;
                    string[] sectionSeparators = new string[] { "," };
                    string[] sectionresultsource;
                    sectionresultsource = section.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in sectionresultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserSectionMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = uid;
                            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string beat = user.Beat;
                    string[] beatSeparators = new string[] { "," };
                    string[] beatresultsource;
                    beatresultsource = beat.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in beatresultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserBeatMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = uid;
                            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                conn.Close();
                msg = "USER DETAIL ADDED SUCCESSFULLY.";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UserMasterUpdate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = user.UserID;
                cmd.Parameters.Add("@UserTypeID", SqlDbType.BigInt).Value = user.UserTypeID;
                cmd.Parameters.Add("@ClusterID", SqlDbType.BigInt).Value = user.Cluster;
                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar).Value = user.FullName;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = user.Address;
                cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = user.MobileNo;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = user.UserName;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = user.Password;
                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = user.EmailID;
                cmd.Parameters.Add("@ShortCode", SqlDbType.VarChar).Value = user.ShortCode;
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();

                if (user.UserID != 0)
                {
                    cmd = new SqlCommand("Delete FROM UserCircleMaster WHERE UserID=" + user.UserID + " AND LoginType = '" + HttpContext.Current.Session["LoginType"] + "' ", conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    cmd = new SqlCommand("Delete FROM UserDivisionMaster WHERE UserID=" + user.UserID + " AND LoginType ='" + HttpContext.Current.Session["LoginType"] + "' ", conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    cmd = new SqlCommand("Delete FROM UserSubDivisionMaster WHERE UserID=" + user.UserID + " AND LoginType ='" + HttpContext.Current.Session["LoginType"] + "'", conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    cmd = new SqlCommand("Delete FROM UserSectionMaster WHERE UserID=" + user.UserID + " AND LoginType ='" + HttpContext.Current.Session["LoginType"] + "'", conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    cmd = new SqlCommand("Delete FROM UserBeatMaster WHERE UserID=" + user.UserID + " AND LoginType ='" + HttpContext.Current.Session["LoginType"] + "'", conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    string[] stringSeparators = new string[] { "," };
                    string circle = user.CircleID;
                    string[] resultcircle;
                    resultcircle = circle.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in resultcircle)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserCircleMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = user.UserID;
                            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string divison = user.Division;
                    string[] divisonSeparators = new string[] { "," };
                    string[] resultsource;
                    resultsource = divison.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in resultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserDivisionMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = user.UserID;
                            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string subdivison = user.SubDivision;
                    string[] subdivisonSeparators = new string[] { "," };
                    string[] subresultsource;
                    subresultsource = subdivison.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in subresultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserSubDivisionMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = user.UserID;
                            cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string section = user.Section;
                    string[] sectionSeparators = new string[] { "," };
                    string[] sectionresultsource;
                    sectionresultsource = section.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in sectionresultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserSectionMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = user.UserID;
                            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string beat = user.Beat;
                    string[] beatSeparators = new string[] { "," };
                    string[] beatresultsource;
                    beatresultsource = beat.Split(stringSeparators, StringSplitOptions.None);
                    foreach (string s in beatresultsource)
                    {
                        if (s != "")
                        {
                            cmd = new SqlCommand("UserBeatMasterInsert", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = user.UserID;
                            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = s;
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                conn.Close();
                msg = "USER DETAIL UPDATED SUCCESSFULLY.";
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
    public static List<ListItem> ListDivisionByCircleSimple(string CircleID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListDivisionByCircle", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (CircleID == "")
                cmd.Parameters.Add("@CircleID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@CircleID", SqlDbType.NVarChar).Value = CircleID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["DivisionID"].ToString(),
                        Text = sdr["DivisionName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDivisionByCircleSimple");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListSubDivisionByDivisionSimple(string DivisionID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListSubDivisionFromDivisionSimple", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (DivisionID == "" || DivisionID == null)
                cmd.Parameters.Add("@DivisionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@DivisionID", SqlDbType.NVarChar).Value = DivisionID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["SubDivisionID"].ToString(),
                        Text = sdr["SubDivisionName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSubDivisionByDivisionSimple");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListSectionBySubDivisionSimple(string SubDivisionID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        SqlCommand cmd = new SqlCommand("ListSectionBySubDivision", conn);
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            if (SubDivisionID == "" || SubDivisionID == null)
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@SubDivisionID", SqlDbType.NVarChar).Value = SubDivisionID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["SectionID"].ToString(),
                        Text = sdr["SectionName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSectionBySubDivisionSimple");

        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListBeatBySectionSimple(string SectionID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListBeatBySection", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            if (SectionID == "" || SectionID == null)
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = "0";
            else
                cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = SectionID;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["BeatID"].ToString(),
                        Text = sdr["BeatName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListBeatBySectionSimple");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return circles;
    }

    [WebMethod]
    public static string GetAllUser(string searchTerm, string SearchCircleWiseTerm, string SearchDivisionWiseTerm, string SearchSubDivisionWiseTerm, string SearchSectionTerm, string SearchBeatTerm, int pageIndex)
    {
        string query = "UserMasterSearch";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SearchTerm", searchTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@CircleID", SearchCircleWiseTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@DivisionID", SearchDivisionWiseTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@SubDivisionID", SearchSubDivisionWiseTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@SectionID", SearchSectionTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@BeatID", SearchBeatTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
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
                        sda.Fill(ds, "UserMaster");
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
    public static List<UserDetail> GetUserDetail(int UserID)
    {
        List<UserDetail> list = new List<UserDetail>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("UserMasterGet", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = UserID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new UserDetail
                {
                    UserID = Convert.ToInt32(ds.Tables[0].Rows[0]["UserID"].ToString()),
                    UserTypeID = Convert.ToInt32(ds.Tables[0].Rows[0]["UserTypeID"].ToString()),
                    Cluster = Convert.ToInt32(ds.Tables[0].Rows[0]["ClusterID"].ToString()),
                    CircleID = ds.Tables[0].Rows[0]["CircleID"].ToString(),
                    FullName = ds.Tables[0].Rows[0]["FullName"].ToString(),
                    Address = ds.Tables[0].Rows[0]["Address"].ToString(),
                    MobileNo = ds.Tables[0].Rows[0]["MobileNo"].ToString(),
                    UserName = ds.Tables[0].Rows[0]["UserName"].ToString(),
                    Password = ds.Tables[0].Rows[0]["Password"].ToString(),
                    //Photo = ds.Tables[0].Rows[0]["Photo"].ToString(),
                    EmailID = ds.Tables[0].Rows[0]["EmailID"].ToString(),
                    DivisionID = ds.Tables[0].Rows[0]["DivisionID"].ToString(),
                    SubDivisionID = ds.Tables[0].Rows[0]["SubDivisionID"].ToString(),
                    SectionID = ds.Tables[0].Rows[0]["SectionID"].ToString(),
                    BeatID = ds.Tables[0].Rows[0]["BeatID"].ToString(),
                    ShortCode = ds.Tables[0].Rows[0]["ShortCode"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "UserManage");

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
    public static string DeleteUser(int UserID)
    {
        string msg = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {

            SqlCommand cmd = new SqlCommand("UserMasterDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = UserID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            int i = Convert.ToInt32(cmd.ExecuteScalar());
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