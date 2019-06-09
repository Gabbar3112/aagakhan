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

public partial class MemberMaster : System.Web.UI.Page
{
    public static int PageSize =20;
    public static string formname = "MemberMaster";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=MemberMaster.aspx", true);
        if (!Page.IsPostBack)
        {
            BindMember();
            BindXYZ();
            BindMemberBlockDetail();
        }
    }

    private void BindMember()
    {
        DataTable member = new DataTable();
        member.Columns.Add("RowNumber");
        member.Columns.Add("PersonCode");
        member.Columns.Add("HouseholdNo");
        member.Columns.Add("AccountNo");
        member.Columns.Add("FullNameG");
        member.Columns.Add("FullAddressG");
        member.Columns.Add("VillageNameG");
        member.Columns.Add("AadharNo");
        member.Rows.Add();
        gvMember.DataSource = member;
        gvMember.DataBind();
    }

    private void BindXYZ()
    {
        DataTable memberdetail = new DataTable();
        memberdetail.Columns.Add("RowNumber");
        memberdetail.Columns.Add("FullNameG");
        memberdetail.Columns.Add("FullAddressG");
        memberdetail.Columns.Add("PersonCode");
        memberdetail.Columns.Add("MobileNo1G");
        memberdetail.Columns.Add("AadharNo");
        memberdetail.Columns.Add("EmailID");
        memberdetail.Rows.Add();
        GVXYZ.DataSource = memberdetail;
        GVXYZ.DataBind();
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
        gvBlockDetail.DataSource = memberblock;
        gvBlockDetail.DataBind();
    }

    [WebMethod]
    public static List<ListItem> ListInstitute()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("ListAllInstituteByUserForMMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClusterID", SqlDbType.BigInt).Value = HttpContext.Current.Session["ClusterID"];

            if (HttpContext.Current.Session["LoginType"].ToString() == "Institute")
            {
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            }
            else
            {
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = 0;
            }

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
            Global.ErrorInsert(ex.Message, formname, "ListInstitute");

        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListVillageSearch()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
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
            Global.ErrorInsert(ex.Message, formname, "ListVillageSearch");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }

    [WebMethod]
    public static List<ListItem> ListVillageForSrchMem()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
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
            SqlCommand cmd = new SqlCommand("ListHouseHoldByVillage", con);
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


    public class MemberParameters
    {
        public string FullName { get; set; }

        public Int64 MemberID { get; set; }
        public Int64 MemberDetailID { get; set; }
        public Int64 hdnMemberIDForFamily { get; set; }
        public Int64 InstituteID { get; set; }
        public Int64 DistrictID { get; set; }
        public Int64 TalukaID { get; set; }
        public Int64 SectionVillageMappingID { get; set; }

        public string MembershipDate { get; set; }

        public string NewSubCast { get; set; }
        public string NewSubCastG { get; set; }

        public string HouseholdNo { get; set; }
        public string PersonCode { get; set; }
        public string PersonCodeMM { get; set; }
        public string PersonCodeMD { get; set; }
        public string GeneratedAccountNo { get; set; }
        public string AccountNo { get; set; }
        public string CurrentAccountNo { get; set; }

        public string FullNameMM { get; set; }

        public string FName { get; set; }
        public string MName { get; set; }
        public string LName { get; set; }
        public string FNameG { get; set; }
        public string MNameG { get; set; }
        public string LNameG { get; set; }

        public string Add1 { get; set; }
        public string Add2 { get; set; }
        public string Add3 { get; set; }
        public string Add1G { get; set; }
        public string Add2G { get; set; }
        public string Add3G { get; set; }

        public string Mobile1 { get; set; }
        public string Mobile1G { get; set; }
        public string Mobile2 { get; set; }
        public string Mobile2G { get; set; }

        public string Gender { get; set; }
        public bool rbtMale { get; set; }
        public bool rbtFeMale { get; set; }
        public string BirthDate { get; set; }
        public string AadhaarNo { get; set; }
        public string Email { get; set; }

        public bool chkBPL { get; set; }
        public string BPLNo { get; set; }

        public bool chkToilet { get; set; }
        public bool chkBathroom { get; set; }

        public string VoterID { get; set; }

        public decimal MonthlySaving { get; set; }
        public string SourceOfIncome { get; set; }
        public decimal BalanceAmount { get; set; }

        public decimal PiyatYears { get; set; }
        public bool chkElectricMotor { get; set; }
        public bool chkKuvo { get; set; }
        public bool chkBorvel { get; set; }

        public string TransferPlace { get; set; }

        public Int64 SubCasteID { get; set; }

        public string Business { get; set; }
        public string Job { get; set; }

        public string TwoWheeler { get; set; }
        public string CarJeep { get; set; }
        public string Truck { get; set; }
        public string Tractor { get; set; }

        public string Cow { get; set; }
        public string Oxe { get; set; }
        public string Buffelo { get; set; }
        public string Other { get; set; }
        public string RemarkOther { get; set; }

        public string VehicalOther { get; set; }
        public string VehicalRemarkOther { get; set; }

        public string HouseType { get; set; }

        public Int64 IsEdit { get; set; }
    }

    [WebMethod]
    public static string MemberManage(MemberParameters member)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            if (member.MemberID == 0)
            {
                SqlCommand cmd;
                if (member.SubCasteID == 0)
                {
                    try
                    {
                        cmd = new SqlCommand("NewCast", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@NewCast", SqlDbType.VarChar).Value = member.NewSubCast;
                        cmd.Parameters.Add("@NewCastG", SqlDbType.NVarChar).Value = member.NewSubCastG;
                        cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                        cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
                        cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];

                        msg = cmd.ExecuteScalar().ToString();
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "NewCast");
                        msg = "Error" + ex.Message;
                    }
                    member.SubCasteID = Convert.ToInt64(msg);
                }

                if (member.IsEdit == 0)
                {
                    cmd = new SqlCommand("MemberMasterInsert", con);
                    cmd.Parameters.Add("@DistrictID", SqlDbType.BigInt).Value = member.DistrictID;
                    cmd.Parameters.Add("@TalukaID", SqlDbType.BigInt).Value = member.TalukaID;
                    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                }
                else
                {
                    cmd = new SqlCommand("MemberMasterUpdate", con);
                    cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = member.IsEdit;
                    cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                    cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];

                }
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add("@SectionVillageMappingID", SqlDbType.BigInt).Value = member.SectionVillageMappingID;
                cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = member.InstituteID;
                cmd.Parameters.Add("@HouseholdNo", SqlDbType.VarChar).Value = member.HouseholdNo;
                cmd.Parameters.Add("@CurrentAccountNo", SqlDbType.VarChar).Value = member.CurrentAccountNo;

                if (member.MembershipDate == "")
                {
                    cmd.Parameters.Add("@MembershipDate", SqlDbType.DateTime).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@MembershipDate", SqlDbType.DateTime).Value = Convert.ToDateTime(member.MembershipDate.Substring(3, 2).PadLeft(2, '0') + "/" + member.MembershipDate.Substring(0, 2).PadLeft(2, '0') + "/" + member.MembershipDate.Substring(6, 4));
                }

                cmd.Parameters.Add("@FName", SqlDbType.VarChar).Value = member.FName;
                cmd.Parameters.Add("@MName", SqlDbType.VarChar).Value = member.MName;
                cmd.Parameters.Add("@LName", SqlDbType.VarChar).Value = member.LName;
                cmd.Parameters.Add("@FNameG", SqlDbType.NVarChar).Value = member.FNameG;
                cmd.Parameters.Add("@MNameG", SqlDbType.NVarChar).Value = member.MNameG;
                cmd.Parameters.Add("@LNameG", SqlDbType.NVarChar).Value = member.LNameG;


                cmd.Parameters.Add("@Address1", SqlDbType.VarChar).Value = member.Add1;
                cmd.Parameters.Add("@Address2", SqlDbType.VarChar).Value = member.Add2;
                cmd.Parameters.Add("@Address3", SqlDbType.VarChar).Value = member.Add3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = member.Add1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = member.Add2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = member.Add3G;

                cmd.Parameters.Add("@MobileNo1", SqlDbType.VarChar).Value = member.Mobile1;
                cmd.Parameters.Add("@MobileNo1G", SqlDbType.NVarChar).Value = member.Mobile1G;
                cmd.Parameters.Add("@MobileNo2", SqlDbType.VarChar).Value = member.Mobile2;
                cmd.Parameters.Add("@MobileNo2G", SqlDbType.NVarChar).Value = member.Mobile2G;

                if (member.rbtMale == true)
                {
                    cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = "M";
                }
                else if (member.rbtFeMale == true)
                {
                    cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = "F";
                }

                if (member.BirthDate == "")
                {
                    cmd.Parameters.Add("@BirthDate", SqlDbType.DateTime).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@BirthDate", SqlDbType.DateTime).Value = Convert.ToDateTime(member.BirthDate.Substring(3, 2).PadLeft(2, '0') + "/" + member.BirthDate.Substring(0, 2).PadLeft(2, '0') + "/" + member.BirthDate.Substring(6, 4));
                }
                cmd.Parameters.Add("@AadhaarNo", SqlDbType.VarChar).Value = member.AadhaarNo;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = member.Email;

                cmd.Parameters.Add("@chkBPL", SqlDbType.Bit).Value = member.chkBPL;
                cmd.Parameters.Add("@BPLNo", SqlDbType.NVarChar).Value = member.BPLNo;

                cmd.Parameters.Add("@chkToilet", SqlDbType.Bit).Value = member.chkToilet;
                cmd.Parameters.Add("@chkBathroom", SqlDbType.Bit).Value = member.chkBathroom;

                cmd.Parameters.Add("@VoterID", SqlDbType.VarChar).Value = member.VoterID;

                cmd.Parameters.Add("@MonthlySaving", SqlDbType.Decimal).Value = member.MonthlySaving;
                cmd.Parameters.Add("@SourceOfIncome", SqlDbType.NVarChar).Value = member.SourceOfIncome;
                cmd.Parameters.Add("@BalanceAmount", SqlDbType.Decimal).Value = member.BalanceAmount;

                cmd.Parameters.Add("@PiyatYears", SqlDbType.Decimal).Value = member.PiyatYears;
                cmd.Parameters.Add("@chkElectricMotor", SqlDbType.Bit).Value = member.chkElectricMotor;
                cmd.Parameters.Add("@chkKuvo", SqlDbType.Bit).Value = member.chkKuvo;
                cmd.Parameters.Add("@chkBorvel", SqlDbType.Bit).Value = member.chkBorvel;

                cmd.Parameters.Add("@TransferPlace", SqlDbType.NVarChar).Value = member.TransferPlace;

                cmd.Parameters.Add("@SubCasteID", SqlDbType.BigInt).Value = member.SubCasteID;

                cmd.Parameters.Add("@Business", SqlDbType.NVarChar).Value = member.Business;
                cmd.Parameters.Add("@Job", SqlDbType.NVarChar).Value = member.Job;

                cmd.Parameters.Add("@TwoWheeler", SqlDbType.NVarChar).Value = member.TwoWheeler;
                cmd.Parameters.Add("@CarJeep", SqlDbType.NVarChar).Value = member.CarJeep;
                cmd.Parameters.Add("@Truck", SqlDbType.NVarChar).Value = member.Truck;
                cmd.Parameters.Add("@Tractor", SqlDbType.NVarChar).Value = member.Tractor;

                cmd.Parameters.Add("@Cow", SqlDbType.NVarChar).Value = member.Cow;
                cmd.Parameters.Add("@Oxe", SqlDbType.NVarChar).Value = member.Oxe;
                cmd.Parameters.Add("@Buffelo", SqlDbType.NVarChar).Value = member.Buffelo;
                cmd.Parameters.Add("@Other", SqlDbType.NVarChar).Value = member.Other;
                cmd.Parameters.Add("@RemarkOther", SqlDbType.NVarChar).Value = member.RemarkOther;

                cmd.Parameters.Add("@HouseType", SqlDbType.NVarChar).Value = member.HouseType;

                cmd.Parameters.Add("@VehicalOther", SqlDbType.NVarChar).Value = member.VehicalOther;
                cmd.Parameters.Add("@VehicalRemarkOther", SqlDbType.NVarChar).Value = member.VehicalRemarkOther;

                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;

                if (member.IsEdit == 0)
                {
                    var strRes = cmd.ExecuteScalar();
                    string[] arrRes = strRes.ToString().Split(',');
                    string pcode = arrRes[0].ToString();
                    string acno = arrRes[1].ToString();
                    msg = pcode + ',' + acno;
                    cmd.Dispose();
                }
                else
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                con.Close();
            }
            else
            {
                SqlCommand cmd;
                if (member.IsEdit == 0)
                {
                    cmd = new SqlCommand("MemberDetailInsert", con);
                    cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = member.MemberID;
                    cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                }
                else
                {
                    cmd = new SqlCommand("MemberDetailUpdate", con);
                    cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = member.MemberID;
                    cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = member.IsEdit;
                    cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                }
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@FName", SqlDbType.NVarChar).Value = member.FName;
                cmd.Parameters.Add("@MName", SqlDbType.NVarChar).Value = member.MName;
                cmd.Parameters.Add("@LName", SqlDbType.NVarChar).Value = member.LName;
                cmd.Parameters.Add("@FNameG", SqlDbType.NVarChar).Value = member.FNameG;
                cmd.Parameters.Add("@MNameG", SqlDbType.NVarChar).Value = member.MNameG;
                cmd.Parameters.Add("@LNameG", SqlDbType.NVarChar).Value = member.LNameG;

                cmd.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = member.Add1;
                cmd.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = member.Add2;
                cmd.Parameters.Add("@Address3", SqlDbType.NVarChar).Value = member.Add3;
                cmd.Parameters.Add("@Address1G", SqlDbType.NVarChar).Value = member.Add1G;
                cmd.Parameters.Add("@Address2G", SqlDbType.NVarChar).Value = member.Add2G;
                cmd.Parameters.Add("@Address3G", SqlDbType.NVarChar).Value = member.Add3G;

                cmd.Parameters.Add("@MobileNo1", SqlDbType.NVarChar).Value = member.Mobile1;
                cmd.Parameters.Add("@MobileNo1G", SqlDbType.NVarChar).Value = member.Mobile1G;
                cmd.Parameters.Add("@MobileNo2", SqlDbType.NVarChar).Value = member.Mobile2;
                cmd.Parameters.Add("@MobileNo2G", SqlDbType.NVarChar).Value = member.Mobile2G;

                if (member.rbtMale == true)
                {
                    cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = "M";
                }
                else if (member.rbtFeMale == true)
                {
                    cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = "F";
                }
                if (member.BirthDate == "")
                {
                    cmd.Parameters.Add("@BirthDate", SqlDbType.DateTime).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@BirthDate", SqlDbType.DateTime).Value = Convert.ToDateTime(member.BirthDate.Substring(3, 2).PadLeft(2, '0') + "/" + member.BirthDate.Substring(0, 2).PadLeft(2, '0') + "/" + member.BirthDate.Substring(6, 4));
                }
                cmd.Parameters.Add("@AadhaarNo", SqlDbType.NVarChar).Value = member.AadhaarNo;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = member.Email;
                cmd.Parameters.Add("@VoterID", SqlDbType.NVarChar).Value = member.VoterID;

                cmd.Parameters.Add("@Job", SqlDbType.NVarChar).Value = member.Job;
                cmd.Parameters.Add("@Business", SqlDbType.NVarChar).Value = member.Business;


                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];

                cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;

                if (member.IsEdit == 0)
                {
                    msg = cmd.ExecuteScalar().ToString();
                    cmd.Dispose();
                    con.Close();
                }
                else
                {
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "MemberManage");
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
    public static string GetPersonBlockDetail(int MemberId)
    {

        string query = "MemberBlockByID";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MemberID", MemberId);
        return GetData1(cmd).GetXml();
    }
    private static DataSet GetData1(SqlCommand cmd)
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
                        sda.Fill(ds, "BD1");
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

    [WebMethod]
    public static string GetAllMember(string SearchMemberNameTerm,string SearchHouseHoldNoTerm,int pageIndex, Int64 VillageID)
    {
        string query = "MemberMasterGetAll";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MemberName", SearchMemberNameTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@HouseHoldNo", SearchHouseHoldNoTerm).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@VillageID", VillageID).DbType = DbType.Int64;
        cmd.Parameters.AddWithValue("@LoginType", HttpContext.Current.Session["LoginType"]).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"]).DbType = DbType.Int64;
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex).DbType = DbType.Int32;
        cmd.Parameters.AddWithValue("@PageSize", PageSize).DbType = DbType.Int32;
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        return GetData(cmd, pageIndex).GetXml();
    }

    private static DataSet GetData(SqlCommand cmd, int pageIndex)
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
                        sda.Fill(ds, "MemberMaster");
                        DataTable dt = new DataTable("Pager");
                        dt.Columns.Add("PageIndex");
                        dt.Columns.Add("PageSize");
                        dt.Columns.Add("RecordCount");
                        dt.Rows.Add();
                        dt.Rows[0]["PageIndex"] = pageIndex;
                        dt.Rows[0]["PageSize"] = PageSize;
                        dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                        ds.Tables.Add(dt);
                        return ds;
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetData");

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


    [WebMethod]
    public static string GetMemberDetail(Int64 MemberID, int pageIndex)
    {
        string query = "MemberDetailGetAllByID";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@MemberID", MemberID).DbType = DbType.Int64;
        return GetDataMemberDetail(cmd, pageIndex).GetXml();
    }

    private static DataSet GetDataMemberDetail(SqlCommand cmd, int pageIndex)
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
                        sda.Fill(ds, "MemberDetail");
                    }
                    catch (Exception ex)
                    {
                        Global.ErrorInsert(ex.Message, formname, "GetDataMemberDetail");

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

    [WebMethod]
    [ScriptMethod]
    public static List<MemberParameters> GetMember(string MemberID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<MemberParameters> list = new List<MemberParameters>();

        try
        {
            SqlCommand cmd1 = new SqlCommand("GetMemberID", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add("@MemberID", SqlDbType.NVarChar).Value = MemberID;
            SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
            DataSet ds1 = new DataSet();
            adp1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                list.Add(new MemberParameters
                {
                    FullName = ds1.Tables[0].Rows[0]["FullName"].ToString(),
                    hdnMemberIDForFamily = Convert.ToInt64(ds1.Tables[0].Rows[0]["MemberID"]),
                });
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListDivisionByCircle");
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
    public static List<MemberParameters> GetMemberMasterByID(int MemberID)
    {
        List<MemberParameters> list = new List<MemberParameters>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("MemberMasterGetByID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = MemberID;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            list.Add(new MemberParameters
            {
                MemberID = Convert.ToInt64(ds.Tables[0].Rows[0]["MemberID"].ToString()),
                InstituteID = Convert.ToInt64(ds.Tables[0].Rows[0]["InstituteID"].ToString()),
                SectionVillageMappingID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionVillageMappingID"].ToString()),
                TalukaID = Convert.ToInt64(ds.Tables[0].Rows[0]["TalukaID"].ToString()),
                DistrictID = Convert.ToInt64(ds.Tables[0].Rows[0]["DistrictID"].ToString()),
                HouseholdNo = ds.Tables[0].Rows[0]["HouseholdNo"].ToString(),
                PersonCode = ds.Tables[0].Rows[0]["PersonCode"].ToString(),
                AccountNo = ds.Tables[0].Rows[0]["AccountNo"].ToString(),
                CurrentAccountNo = ds.Tables[0].Rows[0]["CurrentAccountNo"].ToString(),
                MembershipDate= ds.Tables[0].Rows[0]["MembershipDate"].ToString(),

                FName = ds.Tables[0].Rows[0]["FName"].ToString(),
                MName = ds.Tables[0].Rows[0]["Mname"].ToString(),
                LName = ds.Tables[0].Rows[0]["LName"].ToString(),
                FNameG = ds.Tables[0].Rows[0]["FNameG"].ToString(),
                MNameG = ds.Tables[0].Rows[0]["MnameG"].ToString(),
                LNameG = ds.Tables[0].Rows[0]["LNameG"].ToString(),
                Add1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                Add2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                Add3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                Add1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                Add2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                Add3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                Mobile1 = ds.Tables[0].Rows[0]["MobileNo1"].ToString(),
                Mobile1G = ds.Tables[0].Rows[0]["MobileNo1G"].ToString(),
                Mobile2 = ds.Tables[0].Rows[0]["MobileNo2"].ToString(),
                Mobile2G = ds.Tables[0].Rows[0]["MobileNo2G"].ToString(),

                Gender = ds.Tables[0].Rows[0]["Gender"].ToString(),
                BirthDate = ds.Tables[0].Rows[0]["BirthDate"].ToString(),

                AadhaarNo = ds.Tables[0].Rows[0]["AadharNo"].ToString(),
                Email = ds.Tables[0].Rows[0]["EmailID"].ToString(),
                chkBPL = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsBPL"].ToString()),
                BPLNo = ds.Tables[0].Rows[0]["BPLNo"].ToString(),
                chkToilet = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsToilet"].ToString()),
                chkBathroom = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsBathroom"].ToString()),
                VoterID = ds.Tables[0].Rows[0]["VoteridNo"].ToString(),
                MonthlySaving = Convert.ToDecimal(ds.Tables[0].Rows[0]["MonthlySaving"].ToString()),
                SourceOfIncome = ds.Tables[0].Rows[0]["SourceOfIncome"].ToString(),
                BalanceAmount = Convert.ToDecimal(ds.Tables[0].Rows[0]["BalanceAmount"].ToString()),
                PiyatYears = Convert.ToDecimal(ds.Tables[0].Rows[0]["PiyatYears"].ToString()),
                chkElectricMotor = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsElectricMotor"].ToString()),
                chkKuvo = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsKuvo"].ToString()),
                chkBorvel = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsBorvel"].ToString()),
                TransferPlace = ds.Tables[0].Rows[0]["TransferPlace"].ToString(),
                SubCasteID = Convert.ToInt64(ds.Tables[0].Rows[0]["SubCastID"].ToString()),
                Job = ds.Tables[0].Rows[0]["Job"].ToString(),
                Business = ds.Tables[0].Rows[0]["Business"].ToString(),
                TwoWheeler = ds.Tables[0].Rows[0]["TwoWheeler"].ToString(),
                CarJeep = ds.Tables[0].Rows[0]["CarJeep"].ToString(),
                Truck = ds.Tables[0].Rows[0]["Truck"].ToString(),
                Tractor = ds.Tables[0].Rows[0]["Tracktor"].ToString(),
                Cow = ds.Tables[0].Rows[0]["Cow"].ToString(),
                Oxe = ds.Tables[0].Rows[0]["Oxe"].ToString(),
                Buffelo = ds.Tables[0].Rows[0]["Buffelo"].ToString(),
                Other = ds.Tables[0].Rows[0]["HusbandryOther"].ToString(),
                RemarkOther = ds.Tables[0].Rows[0]["HusbandryRemarkOthers"].ToString(),

                VehicalOther = ds.Tables[0].Rows[0]["VehicalOther"].ToString(),
                VehicalRemarkOther = ds.Tables[0].Rows[0]["VehicalRemarkOthers"].ToString(),

                HouseType = ds.Tables[0].Rows[0]["HouseType"].ToString(),
            });
        }
        return list;
    }


    [WebMethod]
    [ScriptMethod]
    public static List<MemberParameters> GetMemberDetailByID(int MemberDetailID)
    {
        List<MemberParameters> list = new List<MemberParameters>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("MemberDetailGetByID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = MemberDetailID;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            list.Add(new MemberParameters
            {
                MemberDetailID = Convert.ToInt64(ds.Tables[0].Rows[0]["MemberDetailID"].ToString()),
                MemberID = Convert.ToInt64(ds.Tables[0].Rows[0]["MemberID"].ToString()),
                PersonCodeMM = ds.Tables[0].Rows[0]["PersonCodeMM"].ToString(),
                PersonCodeMD = ds.Tables[0].Rows[0]["PersonCodeMD"].ToString(),
                FullNameMM = ds.Tables[0].Rows[0]["FullNameMM"].ToString(),
                FName = ds.Tables[0].Rows[0]["FName"].ToString(),
                MName = ds.Tables[0].Rows[0]["Mname"].ToString(),
                LName = ds.Tables[0].Rows[0]["LName"].ToString(),
                FNameG = ds.Tables[0].Rows[0]["FNameG"].ToString(),
                MNameG = ds.Tables[0].Rows[0]["MnameG"].ToString(),
                LNameG = ds.Tables[0].Rows[0]["LNameG"].ToString(),
                Add1 = ds.Tables[0].Rows[0]["Address1"].ToString(),
                Add2 = ds.Tables[0].Rows[0]["Address2"].ToString(),
                Add3 = ds.Tables[0].Rows[0]["Address3"].ToString(),
                Add1G = ds.Tables[0].Rows[0]["Address1G"].ToString(),
                Add2G = ds.Tables[0].Rows[0]["Address2G"].ToString(),
                Add3G = ds.Tables[0].Rows[0]["Address3G"].ToString(),
                Mobile1 = ds.Tables[0].Rows[0]["MobileNo1"].ToString(),
                Mobile1G = ds.Tables[0].Rows[0]["MobileNo1G"].ToString(),
                Mobile2 = ds.Tables[0].Rows[0]["MobileNo2"].ToString(),
                Mobile2G = ds.Tables[0].Rows[0]["MobileNo2G"].ToString(),

                Gender = ds.Tables[0].Rows[0]["Gender"].ToString(),
                BirthDate = ds.Tables[0].Rows[0]["BirthDate"].ToString(),

                AadhaarNo = ds.Tables[0].Rows[0]["AadharNo"].ToString(),
                Email = ds.Tables[0].Rows[0]["EmailID"].ToString(),
                VoterID = ds.Tables[0].Rows[0]["VoteridNo"].ToString(),
                Job = ds.Tables[0].Rows[0]["Job"].ToString(),
                Business = ds.Tables[0].Rows[0]["Business"].ToString(),
                SectionVillageMappingID = Convert.ToInt64(ds.Tables[0].Rows[0]["SectionVillageMappingID"].ToString()),
            });
        }
        return list;
    }

    [WebMethod]
    [ScriptMethod]
    public static string DeleteMemberMaster(Int64 MemberID)
    {

        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("MemberMasterDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = MemberID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            var i = Convert.ToInt64(cmd.ExecuteScalar());
            msg = "સભ્ય ની માહિતી રદ થઇ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteMemberMaster");
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
    [ScriptMethod]
    public static string DeleteMemberDetail(Int64 MemberDetailID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("MemberDetailDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MemberDetailID", SqlDbType.BigInt).Value = MemberDetailID;
            cmd.Parameters.Add("@DeletedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmd.Parameters.Add("@MachineName", SqlDbType.NVarChar).Value = Global.MachineName;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "કુટુંબ ના સભ્ય ની માહિતી રદ થઇ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteMemberDetail");
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
    [ScriptMethod]
    public static bool CheckHouseHoldNo(string HouseHoldNo)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("HouseHoldNoExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@HouseHoldNo", SqlDbType.VarChar).Value = HouseHoldNo;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckHouseHoldNo");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckCurrAccNo(string CurrAccNo)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CurrentAccNoExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CurrentAccNo", SqlDbType.VarChar).Value = CurrAccNo;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckCurrAccNo");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckPhone(string Phone)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("MobileNoExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = Phone;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckPhone");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckPhoneG(string Phone)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("MobileNoGExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = Phone;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckPhone");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckAdhar(string Adhar)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckAdharNoExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AdharNo", SqlDbType.VarChar).Value = Adhar;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckAdhar");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckEmail(string Email)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckEmailExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckEmail");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }


    [WebMethod]
    [ScriptMethod]
    public static bool CheckVoterID(string VoterID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckVoterIDExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VoterID", SqlDbType.VarChar).Value = VoterID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckVoterID");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckSubCast(string NewSubCast)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckSubCastExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@NewSubCast", SqlDbType.VarChar).Value = NewSubCast;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckSubCastExists");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }

    [WebMethod]
    [ScriptMethod]
    public static bool CheckSubCastG(string NewSubCastG)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        string msg = string.Empty;
        bool IsExist = false;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("CheckSubCastGExists", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@NewSubCastG", SqlDbType.VarChar).Value = NewSubCastG;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i == 0)
                IsExist = false;
            else
                IsExist = true;
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "CheckSubCastG");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return IsExist;
    }
    
}


