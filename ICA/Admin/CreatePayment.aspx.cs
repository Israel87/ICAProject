﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Data;

namespace ICA.Admin
{
    public partial class CreatePayment : System.Web.UI.Page
    {
        string emailinSession = "";
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        ICA.Model.Util utilities = new Model.Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            // get the list of payments from the database
            DataTable _paymentTypes = new DataTable();
            DataTable _memCategoryReport = new DataTable();

            if (Session["UserEmail"] == null)
            {

                Response.Redirect("/ICA/signIn.aspx");
            }
            else
            {
                //_userSession = Session["UserID"].ToString();
                emailinSession = Session["UserEmail"].ToString();


            }

            if (!IsPostBack)
            {

                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GETPAYMENTTYPESLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_paymentTypes);


                paymentID.DataSource = _paymentTypes;
                paymentID.DataTextField = "PAYMENTTYPE";
                paymentID.DataValueField = "PAYMENTTYPEID";
                paymentID.DataBind();

                paymentID.Items.Insert(0, new ListItem("Select Option", ""));

            }

            // get the member category lists from the database.
            if (!IsPostBack)
            {

                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GETMEMLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_memCategoryReport);


                categoryID.DataSource = _memCategoryReport;
                categoryID.DataBind();


                categoryID.Items.Insert(0, new ListItem("Select Option", ""));

            }

        }

        public bool createPayments(string _paymentType, string _amount, string _category)
        {
            bool newPaymenTtype = false;

            try
            {


                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("ADD_PAYMENTITEMS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_MEMBERCATEGORYID", OracleDbType.Int32, _category, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PAYMENTTYPEID", OracleDbType.Int32, _paymentType, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_AMOUNT", OracleDbType.Int32, _amount, ParameterDirection.Input));
                        

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }

                        try
                        {
                            cmd.ExecuteNonQuery();
                            newPaymenTtype = true;
                        }
                        catch (Exception ex)
                        {
                            //Response.Write("<script>alert('Successful');</script>");
                        }
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return newPaymenTtype;
        }


        protected void createpayments_Click(object sender, EventArgs e)
        {
            // perfect tenary operations.
            //string paymnt_item = add.Checked ? addNew.Value : paymentID.Value;

            bool newPayments = createPayments(paymentID.Value, amount.Value, categoryID.Value);

            if (newPayments == true)
            {
                // Response.Write("<script>alert('Successful...');</script>");
                paymentItemNotification.Text = utilities.ShowSuccess("Amount Created Successfully.");

            }
            else
            {
                // Response.Write("<script>alert('Not Created.');</script>");
                paymentItemNotification.Text = utilities.ShowError("Amount Not Created.");
            }
        }




        protected void createPaymentType_Click(object sender, EventArgs e)
        {
            bool typePayments = paymentTypes(typeID.Value);

            if (typePayments == true)
            {
                // Response.Write("<script>alert('Successful...');</script>");
                paymentTypeNotifications.Text = utilities.ShowSuccess("Payment Type Created Successfully.");
              

            }
            else
            {
                // Response.Write("<script>alert('Not Created.');</script>");
                paymentTypeNotifications.Text = utilities.ShowError("Payment Type Not Created.");
            }
        }



        public bool paymentTypes(string _itemType)
        {
            bool itemType = false;

            try
            {
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("ADD_PAYMENTTYPE", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_PAYMENTTYPE", OracleDbType.Varchar2, _itemType, ParameterDirection.Input));              

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }

                        try
                        {
                            cmd.ExecuteNonQuery();
                            itemType = true;
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
            return itemType;


        }
    }
}