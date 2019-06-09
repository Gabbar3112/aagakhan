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

public partial class RptInstituteDetail : System.Web.UI.Page
{
    public static string formname = "RptInstituteDetail";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=RptInstituteDetail.aspx", true);
    }

    //[WebMethod]
    //public static List<ListItem> GetInstitute() {
    //   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
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