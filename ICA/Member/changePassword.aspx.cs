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
    public partial class changePassword : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        DataTable _userdata = new DataTable();
        string emailinSession = "";
        string _firstname = "";
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
                    username.Text = _firstname;


                }

            }

        }

        protected void change_Click(object sender, EventArgs e)
        {
            string _currentPassword = currentPass.Value.ToString();
            string _newPassword = newPass.Value.ToString();
            string _confPassword = confirm.Value.ToString();
           string _userEmail = Session["UserEmail"].ToString();
           // string _oldPassword = Session["active_dbPassword"].ToString();


            try
            {
                if (_newPassword != _confPassword)
                {
                    errorLbl.Text = "password mismatch, please type in correct match";
                }
                   
                else 
                {

                    _changePassword(_userEmail, _currentPassword, _newPassword);
                    succLbl.Text = "Password Successfully Changed.";


                    //try
                    //{
                    //    OracleConnection conn = new OracleConnection(cs);
                    //    conn.Open();

                    //    OracleDataAdapter adpt;

                    //    string query = "SELECT * FROM USERS WHERE USERNAME = '" + _userEmail + "' and PASSWORD = hash_pwd('" + _userEmail + "','" + _currentPassword + "')";
                    //    OracleCommand cmd = new OracleCommand(query, conn);


                    //    adpt = new OracleDataAdapter(cmd);

                    //    adpt.Fill(_userdata);

                    //    if (_userdata.Rows.Count > 0)
                    //    {

                    //        _changePassword(_userEmail, _currentPassword, _newPassword);
                    //        succLbl.Text = "Password Successfully Changed.";

                    //    }
                    //    else
                    //    {
                    //        errorLbl.Text = "Password entered does not exist in the database.";
                    //        conn.Close();
                    //    }



                    //}
                    //catch (Exception ex)
                    //{

                    //}



                }
                //else
                //{
                //    errorLbl.Text = "Password entered does not exist in the database.";
                //}


            }
            catch (Exception ex)
            {

            }


        }

        private bool _changePassword(string _username, string _dbpswd, string _newpswd)
        {
            bool change = false;

            try
            {
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

                    if (retval > 0) change = true;
                }
                catch (Exception ex)
                {

                }

            }
            catch (Exception ex)
            {

            }
            return change;
        }
    }
}