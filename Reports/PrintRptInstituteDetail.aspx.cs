using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintRptInstituteDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["InstituteID"] != "")
            {
                PrintReport(Convert.ToInt16(Request.QueryString["InstituteID"]));
            }
        }
    }

    public void PrintReport(int InstituteID)
    {

        string strHTML = "";
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("rptInstituteMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InstituteID", SqlDbType.BigInt).Value = InstituteID;
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                strHTML += "<html>";
                strHTML += "<head>";
                strHTML += "<title>Report</title>";
                strHTML += "</head>";
                strHTML += "<body>";
                strHTML += "<table style=\"margin:0 auto\" width=\"100%;\">";
                strHTML += "<thead>";
                strHTML += "<tr>";
                strHTML += "<td colspan=\"50\" style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:20px;font-weight:bold;width:30px;text-align:center\">";
                strHTML += "Institution Information   ";
                //strHTML += ds.Tables[0].Rows[0]["MonthName"].ToString() + "-" + ds.Tables[0].Rows[0]["MonthYear"].ToString();
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "<tr>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\">";
                strHTML += "અ.નું.";
                strHTML += "</td>";
                strHTML += "<td  style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\">";
                strHTML += "મંડળીનું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "પુરુષ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "સ્ત્રી";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\"  >";
                strHTML += "ટોટલ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "ફોર્મેસન તારીખ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "મંડળી પ્રકાર";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\"  >";
                strHTML += "ગામનું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\">";
                strHTML += "બેંક નું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:40px;text-align:center\">";
                strHTML += "શાખા નું નામ";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:30px;text-align:center\">";
                strHTML += "એકાઉન્ટ નંબર";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:20px;text-align:center\">";
                strHTML += "નોંધણી કરાવેલ છે?!";
                strHTML += "</td>";
                strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;width:30px;text-align:center\">";
                strHTML += "નોંધણી નંબર";
                strHTML += "</td>";
                strHTML += "</tr>";
                strHTML += "</thead>";
                strHTML += "<tbody>";
                string Institute = "";
                if (ds.Tables[0].Rows.Count > 0)
                {
                    decimal T = 0;
                    int num = 1;
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        if (ds.Tables[0].Rows[i]["InstituteNameG"].ToString() != Institute)
                        {
                            Institute = ds.Tables[0].Rows[i]["InstituteNameG"].ToString();

                            strHTML += "<tr>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += num;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px\">";
                            strHTML += ds.Tables["Table"].Rows[i]["InstituteNameG"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["Male"].ToString();
                            //M += Convert.ToDecimal(ds.Tables["Table"].Rows[i]["Male"].ToString());
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["Female"].ToString();
                            //F += Convert.ToDecimal(ds.Tables["Table"].Rows[i]["Female"].ToString());
                            strHTML += "</td>";
                            T = Convert.ToDecimal(ds.Tables["Table"].Rows[i]["Male"].ToString()) + Convert.ToDecimal(ds.Tables["Table"].Rows[i]["Female"].ToString());
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += T;
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["FormationDate"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px\">";
                            strHTML += ds.Tables["Table"].Rows[i]["InstituteType"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["VillageName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px\">";
                            strHTML += ds.Tables["Table"].Rows[i]["BankName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px\">";
                            strHTML += ds.Tables["Table"].Rows[i]["BranchName"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["AccountNumber"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["RegStatus"].ToString();
                            strHTML += "</td>";
                            strHTML += "<td style=\"border:solid 0.5pt silver;border-collapse:collapse;font-size:12px;text-align:center\">";
                            strHTML += ds.Tables["Table"].Rows[i]["RegNoG"].ToString();
                            strHTML += "</td>";
                            strHTML += "</tr>";
                            T = 0;
                            num++;
                        }
                        
                    }
                }
                strHTML += "</tbody>";

                strHTML += "</table>";
                strHTML += "</body>";
                strHTML += "</html>";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "JS", "javascript:hello(this.value); ", true);

            }
        }
        catch (Exception ex)
        {

        }
        dvReport.InnerHtml = strHTML;
    }
}