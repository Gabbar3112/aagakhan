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

public partial class PrintRptInstituteSummary : System.Web.UI.Page
{
    SqlConnection conn;
    private GridViewRow m_firstGroupGridRow = null;
    private DataRow m_firstGroupDataRow = null;
    private int m_rowSpan = 0;
    DataSet dsDetail = new DataSet();
   // string dsDetail = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["InstituteID"] != null)
                PrintHtml(Convert.ToInt32(Request.QueryString["InstituteID"]));

        }
    }
    public void PrintHtml(int InstituteID)
    {
        try
        {
            string strHTML = "";
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand cmd = new SqlCommand("InstitutionHtmlReport", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = InstituteID;
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
                strHTML += "<table style=\"margin:0 auto;\" width=\"100%;\" >";
                strHTML += "<thead>";
                strHTML += "<tr>";
                strHTML += "<td colspan=\"50\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:20px;font-weight:bold;width:30px;text-align:center\">";
                strHTML += "Institution Report-Summary";
                //strHTML += ds.Tables[0].Rows[0]["MonthName"].ToString() + "-" + ds.Tables[0].Rows[0]["MonthYear"].ToString();
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr style=\"width:100%\">";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\">";
                strHTML += "અ.નું.";
                strHTML += "</td>";
                strHTML += "<td  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\">";
                strHTML += "મંડળીનું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "મંડળી પ્રકાર";
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
                //cmd = new SqlCommand("InstitutionHtmlReport", conn);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = InstituteID;
                //dsDetail = new DataSet();
                //SqlDataAdapter adpDetail = new SqlDataAdapter(cmd);
                //adpDetail.Fill(dsDetail);
               
                strHTML += "</thead>";
                
                var institutename = "0";
                var institutetypename = "0";               
                var TM = 0;
                var TF = 0;
                var TP = 0;
                int temp =0,count=0;
                var No = 1;
                strHTML += "<tbody>";
                if (dsDetail.Tables["Table"].Rows.Count > 0)
                {
                    for (int c = 0; c < dsDetail.Tables["Table"].Rows.Count; c++)
                    {
                        
                        if (dsDetail.Tables["Table"].Rows[c]["InstituteName"].ToString() != institutename)
                        {
                            TM = 0;
                            TF = 0;
                            TP = 0;
                            strHTML += "<tr>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\" rowspan=" + dsDetail.Tables["Table"].Rows[c]["Rowspan"].ToString() + " >";
                            strHTML += No;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\" rowspan=" + dsDetail.Tables["Table"].Rows[c]["Rowspan"].ToString() + " >";
                            strHTML += dsDetail.Tables["Table"].Rows[c]["InstituteName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\" rowspan=" + dsDetail.Tables["Table"].Rows[c]["Rowspan"].ToString() + " >";
                            strHTML += dsDetail.Tables["Table"].Rows[c]["InstituteTypeName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += dsDetail.Tables["Table"].Rows[c]["VillageName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Male"].ToString());
                            TM = TM + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Male"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Female"].ToString());
                            TF = TF + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Female"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                            strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Total"].ToString());
                            TP = TP + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Total"].ToString());
                            strHTML += "</td>";
                            strHTML += "</tr>";
                            temp = Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Rowspan"].ToString());
                            count = temp + c;

                                institutename = dsDetail.Tables["Table"].Rows[c]["InstituteName"].ToString();                              
                                institutetypename = dsDetail.Tables["Table"].Rows[c]["InstituteTypeName"].ToString();
                                if (dsDetail.Tables["Table"].Rows.Count == 1)
                                {
                                    strHTML += "<td colspan = 3 style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                    strHTML += "</td>";

                                    strHTML += "<td style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray; border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                    strHTML += "કુલ";
                                    strHTML += "</td>";
                                    strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                    strHTML += changeNumericToWords(TM.ToString());
                                    strHTML += "</td>";
                                    strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                                    strHTML += changeNumericToWords(TF.ToString());
                                    strHTML += "</td>";
                                    strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                                    strHTML += changeNumericToWords(TP.ToString());
                                    strHTML += "</td>";
                                }
                                else
                                {
                                    c++;
                                    var abc = dsDetail.Tables["Table"].Rows[c]["InstituteName"].ToString();
                                    if (institutename != abc)
                                    {
                                        strHTML += "<td colspan = 3 style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                        strHTML += "</td>";

                                        strHTML += "<td style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                        strHTML += "કુલ";
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                        strHTML += changeNumericToWords(TM.ToString());
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                                        strHTML += changeNumericToWords(TF.ToString());
                                        strHTML += "</td>";
                                        strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                                        strHTML += changeNumericToWords(TP.ToString());
                                        strHTML += "</td>";
                                    }
                                    c--;
                                }
                                No++;
                        }
                        else {
                            if (dsDetail.Tables["Table"].Rows[c]["InstituteTypeName"].ToString() == institutetypename)
                            {


                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += dsDetail.Tables["Table"].Rows[c]["VillageName"].ToString();
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Male"].ToString());
                                TM = TM + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Male"].ToString());
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Female"].ToString());
                                TF = TF + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Female"].ToString());
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Total"].ToString());
                                TP = TP + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Total"].ToString());
                                strHTML += "</td>";
                                strHTML += "</tr>";
                                    institutename = dsDetail.Tables["Table"].Rows[c]["InstituteName"].ToString();
                                    institutetypename = dsDetail.Tables["Table"].Rows[c]["InstituteTypeName"].ToString(); 
                            }
                            else {
                                
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                strHTML += dsDetail.Tables["Table"].Rows[c]["InstituteTypeName"].ToString();
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += dsDetail.Tables["Table"].Rows[c]["VillageName"].ToString();
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Male"].ToString());
                                TM = TM + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Male"].ToString());
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Female"].ToString());
                                TF = TF + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Female"].ToString());
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += changeNumericToWords(dsDetail.Tables["Table"].Rows[c]["Total"].ToString());
                                TP = TP + Convert.ToInt16(dsDetail.Tables["Table"].Rows[c]["Total"].ToString());
                                strHTML += "</td>";
                                strHTML += "</tr>";                               
                                    institutename = dsDetail.Tables["Table"].Rows[c]["InstituteName"].ToString();                                   
                                    institutetypename = dsDetail.Tables["Table"].Rows[c]["InstituteTypeName"].ToString();
                            }
                            if (c == count -1)
                            {
                                strHTML += "<td colspan = 3 style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                                strHTML += "કુલ";
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                                strHTML += changeNumericToWords(TM.ToString());
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                                strHTML += changeNumericToWords(TF.ToString());
                                strHTML += "</td>";
                                strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;text-align:center;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                                strHTML += changeNumericToWords(TP.ToString());
                                strHTML += "</td>";
                            }
                          
                        }
                      
                    }
                    strHTML += "<tr>";
                    strHTML += "<td colspan = 3 style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                    strHTML += "</td>";
                    strHTML += "<td style=\"border:solid 0.5pt silver;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top;text-align:center\">";
                    strHTML += "કુલ ગણતરી";
                    strHTML += "</td>";
                    strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\">";
                    strHTML += changeNumericToWords(dsDetail.Tables["Table1"].Rows[0]["TotalMale"].ToString());
                    strHTML += "</td>";
                    strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                    strHTML += changeNumericToWords(dsDetail.Tables["Table1"].Rows[0]["TotalFemale"].ToString());
                    strHTML += "</td>";
                    strHTML += "<td style=\"border:solid 0.5pt silver;text-align: center;vertical-align:middle;font-weight:bold;background-color:lightgray;border-collapse:collapse;font-size:12px;vertical-align:top\" >";
                    strHTML += changeNumericToWords(dsDetail.Tables["Table1"].Rows[0]["Total"].ToString());
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