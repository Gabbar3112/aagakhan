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

public partial class ReceiptMaster : System.Web.UI.Page
{
    public static int PageSize = 10;
    SqlConnection conn;
    public static string formname = "ReceiptMaster";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=BakiFormDetail.aspx", true);

        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);

        if (!Page.IsPostBack)
        {
            try
            {
                if (Request.QueryString["MPid"] != "")
                {
                    if (conn.State.Equals(ConnectionState.Closed))
                        conn.Open();
                    SqlCommand cmd = new SqlCommand("GetMangnaDetailForReceipt", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = Request.QueryString["MPid"];
                    cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = Session["YearID"];
                    DataSet dset = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dset);
                    conn.Close();

                    if (dset.Tables[0].Rows.Count > 0)
                    {
                        txtPersonName.Text = dset.Tables[0].Rows[0]["Name"].ToString();
                        txtFormNo.Text = dset.Tables[0].Rows[0]["FormNo"].ToString();
                        txtMagnaNo.Text = dset.Tables[0].Rows[0]["MangnaNo"].ToString();
                        txtAccountNo.Text = dset.Tables[0].Rows[0]["AccountNo"].ToString();
                        txtHouseholdNo.Text = dset.Tables[0].Rows[0]["HouseholdNo"].ToString();
                        txtBlockNo.Text = dset.Tables[0].Rows[0]["BlockNo"].ToString();
                        txtKulPiyavo.Text = dset.Tables[0].Rows[0]["KulPiyavo"].ToString();
                        txtTotalFund.Text = dset.Tables[0].Rows[0]["KulLocalFund"].ToString();
                        txtKulRakam.Text = dset.Tables[0].Rows[0]["KulRakam"].ToString();
                        txtReceiveAmt.Text = dset.Tables[0].Rows[0]["SumReceiveAmount"].ToString();
                        txtPendingAmount.Text = dset.Tables[0].Rows[0]["PendingAmount"].ToString();
                        hdnMangnaPatrakID.Value = dset.Tables[0].Rows[0]["MangnaPatrakID"].ToString();
                    }

                }

                BindReceipt();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ErrorMsg", "alert(\"" + ex.Message + "\");", true);
            }
            finally
            {
                if (conn.State.Equals(ConnectionState.Open))
                    conn.Close();
            }
        }


    }

    private void BindReceipt()
    {
        DataTable pak = new DataTable();
        pak.Columns.Add("RowNumber");
        pak.Columns.Add("ReceiptNumber");
        pak.Columns.Add("MangnaNo");
        pak.Columns.Add("AccountNo");
        pak.Columns.Add("MemberName");
        pak.Columns.Add("VillageNameG");
        pak.Columns.Add("ReceiveDate");
        pak.Columns.Add("ReceiveAmount");
        pak.Columns.Add("DiscountPer");
        pak.Columns.Add("DiscountAmt");
        pak.Columns.Add("InterestPer");
        pak.Columns.Add("InterestAmt");
        pak.Rows.Add();
        gvReceipt.DataSource = pak;
        gvReceipt.DataBind();
    }

    [WebMethod]
    public static List<ListItem> ListMemberbank()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetAllMemberBank", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    circles.Add(new ListItem
                    {
                        Value = sdr["MemberBankID"].ToString(),
                        Text = sdr["MemberBank"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ListMemberbank");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        return circles;
    }


    [WebMethod]
    public static List<ListItem> ListVillage()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        List<ListItem> circles = new List<ListItem>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetVillageForReceipt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
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


    public class ReceiptParameters
    {
        public Int64 mangnapatrakid { get; set; }
        public decimal ReceiveAmount { get; set; }
        public decimal DisPer { get; set; }
        public decimal TotalDiscount  { get; set; }
        public decimal IntPer { get; set; }
        public decimal TotalInt { get; set; }
        public string ReceiveDate { get; set; }
        public decimal BakiRakam { get; set; }
        public bool ddlIsCash { get; set; }
        public bool ddlReceiptType { get; set; }
        public Int64 ddlMemberBank { get; set; }
        public string Bank { get; set; }
        public string ChkNo { get; set; }
        public string ChkDate { get; set; }
        public decimal ChkAmt { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string ReceiptManage(ReceiptParameters Receipt)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();

                SqlCommand cmd = new SqlCommand("InsertReceiptMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@MangnaPatrakID", SqlDbType.BigInt).Value = Receipt.mangnapatrakid;
                cmd.Parameters.Add("@ReceiveAmount", SqlDbType.Decimal).Value = Receipt.ReceiveAmount;
                cmd.Parameters.Add("@DiscountPer", SqlDbType.Decimal).Value = Receipt.DisPer;
                cmd.Parameters.Add("@DiscountAmt", SqlDbType.Decimal).Value = Receipt.TotalDiscount;
                cmd.Parameters.Add("@InterestPer", SqlDbType.Decimal).Value = Receipt.IntPer;
                cmd.Parameters.Add("@InterestAmt", SqlDbType.Decimal).Value = Receipt.TotalInt;
                cmd.Parameters.Add("@ReceiveDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Receipt.ReceiveDate.Substring(3, 2).PadLeft(2, '0') + "/" + Receipt.ReceiveDate.Substring(0, 2).PadLeft(2, '0') + "/" + Receipt.ReceiveDate.Substring(6, 4));

                if (Receipt.BakiRakam == 0)
                    cmd.Parameters.Add("@CreditAmount", SqlDbType.Decimal).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@CreditAmount", SqlDbType.Decimal).Value = Receipt.BakiRakam;

                cmd.Parameters.Add("@IsCash", SqlDbType.Bit).Value = Receipt.ddlIsCash;
                cmd.Parameters.Add("@IsAdvance", SqlDbType.Bit).Value = Receipt.ddlReceiptType;

                if (Receipt.ddlMemberBank != 0)
                    cmd.Parameters.Add("@MemberBankID", SqlDbType.BigInt).Value = Receipt.ddlMemberBank;
                else
                    cmd.Parameters.Add("@MemberBankID", SqlDbType.BigInt).Value = DBNull.Value;

                if (Receipt.Bank == "")
                    cmd.Parameters.Add("@BankName", SqlDbType.NVarChar).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@BankName", SqlDbType.NVarChar).Value = Receipt.Bank;

                if (Receipt.ChkNo== "")
                    cmd.Parameters.Add("@ChequeNo", SqlDbType.VarChar).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@ChequeNo", SqlDbType.VarChar).Value = Receipt.ChkNo;

                if (Receipt.ChkDate == "")
                    cmd.Parameters.Add("@ChequeDate", SqlDbType.DateTime).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@ChequeDate", SqlDbType.DateTime).Value = Convert.ToDateTime(Receipt.ChkDate.Substring(3, 2).PadLeft(2, '0') + "/" + Receipt.ChkDate.Substring(0, 2).PadLeft(2, '0') + "/" + Receipt.ChkDate.Substring(6, 4));

                if (Receipt.ChkAmt == 0)
                    cmd.Parameters.Add("@ChequeAmount", SqlDbType.Decimal).Value = DBNull.Value;
                else
                    cmd.Parameters.Add("@ChequeAmount", SqlDbType.Decimal).Value = Receipt.ChkAmt;

              

                cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = HttpContext.Current.Session["YearID"];
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
                cmd.Parameters.Add("@InsertedBy", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                msg = "રસીદ વિગતવાર સફળતાપૂર્વક  દાખલ થઇ ગઈ છે.";
                cmd.Dispose();
                con.Close();
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "ReceiptManage");
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
    public static string GetAllReceipt(string AccountNo, string MemberName, string MangnaNo, string ReceiptNo, Int64 VillageID,int pageIndex)
    {
        string query = "GetReceiptDetail";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@AccountNo", AccountNo).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@ReceiptNumber", ReceiptNo).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@MemberName", MemberName).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@MangnaNo", MangnaNo).DbType = DbType.String;
        cmd.Parameters.AddWithValue("@VillageID", VillageID).DbType = DbType.Int64;
        cmd.Parameters.AddWithValue("@YearID", HttpContext.Current.Session["YearID"]).DbType = DbType.Int64;
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
                    sda.Fill(ds, "ReceiptDetail");
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
            }
        }

    }

    [WebMethod]
    [ScriptMethod]
    public static string DeleteReceipt(int ReceiptID)
    {
        string msg = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DeleteReceiptMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ReceiptID", SqlDbType.BigInt).Value = ReceiptID;
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            msg = "રસીદ ની માહિતી સફળતાથી રદ થઇ ગઇ છે.";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "DeleteReceipt");
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