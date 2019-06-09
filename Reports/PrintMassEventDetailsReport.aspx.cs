﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Reports_PrintMassEventDetailsReport : System.Web.UI.Page
{
    string formName = "Reports_PrintMassEventDetailsReport";
    SqlConnection conn;
    private GridViewRow m_firstGroupGridRow = null;
    private DataRow m_firstGroupDataRow = null;
    private int m_rowSpan = 0;
    DataSet dsDetail = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        if (!Page.IsPostBack)
        {
          
                PrintHtml(Convert.ToInt32(Request.QueryString["AETid"]), Convert.ToInt32(Request.QueryString["AETtypeid"]), Convert.ToInt32(Request.QueryString["Subject"]));

        }
    }

    public void PrintHtml(int AETid, int AETtypeid, int Subject)
    {
        try
        {
            string strHTML = "";
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand cmd = new SqlCommand("ProgramReport", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = AETtypeid;
            cmd.Parameters.Add("@Subject", SqlDbType.BigInt).Value = Subject;
            //cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = Session["YearID"];
            DataSet dsDetail = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dsDetail);
            cmd.Dispose();



            if (dsDetail.Tables[0].Rows.Count > 0)
            {
                strHTML += "<html>";
                strHTML += "<head>";
                strHTML += "<title>Report</title>";
                strHTML += "</head>";
                strHTML += "<body>";
                strHTML += "<table style=\"margin:0 auto;\" width=\"100%;\">";
                strHTML += "<thead>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td colspan=\"15\" style=\"border:solid 0.5pt silver;border-collapse:collapse;text-align:center;font-size:20px;font-weight:bold;text-align:center\">";
                strHTML += "Mass Events Format";
                //strHTML += ds.Tables[0].Rows[0]["MonthName"].ToString() + "-" + ds.Tables[0].Rows[0]["MonthYear"].ToString();
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\">";
                strHTML += "અ.નું.";
                strHTML += "</td>";
                strHTML += "<td  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:30px;text-align:center\">";
                strHTML += "મહિનો";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:30px;text-align:center\"  >";
                strHTML += "વર્ષ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "પ્રોગ્રામ પ્રકાર";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "પ્રોગ્રામનું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "પ્રોગ્રામની શરૂઆતની તારીખ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "પ્રોગ્રામની ખત્મ તારીખ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "કુલ દિવસો";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "વિષય";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "સ્થળ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "ગામ કોડ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "ગામનું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "પુરુષ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "સ્ત્રી";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "કુલ";
                strHTML += "</td>";
                strHTML += "</tr>";


                strHTML += "</thead>";

                int male = 0;
                int female = 0;
                var villagename = "0";
                var mon = "0";
                var No = 1;
                strHTML += "<tbody>";
                if (dsDetail.Tables[0].Rows.Count > 0)
                {
                    for (int c = 0; c < dsDetail.Tables[0].Rows.Count; c++)
                    {

                        //if (dsDetail.Tables[0].Rows[c]["VillageNameG"].ToString() != villagename || dsDetail.Tables[0].Rows[c]["MonName"].ToString() != mon)
                        //{

                            strHTML += "<tr>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\"  >";
                            strHTML += No;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += dsDetail.Tables[0].Rows[c]["MonName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["YearName"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                            strHTML += dsDetail.Tables[0].Rows[c]["EventTypeNameG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                            strHTML += dsDetail.Tables[0].Rows[c]["ProgramNameG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["FromDate"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["ToDate"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["NoOfDays"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                            strHTML += dsDetail.Tables[0].Rows[c]["SubjectG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                            strHTML += dsDetail.Tables[0].Rows[c]["PlaceG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["VillageID"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += dsDetail.Tables[0].Rows[c]["VillageNameG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                            male = Convert.ToInt16(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                            female = Convert.ToInt16(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords((male + female).ToString());
                            strHTML += "</td>";                          
                            strHTML += "</tr>";

                            mon = dsDetail.Tables[0].Rows[c]["MonName"].ToString();
                            villagename = dsDetail.Tables[0].Rows[c]["VillageNameG"].ToString();
                          
                            No++;                        
                    }
                }
                strHTML += "</tbody>";
                strHTML += "</table>";
                strHTML += "</body></html>";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "JS", "javascript:hello(this.value); ", true);

            }    
            divRpt.InnerHtml = strHTML;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Ming", "alert('" + ex.Message + "')", true);
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }


    }

    public static string changeNumericToWords(string numb)
    {
        string number = string.Empty;
        for (int i = 0; i < numb.Length; i++)
        {
            if (numb[i].ToString() == "0" || numb[i].ToString() == "1" || numb[i].ToString() == "2" || numb[i].ToString() == "3" || numb[i].ToString() == "4" || numb[i].ToString() == "5" || numb[i].ToString() == "6" || numb[i].ToString() == "7" || numb[i].ToString() == "8" || numb[i].ToString() == "9")
                number += ones(numb[i].ToString());
            else
                number += numb[i].ToString();

        }
        return number;
    }

    private static string ones(String digit)
    {
        int digt = Convert.ToInt32(digit);
        String name = "";
        switch (digt)
        {
            case 0:
                name = "૦";//"Zero"
                break;
            case 1:
                name = "૧";//"One"
                break;
            case 2:
                name = "૨";//"Two"
                break;
            case 3:
                name = "૩";//"Three"
                break;
            case 4:
                name = "૪";//"Four"
                break;
            case 5:
                name = "૫";//"Five"
                break;
            case 6:
                name = "૬";//"Six"
                break;
            case 7:
                name = "૭";//"Seven"
                break;
            case 8:
                name = "૮";//"Eight"
                break;
            case 9:
                name = "૯";//"Nine"
                break;
            default:
                name = digit;
                break;

        }
        return name;
    }
}