using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Admin
{
    public partial class Manage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;

        DataTable _memCategoryReport = new DataTable();
        DataTable _appStatus = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GETMEMCATLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_memCategoryReport);


                memberCatID.DataSource = _memCategoryReport;
                memberCatID.DataBind();

            }


            if (!IsPostBack)
            {

                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

      
                OracleCommand cmd = new OracleCommand("GETAPPSTATUS", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_appStatus);


                appStatusID.DataSource = _appStatus;
                appStatusID.DataBind();

            }
        }

        protected void manageRegID_Click(object sender, EventArgs e)
        {
            //to generate registration details based on selected values from the drop down.
            string appStatus = appStatusID.Value;
            string memTypes = memberCatID.Value;

            DataTable dt = null;

            try
            {

                dt = GetRegistrationDetails(appStatus, memTypes);


                if (dt != null && dt.Rows.Count >= 0)
                {
                    string html = ""; int count = 1;
                    foreach (DataRow item in dt.Rows)
                    {
                        html += "<tr><td>" + (count++) + "</td><td>" + item["FULLNAME"] + "</td><td>" + item["USERNAME"] + "</td><td>" + item["MEMBERCATEGORY"] + "</td><td>" + item["APPLICATION STATUS"] + "</td></tr>";
                    }


                    t_body.InnerHtml = html;
                    //gvData.DataSource = dt;
                    //gvData.DataBind();

                }
                else
                {
                    Response.Write("<script>alert('No Record Found...');</script>");
                }



            }
            catch (Exception ex)
            {

            }


        }


        public DataTable GetRegistrationDetails(string _appStatus, string _memberTypes)
        {

            DataTable dt = new DataTable();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            OracleCommand cmd = new OracleCommand("GET_PENDING_USERS", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new OracleParameter("V_FLAG", OracleDbType.Int32, _appStatus, ParameterDirection.Input));
            cmd.Parameters.Add(new OracleParameter("V_MEMTYPE", OracleDbType.Int32, _memberTypes, ParameterDirection.Input));
            
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;

        }
    }
}