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

public partial class MasterPage : System.Web.UI.MasterPage
{
    public static string formname = "MasterPage";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Global.conn.Open();

            SqlCommand cmdA = new SqlCommand("GetUserRightsByUserIDForMenu", Global.conn);
            cmdA.CommandType = CommandType.StoredProcedure;
            cmdA.Parameters.Add("@UserID", SqlDbType.BigInt).Value = HttpContext.Current.Session["UserID"];
            cmdA.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = HttpContext.Current.Session["LoginType"];
            DataTable dsRights = new DataTable();
            SqlDataAdapter adprights = new SqlDataAdapter(cmdA);
            adprights.Fill(dsRights);
            cmdA.Dispose();

            cmdA = new SqlCommand("ListForm", Global.conn);
            cmdA.CommandType = CommandType.StoredProcedure;
            //cmdA.Parameters.Add("@FormType", SqlDbType.VarChar).Value = "ALL";
            DataTable dsForms = new DataTable();
            SqlDataAdapter adpform = new SqlDataAdapter(cmdA);
            adpform.Fill(dsForms);
            cmdA.Dispose();

            if (dsRights.Rows.Count > 0)
            {
                for (int i = 0; i < dsRights.Rows.Count; i++)
                {
                    DataView dv = new DataView(dsForms);
                    dv.RowFilter = "FormNameID='" + dsRights.Rows[i]["FormNameID"].ToString() + "'";
                    DataView dvFT = new DataView(dsForms);
                    dvFT.RowFilter = "FormType='" + dsRights.Rows[i]["FormType"].ToString() + "'";

                    if (dvFT.ToTable().Rows.Count > 0)
                    {
                        if (dvFT.ToTable().Rows[0]["FormType"].ToString() == "MASTERS")
                        {
                            if (dsRights.Rows.Count > 0)
                                liMaster.Style.Add("display", "block");
                            else
                                liMaster.Style.Add("display", "none");
                        }
                        if (dvFT.ToTable().Rows[0]["FormType"].ToString() == "TRANSACTION")
                        {
                            liTransaction.Style.Add("display", "block");
                        }
                        if (dvFT.ToTable().Rows[0]["FormType"].ToString() == "UTILITY")
                        {
                            liUtility.Style.Add("display", "block");
                        }
                        if (dvFT.ToTable().Rows[0]["FormType"].ToString() == "REPORTS")
                        {
                            liReport.Style.Add("display", "block");
                        }
                        if (dvFT.ToTable().Rows[0]["FormType"].ToString() == "MAP")
                        {
                            liMap.Style.Add("display", "block");
                        }
                    }

                    if (dv.ToTable().Rows.Count > 0)
                    {
                        for (int ii = 0; ii < dv.ToTable().Rows.Count; ii++)
                        {
                            string cnt = "";
                            SqlCommand cmd = new SqlCommand("GetUserRightsFormWise", Global.conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = Convert.ToInt64(Session["UserID"]);
                            cmd.Parameters.Add("@FormNameID", SqlDbType.NVarChar).Value = dv.ToTable().Rows[ii]["FormNameID"].ToString();

                            DataSet ds = new DataSet();
                            SqlDataAdapter adp = new SqlDataAdapter(cmd);
                            adp.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                cnt = ds.Tables[0].Rows[0]["TotalRights"].ToString();

                                if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aCircleMaster" && cnt != "0")
                                {
                                    licirclemaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aDivisionMaster" && cnt != "0")
                                {
                                    lidivisionmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aSubDivisionMaster" && cnt != "0")
                                {
                                    lisubdivisionmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aSectionMaster" && cnt != "0")
                                {
                                    lisectionmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aBeatMaster" && cnt != "0")
                                {
                                    libeatmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aCanalMaster" && cnt != "0")
                                {
                                    licanalmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aFarmerMaster" && cnt != "0")
                                {
                                    lifarmermaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aInstituteTypeMaster" && cnt != "0")
                                {
                                    liinstitutetypemaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aInstituteMaster" && cnt != "0")
                                {
                                    liinstitutemaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aMemberMaster" && cnt != "0")
                                {
                                    limembermaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aPakMaster" && cnt != "0")
                                {
                                    lipakmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aBhavPatrakMaster" && cnt != "0")
                                {
                                    libhavpatrakmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aActivityEventTrainingMaster" && cnt != "0")
                                {
                                    liactivityeventtrainingmaster.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aActivityEventTrainingType" && cnt != "0")
                                {
                                    liactivityeventtrainingtype.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aActivityEventTrainingVigat" && cnt != "0")
                                {
                                    liactivityeventtrainingvigat.Style.Add("display", "block");
                                }




                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aSectionVillageMapping" && cnt != "0")
                                {
                                    lisectionvillagemapping.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aVillageBeatMapping" && cnt != "0")
                                {
                                    livillagebeatmapping.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aInstituteVillageMapping" && cnt != "0")
                                {
                                    liinstitutevillagemapping.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aBeatCanalMapping" && cnt != "0")
                                {
                                    libeatcanalmapping.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aActivityEventTrainingDetails" && cnt != "0")
                                {
                                    liactivityeventtrainingdetails.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aMangnaPatrak" && cnt != "0")
                                {
                                    limangnapatrak.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aManganaPatrakList" && cnt != "0")
                                {
                                    limangnapatraklist.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aReceiptMaster" && cnt != "0")
                                {
                                    lireceiptmaster.Style.Add("display", "block");
                                }


                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptCanalDetail" && cnt != "0")
                                {
                                    lirptcanaldetail.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptInstituteSummary" && cnt != "0")
                                {
                                    lirptinstitutesummary.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptInstituteDetail" && cnt != "0")
                                {
                                    lirptinstitutedetail.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptPIMMemberDetail" && cnt != "0")
                                {
                                    lirptPIMmemberdetail.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptActivityEventTraining" && cnt != "0")
                                {
                                    lirptactivityeventtraining.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aBakiFormDetail" && cnt != "0")
                                {
                                    libakiformdetail.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aMembershipDetail" && cnt != "0")
                                {
                                    limembershipdetail.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptForm12" && cnt != "0")
                                {
                                    lirptform12.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aRptSummaryOfWaterchargeRecovery" && cnt != "0")
                                {
                                    liarptsummaryofwaterchargerecovery.Style.Add("display", "block");
                                }



                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aMap" && cnt != "0")
                                {
                                    liPiyatMandliMap.Style.Add("display", "block");
                                }


                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aUserMaster" && cnt != "0")
                                {
                                    liuser.Style.Add("display", "block");
                                }
                                else if (dv.ToTable().Rows[ii]["FormNameID"].ToString() == "aUserRights" && cnt != "0")
                                {
                                    liuserrights.Style.Add("display", "block");
                                }
                            }
                            ii++;
                        }
                    }
                }
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Ming", "swal('', " + ex.Message + ", 'warning');", true);
            Global.ErrorInsert(ex.Message, "Master.aspx", "Page_Load");
        }
        finally
        {
            if (Global.conn.State == ConnectionState.Open)
                Global.conn.Close();
        }
    }
    //protected void Page_Init(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
    //        Response.Cache.SetNoStore();
    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "Ming", "swal('', '" + ex.Message + "', 'warning');", true);
    //        Global.ErrorInsert(ex.Message, "Master.aspx", "Page_Init");
    //    }
    //}
}
