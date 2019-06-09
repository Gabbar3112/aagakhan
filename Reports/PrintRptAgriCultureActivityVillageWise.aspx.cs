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

public partial class Reports_PrintRptAgriCultureActivityVillageWise : System.Web.UI.Page
{
    string formName = "Reports_PrintRptAgriCultureActivityVillageWise";
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

            PrintHtml(Convert.ToInt32(Request.QueryString["AETid"]), Convert.ToInt32(Request.QueryString["AETtypeid"]), Request.QueryString["FromDate"], Request.QueryString["ToDate"]);

        }
    }

    public void PrintHtml(int AETid, int AETtypeid, string FromDate, string ToDate)
    {
        try
        {
            string strHTML = "";
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand cmd = new SqlCommand("AgriCultureActivityVillageWiseReport", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AETid", SqlDbType.BigInt).Value = AETid;
            cmd.Parameters.Add("@AETtypeid", SqlDbType.BigInt).Value = AETtypeid;
            cmd.Parameters.Add("@Fromdate", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate.Substring(3, 2).PadLeft(2, '0') + "/" + FromDate.Substring(0, 2).PadLeft(2, '0') + "/" + FromDate.Substring(6, 4));
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate.Substring(3, 2).PadLeft(2, '0') + "/" + ToDate.Substring(0, 2).PadLeft(2, '0') + "/" + ToDate.Substring(6, 4));
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
                strHTML += "<td colspan=\"6\" style=\"border:solid 0.5pt silver;border-collapse:collapse;text-align:center;font-size:20px;font-weight:bold;text-align:center\">";
                strHTML += "Agri-Culture Activitywise/VillageWise Report";
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<td colspan=\"6\" style=\"border:solid 0.5pt silver;border-collapse:collapse;text-align:center;font-size:20px;font-weight:bold;text-align:center\">";
                strHTML += "સમયગાળો :" + FromDate.ToString() + " થી " + ToDate.ToString();
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\">";
                strHTML += "અ.નું.";
                strHTML += "</td>";
                strHTML += "<td  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\">";
                strHTML +=  "ગામનું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "પ્રવૃત્તિનું નામ";
                strHTML += "</td>";              
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "પુરુષ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "સ્ત્રી";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "કુલ સભ્યો";
                strHTML += "</td>";   
                strHTML += "</tr>";
                strHTML += "</thead>";

                var male = 0;
                var female = 0;
                var villagename = "0";
                var subject = "0";
                var totalmale = 0;
                var totalfemale = 0;
                var No = 1;
                strHTML += "<tbody>";

                if (dsDetail.Tables[0].Rows.Count > 0)
                {
                    for (int c = 0; c < dsDetail.Tables[0].Rows.Count; c++)
                    {

                        if (dsDetail.Tables[0].Rows[c]["VillageID"].ToString() != villagename)
                        {

                            strHTML += "<tr>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\"rowspan=" + dsDetail.Tables[0].Rows[c]["VillageRowspan"].ToString() + " >";
                            strHTML += No;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\"rowspan=" + dsDetail.Tables[0].Rows[c]["VillageRowspan"].ToString() + " >";
                            strHTML += dsDetail.Tables[0].Rows[c]["VillageNameG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                            strHTML += dsDetail.Tables[0].Rows[c]["ActivityTypeNameG"].ToString();
                            strHTML += "</td>";                          
                            //strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                            //strHTML += dsDetail.Tables[0].Rows[c]["SubjectG"].ToString();
                            //strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                            male = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                            totalmale = totalmale + male;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                            female = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                            totalfemale = totalfemale + female;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords((male + female).ToString());
                            strHTML += "</td>";                        
                            strHTML += "</tr>";


                            villagename = dsDetail.Tables[0].Rows[c]["VillageID"].ToString();
                            subject = dsDetail.Tables[0].Rows[c]["ActivityTypeID"].ToString();
                            No++;
                        }
                        else
                        {
                            if (dsDetail.Tables[0].Rows[c]["ActivityTypeID"].ToString() == subject)
                            {
                                strHTML += "<tr>";
                                //strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                //strHTML += dsDetail.Tables[0].Rows[c]["SubjectG"].ToString();
                                //strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                                male = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                                totalmale = totalmale + male;
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                                female = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                                totalfemale = totalfemale + female;
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords((male + female).ToString());
                                strHTML += "</td>";
                                strHTML += "</tr>";

                                villagename = dsDetail.Tables[0].Rows[c]["VillageID"].ToString();
                                subject = dsDetail.Tables[0].Rows[c]["ActivityTypeID"].ToString();
                            }
                            else {
                                strHTML += "<tr>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                strHTML += dsDetail.Tables[0].Rows[c]["ActivityTypeNameG"].ToString();
                                strHTML += "</td>";
                                //strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                //strHTML += dsDetail.Tables[0].Rows[c]["SubjectG"].ToString();
                                //strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                                male = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["Male"].ToString());
                                totalmale = totalmale + male;
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                                female = Convert.ToInt32(dsDetail.Tables[0].Rows[c]["FeMale"].ToString());
                                totalfemale = totalfemale + female;
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords((male + female).ToString());
                                strHTML += "</td>";
                                strHTML += "</tr>";

                                villagename = dsDetail.Tables[0].Rows[c]["VillageID"].ToString();
                                subject = dsDetail.Tables[0].Rows[c]["ActivityTypeID"].ToString();
                            }
                        }                       
                    }

                    strHTML += "<tr>";

                    strHTML += "<td  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                    strHTML += "</td>";
                    strHTML += "<td  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                    strHTML += "</td>";
                    strHTML += "<td style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                    strHTML += "કુલ ગણતરી";
                    strHTML += "</td>";
                    strHTML += "<td  style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;font-weight:bold;vertical-align:top;text-align:center\">";
                    strHTML += changeNumericToWords(totalmale.ToString());
                    strHTML += "</td>";
                    strHTML += "<td  style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;font-weight:bold;vertical-align:top;text-align:center\">";
                    strHTML += changeNumericToWords(totalfemale.ToString());
                    strHTML += "</td>";
                    strHTML += "<td  style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                    strHTML += changeNumericToWords((totalmale + totalfemale).ToString());
                    strHTML += "</td>";
                    strHTML += "</tr>";
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