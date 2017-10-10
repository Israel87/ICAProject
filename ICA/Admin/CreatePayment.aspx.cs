using System;
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

        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // get the list of payments from the database
            DataTable _paymentTypes = new DataTable();
            DataTable _memCategoryReport = new DataTable();



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
                paymentID.DataValueField = "PAYMENTTYPE";
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
                    using (OracleCommand cmd = new OracleCommand("ADD_PAYMENTITEM", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_PAYMENTTYPE", OracleDbType.Varchar2, _paymentType, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_AMOUNT", OracleDbType.Int32,Convert.ToInt32(_amount), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MEMBERCATEGORYID", OracleDbType.Int32, Convert.ToInt32(_category), ParameterDirection.Input));
                       
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
            string paymnt_item = add.Checked ? addNew.Value : paymentID.Value;

            bool newPayments = createPayments(paymnt_item, amount.Value, categoryID.Value);

            if (newPayments == true)
            {
                Response.Write("<script>alert('Successful...');</script>");
                //orgNameCreate.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Not Created.');</script>");
            }
        }


    }
}