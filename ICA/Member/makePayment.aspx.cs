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
    public partial class makePayment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        string emailinSession = "";
        int _useridInSession;
        string _firstname = "";
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
                    username.Text = _firstname;


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
                    }  
                }
                catch (Exception ex)
                {

                }

            }
        }
    }
}