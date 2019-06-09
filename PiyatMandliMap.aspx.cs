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

public partial class PiyatMandliMap : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=PiyatMandliMap.aspx", true);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
       // Session["InstituteID"] = Request.QueryString["InstituteID"].ToString();
    }

    public class MapBlockPoint
    {
        public Int64 MapPointIDs;
        public string MapPoints;
        public string MapColor;

        public string MapHouseHoldNo;
    }

    [WebMethod]
    [ScriptMethod]
    public static MapBlockPoint[] BindMapBlockPoints(Int64 InstituteID)
    {
        List<MapBlockPoint> lstMarkers = new List<MapBlockPoint>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

        if (con.State == ConnectionState.Closed)
            con.Open();
        SqlCommand cmd = new SqlCommand("GetMapPointByInstitute", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@InstituteID", SqlDbType.BigInt).Value = InstituteID;
        DataSet ds = new DataSet();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds, "Data1");
        if (ds.Tables["Data1"].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables["Data1"].Rows.Count; i++)
            {
                MapBlockPoint objMAPS = new MapBlockPoint();

                objMAPS.MapPointIDs = Convert.ToInt64(ds.Tables["Data1"].Rows[i]["MapPointID"].ToString());
                objMAPS.MapPoints = ds.Tables["Data1"].Rows[i]["Points"].ToString();
                objMAPS.MapColor = ds.Tables["Data1"].Rows[i]["Color"].ToString();

                //objMAPS.MapHouseHoldNo = ds.Tables["Data1"].Rows[i]["HouseHoldNo"].ToString();
                
                lstMarkers.Add(objMAPS);
            }
        }
        return lstMarkers.ToArray();
    }
}