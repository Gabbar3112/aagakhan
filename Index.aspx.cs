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

public partial class Index : System.Web.UI.Page
{
    public static string formname = "Index";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public class UserDetail
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public int YearID { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string CheckUserNamePasssword(UserDetail user)
    {
        string msg = string.Empty;
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("CheckUserPassword", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = user.UserName;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = user.Password;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = user.YearID;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
           
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["LoginType"].ToString() == "AdminOrCluster")
                    {
                        HttpContext.Current.Session["UserID"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                        HttpContext.Current.Session["UserTypeID"] = ds.Tables[0].Rows[0]["UserTypeID"].ToString();
                        HttpContext.Current.Session["UserType"] = ds.Tables[0].Rows[0]["UserType"].ToString();
                    }
                    else if (ds.Tables[0].Rows[0]["LoginType"].ToString() == "Institute")
                    {
                        HttpContext.Current.Session["UserID"] = ds.Tables[0].Rows[0]["InstituteID"].ToString();
                        HttpContext.Current.Session["UserTypeID"] = ds.Tables[0].Rows[0]["InstituteTypeID"].ToString();
                        HttpContext.Current.Session["UserType"] = ds.Tables[0].Rows[0]["InstituteTypeName"].ToString();
                    }
                    HttpContext.Current.Session["ClusterID"] = ds.Tables[0].Rows[0]["ClusterID"].ToString();
                    HttpContext.Current.Session["UserName"] = ds.Tables[0].Rows[0]["UserName"].ToString();
                    HttpContext.Current.Session["StartYear"] = ds.Tables[0].Rows[0]["StartYear"].ToString();
                    HttpContext.Current.Session["EndYear"] = ds.Tables[0].Rows[0]["EndYear"].ToString();
                    HttpContext.Current.Session["Finyear"] = ds.Tables[0].Rows[0]["StartYear"].ToString() + "-" + ds.Tables[0].Rows[0]["EndYear"].ToString();
                    HttpContext.Current.Session["YearID"] = user.YearID;
                    HttpContext.Current.Session["LoginType"] = ds.Tables[0].Rows[0]["LoginType"].ToString();
                    
                    msg = "1";
                   // Global.LogInsert(formname, "Login", "UserMaster", "User Login");
                }
            }
            else
            {
                msg = "0";
            }
        }
        catch (Exception ex)
        {
            msg = "Error" + ex.Message;
            Global.ErrorInsert(ex.Message, formname, "CheckUserPasss");
        }
        return msg;
    }
}