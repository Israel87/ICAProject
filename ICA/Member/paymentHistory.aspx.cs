using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Member
{
    public partial class paymentHistory : System.Web.UI.Page
    {
        string emailinSession = "";
        int biodataidInSession;

        //string _firstname = "";

        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        ICA.Model.Util utilities = new Model.Util();
        DataSet _payHistory = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] == null)
                {

                    Response.Redirect("/ICA/signIn.aspx");
                }
                else
                {
                    //_userSession = Session["UserID"].ToString();
                    emailinSession = Session["UserEmail"].ToString();
                    biodataidInSession = Convert.ToInt32(Session["BiodataID"]);
                   // _firstname = Session["active_firstname"].ToString();
                    //username.Text = _firstname;


                }

            }

            // Display Payment History using userid.
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;


            OracleCommand cmd = new OracleCommand("USER_PAYHISTORY", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new OracleParameter("v_userid", OracleDbType.Int32, Convert.ToInt32(biodataidInSession), ParameterDirection.Input));
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(_payHistory);

            if (_payHistory != null && _payHistory.Tables.Count > 0)
            {
                excelExport.Visible = true;
                payHistoryID.DataSource = _payHistory;
                payHistoryID.DataBind();
                Session["_payHistory"] = _payHistory;

            }
            else
            {
                paymentHistoryNotification.Text = utilities.ShowSuccessWithoutClose("No Payment History Found.");
            }

        }

        protected void payHistoryID_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            payHistoryID.PageIndex = e.NewPageIndex;
            payHistoryID.DataBind();
        }

        protected void payHistoryID_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerrow = payHistoryID.BottomPagerRow;
            if (pagerrow != null )
            {

                Label pageno = (Label)pagerrow.Cells[0].FindControl("L3");
                Label totalpageno = (Label)pagerrow.Cells[0].FindControl("L4");

                if ((pageno != null) && (totalpageno != null))
                {
                    int pagen = payHistoryID.PageIndex + 1;
                    int tot = payHistoryID.PageCount;

                    pageno.Text = pagen.ToString();
                    totalpageno.Text = tot.ToString();
                }
                 
            }
            else
            {
                //Response.Redirect(Request.RawUrl);
                paymentHistoryNotification.Text = utilities.ShowSuccessWithoutClose("No Payment History Available. ");
               
              
            }

            Response.Redirect("/ICA/Member/makePayment.aspx");
        }

        protected void excelExport_Click(object sender, EventArgs e)
        {
            utilities.ExportToExcel(((DataSet)Session["_payHistory"]), HttpContext.Current, "Payment History SpreadSheet");
        }

        void BindGrid()
        {

            payHistoryID.DataSource = ((DataSet)Session["_payHistory"]);
            payHistoryID.DataBind();

        }
    }
}