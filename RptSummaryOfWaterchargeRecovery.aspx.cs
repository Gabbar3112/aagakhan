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

public partial class RptSummaryOfWaterchargeRecovery : System.Web.UI.Page
{
    public static string formname = "RptSummaryOfWaterchargeRecovery";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=RptMembershipData.aspx", true);
    }

    [WebMethod]
    public static List<ListItem> ListInstituteForForm17()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListInstituteForForm17", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            //cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = HttpContext.Current.Session["LoginType"];
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
            Global.ErrorInsert(ex.Message, formname, "ListCircle");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

}