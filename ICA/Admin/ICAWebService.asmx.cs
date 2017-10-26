using Newtonsoft.Json;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace ICA
{
    /// <summary>
    /// Summary description for ICAWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ICAWebService : System.Web.Services.WebService
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;

        // getting the count for active registrations.
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetActiveRegistrations()
        {
            DataSet dt = new DataSet();
           

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

        
            OracleCommand cmd = new OracleCommand("TOTALCOUNTS", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR1", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR2", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR3", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);
         

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else { return ""; }


        }


        // getting the count for Successful Payments.
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetSuccessfulPayments()
        {
            DataSet dt = new DataSet();
        
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;


            OracleCommand cmd = new OracleCommand("TOTALCOUNTS", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR1", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR2", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR3", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);


            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else { return ""; }


        }

        // getting the count for Approved Registrations.
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetApproved()
        {
            DataSet dt = new DataSet();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;


            OracleCommand cmd = new OracleCommand("TOTALCOUNTS", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR1", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR2", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR3", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);


            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else { return ""; }


        }


        // getting the count for Pending.
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetPending()
        {
            DataSet dt = new DataSet();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;


            OracleCommand cmd = new OracleCommand("TOTALCOUNTS", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR1", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR2", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("CUR3", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);


            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else { return ""; }


        }


        // get user info by email 
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetInfoByEmail(string email)
        {
      
                DataSet dt = new DataSet();

                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;


                OracleCommand cmd = new OracleCommand("select biodataid, firstname, lastname, email, phone from biodata where email='" + email.ToUpper() + "'", conn);
                cmd.CommandType = CommandType.Text;
                da = new OracleDataAdapter(cmd);
                da.Fill(dt);


                if (dt != null && dt.Tables[0].Rows.Count > 0)
                {
                    string json = JsonConvert.SerializeObject(dt);
                    return json;
                }

                else
                {
                    return "";
                }
       
           

        }

        // log payment 
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string logPaymentInfoDB(string biodataid, string description, string response, string payItemId, string payRef, string status)
        {
            DataSet dt = new DataSet();

            OracleConnection conn = new OracleConnection(cs);
            if(conn.State != ConnectionState.Open) conn.Open();


            //V_USERID, V_DESCRIPTION, V_PAYMENTID, V_PAYMENTREF, V_STATUS
           //OracleDataAdapter da;
           OracleCommand cmd = new OracleCommand("LOGPAYMENTINFO", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new OracleParameter("V_USERID", OracleDbType.Varchar2,biodataid, ParameterDirection.Input));
            cmd.Parameters.Add(new OracleParameter("V_DESCRIPTION", OracleDbType.Varchar2, description, ParameterDirection.Input));
            cmd.Parameters.Add(new OracleParameter("V_PAYMENTID", OracleDbType.Varchar2, payItemId, ParameterDirection.Input));
            cmd.Parameters.Add(new OracleParameter("V_PAYMENTREF", OracleDbType.Varchar2, payRef, ParameterDirection.Input));
            cmd.Parameters.Add(new OracleParameter("V_STATUS", OracleDbType.Varchar2, status, ParameterDirection.Input));
            cmd.Parameters.Add("OUT_PAYMENTID", OracleDbType.Int64).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            string retval = cmd.Parameters["OUT_PAYMENTID"].Value.ToString();

            if (conn.State == ConnectionState.Open) conn.Close();

            
            return retval;
        }

        // update payment
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int updatePaymentInfoDB(string paymentid, string status, string response)
        {
            DataSet dt = new DataSet();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            string query = String.Format("update payments set status = {0}, response = '{1}' where paymentid = {2}", status, response, paymentid);
            OracleCommand cmd = new OracleCommand(query, conn);
            cmd.CommandType = CommandType.Text;

            int retval = cmd.ExecuteNonQuery();

            return retval;
        }
    }
}
