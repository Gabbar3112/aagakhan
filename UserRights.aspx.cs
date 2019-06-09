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

public partial class UserRights : System.Web.UI.Page
{
    public static string formname = "UserRights";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Index.aspx?RedirectTo=UserRights.aspx", true);
        if (!Page.IsPostBack)
        {
            BindDetail();
        }
    }

    private void BindDetail()
    {
        DataTable userrights = new DataTable();
        userrights.Columns.Add("FormType");
        userrights.Columns.Add("FormDisplayName");
        userrights.Columns.Add("Insert");
        userrights.Columns.Add("Update");
        userrights.Columns.Add("Delete");
        userrights.Columns.Add("View");
        userrights.Columns.Add("SMS");
        userrights.Columns.Add("Mail");
        userrights.Columns.Add("Print");
        userrights.Rows.Add();
        gvUserRights.DataSource = userrights;
        gvUserRights.DataBind();
    }


    [WebMethod]
    public static List<ListItem> BindUser(int UserTypeID)
    {
        
        List<ListItem> User = new List<ListItem>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
        con.Open();
        SqlCommand cmd = new SqlCommand("ListUsersByUserType", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@UserTypeID", SqlDbType.BigInt).Value = UserTypeID;
        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                User.Add(new ListItem
                {
                    Value = sdr["UserID"].ToString(),
                    Text = sdr["UserName"].ToString(),
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
        return User;
    }

    [WebMethod]
    public static List<ListItem> BindInstitute(int ClusterID)
    {
        List<ListItem> User = new List<ListItem>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("ListInstituteByCluster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClusterID", SqlDbType.BigInt).Value = ClusterID;
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    User.Add(new ListItem
                    {
                        Value = sdr["InstituteID"].ToString(),
                        Text = sdr["InstituteNameG"].ToString(),
                    });
                }
            }
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "BindInstitute");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return User;
    }

    [WebMethod]
    public static string GetFormType(int UserID, int UserTypeID)
    {
        string query = "GetUserRightsByUserID";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        
        cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = UserID;
        if (UserTypeID == 1 || UserTypeID == 2)
        {
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = "AdminOrCluster";
        }
        else if (UserTypeID == 4)
        {
            cmd.Parameters.Add("@LoginType", SqlDbType.NVarChar).Value = "Institute";
        }
        
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
                    sda.Fill(ds, "FormsType");
                    return ds;
                }
            }
        }
    }

    public class UserRightsData
    {
        public int UserTypeID { get; set; }
        public int UserID { get; set; }
        public int FormID { get; set; }
        public int RightsID { get; set; }
    }

    [WebMethod]
    [ScriptMethod]
    public static string UserRightsManage(UserRightsData UserRights)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UserRightsInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FormID", SqlDbType.BigInt).Value = UserRights.FormID;
            cmd.Parameters.Add("@UserTypeID", SqlDbType.BigInt).Value = UserRights.UserTypeID;
            cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = UserRights.UserID;
            cmd.Parameters.Add("@RightsID", SqlDbType.BigInt).Value = UserRights.RightsID;
            
            if (UserRights.UserTypeID == 1 || UserRights.UserTypeID == 2)
            {
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = "AdminOrCluster";
            }
            else if (UserRights.UserTypeID == 4)
            {
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = "Institute";
            }
            cmd.ExecuteNonQuery();
            con.Close();
            msg = "Successfully Inserted";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "UserRightsManage");
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
    public static string UserRightsDelete(int UserID, int UserTypeID)
    {
        string msg = string.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AagakhanConnectionString"].ConnectionString);
        try
        {
           
            con.Open();

            SqlCommand cmd = new SqlCommand("UserRightsDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("UserID", SqlDbType.BigInt).Value = UserID;
            if (UserTypeID == 1 || UserTypeID == 2)
            {
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = "AdminOrCluster";
            }
            else if (UserTypeID == 4)
            {
                cmd.Parameters.Add("@LoginType", SqlDbType.VarChar).Value = "Institute";
            }
            cmd.ExecuteNonQuery();
            con.Close();
            msg = "Successfully Deleted";
        }
        catch (Exception ex)
        {
            Global.ErrorInsert(ex.Message, formname, "UserRightsManage");
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