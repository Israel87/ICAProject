﻿using Oracle.DataAccess.Client;
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
    public partial class signIn : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.RemoveAll();
            //Response.Redirect("signIn.aspx");
            //if (!IsPostBack)
            //{
            //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script> $(document).ready(function(){$('.alert-success').hide();$('.alert-danger').hide();});</script>");
            //}
        }

        protected void loginID_Click(object sender, EventArgs e)
        {
            //login to admin or member pages.
            string _username = usernameID.Text.ToString();
            string _password = passwordID.Text.ToString();
            string _roleView = selectValue.Text.ToString();

            errorDisplay.InnerHtml = "";

            try
            {
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    OracleDataAdapter da;
                    OracleCommand cmd = new OracleCommand("USER_LOGIN", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new OracleParameter("v_username", OracleDbType.Varchar2, _username, ParameterDirection.Input));
                    cmd.Parameters.Add(new OracleParameter("v_password", OracleDbType.Varchar2, _password, ParameterDirection.Input));
                    cmd.Parameters.Add(new OracleParameter("v_usertype", OracleDbType.Varchar2, _roleView, ParameterDirection.Input));
                    cmd.Parameters.Add("cur", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                    da = new OracleDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // if the user login details entered exists
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        Session["UserEmail"] = dt.Rows[0][2].ToString();
                        //Session.Add("UserID", dt.Rows[0][0].ToString());
                        

                        string _useremail = Session["UserEmail"].ToString();



                        if (selectValue.SelectedValue == "ADMIN")
                        {
                            Response.Redirect("~/ICA/Admin/Index.aspx");

                        }

                        else if (selectValue.SelectedValue == "MEMBER")
                        {
                            //cmd.Dispose(); da.Dispose();
                            cmd = new OracleCommand("Select * FROM USERS WHERE USERNAME = '" + _username.ToUpper() + "'", conn);
                            cmd.CommandType = CommandType.Text;
                            da = new OracleDataAdapter(cmd);
                            DataTable dt2 = new DataTable();
                            da.Fill(dt2);

                            if (dt2 != null && dt2.Rows[0]["STATUS"].ToString() == "1")
                            {
                                Response.Redirect("~/ICA/Member/index.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/ICA/guest/registrationPayment.aspx", true);
                            }
                            
                        }
                        else
                            return;
                    }
                    else
                    {
                        errorDisplay.InnerHtml = "<div class='alert alert-danger container text-center' role='alert'>Invalid Login / Password</div>"; 
                    }

                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}