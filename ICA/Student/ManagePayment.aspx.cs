using System;
using Oracle.ManagedDataAccess.Client;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Student
{
    public partial class payments : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        string emailinSession = "";
        int _useridInSession;
        string _firstname = "";
        DataTable _payHistory = new DataTable();

        ICA.Model.Util utilities = new Model.Util();

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
                    _useridInSession = Convert.ToInt32(Session["UserID"]);
                    emailDisplay.Value = emailinSession;
                    // _firstname = Session["active_firstname"].ToString();
                    // username.Text = _firstname;


                }

                // Populate dropdown with the specific payment item for the user.
                try
                {
                    using (OracleConnection conn = new OracleConnection(cs))
                    {
                        OracleDataAdapter da;
                        OracleCommand cmd = new OracleCommand("GET_OUTSTANDING_BYUSER", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new OracleParameter("v_userid", OracleDbType.Int32, _useridInSession, ParameterDirection.Input));
                        cmd.Parameters.Add("cur", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                        da = new OracleDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        if (dt != null && dt.Rows.Count > 0)
                        {
                            paymentCatID.DataSource = dt;
                            paymentCatID.DataBind();
                        }
                        else
                        {
                            recordList.Text = utilities.ShowInfo("No Outstanding Payment.");
                        }


                        // return list of payment history
                        string html = "";
                        OracleDataAdapter da2;
                        OracleCommand cmd2 = new OracleCommand("USER_PAYHISTORY", conn);
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.Parameters.Add(new OracleParameter("v_userid", OracleDbType.Int32, _useridInSession, ParameterDirection.Input));
                        cmd2.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                        da2 = new OracleDataAdapter(cmd2);
                        da2.Fill(_payHistory);

                        if (_payHistory != null && _payHistory.Rows.Count > 0)
                        {

                            foreach (DataRow item in _payHistory.Rows)
                            {
                                html += "<td>" + item["DESCRIPTION"] + "</td><td>" + item["TIMESTAMP"] + "</td><td>" + item["RESPONSE"] + "</td><td>" + item["PAYMENTREFERENCE"] + "</td></tr>";
                                t_body.InnerHtml = html;

                            }

                            //excelExport.Visible = true;
                            //payHistoryID.DataSource = _payHistory;
                            //payHistoryID.DataBind();
                            //Session["_payHistory"] = _payHistory;

                        }
                        else
                        {
                            html = "No payment history available";
                            // paymentHistoryNotification.Text = utilities.ShowSuccessWithoutClose("No Payment History Found.");
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}