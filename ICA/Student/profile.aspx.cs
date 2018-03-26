using System;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Data;
//using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Student
{
    public partial class profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;
        string emailinSession = "";
        DataTable _userEmail = new DataTable();
        int _biodataid;
        ICA.Model.Util utilities = new Model.Util();

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
                try
                {
                    OracleConnection conn = new OracleConnection(cs);
                    conn.Open();

                    OracleDataAdapter adpt;
                    string query = "SELECT b.biodataid, t.title, b.firstname, b.middlename, b.lastname, b.gender,m.maritalstatus,TO_CHAR(b.DATEOFBIRTH, 'DD-MON-YYYY') AS BIRTHDATE,b.email, b.phone, e.streetname, e.street2, ei.nameofschool,d.degree, TO_CHAR(ei.graddate,  'DD-MON-YYYY') AS GRADUATIONDATE, ei.othercertificationandyear, emply.mostrecentemployer,emply.position, rf.refereefirstname, rf.refereelastname, rf.position, rf.refereeemail, rf.refereephonenumber from BIODATA b LEFT JOIN TITLES t on b.title = t.TITLEID LEFT JOIN ENROLEEADDRESS e on b.biodataid = e.biodataid LEFT JOIN MARITALSTATUS m on b.maritalstatus = m.maritalstatusid LEFT JOIN EDUCATIONINFO ei on b.biodataid = ei.biodataid LEFT JOIN TBL_DEGREES d on ei.highestdegree = d.degreeid LEFT JOIN EMPLOYMENTINFO emply on b.biodataid = emply.biodataid LEFT JOIN REFEREES rf on b.biodataid = rf.biodataid WHERE b.EMAIL = '" + emailinSession + "'";
                    OracleCommand cmd = new OracleCommand(query, conn);

                    adpt = new OracleDataAdapter(cmd);

                    adpt.Fill(_userEmail);

                    if (_userEmail != null && _userEmail.Rows.Count > 0)
                    {
                        string _firstname = _userEmail.Rows[0]["firstname"].ToString();
                        string _middlename = _userEmail.Rows[0]["middlename"].ToString();
                        string _lastname = _userEmail.Rows[0]["lastname"].ToString();
                        _biodataid = Convert.ToInt32(_userEmail.Rows[0]["biodataid"]);
                        // string membertypeDisplay = _userEmail.Rows[0]["MEMBER TYPE"].ToString();

                        Session["active_biodata"] = _biodataid;



                        titles.Value = _userEmail.Rows[0]["Title"].ToString();
                        fullname.Value = _firstname + " , " + _middlename + " " + _lastname;

                        // fullname.Value = _firstname + " " + _middlename + " " + _lastname;
                        dob.Value = _userEmail.Rows[0]["BIRTHDATE"].ToString();
                        gender.Value = _userEmail.Rows[0]["GENDER"].ToString();
                        maritalstatuses.Value = _userEmail.Rows[0]["MARITALSTATUS"].ToString();
                        email.Value = _userEmail.Rows[0]["EMAIL"].ToString();
                        address.Value = _userEmail.Rows[0]["Streetname"].ToString();

                        //memstats.Value = _userEmail.Rows[0]["MEMBER TYPE"].ToString();
                        addressII.Value = _userEmail.Rows[0]["STREET2"].ToString();
                        phonenum.Value = _userEmail.Rows[0]["Phone"].ToString();
                        nos.Value = _userEmail.Rows[0]["Nameofschool"].ToString();
                        deg.SelectedValue = _userEmail.Rows[0]["degree"].ToString();
                        graddate.Value = _userEmail.Rows[0]["GRADUATIONDATE"].ToString();
                        recentEmp.Value = _userEmail.Rows[0]["Mostrecentemployer"].ToString();
                        position.Value = _userEmail.Rows[0]["Position"].ToString();


                        certyear.Value = _userEmail.Rows[0]["othercertificationandyear"].ToString();
                        refFirstname.Value = _userEmail.Rows[0]["refereelastname"].ToString();
                        refLastname.Value = _userEmail.Rows[0]["refereelastname"].ToString();
                        refPosition.Value = _userEmail.Rows[0]["position1"].ToString();
                        refEmail.Value = _userEmail.Rows[0]["refereeemail"].ToString();
                        refPhoneNumber.Value = _userEmail.Rows[0]["refereephonenumber"].ToString();

                    }
                    else
                        conn.Close();
                }
                catch (Exception ex)
                {

                }
            }


        }
    }
}