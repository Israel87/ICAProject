using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        //MailWebService.WebServiceSoapClient sendmail = new MailWebService.WebServiceSoapClient();
        EmailWS.WebService Emal = new EmailWS.WebService();

        protected void Page_Load(object sender, EventArgs e)
        {
            emailLabel.Text = "";
        }

        protected void forgotPasswordID_Click(object sender, EventArgs e)
        {
            try
            {

                String Pwd = emailID.Value.Substring(0, 3) + DateTime.Now.ToString("mmss");
                String Email = emailID.Value.ToString();
                insertForgotPassword(Email, Pwd);


            }
            catch (Exception ex)
            {

            }
        }

        public void insertForgotPassword(String _email, string _password)
        {
            try
            {
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("FORGOT_PASSWORD", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new OracleParameter("V_USERNAME", OracleDbType.Varchar2, _email, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PASSWORD", OracleDbType.Varchar2, _password, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("RETVAL", OracleDbType.Int32)).Direction = ParameterDirection.Output;

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }

                        try
                        {
                            cmd.ExecuteNonQuery();

                            int _retValStatus = Convert.ToInt32(cmd.Parameters["RETVAL"].Value.ToString());

                            if (_retValStatus == 1)
                            {
                                string _subject = "PASSWORD RESET";
                                Emal.sendmail1(_email, _subject, "Your New Password is " + _password + "<br/>Please Sign in to ICA Member Portal to Change your Password.");
                                emailLabel.Text = "Password Reset was Successful. Check your email for next step";
                            }
                            else
                            {
                                emailLabel.Text = "Email Does not Exist.";
                            }
                            //emailLabel.Text = _retValStatus.ToLower() == "Success" ? "Password Reset was Successful. Check your email for next step" : "Email Does not Exist.";

                        }
                        catch (Exception ex)
                        {

                        }

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}