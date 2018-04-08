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
        protected void update_click(object sender, EventArgs args)
        {
            try {

                //updateStudentData(address.Value, addressII.Value, phonenum.Value, nos.Value, deg.SelectedValue, graddate.Value, recentEmp.Value,
                //   position.Value, certyear.Value, refFirstname.Value, refLastname.Value,refPosition.Value, refEmail.Value, refPhoneNumber.Value );

            }
            catch (Exception ex)
            {

            }
        }
       // update student records
       private bool updateStudentData(string _firstname, string _middlename, string _lastname, string _email, string _phonenumber, string _address, string _addressII,
                string _nameofschool, string _certyear, string _recentEmp, string _position,  string _refFirstname, string _refLastname, string _refPosition, string _refEmail, string _refPhonenumber)
        {
            bool updateStudentRecord = false;
            int biodataid = Convert.ToInt32(Session["active_biodata"]);


            try
            {
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("UPDATESTUDENTDATA", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_FIRSTNAME", OracleDbType.Varchar2, _firstname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MIDDLENAME", OracleDbType.Varchar2, _middlename, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LASTNAME", OracleDbType.Varchar2, _lastname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_EMAIL", OracleDbType.Varchar2, _email, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PHONE", OracleDbType.Varchar2, _phonenumber, ParameterDirection.Input));

                        
                        cmd.Parameters.Add(new OracleParameter("V_STREETNAME", OracleDbType.Varchar2, _phonenumber, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_STREETADDRESSII", OracleDbType.Varchar2, _addressII, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_NAMEOFSCHOOL", OracleDbType.Varchar2, _addressII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_OTHERCERTANDYEAR", OracleDbType.Varchar2, _addressII, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("MOSTRECENTEMPLOYER", OracleDbType.Varchar2, _recentEmp, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION", OracleDbType.Varchar2, _position, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_REFFIRSTNAME", OracleDbType.Varchar2, _refFirstname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_REFLASTNAME", OracleDbType.Varchar2, _refLastname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_REFPOSITION", OracleDbType.Varchar2, _refPosition, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_REFEMAIL", OracleDbType.Varchar2, _refEmail, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_REFPHONENUMBER", OracleDbType.Varchar2, _refPhonenumber, ParameterDirection.Input));
        


                        cmd.Parameters.Add(new OracleParameter("V_BIODATAID", OracleDbType.Int32, Convert.ToInt32(biodataid), ParameterDirection.Input));

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {

                            cmd.ExecuteNonQuery();
                            updateStudentRecord = true;

                        }
                        catch (Exception ex)
                        {
                            //Response.Write("<script>alert('Successful');</script>");
                        }

                        if (FileUpload1.FileName.EndsWith("jpg"))
                        {
                            String fileName = Server.MapPath("~") + "/Content/Credentials/Passport/" + biodataid + ".jpg";
                            FileUpload1.SaveAs(fileName);
                        }
                        else
                        {
                            //uploadNotificationI.Text = utilities.ShowError("Invalid File Format.");
                        }
                        uploadNotificationI.Text = utilities.ShowSuccess("Uploaded Successfully.");

                    }
                }
            }
            catch (Exception ex)
            {

            }
            return updateStudentRecord;


        }
    }



}
