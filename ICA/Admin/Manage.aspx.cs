﻿using Oracle.DataAccess.Client;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace ICA.Admin
{
    public partial class Manage : System.Web.UI.Page
    {

        MailWebService.WebServiceSoapClient sendmail = new MailWebService.WebServiceSoapClient();

        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        string biodata = "";

        DataTable _memCategoryReport = new DataTable();
        DataTable _appStatus = new DataTable();
        DataTable _biodata = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GETMEMCATLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_memCategoryReport);


                memberCatID.DataSource = _memCategoryReport;
                memberCatID.DataBind();

            

            }


            if (!IsPostBack)
            {

                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

      
                OracleCommand cmd = new OracleCommand("GETAPPSTATUS", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_appStatus);


                appStatusID.DataSource = _appStatus;
                appStatusID.DataBind();

            }
        }

        protected void manageRegID_Click(object sender, EventArgs e)
        {
            //to generate registration details based on selected values from the drop down.
            string appStatus = appStatusID.Value;
            string memTypes = memberCatID.Value;

            DataTable dt = null;

            try
            {

                dt = GetRegistrationDetails(appStatus, memTypes);


                if (dt != null && dt.Rows.Count > 0)
                {

                    regResults.DataSource = dt;
                    regResults.DataBind();

                }
                else
                {
                    Response.Write("<script>alert('No Record Found...');</script>");
                }



            }
            catch (Exception ex)
            {

            }


        }


        public DataTable GetRegistrationDetails(string _appStatus, string _memberTypes)
        {

            DataTable dt = new DataTable();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            string query = "SELECT B.LASTNAME||', '||B.FIRSTNAME||' '||B.MIDDLENAME \"FULLNAME\", U.USERNAME, B.BIODATAID, B.DATEADDED, M.MEMBERCATEGORY, F.APPLICATIONFLAG \"APPLICATION STATUS\" " +
                            "FROM BIODATA B LEFT JOIN USERS U ON U.BIODATAID = B.BIODATAID LEFT JOIN MEMBERCATEGORY M ON M.MEMBERCATEGORYID = U.MEMCATEGORYID " +
                            "LEFT JOIN MEMBERTYPE T ON T.MEMBERTYPEID = M.MEMBERTYPEID LEFT JOIN APPLICATION_FLAG F ON F.APPLICATIONFLAGID = U.APPLICATIONFLAGID " +
                            "WHERE U.APPLICATIONFLAGID = "+ _appStatus + " AND T.MEMBERTYPEID = "+ _memberTypes;
            OracleCommand cmd = new OracleCommand(query, conn);

            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;

        }

        protected void regResults_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
   

        protected void viewReg_Click(object sender, EventArgs e)
        {
            ViewPanel.Visible = true;
            biodata = ((Button)sender).CommandArgument;
            Session["active_biodata"] = biodata;

            try
            {
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                //OracleCommand Orcl = new OracleCommand("POPULATE_SUMMARY", conn);

                //Orcl.CommandType = CommandType.StoredProcedure;
                //Orcl.Parameters.Add(new OracleParameter("v_biodataid", OracleDbType.Int32, biodata, ParameterDirection.Input));

                OracleDataAdapter adpt;
                string query = "SELECT UPPER(t.title||' '||b.lastname||', '||b.firstname||' '||b.MIDDLENAME) FULLNAME, b.EMAIL, B.PHONE, TO_CHAR(b.DATEOFBIRTH, 'DD-MON-YYYY') \"DATEOFBIRTH\", b.GENDER, m.maritalstatus,u.USERNAME, t.membertype||' '||c.membercategory||' MEMBER' \"MEMBER TYPE\", DECODE(NULL, a.STREETNAME, null, a.STREETNAME||', ' )|| DECODE(NULL, a.CITY, null, a.CITY||', ' )|| DECODE(NULL, s.STATENAME, null, s.STATENAME||'.' ) \"ADDRESS 1\", DECODE(NULL, a.STREET2, null, a.STREET2||', ' )|| DECODE(NULL, a.CITY2, null, a.CITY2||', ' )|| DECODE(NULL, s2.STATENAME, null, s2.STATENAME||'.' ) \"ADDRESS 2\", d.DEGREE \"HIGHESTDEGREE\", i2.NAMEOFSCHOOL, to_char(i2.GRADDATE, 'DD-MON-YYYY') \"GRADUATION DATE\" FROM biodata b left join titles t on t.titleid = b.title left join MARITALSTATUS m on m.MARITALSTATUSID = b.MARITALSTATUS left JOIN enroleeaddress a on a.BIODATAID = b.BIODATAID left join EMPLOYMENTINFO i on  i.BIODATAID = b.BIODATAID LEFT JOIN EDUCATIONINFO i2 on i2.biodataid = b.biodataid LEFT JOIN TBL_DEGREES d on d.degreeid = i2.highestdegree left JOIN users u on u.biodataid = b.biodataid left join MEMBERCATEGORY c on c.membercategoryid = u.memcategoryid left JOIN MEMBERTYPE t on t.membertypeid = c.membertypeid left join SETUP_STATE s on s.statecode = a.statecode left join SETUP_STATE s2 on s2.statecode = a.STATECODE2 where b.biodataid = " + biodata;
                OracleCommand cmd = new OracleCommand(query, conn);

                adpt = new OracleDataAdapter(cmd);

                adpt.Fill(_biodata);

                if (_biodata.Rows.Count > 0)
                {
                   
                    fullname.Value = _biodata.Rows[0]["FULLNAME"].ToString();                  
                    memberstatus.Value = _biodata.Rows[0]["MEMBER TYPE"].ToString();
                    gender.Value = _biodata.Rows[0]["GENDER"].ToString();
                    dateofbirth.Value = _biodata.Rows[0]["DATEOFBIRTH"].ToString();
                    maritalstatus.Value = _biodata.Rows[0]["MARITALSTATUS"].ToString();
                    address.Value = _biodata.Rows[0]["ADDRESS 1"].ToString();
                    addressII.Value = _biodata.Rows[0]["ADDRESS 2"].ToString();
                    email.Value = _biodata.Rows[0]["EMAIL"].ToString();
                    phonenumber.Value = _biodata.Rows[0]["PHONE"].ToString();
                    nameofschool.Value = _biodata.Rows[0]["NAMEOFSCHOOL"].ToString();
                    highestdegree.Value = _biodata.Rows[0]["HIGHESTDEGREE"].ToString();
                    graduationdate.Value = _biodata.Rows[0]["GRADUATION DATE"].ToString();
                }
                else
                    conn.Close();





            }
            catch (Exception ex)
            {

            }

        }


        private bool checkApproval()
        {
            bool check = false;
            biodata = Session["active_biodata"].ToString();

            try
            {
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();
                OracleCommand Orcl = new OracleCommand("APPROVE_USER", conn);
                Orcl.Parameters.Add(new OracleParameter("V_BIODATAID", OracleDbType.Int32, Convert.ToInt32(biodata), ParameterDirection.Input));
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

                    if(retval > 0)  check = true;
                }
                catch (Exception ex)
                {

                }

            }
            catch (Exception ex)
            {

            }
            return check;

        }

        protected void approve_Click(object sender, EventArgs e)
        {
            checkApproval();
            string _email = email.Value.ToString();
            string _fullname = fullname.Value.ToString();
            string _membercategory = memberstatus.Value.ToString();

            string _subject = "ICA Approval Notifications.";

            string _body = "Dear " + _fullname + "your application has been approved and your Membership Status is :" + _membercategory + ", Please log in using this address: to view your personal page.";

            try
            {
                
                string response = sendmail.sendmail1(_email, _subject, _body);
                Response.Write("<script>alert('sent.');</script>");
            }
            catch (Exception ex)
            {

            }

        }
    }
}