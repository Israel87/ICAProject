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

                        cmd.Parameters.Add(new OracleParameter("V_PAYMENTTYPEID", OracleDbType.Varchar2, _paymentType, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_AMOUNT", OracleDbType.Varchar2, _amount, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MEMBERCATEGORYID", OracleDbType.Int32, _category, ParameterDirection.Input));
                       
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



        protected void Create_Click(Object sender, EventArgs e)
        {
            bool newPayments = createPayments(paymentType.Value, amount.Value, categoryID.Value);

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