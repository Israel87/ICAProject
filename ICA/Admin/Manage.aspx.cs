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

                //try
                //{
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
            //
        }
    }
}