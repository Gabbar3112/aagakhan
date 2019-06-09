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

public partial class MangnaPatrak : System.Web.UI.Page
{
    public static string formname = "MangnaPatrak";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=MangnaPatrak.aspx", true);
    }

    public class MangnaParameters
    {
        public Int64 MemberID { get; set; }
        public string MemberName { get; set; }
        public Int64 PersonCode { get; set; }
        public string HouseholdNo { get; set; }
        public Int64 AccountNo { get; set; }
        public string AadharNo { get; set; }

        public string SeasonUnadu { get; set; }
        public string SeasonUnaduToolTip { get; set; }
        public string SeasonKharif { get; set; }
        public string SeasonKharifToolTip { get; set; }
        public string SeasonRabiNextYear { get; set; }
        public string SeasonRabiNextYearToolTip { get; set; }

        public string FormNo { get; set; }
        public string MalikName { get; set; }
        public Int64 FarmerID { get; set; }
        public decimal BlockArea { get; set; }
        public decimal KLPiyat { get; set; }
        public decimal PiyatArea { get; set; }
        public decimal BinPiyatArea { get; set; }
        public decimal Rate { get; set; }
        public decimal TotalWater { get; set; }
        public decimal GovtRate{ get; set; }
    }

    [WebMethod]
    public static List<ListItem> ListVillage()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            //SqlCommand cmd = new SqlCommand("GetMemberVillage", con);
            
            SqlCommand cmd = new SqlCommand("GetVillagesFromMemberMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]);
            cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]);
            
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
    public static List<ListItem> ListHouseHoldNoFromVillage(Int64 VillageID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListHouseHoldByVillageForMangna", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@VillageID", VillageID);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["MemberID"].ToString(),
                        Text = sdr["HouseholdNo"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListHouseHoldNoFromVillage");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListMalik(int VillageID, int MemberID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllMemberByVillage", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = VillageID;
            cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = MemberID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["MemberID"].ToString(),
                        Text = sdr["MemberName"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListMalik");
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
    public static List<MangnaParameters> GetMemberDetail(int MalikID)
    {
        List<MangnaParameters> list = new List<MangnaParameters>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("GetMemberInfo", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MemberID", SqlDbType.NVarChar).Value = MalikID;
            cmd.Connection = conn;
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    list.Add(new MangnaParameters
                    {
                        AccountNo = Convert.ToInt64(sdr["AccountNo"].ToString()),
                        PersonCode = Convert.ToInt64(sdr["PersonCode"].ToString()),
                        AadharNo = sdr["AadharNo"].ToString(),
                        HouseholdNo = sdr["HouseholdNo"].ToString(),
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListMalik");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        return list;
    }

    [WebMethod]
    public static List<ListItem> ListBlockNo(int MemberID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetMemberBlockDetail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = MemberID;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["BlockID"].ToString(),
                        Text = sdr["BlockNo"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListBlockNo");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListSeasonRabi(bool IsAdvance)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetSeasonForMangna", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@IsAdvance", SqlDbType.Bit).Value = IsAdvance;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["SeasonID"].ToString(),
                        Text = sdr["Season"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListSeasonRabi");
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
    public static List<MangnaParameters> GetSeason(string SeasonIDYearID)
    {
        string msg = "";
        List<MangnaParameters> list = new List<MangnaParameters>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try{

        string strRes = SeasonIDYearID;
        string[] arrRes = strRes.Split('-');

        string SeasonID = arrRes[0].ToString();
        string YearID = arrRes[1].ToString();


        SqlCommand cmd1 = new SqlCommand("GetNextSeasonOnRabiChanges", con);
        cmd1.CommandType = CommandType.StoredProcedure;

        cmd1.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = SeasonID;
        cmd1.Parameters.Add("@YearID", SqlDbType.BigInt).Value = YearID;
        SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
        DataSet ds1 = new DataSet();
        adp1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            list.Add(new MangnaParameters
            {
                SeasonUnadu = ds1.Tables[0].Rows[0]["Season"].ToString(),
                SeasonUnaduToolTip = ds1.Tables[0].Rows[0]["SeasonID"].ToString(),

                SeasonKharif = ds1.Tables[0].Rows[1]["Season"].ToString(),
                SeasonKharifToolTip = ds1.Tables[0].Rows[1]["SeasonID"].ToString(),

                SeasonRabiNextYear = ds1.Tables[0].Rows[2]["Season"].ToString(),
                SeasonRabiNextYearToolTip = ds1.Tables[0].Rows[2]["SeasonID"].ToString(),

            });
        }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetSeason");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static List<MangnaParameters> GetBlockDetailByBlockID(int BlockID, string SeasonNdYearID)
    {
        string msg = "";
        List<MangnaParameters> list = new List<MangnaParameters>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            string strRes = SeasonNdYearID;
            string[] arrRes = strRes.Split('-');

            string SeasonID = arrRes[0].ToString();
            string FinancialYearID = arrRes[1].ToString();

            SqlCommand cmd1 = new SqlCommand("ListBlockDetailForMangna", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = BlockID;
            cmd1.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = SeasonID;
            cmd1.Parameters.Add("@YearID", SqlDbType.BigInt).Value = FinancialYearID;
            SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
            DataSet ds1 = new DataSet();
            adp1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                list.Add(new MangnaParameters
                {
                    FormNo = ds1.Tables[0].Rows[0]["FormNo"].ToString(),
                    MalikName = ds1.Tables[0].Rows[0]["FarmerName"].ToString(),
                    FarmerID = Convert.ToInt64(ds1.Tables[0].Rows[0]["FarmerID"]),
                    BlockArea = Convert.ToDecimal(ds1.Tables[0].Rows[0]["Area"]),
                    KLPiyat = Convert.ToDecimal(ds1.Tables[0].Rows[0]["KLArea"]),
                    PiyatArea = Convert.ToDecimal(ds1.Tables[0].Rows[0]["KLArea"]),
                    BinPiyatArea = Convert.ToDecimal("0.00"),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "GetBlockDetailByBlockID");
            msg = "Error" + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return list;
    }


    [WebMethod]
    public static List<ListItem> ListPak(string SeasonIDYearID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try{
        string strRes = SeasonIDYearID;
        string[] arrRes = strRes.Split('-');

        string SeasonID = arrRes[0].ToString();
        string FinancialYearID = arrRes[1].ToString();


        SqlCommand cmd = new SqlCommand("GetPakForMangna", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = SeasonID;
        cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = FinancialYearID;
        cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
        cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"]; 
        cmd.Connection = con;
        con.Open();
        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                circles.Add(new ListItem
                {
                    Value = sdr["PakID"].ToString(),
                    Text = sdr["Pak"].ToString()
                });
            }
        }
         }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListPak");
            msg = "Error" + ex.Message;
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
    public static List<MangnaParameters> GetPakRateAndWaterByPakID(int PakID, string SeasonIDYearID)
    {
        string strRes = SeasonIDYearID;
        string[] arrRes = strRes.Split('-');

        string SeasonID = arrRes[0].ToString();
        string FinancialYearID = arrRes[1].ToString();

        List<MangnaParameters> list = new List<MangnaParameters>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("GetPakRateAndWater", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@PakID", SqlDbType.BigInt).Value = PakID;
        cmd.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = SeasonID;
        cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = FinancialYearID;
        cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"].ToString();
        cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"].ToString();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            list.Add(new MangnaParameters
            {
                Rate = Convert.ToDecimal(ds.Tables[0].Rows[0]["Rate"].ToString()),
                TotalWater = Convert.ToDecimal(ds.Tables[0].Rows[0]["TotalWater"].ToString()),
                GovtRate = Convert.ToDecimal(ds.Tables[0].Rows[0]["GovtRate"].ToString()),
            });
        }
        return list;
    }


    public class MangnaMasterAndDetail
    {
        public Int64 AccountNo { get; set; }
        public string MangnaNo { get; set; }
        public string MangnaDate { get; set; }
        public Int64 MemberID { get; set; }
        public Int64 VillageID { get; set; }
        public string Remark { get; set; }
        public bool IsAdvance { get; set; }

        public string SeasonRabi { get; set; }
        public Int64 BlockIDRabi { get; set; }
        public Int64 FarmerIDRabi { get; set; }
        public string FormNoR { get; set; }
        public string FormDateR { get; set; }
        public decimal BlockAreaR { get; set; }
        public decimal KLPiyatR { get; set; }
        public decimal PiyatAreaR { get; set; }
        public decimal BinPiyatAreaR { get; set; }
        public Int64 PakIDR { get; set; }
        public decimal hdnGovtRateRabi{ get; set; }
        public decimal vAreaR { get; set; }
        public decimal vRateR { get; set; }
        public decimal vWaterR { get; set; }
        public decimal vTotalAmtR { get; set; }
        public decimal uAreaR { get; set; }
        public decimal uRateR { get; set; }
        public decimal uWaterR { get; set; }
        public decimal uTotalAmtR { get; set; }
        public decimal TotalPiyatAmtR { get; set; }
        public decimal LocalFundR { get; set; }
        public decimal LocalFundAmtR { get; set; }
        public decimal RoundOffR { get; set; }
        public decimal NetAmountR { get; set; }
        public bool DoneRabi { get; set; }

        public string SeasonUnadu { get; set; }
        public Int64 BlockIDUnadu { get; set; }
        public Int64 FarmerIDUnadu { get; set; }
        public string FormNoU { get; set; }
        public string FormDateU { get; set; }
        public decimal BlockAreaU { get; set; }
        public decimal KLPiyatU { get; set; }
        public decimal PiyatAreaU { get; set; }
        public decimal BinPiyatAreaU { get; set; }
        public Int64 PakIDU { get; set; }
        public decimal hdnGovtRateUnadu{ get; set; }
        public decimal vAreaU { get; set; }
        public decimal vRateU { get; set; }
        public decimal vWaterU { get; set; }
        public decimal vTotalAmtU { get; set; }
        public decimal uAreaU { get; set; }
        public decimal uRateU { get; set; }
        public decimal uWaterU { get; set; }
        public decimal uTotalAmtU { get; set; }
        public decimal TotalPiyatAmtU { get; set; }
        public decimal LocalFundU { get; set; }
        public decimal LocalFundAmtU { get; set; }
        public decimal RoundOffU { get; set; }
        public decimal NetAmountU { get; set; }
        public bool DoneUnadu { get; set; }

        public string SeasonKharif { get; set; }
        public Int64 BlockIDKharif { get; set; }
        public Int64 FarmerIDKharif { get; set; }
        public string FormNoK { get; set; }
        public string FormDateK { get; set; }
        public decimal BlockAreaK { get; set; }
        public decimal KLPiyatK { get; set; }
        public decimal PiyatAreaK { get; set; }
        public decimal BinPiyatAreaK { get; set; }
        public Int64 PakIDK { get; set; }
        public decimal hdnGovtRateKharif{ get; set; }
        public decimal vAreaK { get; set; }
        public decimal vRateK { get; set; }
        public decimal vWaterK { get; set; }
        public decimal vTotalAmtK { get; set; }
        public decimal uAreaK { get; set; }
        public decimal uRateK { get; set; }
        public decimal uWaterK { get; set; }
        public decimal uTotalAmtK { get; set; }
        public decimal TotalPiyatAmtK { get; set; }
        public decimal LocalFundK { get; set; }
        public decimal LocalFundAmtK { get; set; }
        public decimal RoundOffK { get; set; }
        public decimal NetAmountK { get; set; }
        public bool DoneKharif { get; set; }

        public string SeasonNextYearRabi { get; set; }
        public Int64 BlockIDNextYearRabi { get; set; }
        public Int64 FarmerIDNextYearRabi { get; set; }
        public string FormNoNYR { get; set; }
        public string FormDateNYR { get; set; }
        public decimal BlockAreaNYR { get; set; }
        public decimal KLPiyatNYR { get; set; }
        public decimal PiyatAreaNYR { get; set; }
        public decimal BinPiyatAreaNYR { get; set; }
        public Int64 PakIDNYR { get; set; }
        public decimal hdnGovtRateNextYearRabi { get; set; }
        public decimal vAreaNYR { get; set; }
        public decimal vRateNYR { get; set; }
        public decimal vWaterNYR { get; set; }
        public decimal vTotalAmtNYR { get; set; }
        public decimal uAreaNYR { get; set; }
        public decimal uRateNYR { get; set; }
        public decimal uWaterNYR { get; set; }
        public decimal uTotalAmtNYR { get; set; }
        public decimal TotalPiyatAmtNYR { get; set; }
        public decimal LocalFundNYR { get; set; }
        public decimal LocalFundAmtNYR { get; set; }
        public decimal RoundOffNYR { get; set; }
        public decimal NetAmountNYR { get; set; }
        public bool DoneNextYearRabi { get; set; }
       
    }

    [WebMethod]
    [ScriptMethod]
    public static string MangnaPatrakManage(MangnaMasterAndDetail Mangna)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();

            #region insert master

            SqlCommand cmd = new SqlCommand("InsertMangnaPatrak", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AccountNo", SqlDbType.NVarChar).Value = Mangna.AccountNo;
            cmd.Parameters.Add("@MangnaDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Mangna.MangnaDate.Substring(3, 2).PadLeft(2, '0') + "/" + Mangna.MangnaDate.Substring(0, 2).PadLeft(2, '0') + "/" + Mangna.MangnaDate.Substring(6, 4));
            cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = Mangna.MemberID;
            cmd.Parameters.Add("@VillageID", SqlDbType.BigInt).Value = Mangna.VillageID;
            cmd.Parameters.Add("@IsAdvance", SqlDbType.Bit).Value = Mangna.IsAdvance;
            cmd.Parameters.Add("@Remark", SqlDbType.NVarChar).Value = Mangna.Remark;
            cmd.Parameters.Add("@YearID", SqlDbType.SmallInt).Value = HttpContext.Current.Session["YearID"];
            cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
            cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = Global.MachineName;
            Int64 mid = Convert.ToInt64(cmd.ExecuteScalar());
            cmd.Dispose();
            #endregion

            if (mid != 0)
            {
                # region Insert Detail - Rabi
                if (Mangna.DoneRabi == true)
                {
                    string strResRabi = Mangna.SeasonRabi;
                    string[] arrResRabi = strResRabi.Split('-');

                    string RabiSeasonID = arrResRabi[0].ToString();
                    string RabiFinancialYearID = arrResRabi[1].ToString();

                    SqlCommand cmdR = new SqlCommand("InsertMangnaPatrakDetail", con);
                    cmdR.CommandType = CommandType.StoredProcedure;
                    cmdR.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = mid;
                    cmdR.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = RabiSeasonID;
                    cmdR.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = Mangna.BlockIDRabi;
                    cmdR.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = Mangna.FarmerIDRabi;
                    cmdR.Parameters.Add("@FormNo", SqlDbType.VarChar).Value = Mangna.FormNoR;
                    cmdR.Parameters.Add("@FormDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Mangna.FormDateR.Substring(3, 2).PadLeft(2, '0') + "/" + Mangna.FormDateR.Substring(0, 2).PadLeft(2, '0') + "/" + Mangna.FormDateR.Substring(6, 4));
                    cmdR.Parameters.Add("@BlockArea", SqlDbType.Decimal).Value = Mangna.BlockAreaR;
                    cmdR.Parameters.Add("@KLPiyatArea", SqlDbType.Decimal).Value = Mangna.KLPiyatR;
                    cmdR.Parameters.Add("@PiyatArea", SqlDbType.Decimal).Value = Mangna.PiyatAreaR;
                    cmdR.Parameters.Add("@BinPiyatArea", SqlDbType.Decimal).Value = Mangna.BinPiyatAreaR;
                    cmdR.Parameters.Add("@PakID", SqlDbType.BigInt).Value = Mangna.PakIDR;
                    cmdR.Parameters.Add("@VPiyatArea", SqlDbType.Decimal).Value = Mangna.vAreaR;
                    cmdR.Parameters.Add("@VRate", SqlDbType.Decimal).Value = Mangna.vRateR;
                    cmdR.Parameters.Add("@VWater", SqlDbType.Decimal).Value = Mangna.vWaterR;
                    cmdR.Parameters.Add("@VTotalAmt", SqlDbType.Decimal).Value = Mangna.vTotalAmtR;
                    cmdR.Parameters.Add("@UPiyatArea", SqlDbType.Decimal).Value = Mangna.uAreaR;
                    cmdR.Parameters.Add("@URate", SqlDbType.Decimal).Value = Mangna.uRateR;
                    cmdR.Parameters.Add("@UWater", SqlDbType.Decimal).Value = Mangna.uWaterR;
                    cmdR.Parameters.Add("@UTotalAmt", SqlDbType.Decimal).Value = Mangna.uTotalAmtR;
                    cmdR.Parameters.Add("@TotalPiyat", SqlDbType.Decimal).Value = Mangna.TotalPiyatAmtR;

                    cmdR.Parameters.Add("@LocalFundAmt", SqlDbType.Decimal).Value = Mangna.LocalFundR;
                    cmdR.Parameters.Add("@Total", SqlDbType.Decimal).Value = Mangna.LocalFundAmtR;
                    cmdR.Parameters.Add("@RoundOff", SqlDbType.Decimal).Value = Mangna.RoundOffR;
                    cmdR.Parameters.Add("@NetTotal", SqlDbType.Decimal).Value = Mangna.NetAmountR;


                    decimal totalfundR = ((Convert.ToDecimal(Mangna.TotalPiyatAmtR) * 20) / 100);
                    cmdR.Parameters.Add("@GovRate", SqlDbType.Decimal).Value = Mangna.hdnGovtRateRabi;
                    decimal GovvRateRabi = ((Convert.ToDecimal(Mangna.hdnGovtRateRabi) * 33) / 100);
                    decimal GovVTotalAmtRabi = (Convert.ToDecimal(Mangna.vAreaR) * Convert.ToDecimal(Mangna.hdnGovtRateRabi) * Convert.ToDecimal(Mangna.vWaterR));
                    decimal GovUTotalAmtRabi = (Convert.ToDecimal(Mangna.uAreaR) * GovvRateRabi * Convert.ToDecimal(Mangna.uWaterR));
                    decimal GovTotalPiyatRabi = GovVTotalAmtRabi + GovUTotalAmtRabi;
                    decimal GovAmtLocalFundRabi = (GovTotalPiyatRabi * 20) / 100;
                    cmdR.Parameters.Add("@GovVTotalAmt", SqlDbType.Float).Value = GovVTotalAmtRabi;
                    cmdR.Parameters.Add("@GovUTotalAmt", SqlDbType.Float).Value = GovUTotalAmtRabi;
                    cmdR.Parameters.Add("@GovTotalPiyat", SqlDbType.Float).Value = GovTotalPiyatRabi;
                    cmdR.Parameters.Add("@GovLocalFundAmt", SqlDbType.Float).Value = GovAmtLocalFundRabi;


                    cmdR.Parameters.Add("@YearID", SqlDbType.BigInt).Value = RabiFinancialYearID;
                    cmdR.Parameters.Add("@MangnaFinYearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"]; 
                    cmdR.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    
                    cmdR.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                    cmdR.ExecuteNonQuery();
                    cmdR.Dispose();
                }
                #endregion

                # region Insert Detail - Unadu
                if (Mangna.DoneUnadu == true)
                {
                    string strResUnadu = Mangna.SeasonUnadu;
                    string[] arrResUnadu = strResUnadu.Split('-');

                    string UnaduSeasonID = arrResUnadu[0].ToString();
                    string UnaduFinancialYearID = arrResUnadu[1].ToString();

                    SqlCommand cmdU = new SqlCommand("InsertMangnaPatrakDetail", con);
                    cmdU.CommandType = CommandType.StoredProcedure;
                    cmdU.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = mid;
                    cmdU.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = UnaduSeasonID;
                    cmdU.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = Mangna.BlockIDUnadu;
                    cmdU.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = Mangna.FarmerIDUnadu;
                    cmdU.Parameters.Add("@FormNo", SqlDbType.VarChar).Value = Mangna.FormNoU;
                    cmdU.Parameters.Add("@FormDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Mangna.FormDateU.Substring(3, 2).PadLeft(2, '0') + "/" + Mangna.FormDateU.Substring(0, 2).PadLeft(2, '0') + "/" + Mangna.FormDateU.Substring(6, 4));
                    cmdU.Parameters.Add("@BlockArea", SqlDbType.Decimal).Value = Mangna.BlockAreaU;
                    cmdU.Parameters.Add("@KLPiyatArea", SqlDbType.Decimal).Value = Mangna.KLPiyatU;
                    cmdU.Parameters.Add("@PiyatArea", SqlDbType.Decimal).Value = Mangna.PiyatAreaU;
                    cmdU.Parameters.Add("@BinPiyatArea", SqlDbType.Decimal).Value = Mangna.BinPiyatAreaU;
                    cmdU.Parameters.Add("@PakID", SqlDbType.BigInt).Value = Mangna.PakIDU;
                    cmdU.Parameters.Add("@VPiyatArea", SqlDbType.Decimal).Value = Mangna.vAreaU;
                    cmdU.Parameters.Add("@VRate", SqlDbType.Decimal).Value = Mangna.vRateU;
                    cmdU.Parameters.Add("@VWater", SqlDbType.Decimal).Value = Mangna.vWaterU;
                    cmdU.Parameters.Add("@VTotalAmt", SqlDbType.Decimal).Value = Mangna.vTotalAmtU;
                    cmdU.Parameters.Add("@UPiyatArea", SqlDbType.Decimal).Value = Mangna.uAreaU;
                    cmdU.Parameters.Add("@URate", SqlDbType.Decimal).Value = Mangna.uRateU;
                    cmdU.Parameters.Add("@UWater", SqlDbType.Decimal).Value = Mangna.uWaterU;
                    cmdU.Parameters.Add("@UTotalAmt", SqlDbType.Decimal).Value = Mangna.uTotalAmtU;
                    cmdU.Parameters.Add("@TotalPiyat", SqlDbType.Decimal).Value = Mangna.TotalPiyatAmtU;

                    cmdU.Parameters.Add("@LocalFundAmt", SqlDbType.Decimal).Value = Mangna.LocalFundU;
                    cmdU.Parameters.Add("@Total", SqlDbType.Decimal).Value = Mangna.LocalFundAmtU;
                    cmdU.Parameters.Add("@RoundOff", SqlDbType.Decimal).Value = Mangna.RoundOffU;
                    cmdU.Parameters.Add("@NetTotal", SqlDbType.Decimal).Value = Mangna.NetAmountU;

                    decimal totalfundU = ((Convert.ToDecimal(Mangna.TotalPiyatAmtU) * 20) / 100);
                    cmdU.Parameters.Add("@GovRate", SqlDbType.Float).Value = Mangna.hdnGovtRateUnadu;
                    decimal GovvRateUnadu = ((Convert.ToDecimal(Mangna.hdnGovtRateUnadu) * 33) / 100);
                    decimal GovVTotalAmtUnadu = (Convert.ToDecimal(Mangna.vAreaU) * Convert.ToDecimal(Mangna.hdnGovtRateUnadu) * Convert.ToDecimal(Mangna.vWaterU));
                    decimal GovUTotalAmtUnadu = (Convert.ToDecimal(Mangna.uAreaU) * GovvRateUnadu * Convert.ToDecimal(Mangna.uWaterU));
                    decimal GovTotalPiyatUnadu = GovVTotalAmtUnadu + GovUTotalAmtUnadu;
                    decimal GovAmtLocalFundUnadu = (GovTotalPiyatUnadu * 20) / 100;

                    cmdU.Parameters.Add("@GovUTotalAmt", SqlDbType.Float).Value = GovUTotalAmtUnadu;
                    cmdU.Parameters.Add("@GovVTotalAmt", SqlDbType.Float).Value = GovVTotalAmtUnadu;
                    cmdU.Parameters.Add("@GovTotalPiyat", SqlDbType.Float).Value = GovTotalPiyatUnadu;
                    cmdU.Parameters.Add("@GovLocalFundAmt", SqlDbType.Float).Value = GovAmtLocalFundUnadu;

                    cmdU.Parameters.Add("@YearID", SqlDbType.BigInt).Value = UnaduFinancialYearID;
                    cmdU.Parameters.Add("@MangnaFinYearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"]; 
                    cmdU.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmdU.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                    cmdU.ExecuteNonQuery();
                    cmdU.Dispose();
                }
                #endregion

                # region Insert Detail - Kharif
                if (Mangna.DoneKharif == true)
                {
                    string strResKharif = Mangna.SeasonKharif;
                    string[] arrResKharif = strResKharif.Split('-');

                    string KharifSeasonID = arrResKharif[0].ToString();
                    string KharifFinancialYearID = arrResKharif[1].ToString();


                    SqlCommand cmdK = new SqlCommand("InsertMangnaPatrakDetail", con);
                    cmdK.CommandType = CommandType.StoredProcedure;
                    cmdK.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = mid;
                    cmdK.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = KharifSeasonID;
                    cmdK.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = Mangna.BlockIDKharif;
                    cmdK.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = Mangna.FarmerIDKharif;
                    cmdK.Parameters.Add("@FormNo", SqlDbType.VarChar).Value = Mangna.FormNoK;
                    cmdK.Parameters.Add("@FormDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Mangna.FormDateK.Substring(3, 2).PadLeft(2, '0') + "/" + Mangna.FormDateK.Substring(0, 2).PadLeft(2, '0') + "/" + Mangna.FormDateK.Substring(6, 4));
                    cmdK.Parameters.Add("@BlockArea", SqlDbType.Decimal).Value = Mangna.BlockAreaK;
                    cmdK.Parameters.Add("@KLPiyatArea", SqlDbType.Decimal).Value = Mangna.KLPiyatK;
                    cmdK.Parameters.Add("@PiyatArea", SqlDbType.Decimal).Value = Mangna.PiyatAreaK;
                    cmdK.Parameters.Add("@BinPiyatArea", SqlDbType.Decimal).Value = Mangna.BinPiyatAreaK;
                    cmdK.Parameters.Add("@PakID", SqlDbType.BigInt).Value = Mangna.PakIDK;
                    cmdK.Parameters.Add("@VPiyatArea", SqlDbType.Decimal).Value = Mangna.vAreaK;
                    cmdK.Parameters.Add("@VRate", SqlDbType.Decimal).Value = Mangna.vRateK;
                    cmdK.Parameters.Add("@VWater", SqlDbType.Decimal).Value = Mangna.vWaterK;
                    cmdK.Parameters.Add("@VTotalAmt", SqlDbType.Decimal).Value = Mangna.vTotalAmtK;
                    cmdK.Parameters.Add("@UPiyatArea", SqlDbType.Decimal).Value = Mangna.uAreaK;
                    cmdK.Parameters.Add("@URate", SqlDbType.Decimal).Value = Mangna.uRateK;
                    cmdK.Parameters.Add("@UWater", SqlDbType.Decimal).Value = Mangna.uWaterK;
                    cmdK.Parameters.Add("@UTotalAmt", SqlDbType.Decimal).Value = Mangna.uTotalAmtK;
                    cmdK.Parameters.Add("@TotalPiyat", SqlDbType.Decimal).Value = Mangna.TotalPiyatAmtK;

                    cmdK.Parameters.Add("@LocalFundAmt", SqlDbType.Decimal).Value = Mangna.LocalFundK;
                    cmdK.Parameters.Add("@Total", SqlDbType.Decimal).Value = Mangna.LocalFundAmtK;
                    cmdK.Parameters.Add("@RoundOff", SqlDbType.Decimal).Value = Mangna.RoundOffK;
                    cmdK.Parameters.Add("@NetTotal", SqlDbType.Decimal).Value = Mangna.NetAmountK;


                    decimal totalfundK = ((Convert.ToDecimal(Mangna.TotalPiyatAmtK) * 20) / 100);
                    cmdK.Parameters.Add("@GovRate", SqlDbType.Float).Value = Mangna.hdnGovtRateKharif;
                    decimal GovvRateKharif = ((Convert.ToDecimal(Mangna.hdnGovtRateKharif) * 33) / 100);
                    decimal GovVTotalAmtKharif = (Convert.ToDecimal(Mangna.vAreaK) * Convert.ToDecimal(Mangna.hdnGovtRateKharif) * Convert.ToDecimal(Mangna.vWaterK));
                    decimal GovUTotalAmtKharif = (Convert.ToDecimal(Mangna.uAreaK) * GovvRateKharif * Convert.ToDecimal(Mangna.uWaterK));
                    decimal GovTotalPiyatKharif = GovVTotalAmtKharif + GovUTotalAmtKharif;
                    decimal GovAmtLocalFundKharif = (GovTotalPiyatKharif * 20) / 100;

                    cmdK.Parameters.Add("@GovUTotalAmt", SqlDbType.Float).Value = GovUTotalAmtKharif;
                    cmdK.Parameters.Add("@GovVTotalAmt", SqlDbType.Float).Value = GovVTotalAmtKharif;
                    cmdK.Parameters.Add("@GovTotalPiyat", SqlDbType.Float).Value = GovTotalPiyatKharif;
                    cmdK.Parameters.Add("@GovLocalFundAmt", SqlDbType.Float).Value = GovAmtLocalFundKharif;

                    cmdK.Parameters.Add("@YearID", SqlDbType.BigInt).Value = KharifFinancialYearID;
                    cmdK.Parameters.Add("@MangnaFinYearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"]; 
                    cmdK.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmdK.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                    cmdK.ExecuteNonQuery();
                    cmdK.Dispose();
                }
                #endregion

                # region Insert Detail - Rabi Next Year
                if (Mangna.DoneNextYearRabi == true)
                {
                    string strResNextYearRabi = Mangna.SeasonNextYearRabi;
                    string[] arrResNextYearRabi = strResNextYearRabi.Split('-');

                    string NextYearRabiSeasonID = arrResNextYearRabi[0].ToString();
                    string NextYearRabiFinancialYearID = arrResNextYearRabi[1].ToString();


                    SqlCommand cmdNYR = new SqlCommand("InsertMangnaPatrakDetail", con);
                    cmdNYR.CommandType = CommandType.StoredProcedure;
                    cmdNYR.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = mid;
                    cmdNYR.Parameters.Add("@SeasonID", SqlDbType.BigInt).Value = NextYearRabiSeasonID;
                    cmdNYR.Parameters.Add("@BlockID", SqlDbType.BigInt).Value = Mangna.BlockIDNextYearRabi;
                    cmdNYR.Parameters.Add("@FarmerID", SqlDbType.BigInt).Value = Mangna.FarmerIDNextYearRabi;
                    cmdNYR.Parameters.Add("@FormNo", SqlDbType.VarChar).Value = Mangna.FormNoNYR;
                    cmdNYR.Parameters.Add("@FormDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Mangna.FormDateNYR.Substring(3, 2).PadLeft(2, '0') + "/" + Mangna.FormDateNYR.Substring(0, 2).PadLeft(2, '0') + "/" + Mangna.FormDateNYR.Substring(6, 4));
                    cmdNYR.Parameters.Add("@BlockArea", SqlDbType.Decimal).Value = Mangna.BlockAreaNYR;
                    cmdNYR.Parameters.Add("@KLPiyatArea", SqlDbType.Decimal).Value = Mangna.KLPiyatNYR;
                    cmdNYR.Parameters.Add("@PiyatArea", SqlDbType.Decimal).Value = Mangna.PiyatAreaNYR;
                    cmdNYR.Parameters.Add("@BinPiyatArea", SqlDbType.Decimal).Value = Mangna.BinPiyatAreaNYR;
                    cmdNYR.Parameters.Add("@PakID", SqlDbType.BigInt).Value = Mangna.PakIDNYR;
                    cmdNYR.Parameters.Add("@VPiyatArea", SqlDbType.Decimal).Value = Mangna.vAreaNYR;
                    cmdNYR.Parameters.Add("@VRate", SqlDbType.Decimal).Value = Mangna.vRateNYR;
                    cmdNYR.Parameters.Add("@VWater", SqlDbType.Decimal).Value = Mangna.vWaterNYR;
                    cmdNYR.Parameters.Add("@VTotalAmt", SqlDbType.Decimal).Value = Mangna.vTotalAmtNYR;
                    cmdNYR.Parameters.Add("@UPiyatArea", SqlDbType.Decimal).Value = Mangna.uAreaNYR;
                    cmdNYR.Parameters.Add("@URate", SqlDbType.Decimal).Value = Mangna.uRateNYR;
                    cmdNYR.Parameters.Add("@UWater", SqlDbType.Decimal).Value = Mangna.uWaterNYR;
                    cmdNYR.Parameters.Add("@UTotalAmt", SqlDbType.Decimal).Value = Mangna.uTotalAmtNYR;
                    cmdNYR.Parameters.Add("@TotalPiyat", SqlDbType.Decimal).Value = Mangna.TotalPiyatAmtNYR;

                    cmdNYR.Parameters.Add("@LocalFundAmt", SqlDbType.Decimal).Value = Mangna.LocalFundNYR;
                    cmdNYR.Parameters.Add("@Total", SqlDbType.Decimal).Value = Mangna.LocalFundAmtNYR;
                    cmdNYR.Parameters.Add("@RoundOff", SqlDbType.Decimal).Value = Mangna.RoundOffNYR;
                    cmdNYR.Parameters.Add("@NetTotal", SqlDbType.Decimal).Value = Mangna.NetAmountNYR;

                    decimal totalfundNYR = ((Convert.ToDecimal(Mangna.TotalPiyatAmtNYR) * 20) / 100);
                    cmdNYR.Parameters.Add("@GovRate", SqlDbType.Float).Value = Mangna.hdnGovtRateNextYearRabi;
                    decimal GovvRateNextYearRabi = ((Convert.ToDecimal(Mangna.hdnGovtRateNextYearRabi) * 33) / 100);
                    decimal GovVTotalAmtNextYearRabi = (Convert.ToDecimal(Mangna.vAreaNYR) * Convert.ToDecimal(Mangna.hdnGovtRateNextYearRabi) * Convert.ToDecimal(Mangna.vWaterNYR));
                    decimal GovUTotalAmtNextYearRabi = (Convert.ToDecimal(Mangna.uAreaNYR) * GovvRateNextYearRabi * Convert.ToDecimal(Mangna.uWaterNYR));
                    decimal GovTotalPiyatNextYearRabi = GovVTotalAmtNextYearRabi + GovUTotalAmtNextYearRabi;
                    decimal GovAmtLocalFundNextYearRabi = (GovTotalPiyatNextYearRabi * 20) / 100;
                    cmdNYR.Parameters.Add("@GovUTotalAmt", SqlDbType.Float).Value = GovUTotalAmtNextYearRabi;
                    cmdNYR.Parameters.Add("@GovVTotalAmt", SqlDbType.Float).Value = GovVTotalAmtNextYearRabi;
                    cmdNYR.Parameters.Add("@GovTotalPiyat", SqlDbType.Float).Value = GovTotalPiyatNextYearRabi;
                    cmdNYR.Parameters.Add("@GovLocalFundAmt", SqlDbType.Float).Value = GovAmtLocalFundNextYearRabi;



                    cmdNYR.Parameters.Add("@YearID", SqlDbType.BigInt).Value = NextYearRabiFinancialYearID;
                    cmdNYR.Parameters.Add("@MangnaFinYearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"]; 
                    cmdNYR.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmdNYR.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                    cmdNYR.ExecuteNonQuery();
                    cmdNYR.Dispose();
                }
                #endregion

                msg = Convert.ToString(mid);
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "MangnaPatrakManage");
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