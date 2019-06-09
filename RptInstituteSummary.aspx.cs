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

public partial class RptInstituteSummary : System.Web.UI.Page
{
    public static string formname = "RptInstituteSummary";   
    private static int PageSize = 10;
    SqlConnection conn;
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=RptInstituteSummary.aspx", true);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        Session["date"] = indianTime;
        //Label lblTitle = this.Master.FindControl("lblTitle") as Label;
        //lblTitle.Text = "મૌસમ પ્રમાણે માહિતી";
        if (!Page.IsPostBack)
        {
            
        }
        
    }

    //[WebMethod]
    //public static List<ListItem> ListInstitute()
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
    //    List<ListItem> circles = new List<ListItem>();
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("ListAllInstitute", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Connection = con;
    //        con.Open();
    //        using (SqlDataReader sdr = cmd.ExecuteReader())
    //        {
    //            while (sdr.Read())
    //            {
    //                circles.Add(new ListItem
    //                {
    //                    Value = sdr["InstituteID"].ToString(),
    //                    Text = sdr["InstituteNameG"].ToString()
    //                });
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Global.ErrorInsert(ex.Message, formname, "ListDistrict");

    //    }
    //    finally
    //    {
    //        if (con.State == ConnectionState.Open)
    //            con.Close();
    //    }

    //    return circles;
    //}
}