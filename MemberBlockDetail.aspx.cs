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

public partial class MemberBlockDetail : System.Web.UI.Page
{
    SqlConnection conn;
    public static string formname = "MemberBlockDetail";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=MemberMaster.aspx", true);

        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

        string MemberId = Request.QueryString["Mid"];
        SqlCommand cmd = new SqlCommand("MemberInfoByID", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = MemberId;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblAccountNo.Text = ds.Tables[0].Rows[0]["AccountNo"].ToString();
            lblFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
            lblVillage.Text = ds.Tables[0].Rows[0]["VillageNameG"].ToString();
            lblAddress.Text = ds.Tables[0].Rows[0]["FullAddress"].ToString(); 
            lblMobile1.Text = ds.Tables[0].Rows[0]["MobileNo1"].ToString();
            lblHouseHold.Text = ds.Tables[0].Rows[0]["HouseholdNo"].ToString();
        }

        if (!Page.IsPostBack)
        {
            BindMemberBlockDetail();
        }
    }

    private void BindMemberBlockDetail()
    {
        DataTable memberblock = new DataTable();
        memberblock.Columns.Add("RowNumber");
        memberblock.Columns.Add("BlockNo");
        memberblock.Columns.Add("Area");
        memberblock.Columns.Add("FarmerName");
        memberblock.Columns.Add("VillageNameG");
        memberblock.Columns.Add("CanalNameG");
        memberblock.Columns.Add("Outlet");
        memberblock.Rows.Add();
        gvMemberBlockDetail.DataSource = memberblock;
        gvMemberBlockDetail.DataBind();
    }

    [WebMethod]
    public static List<ListItem> ListFamilyMember(int MemberID)
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListFamilyMember", Global.conn);
        List<ListItem> villages = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = MemberID;
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    villages.Add(new ListItem
                    {
                        Value = sdr["ID"].ToString(),
                        Text = sdr["Name"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListVillage");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return villages;
    }


    [WebMethod]
    public static List<ListItem> ListVillage()
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListAllVillage", Global.conn);
        List<ListItem> villages = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    villages.Add(new ListItem
                    {
                        Value = sdr["VillageID"].ToString(),
                        Text = sdr["VillageNameG"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListVillage");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return villages;
    }

    [WebMethod]
    public static List<ListItem> ListBeat(int VillageID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListBeatByVillage", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = VillageID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["BeatID"].ToString(),
                        Text = sdr["BeatNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListBeat");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListCanal(int BeatID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListCanalByBeat", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = BeatID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListCanal");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListOutlet(int CanalID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllOutletByCanal", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = CanalID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["CanalID"].ToString(),
                        Text = sdr["CanalNameG"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListOutlet");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListFarmer()
    {
        string msg = string.Empty;
        SqlCommand cmd = new SqlCommand("ListAllFarmer", Global.conn);
        List<ListItem> villages = new List<ListItem>();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Global.conn;
            Global.conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    villages.Add(new ListItem
                    {
                        Value = sdr["FarmerID"].ToString(),
                        Text = sdr["FarmerName"].ToString()
                    });
                }
            }
            Global.conn.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListVillage");
            msg = ex.Message;
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
        return villages;
    }

    

    [WebMethod]
    [ScriptMethod]
    public static string MemberBlockDetailManage(MemberBlock memberblock)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            if (memberblock.BlockID == 0)
            {
                SqlCommand cmd = new SqlCommand("MemberBlockDetailInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = memberblock.MemberID;
                cmd.Parameters.Add("@BlockMemberID", SqlDbType.BigInt).Value = memberblock.BlockMemberID;
                cmd.Parameters.Add("@FamilyHeadPerson", SqlDbType.NVarChar).Value = memberblock.FamilyHeadPerson;
                cmd.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = memberblock.FarmerID;
                cmd.Parameters.Add("@BlockNo", SqlDbType.NVarChar).Value = memberblock.BlockNo;
                cmd.Parameters.Add("@Area", SqlDbType.Decimal).Value = memberblock.Area;
                cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = memberblock.CanalID;
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = memberblock.VillageID;
                cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = memberblock.BeatID;
                cmd.Parameters.Add("@OutletCanalID", SqlDbType.BigInt).Value = memberblock.OutletCanalID;
                cmd.Parameters.Add("@IsOut", SqlDbType.Bit).Value = memberblock.IsOut;
                cmd.Parameters.Add("@WinterWaterHours", SqlDbType.Decimal).Value = memberblock.WinterWaterHours;
                cmd.Parameters.Add("@SummerWaterHours ", SqlDbType.Decimal).Value = memberblock.SummerWaterHours;
                cmd.Parameters.Add("@MonsoonWaterHours", SqlDbType.Decimal).Value = memberblock.MonsoonWaterHours;
                cmd.Parameters.Add("@HeadMiddleTail ", SqlDbType.VarChar).Value = memberblock.HeadMiddleTail;
                if (memberblock.FarmerID > 1)
                {
                    cmd.Parameters.Add("@IsFarmer ", SqlDbType.Bit).Value = 1;
                }
                else
                {
                    cmd.Parameters.Add("@IsFarmer ", SqlDbType.Bit).Value = 0;
                }
                cmd.Parameters.Add("@IsPartner", SqlDbType.Bit).Value = memberblock.rbtBhaag;
                cmd.Parameters.Add("@IsOnRent ", SqlDbType.Bit).Value = memberblock.rbtRent;
                cmd.Parameters.Add("@RentType ", SqlDbType.NVarChar).Value = memberblock.RentType;
                cmd.Parameters.Add("@RentRemark ", SqlDbType.NVarChar).Value = memberblock.RentRemark;
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                msg = "બ્લોક ની માહિતી દાખલ થઇ છે.";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("MemberBlockDetailUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = memberblock.BlockID;
                cmd.Parameters.Add("@BlockMemberID", SqlDbType.BigInt).Value = memberblock.BlockMemberID;
                cmd.Parameters.Add("@FamilyHeadPerson", SqlDbType.NVarChar).Value = memberblock.FamilyHeadPerson;
                cmd.Parameters.Add("@BlockNo", SqlDbType.NVarChar).Value = memberblock.BlockNo;
                cmd.Parameters.Add("@Area", SqlDbType.Decimal).Value = memberblock.Area; 
                cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = memberblock.VillageID; 
                cmd.Parameters.Add("@BeatID", SqlDbType.BigInt).Value = memberblock.BeatID; 
                cmd.Parameters.Add("@CanalID", SqlDbType.BigInt).Value = memberblock.CanalID;
                cmd.Parameters.Add("@OutletCanalID", SqlDbType.BigInt).Value = memberblock.OutletCanalID; 
                cmd.Parameters.Add("@IsOut", SqlDbType.Bit).Value = memberblock.IsOut;
                cmd.Parameters.Add("@HeadMiddleTail", SqlDbType.VarChar).Value = memberblock.HeadMiddleTail;
                cmd.Parameters.Add("@WinterWaterHours", SqlDbType.Decimal).Value = memberblock.WinterWaterHours;
                cmd.Parameters.Add("@SummerWaterHours", SqlDbType.Decimal).Value = memberblock.SummerWaterHours;
                cmd.Parameters.Add("@MonsoonWaterHours", SqlDbType.Decimal).Value = memberblock.MonsoonWaterHours;
                cmd.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = memberblock.FarmerID;
                if (memberblock.FarmerID > 1)
                {
                    cmd.Parameters.Add("@IsFarmer ", SqlDbType.Bit).Value = 1;
                }
                else
                {
                    cmd.Parameters.Add("@IsFarmer ", SqlDbType.Bit).Value = 0;
                }
                cmd.Parameters.Add("@IsPartner", SqlDbType.Bit).Value = memberblock.rbtBhaag;
                cmd.Parameters.Add("@IsOnRent", SqlDbType.Bit).Value = memberblock.rbtRent;
                cmd.Parameters.Add("@RentType", SqlDbType.NVarChar).Value = memberblock.RentType;
                cmd.Parameters.Add("@RentRemark", SqlDbType.NVarChar).Value = memberblock.RentRemark;
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
                cmd.ExecuteNonQuery();
                con.Close();
                msg = "બ્લોક ની માહિતી સુધારાઈ ગઈ છે.";
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "MemberBlockDetailManage");
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
    public static string GetMemberBlockDetail(string MemberID)
    {
        string query = "MemberBlockByID";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MemberID", MemberID);
        return GetData(cmd).GetXml();
    }

    private static DataSet GetData(SqlCommand cmd)
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
                        sda.Fill(ds, "BlockDetail");
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetUser");

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

    public class MemberBlock
    {
        public Int64 MemberID { get; set; }
        public Int64 BlockMemberID { get; set; }
        public Int64 FarmerID { get; set; }
        public string FamilyHeadPerson { get; set; }
        public Int64 BlockID { get; set; }
        public string BlockNo { get; set; }
        public decimal Area { get; set; }
        public Int64 CanalID { get; set; }
        public int VillageID { get; set; }
        public Int64 BeatID { get; set; }
        public Int64 OutletCanalID { get; set; }
        public bool IsOut { get; set; }
        public decimal WinterWaterHours { get; set; }
        public decimal SummerWaterHours { get; set; }
        public decimal MonsoonWaterHours { get; set; }
        public string HeadMiddleTail { get; set; }
        public bool rbtBhaag { get; set; }
        public bool rbtRent { get; set; }
        public bool IsPartner { get; set; }
        public bool IsOnRent { get; set; }
        public string RentType { get; set; }
        public string RentRemark { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static List<MemberBlock> GetBlockDetail(int BlockID)
    {
        string msg = string.Empty;
        List<MemberBlock> list = new List<MemberBlock>();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("MemberBlockGet", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = BlockID;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                list.Add(new MemberBlock
                {
                    BlockID = Convert.ToInt64(ds.Tables[0].Rows[0]["BlockID"].ToString()),
                    BlockMemberID = Convert.ToInt64(ds.Tables[0].Rows[0]["BlockMemberID"].ToString()),
                    MemberID = Convert.ToInt64(ds.Tables[0].Rows[0]["MemberID"].ToString()),
                    FamilyHeadPerson = ds.Tables[0].Rows[0]["FamilyHeadPerson"].ToString(),
                    FarmerID = Convert.ToInt64(ds.Tables[0].Rows[0]["FarmerID"].ToString()),
                    BlockNo = ds.Tables[0].Rows[0]["BlockNo"].ToString(),
                    Area = Convert.ToDecimal(ds.Tables[0].Rows[0]["Area"].ToString()),
                    CanalID = Convert.ToInt64(ds.Tables[0].Rows[0]["CanalID"].ToString()),
                    VillageID = Convert.ToInt16(ds.Tables[0].Rows[0]["VillageID"].ToString()),
                    BeatID = Convert.ToInt64(ds.Tables[0].Rows[0]["BeatID"].ToString()),
                    OutletCanalID = Convert.ToInt64(ds.Tables[0].Rows[0]["OutletCanalID"].ToString()),
                    IsOut = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsOut"].ToString()),
                    WinterWaterHours = Convert.ToDecimal(ds.Tables[0].Rows[0]["WinterWaterHours"].ToString()),
                    SummerWaterHours = Convert.ToDecimal(ds.Tables[0].Rows[0]["SummerWaterHours"].ToString()),
                    MonsoonWaterHours = Convert.ToDecimal(ds.Tables[0].Rows[0]["MonsoonWaterHours"].ToString()),
                    HeadMiddleTail = ds.Tables[0].Rows[0]["HeadMiddleTail"].ToString(),
                    IsPartner = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsPartner"].ToString()),
                    IsOnRent = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsOnRent"].ToString()),
                    RentType = ds.Tables[0].Rows[0]["RentType"].ToString(),
                    RentRemark = ds.Tables[0].Rows[0]["RentRemark"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetBlockDetail");
            msg = "Error" + ex.Message;
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static string DeleteBlockDetail(int BlockID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("MemberBlockDetailDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = BlockID;
            cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "બ્લોકની માહિતી રદ થઇ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteBlockDetail");
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