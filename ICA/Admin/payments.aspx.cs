using Oracle.ManagedDataAccess.Client;
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
        ICA.Model.Util utilities = new Model.Util();
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;

        DataTable _memCategoryReport = new DataTable();
        string emailinSession = "";
        string _useridInSession = "";

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
                _useridInSession = Session["UserID"].ToString();

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
              //  Session["mc"] = _memCategoryReport;

            }

           

        }

        // generate report by member types.
        public DataSet GetReportByMemberTypes(string _memberTypeID)
        {

            DataSet dt = new DataSet();
           
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

            DataSet dt = null;

            try {

            dt = GetReportByMemberTypes(reportType);


            if (dt != null && dt.Tables.Count > 0)
            {
                    //string html = ""; int count = 1;

                    //foreach (DataRow item in dt.Rows)
                    //{
                    //    html += "<tr style='line-height:20px'><td>" + (count++) + "</td><td>" + item["FULLNAME"] + "</td><td>" + item["USERNAME"] + "</td><td>" + item["MEMBERCATEGORY"] + "</td><td>" + item["PAYMENTREFERENCE"] + "</td><td>" + item["TRANSACTION DATE"] + "</td><td>" + item["AMOUNT"] + "</td><td>" + item["DESCRIPTION"] + "</td><td>" + item["APPLICATION STATUS"] + "</td></tr>";
                    //}


                    //t_body.InnerHtml = html;
                    exportExcel.Visible = true;
                    gvData.DataSource = dt;
                    gvData.DataBind();
                    Session["dt"] = dt;

                }
            else
            {

                    // Response.Write("<script>alert('No Data Record Found.');</script>");
                    DataRecordNotification.Text = utilities.ShowError("Data Record Not Found.");
                   // t_body.InnerHtml = err;
            }
            }
            catch (Exception ex)
            {

            }


        }

        protected void gvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvData.PageIndex = e.NewPageIndex;
            gvData.DataBind();

        }

        protected void gvData_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerrow = gvData.BottomPagerRow;
            Label pageno = (Label)pagerrow.Cells[0].FindControl("L3");
            Label totalpageno = (Label)pagerrow.Cells[0].FindControl("L4");

            if ((pageno != null) && (totalpageno != null))
            {
                int pagen = gvData.PageIndex + 1;
                int tot = gvData.PageCount;

                pageno.Text = pagen.ToString();
                totalpageno.Text = tot.ToString();
            }
            else
            {
              
            }
        }

        protected void exportExcel_Click(object sender, EventArgs e)
        {
            utilities.ExportToExcel(((DataSet)Session["dt"]), HttpContext.Current, "Payment Types");
            //Utils.ExportToExcel(((DataSet)Session["ds"]), HttpContext.Current, "DetailedFinancialReport");
        }



        void BindGrid()
        {

            gvData.DataSource = ((DataSet)Session["dt"]);
            gvData.DataBind();

        }
    }
}