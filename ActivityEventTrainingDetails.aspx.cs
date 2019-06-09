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


public partial class ActivityEventTrainingDetails : System.Web.UI.Page
{
    public static string formname = "ActivityEventTrainingDetails";
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=ActivityEventTrainingDetails.aspx", true);
    }

     public class EventMember
    {
        public Int64 EventID { get; set; }      
        public Int64 ProgramID { get; set; }
        public string PlaceG {get;set;}
        public string FromDate {get;set;}
        public string ToDate {get;set;}
        public string Time { get; set; }
        public Int64 IsEdit { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string ManageEvent(EventMember Events)
    {
        var msg = "";
        Int64 id = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            if (Events.IsEdit == 0)
            {

                if (Events.ProgramID == 2)
                {
                    SqlCommand cmd = new SqlCommand("EventDetailsInsert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@EventID", SqlDbType.BigInt).Value = Events.EventID;
                    cmd.Parameters.Add("@PlaceG", SqlDbType.NVarChar).Value = Events.PlaceG;
                    if (Events.FromDate == "")
                    {
                        cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Events.FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + Events.FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + Events.FromDate.Substring(6, 4));
                    }
                    if (Events.ToDate == "")
                    {
                        cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Events.ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + Events.ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + Events.ToDate.Substring(6, 4));
                    }
                    if (Events.Time == "")
                    {
                        cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = Events.Time;
                    }
                    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                    cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                    msg = cmd.ExecuteScalar().ToString();
                    cmd.Dispose();

                    conn.Close();
                }
                else if (Events.ProgramID == 1)
                {                    
                        SqlCommand cmd = new SqlCommand("ActivityDetailsInsert", conn);
                        cmd.CommandType = CommandType.StoredProcedure;                        
                                            
                            cmd.Parameters.Add("@EventID", SqlDbType.BigInt).Value = Events.EventID;
                            cmd.Parameters.Add("@PlaceG", SqlDbType.NVarChar).Value = Events.PlaceG;
                             if (Events.FromDate =="") {
                                cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DBNull.Value;
                             }
                             else
                             {
                                cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Events.FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + Events.FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + Events.FromDate.Substring(6, 4));
                             }
                             if (Events.ToDate =="") {
                                cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DBNull.Value;
                             }
                             else
                             {
                                cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Events.ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + Events.ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + Events.ToDate.Substring(6, 4));
                             }
                             if (Events.Time == "")
                             {
                                 cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = DBNull.Value;
                             }
                             else
                             {
                                 cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = Events.Time;
                             }
                            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                            cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                            msg = cmd.ExecuteScalar().ToString();
                            cmd.Dispose();  

                    conn.Close();
                }
                else if (Events.ProgramID == 3)
                {
                    SqlCommand cmd = new SqlCommand("TrainingDetailsInsert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@EventID", SqlDbType.BigInt).Value = Events.EventID;
                    cmd.Parameters.Add("@PlaceG", SqlDbType.NVarChar).Value = Events.PlaceG;
                    if (Events.FromDate == "")
                    {
                        cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Events.FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + Events.FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + Events.FromDate.Substring(6, 4));
                    }
                    if (Events.ToDate == "")
                    {
                        cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Events.ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + Events.ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + Events.ToDate.Substring(6, 4));
                    }
                    if (Events.Time == "")
                    {
                        cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = Events.Time;
                    }
                    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                    cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                    msg = cmd.ExecuteScalar().ToString();
                    cmd.Dispose();

                    conn.Close();
                }
                //msg = "પ્રોગ્રામની માહિતી દાખલ થઈ ગઈ છે.";

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
    public static string CheckEventVigat(int AETid, int AETtype, int Subject, string Place, string FromDate, string ToDate, string Time)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        string IsExist = "0";
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckEventVigat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@AETtype", SqlDbType.BigInt).Value = AETtype;
            cmd.Parameters.Add("@Subject", SqlDbType.BigInt).Value = Subject;
            cmd.Parameters.Add("@Place", SqlDbType.NVarChar).Value = Place;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + FromDate.Substring(6, 4));
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + ToDate.Substring(6, 4));
            cmd.Parameters.Add("@Time", SqlDbType.DateTime).Value = Time;
         
            string i = cmd.ExecuteScalar().ToString();
            string[] chk = i.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            if (chk[0] == "0")
                IsExist = chk[0];
            else
                IsExist = chk[1];

        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckEventVigat");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

}