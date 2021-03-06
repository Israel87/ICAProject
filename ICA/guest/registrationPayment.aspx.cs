﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ICA.registrationViewModel;
using ICA.Logic;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace ICA
{
    public partial class registrationPayment : System.Web.UI.Page
    {
        ICA.Model.Util utilities = new Model.Util();
        logic logic = new logic();
        string _userEmail = "";
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        int _membercategoryid = 2;
        DataTable _paymenttable = new DataTable();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                regNotification.Text = utilities.ShowSuccess("Successful registration / login, please proceed to pay for registration.");

                if(Session["UserEmail"] == null)
                {
                    Response.Redirect("/signIn.aspx.aspx");
                }
                
                else
                {
                    _userEmail = Session["UserEmail"].ToString();
                    _membercategoryid = Convert.ToInt32(Session["ActiveMemCatID"]);
                    emailDisplay.Text = _userEmail.ToLower();
                }

                // populate payment item from the database
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GET_MEMCAT_REGFEES", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("V_MEMBERCATEGORYID", OracleDbType.Int32, Convert.ToInt32(_membercategoryid), ParameterDirection.Input));
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