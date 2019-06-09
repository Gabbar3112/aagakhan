using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports_PrintSectionwiseMonthlyProgressReport : System.Web.UI.Page
{
    string formName = "Reports_PrintSectionwiseMonthlyProgressReport";
    SqlConnection conn;

    DataSet dsDetail = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        if (!Page.IsPostBack)
        {

            PrintHtml(Convert.ToInt32(Request.QueryString["SectionID"]), Request.QueryString["FromDate"], Request.QueryString["ToDate"]);

        }
    }

    public void PrintHtml(int SectionID, string FromDate, string ToDate)
    {
        try
        {
            string strHTML = "";
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand cmd = new SqlCommand("SectionwiseMonthlyProgressReport", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = SectionID;
            cmd.Parameters.Add("@Fromdate", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + FromDate.Substring(6, 4));
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + ToDate.Substring(6, 4));
            //cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = Session["YearID"];
            DataSet dsDetail = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dsDetail);
            cmd.Dispose();



            if (dsDetail.Tables[0].Rows.Count > 0)
            {
                 var SectionName = dsDetail.Tables[0].Rows[0]["SectionNameG"].ToString();
                 var CircleName = dsDetail.Tables[0].Rows[0]["CircleNameG"].ToString();
                 var frmd = dsDetail.Tables[0].Rows[0]["FromDate"].ToString(); ;
                 var tod = dsDetail.Tables[0].Rows[0]["ToDate"].ToString(); ;
                 var fday = dsDetail.Tables[0].Rows[0]["firstday"].ToString();
                 var fmon = dsDetail.Tables[0].Rows[0]["MonName"].ToString();
                 var fyear = dsDetail.Tables[0].Rows[0]["YearName"].ToString();
                 var lday = dsDetail.Tables[0].Rows[0]["lastday"].ToString();
                 var lmon = dsDetail.Tables[0].Rows[0]["lMonName"].ToString();
                 var lyear = dsDetail.Tables[0].Rows[0]["lYearName"].ToString();


                strHTML += "<html>";
                strHTML += "<head>";
                strHTML += "<title>Report</title>";
                strHTML += "</head>";
                strHTML += "<body>";
                strHTML += "<table style=\"margin:0 auto;\" width=\"100%;\">";
                strHTML += "<thead>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td colspan=\"8\" style=\"border:solid 0.5pt silver;border-collapse:collapse;text-align:center;font-size:20px;font-weight:bold;text-align:center\">";
                strHTML += "Sectionwise Monthly Progress Report";
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td  colspan=\"8\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:200px;text-align:center\">";
                strHTML +=  CircleName.ToString() +" હેઠળના ડા.બા.કા. સિંચાઈ યોજના : " + SectionName.ToString();
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td colspan=\"8\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:200px;text-align:center\">";
                strHTML +=  SectionName.ToString() + " કમાન્ડ વિસ્તારમાં સહભાગી સિંચાઈ વ્યવસ્થા અંતર્ગત થયેલ કામગીરીનો પ્રગતિ અહેવાલ";
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td colspan=\"8\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:200px;text-align:center\">";
                strHTML += "સમયગાળો : તારીખ " + frmd.ToString() + " થી " +tod.ToString() + " અંતિત પ્રગતિ અહેવાલ";
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td colspan=\"8\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:200px;text-align:center\">";
                strHTML += "માર્ગદર્શક સંસ્થાનું નામ: આગાખાન ગ્રામ સમર્થન કાર્યક્રમ(ભારત) વ્યારા ક્લસ્ટર ઓફીસ";
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr  style=\"width:100%\">";
                strHTML += "<td rowspan=\"2\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:200px;text-align:center\">";
                strHTML += "અ.નું.";
                strHTML += "</td>";
                strHTML += "<td rowspan=\"2\"  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:30px;text-align:center\">";
                strHTML += "પ્રવૃત્તિનું નામ";
                strHTML += "</td>";
                strHTML += "<td colspan=\"2\"   style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:200px;text-align:center\">";
                strHTML += "ગતમાસમાં થયેલ કામગીરી";
                strHTML += "</td>";
                strHTML += "<td colspan=\"2\"  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:100px;text-align:center\"  >";
                strHTML += frmd.ToString() + " થી " + tod.ToString() + " પ્રગતિ";
                strHTML += "</td>";
                strHTML += "<td colspan=\"2\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "કુલ પ્રગતિ";
                strHTML += "</td>";
                strHTML += "</tr>";

                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "થયેલ પ્રવૃત્તિ સંખ્યા";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "લાભાર્થી સંખ્યા";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "થયેલ પ્રવૃત્તિ સંખ્યા";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "લાભાર્થી સંખ્યા";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "થયેલ પ્રવૃત્તિ સંખ્યા";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:50px;text-align:center\"  >";
                strHTML += "લાભાર્થી સંખ્યા";
                strHTML += "</td>";
                strHTML += "</tr>";  
                strHTML += "</tr>";
                strHTML += "</tr>";
                strHTML += "</thead>";

                var activitytypeid = 0;
                var membertotal = 0;
                var activityTotal = 0;
                var No = 1;
                var ActivityType = "0";
                var frmdate = "0";
                var todate = "0";
                var ActiID = "0";

                strHTML += "<tbody>";

                if (dsDetail.Tables[0].Rows.Count > 0)
                {
                    for (int c = 0; c < dsDetail.Tables[0].Rows.Count; c++)
                    {
                        activitytypeid = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["ActivityTypeID"].ToString());
                        
                        strHTML += "<tr>";
                        strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                        strHTML += No;
                        strHTML += "</td>";
                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                        strHTML += dsDetail.Tables[0].Rows[c]["ActivityTypeNameG"].ToString();
                        strHTML += "</td>";
                        strHTML += "<td colspan=\"6\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                        strHTML += "</td>";
                        
                        strHTML += "</tr>";
                        for (int e = 0; e < dsDetail.Tables[1].Rows.Count; e++)
                        {
                            
                            activitytypeid = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["ActivityTypeID"].ToString());
                            if (activitytypeid.ToString() == dsDetail.Tables[1].Rows[e]["ActivityTypeID"].ToString())
                            {
                                ActiID = dsDetail.Tables[1].Rows[e]["ActivityID"].ToString();
                                frmdate = dsDetail.Tables[1].Rows[e]["FromDate"].ToString();
                                todate = dsDetail.Tables[1].Rows[e]["Todate"].ToString();
                            }
                            else
                            {
                                frmdate = "";
                                todate = "";
                            }
                            if (conn.State == ConnectionState.Closed)
                                conn.Open();
                            if (frmdate != "" && todate != "")
                            {
                                SqlCommand cmd1 = new SqlCommand("SectionwiseMonthlyProgressReportbyActivityTypeID", conn);
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.Add("@SectionID", SqlDbType.BigInt).Value = SectionID;
                                cmd1.Parameters.Add("@ActivityID", SqlDbType.BigInt).Value = ActiID;
                                cmd1.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = activitytypeid;
                                cmd1.Parameters.Add("@Fromdate", SqlDbType.DateTime).Value = Convert.ToDateTime(frmdate.Substring(3, 2).PadLeft(2, '0') + "/" + frmdate.Substring(0, 2).PadLeft(2, '0') + "/" + frmdate.Substring(6, 4));
                                cmd1.Parameters.Add("@Todate", SqlDbType.DateTime).Value = Convert.ToDateTime(todate.Substring(3, 2).PadLeft(2, '0') + "/" + todate.Substring(0, 2).PadLeft(2, '0') + "/" + todate.Substring(6, 4));
                                //cmd.Parameters.Add("@YearID", SqlDbType.BigInt).Value = Session["YearID"];
                             
                                DataSet dsSubDetail = new DataSet();
                                SqlDataAdapter adpd = new SqlDataAdapter(cmd1);
                                adpd.Fill(dsSubDetail);
                                cmd1.Dispose();
                                
                                if (dsSubDetail.Tables[0].Rows.Count > 0)
                                {
                                    for (int d = 0; d < dsSubDetail.Tables[0].Rows.Count; d++)
                                    {
                                        strHTML += "<tr>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        // strHTML += No;
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += dsSubDetail.Tables[0].Rows[d]["SubjectG"].ToString();
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(dsSubDetail.Tables[0].Rows[d]["LastMonthSubjectTotal"].ToString());
                                        activityTotal = Convert.ToInt32(dsSubDetail.Tables[0].Rows[d]["LastMonthSubjectTotal"].ToString());
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(dsSubDetail.Tables[0].Rows[d]["LastMonthTotalMember"].ToString());
                                        membertotal = Convert.ToInt32(dsSubDetail.Tables[0].Rows[d]["LastMonthTotalMember"].ToString());
                                        strHTML += "</td>";

                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(dsSubDetail.Tables[0].Rows[d]["CurrentSubjectTotal"].ToString());
                                        activityTotal = activityTotal + Convert.ToInt32(dsSubDetail.Tables[0].Rows[d]["CurrentSubjectTotal"].ToString());
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(dsSubDetail.Tables[0].Rows[d]["CurrentMonthTotalMember"].ToString());
                                        membertotal = membertotal + Convert.ToInt32(dsSubDetail.Tables[0].Rows[d]["CurrentMonthTotalMember"].ToString());
                                        strHTML += "</td>";

                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(activityTotal.ToString());
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(membertotal.ToString());
                                        strHTML += "</td>";
                                        strHTML += "</tr>";
                                    }
                                }
                            }
                        }
                            ActivityType = dsDetail.Tables[0].Rows[c]["ActivityTypeNameG"].ToString();
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