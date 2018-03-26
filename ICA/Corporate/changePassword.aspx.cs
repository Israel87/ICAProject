using System;
using Oracle.ManagedDataAccess.Client;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Corporate
{
    public partial class changePassword : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        DataTable _userdata = new DataTable();
        string emailinSession = "";
        //string _firstname = "";
        bool gChange;

        ICA.Model.Util utilities = new Model.Util();
        //string _dbPassword = "";


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
                    // _firstname = Session["active_firstname"].ToString();
                    // username.Text = _firstname;


                }

            }

        }

        protected void change_Click(object sender, EventArgs e)
        {
            string _currentPassword = currentPass.Value.ToString();
            string _newPassword = newPass.Value.ToString();
            //string _confPassword = confirm.Value.ToString();
            string _userEmail = Session["UserEmail"].ToString();
            // string _oldPassword = Session["active_dbPassword"].ToString();


            try
            {
                //if (_newPassword != _confPassword)
                //{
                //    passwordCheck.Text = utilities.ShowError("Passwords do not match.");
                //}

                _changePassword(_userEmail, _currentPassword, _newPassword);

                if (gChange != true)
                {
                    passwordCheck.Text = utilities.ShowError("Current Password does not match any record in the Database.");

                }
                else
                {



                    passwordCheck.Text = utilities.ShowSuccess("Password Successfully Changed.");

                }


            }
            catch (Exception ex)
            {

            }


        }

        private bool _changePassword(string _username, string _dbpswd, string _newpswd)
        {
            bool change = false;

            //try
            //{
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();
            OracleCommand Orcl = new OracleCommand("change_password", conn);
            Orcl.Parameters.Add(new OracleParameter("v_username", OracleDbType.Varchar2, _username, ParameterDirection.Input));
            Orcl.Parameters.Add(new OracleParameter("v_old_password", OracleDbType.Varchar2, _dbpswd, ParameterDirection.Input));
            Orcl.Parameters.Add(new OracleParameter("v_new_password", OracleDbType.Varchar2, _newpswd, ParameterDirection.Input));
            Orcl.Parameters.Add(new OracleParameter("RETVAL", OracleDbType.Int32)).Direction = ParameterDirection.Output;
            Orcl.CommandType = CommandType.StoredProcedure;


            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            try
            {
                Orcl.ExecuteNonQuery();
                int retval = Convert.ToInt32(Orcl.Parameters["RETVAL"].Value.ToString());

                if (retval > 0)
                    change = true;

                gChange = change;


            }
            catch (Exception ex)
            {


            }
            return change;
            //}
            //catch (Exception ex)
            //{

            //}

        }
    }
}