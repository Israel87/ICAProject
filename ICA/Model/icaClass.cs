using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace ICA.Model
{
    public class icaClass
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;

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
                        cmd.Parameters.Add(new OracleParameter("V_AMOUNT", OracleDbType.Int32, _amount, ParameterDirection.Input));
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
    }
}