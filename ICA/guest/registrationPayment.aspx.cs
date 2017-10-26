using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ICA.registrationViewModel;
using ICA.Logic;
using System.Configuration;
using Oracle.DataAccess.Client;
using System.Data;

namespace ICA
{
    public partial class registrationPayment : System.Web.UI.Page
    {
        logic logic = new logic();
        string _userEmail = "";
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        int _membertypeid = 3;
        DataTable _paymenttable = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if(Session["UserEmail"] == null)
                {
                    Response.Redirect("~/ICA/signIn.aspx.aspx");
                }
                
                else
                {
                    _userEmail = Session["UserEmail"].ToString();
                    emailDisplay.Text = _userEmail.ToLower();
                }

                // populate payment item from the database
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GET_MEMCAT_FEES", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("V_MEMBERTYPEID", OracleDbType.Int32, Convert.ToInt32(_membertypeid), ParameterDirection.Input));
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);

                da.Fill(_paymenttable);

                paymentCatID.DataSource = _paymenttable;
                paymentCatID.DataBind();
                //paymentCatID.DataTextField = "PAYMENTTEXT";
                //paymentCatID.DataValueField = "MEMBERCATEGORYID";
               

            }
        }
    }
}