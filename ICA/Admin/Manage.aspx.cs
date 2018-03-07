using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Admin
{
    public partial class Manage : System.Web.UI.Page
    {

        //MailWebService.WebServiceSoapClient sendmail = new MailWebService.WebServiceSoapClient();
        EmailWS.WebService Emal = new EmailWS.WebService();
        ICA.Model.Util utilities = new Model.Util();
        string emailinSession = "";

        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        string biodata = "";
        //string getUploadByEmail = "";

        DataTable _memCategoryReport = new DataTable();
        DataTable _appStatus = new DataTable();
        DataTable _biodata = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {


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
            clearView();
            //to generate registration details based on selected values from the drop down.
            string appStatus = appStatusID.Value;
            string memTypes = memberCatID.Value;

            DataSet dt = null;

            try
            {

                dt = GetRegistrationDetails(appStatus, memTypes);

                if (dt != null && dt.Tables.Count > 0)
                {
                    excelExport.Visible = true;
                    regResults.DataSource = dt;
                    regResults.DataBind();
                    Session["dt"] = dt;

                }
           
                else
                {
                    DataRecordNotification.Text = utilities.ShowError("No Input Data.");
                }



            }
            catch (Exception ex)
            {

            }


        }


        public DataSet GetRegistrationDetails(string _appStatus, string _memberTypes)
        {

            DataSet dt = new DataSet();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            string query = "SELECT B.LASTNAME || ', ' || B.FIRSTNAME || ' ' || B.MIDDLENAME \"FULLNAME\", U.USERNAME, B.BIODATAID, B.DATEADDED,T.MEMBERTYPE, M.MEMBERCATEGORY,S.STATUS \"PAYMENT STATUS\", F.APPLICATIONFLAG \"APPLICATION STATUS\" FROM BIODATA B LEFT JOIN USERS U ON U.BIODATAID = B.BIODATAID LEFT JOIN PAYMENTS P ON P.USERID = U.USERID LEFT JOIN PAYMENTSTATUS S ON P.STATUS = S.STATUSID LEFT JOIN MEMBERCATEGORY M ON M.MEMBERCATEGORYID = U.MEMCATEGORYID LEFT JOIN MEMBERTYPE T ON T.MEMBERTYPEID = M.MEMBERTYPEID LEFT JOIN APPLICATION_FLAG F ON F.APPLICATIONFLAGID = U.APPLICATIONFLAGID WHERE U.APPLICATIONFLAGID = " + _appStatus + " AND T.MEMBERTYPEID = " + _memberTypes + " AND P.STATUS = " + 1 + "";

            OracleCommand cmd = new OracleCommand(query, conn);

            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;

        }

        protected void regResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            regResults.PageIndex = e.NewPageIndex;
            regResults.DataBind();

        }


        protected void viewReg_Click(object sender, EventArgs e)
        {
            clearView();
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

                try
                {
                    //Server.MapPath("~") + "/Credentials/Passport/" + email.Value.ToString() + ".jpg"
                    if (File.Exists(Server.MapPath("/Content/Credentials/Resume/" + biodata + ".pdf")))
                    {

                        pdfDisplay.Text = "<iframe id='' style ='border:1px solid #666CCC' title ='Resume' src ='/Content/Credentials/Resume/" +
                                 biodata + ".pdf' frameborder ='1' scrolling ='auto' height ='600' width ='1050' ><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></ iframe >";
                    }

                    if (File.Exists(Server.MapPath("/Content/Credentials/Passport/" + biodata + ".jpg")))
                    {
                        passportDisplay.Text = "<b><p>Passport</p></b><img src='/Content/Credentials/Passport/" + biodata + ".jpg' width='200' height='200'/>";
                        // lblcac.Text = "<b><p>CAC Certificate</p></b><img src='../CAC/" + orgid.ToString() + ".JPG' width='600' />";
                    }

                }
                catch (Exception ex)
                {
                    ex.ToString();
                }

            }
            catch (Exception ex)
            {

            }
            // Session["active_email"] = email.Value.ToString();
            Session["active_biodata"] = biodata;
            string emailinSession = _biodata.Rows[0]["EMAIL"].ToString();
            Session["active_email"] = emailinSession;
            //emailinSession = Session["active_email"].ToString();

            // select the particular text from a DB Derived Drop down.
            string _status = appStatusID.Items[appStatusID.SelectedIndex].Text.ToLower();

            if (_status == "approved")
                approve.Visible = false;
            else
                approve.Visible = true;



        }

        internal void clearView()
        {
            fullname.Value = "";
            memberstatus.Value = "";
            gender.Value = "";
            dateofbirth.Value = "";
            maritalstatus.Value = "";
            address.Value = "";
            addressII.Value = "";
            email.Value = "";
            phonenumber.Value ="";
            nameofschool.Value = "";
            highestdegree.Value = "";
            graduationdate.Value = "";
            pdfDisplay.Text = "";
            passportDisplay.Text = "";
            approve.Visible = false ;
            
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

                    if (retval > 0) check = true;
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

            string _subject = "ICA Approval Notification.";

            string _body = "Dear " + _fullname + " your application has been approved and your Membership Status is :" + _membercategory + ", Please log in using this address: 154.113.0.163:1010/ICA/guest/Default.aspx or 154.113.0.163:1010/ICA to sign in and view your personal page.";

            try
            {

                string response = Emal.sendmail1(_email, _subject, _body);
                approvalNotification.Text = utilities.ShowSuccess("Member has been Approved and Email Notification has been sent. ");
                //Response.Write("<script>alert('Email has been Sent.');</script>");
            }
            catch (Exception ex)
            {

            }

        }

        protected void regResults_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerrow = regResults.BottomPagerRow;
            Label pageno = (Label)pagerrow.Cells[0].FindControl("L3");
            Label totalpageno = (Label)pagerrow.Cells[0].FindControl("L4");

            if((pageno != null) && (totalpageno != null))
            {
                int pagen = regResults.PageIndex + 1;
                int tot = regResults.PageCount;

                pageno.Text = pagen.ToString();
                totalpageno.Text = tot.ToString();
            }
            else
            {
                Response.Write("<script>alert('No more Data to Display');</script>");
            }

        }

        protected void excelExport_Click(object sender, EventArgs e)
        {
            utilities.ExportToExcel(((DataSet)Session["dt"]), HttpContext.Current, "View Registration By Status & Category");
        }

    }
}