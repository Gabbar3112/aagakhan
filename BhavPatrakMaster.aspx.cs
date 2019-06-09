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

public partial class BhavPatrakMaster : System.Web.UI.Page
{
    public static string formname = "BhavPatrakMaster";

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=BhavPatrakMaster.aspx", true);
    }

    protected DataSet GetSeason(Int64 PakID)
    {
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("PakMasterGetAllSeasonWithPak", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PakID", PakID).DbType = DbType.Int64;
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = Session["YearID"];
            //cmd.Parameters.Add("@Rate", SqlDbType.Float).Value = 0;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"]; 
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.Dispose();
            conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSeason");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return ds;
    }

    protected void repPak_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            GridView gvSeason = (GridView)e.Item.FindControl("gvSeason");

            if (gvSeason != null)
            {
                Int64 PakID = Convert.ToInt64(DataBinder.Eval(e.Item.DataItem, "PakID").ToString());
                DataSet ds3 = GetSeason(PakID);

                if (gvSeason != null)
                {
                    gvSeason.DataSource = ds3;
                    gvSeason.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "repPak_ItemDataBound");
        }
        finally
        {
            if (conn.State.Equals(ConnectionState.Open))
                conn.Close();
        }
    }

    [WebMethod]
    [ScriptMethod]
    public static string UpdateRate(int PakID, int SeasonID,decimal GovtPrice,decimal Price, decimal TotalWater, int YearID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("RateMasterInsert", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@PakID", SqlDbType.BigInt).Value = PakID;
            cmd.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = SeasonID;
            cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = YearID;
            cmd.Parameters.Add("@Rate", SqlDbType.Decimal).Value = Price;
            cmd.Parameters.Add("@GovtRate", SqlDbType.Decimal).Value = GovtPrice;
            cmd.Parameters.Add("@TotalWater", SqlDbType.Decimal).Value = TotalWater;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"]; 
            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"]; 
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            msg = "ભાવ સફળતાથી દાખલ થઇ ગયો છે.";
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
}