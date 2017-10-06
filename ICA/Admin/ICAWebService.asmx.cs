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
    }
}
