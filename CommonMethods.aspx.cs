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

public partial class CommonMethods : System.Web.UI.Page
{
    public static string formname = "CommonMethods";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx", true);
    }

    [WebMethod]
    public static List<ListItem> ListCircle()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListCircleByUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CircleID"].ToString(),
                        Text = sdr["CircleNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListCircle");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListDivision(int CircleID)
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListDivisionFromCircle", Global.conn);
        List<ListItem> divisions = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CircleID", SqlDbType.BigInt).Value = CircleID;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    divisions.Add(new ListItem
                    {
                        Value = sdr["DivisionID"].ToString(),
                        Text = sdr["DivisionNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDivision");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return divisions;
    }

    [WebMethod]
    public static List<ListItem> ListDivisionByUser()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListDivisionByUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["DivisionID"].ToString(),
                        Text = sdr["DivisionNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDivisionByUser");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListSubDivision(int DivisionID)
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListSubDivisionFromDivision", Global.conn);
        List<ListItem> subdivisions = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DivisionID", SqlDbType.BigInt).Value = DivisionID;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    subdivisions.Add(new ListItem
                    {
                        Value = sdr["SubDivisionID"].ToString(),
                        Text = sdr["SubDivisionNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSubDivision");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return subdivisions;
    }

    [WebMethod]
    public static List<ListItem> ListSection(int SubDivisionID)
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListSectionFromSubDivision", Global.conn);
        List<ListItem> sections = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SubDivisionID", SqlDbType.BigInt).Value = SubDivisionID;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    sections.Add(new ListItem
                    {
                        Value = sdr["SectionID"].ToString(),
                        Text = sdr["SectionNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSection");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return sections;
    }

    [WebMethod]
    public static List<ListItem> ListBeat(int SectionID)
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListBeatFromSection", Global.conn);
        List<ListItem> sections = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.NVarChar).Value = SectionID;
            cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    sections.Add(new ListItem
                    {
                        Value = sdr["BeatID"].ToString(),
                        Text = sdr["BeatNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListBeat");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return sections;
    }


    [WebMethod]
    public static List<ListItem> ListDistrict()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllDistrict", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["DistrictID"].ToString(),
                        Text = sdr["DistrictNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDistrict");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListTaluka(int DistrictID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllTalukaByDistrict", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DistrictID", SqlDbType.BigInt).Value = DistrictID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
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
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListVillage(int TalukaID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllVillageByTaluka", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TalukaID", SqlDbType.BigInt).Value = TalukaID;
            //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["VillageID"].ToString(),
                        Text = sdr["VillageNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListVillage");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListInstituteByUser()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllInstituteByUser", con);
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
                        Value = sdr["InstituteID"].ToString(),
                        Text = sdr["InstituteNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListFinYear");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListSubCaste()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllSubCast", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["SubCastID"].ToString(),
                        Text = sdr["SubCastNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSubCaste");

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
    public static string Logout()
    {
        string str = string.Empty;
        try
        {
            Global.LogInsert(formname, "Logout", "UserMaster", "User logout");
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Clear();
            str = "logout";
        }
        catch (Exception ex)
        {
            str = "Error" + ex.Message;
            Global.ErrorInsert(ex.Message, formname, "Logout");
        }
        return str;
    }

    public class UserDetail
    {
        public int UserTypeID { get; set; }
        public int UserID { get; set; }
        public string RightsID { get; set; }
    }


    [WebMethod]
    [ScriptMethod]
    public static List<UserDetail> ListRigthsByUser(Int64 UserID, string FormNameID ,string LoginType)
    {
        List<UserDetail> list = new List<UserDetail>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("ListRightsOfUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", UserID).DbType = DbType.Int64;
            cmd.Parameters.Add("@FormNameID", FormNameID).DbType = DbType.String;
            cmd.Parameters.Add("@LoginType", LoginType).DbType = DbType.String;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new UserDetail
                {
                    RightsID = ds.Tables[0].Rows[0]["RightsID"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListRigthsByUser");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return list;
    }



}