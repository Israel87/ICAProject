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
    public partial class payments : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        DataTable _memCategoryReport = new DataTable();
        string emailinSession = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserEmail"] == null)
            {

                Response.Redirect("/ICA/signIn.aspx");
            }
            else
            {
                //_userSession = Session["UserID"].ToString();
                emailinSession = Session["UserEmail"].ToString();


            }


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


                memcatID.DataSource = _memCategoryReport;
                memcatID.DataBind();

            }


        }

        // generate report by member types.
        public DataTable GetReportByMemberTypes(string _memberTypeID)
        {
         
            DataTable dt = new DataTable();
           
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();
            OracleDataAdapter da;
            OracleCommand cmd = new OracleCommand("GET_MEMBERBYTYPE", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new OracleParameter("V_MEMTYPE", OracleDbType.Int32, _memberTypeID, ParameterDirection.Input));
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;


            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;

        }

        protected void generateReport_Click(object sender, EventArgs e)
        {
            string reportType = memcatID.Value;

            DataTable dt = null;

            try {

            dt = GetReportByMemberTypes(reportType);


            if (dt != null && dt.Rows.Count > 0)
            {
                string html = ""; int count = 1;
                   
                foreach (DataRow item in dt.Rows)
                {
                    html += "<tr style='line-height:20px'><td>" + (count++) + "</td><td>" + item["FULLNAME"] + "</td><td>" + item["USERNAME"] + "</td><td>" + item["MEMBERCATEGORY"] + "</td><td>" + item["PAYMENTREFERENCE"] + "</td><td>" + item["TRANSACTION DATE"] + "</td><td>" + item["AMOUNT"] + "</td><td>" + item["DESCRIPTION"] + "</td><td>" + item["APPLICATION STATUS"] + "</td></tr>";
                }


                t_body.InnerHtml = html;
                //gvData.DataSource = dt;
                //gvData.DataBind();

            }
            else
            {
                    string err = "<tr style='line-height:100px text-align: center'><td>" + "No Record Found" + "</td></tr>";

                    //Response.Write("<script>alert('No Record Found...');</script>");
                    t_body.InnerHtml = err;
            }



            }
            catch (Exception ex)
            {

            }











        }
    }
}