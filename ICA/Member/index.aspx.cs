using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Member
{
    public partial class index : System.Web.UI.Page
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

                    string query = "SELECT t.title, b.lastname, b.firstname, b.MIDDLENAME , b.biodataid, b.EMAIL, B.PHONE, TO_CHAR(b.DATEOFBIRTH, 'DD-MON-YYYY') \"DATEOFBIRTH\", b.GENDER, m.maritalstatus,u.USERNAME, t.membertype || ' ' || c.membercategory || ' MEMBER' \"MEMBER TYPE\", DECODE(NULL, a.STREETNAME, null, a.STREETNAME || ', ') || DECODE(NULL, a.CITY, null, a.CITY || ', ') || DECODE(NULL, s.STATENAME, null, s.STATENAME || '.') \"ADDRESS 1\",  DECODE(NULL, a.STREET2, null, a.STREET2 || ', ') || DECODE(NULL, a.CITY2, null, a.CITY2 || ', ') || DECODE(NULL, s2.STATENAME, null, s2.STATENAME || '.') \"ADDRESS 2\", d.DEGREE \"HIGHESTDEGREE\", i2.othercertificationandyear \"Other Certification\", i2.NAMEOFSCHOOL, to_char(i2.GRADDATE, 'DD-MON-YYYY') \"GRADUATION DATE\", i.mostrecentemployer, i.position, i.otheremployer, i.position2, i.OTHEREMPLOYER3, i.position3 FROM biodata b left join titles t on t.titleid = b.title left join MARITALSTATUS m on m.MARITALSTATUSID = b.MARITALSTATUS left JOIN enroleeaddress a on a.BIODATAID = b.BIODATAID left join EMPLOYMENTINFO i on i.BIODATAID = b.BIODATAID LEFT JOIN EDUCATIONINFO i2 on i2.biodataid = b.biodataid LEFT JOIN TBL_DEGREES d on d.degreeid = i2.highestdegree left JOIN users u on u.biodataid = b.biodataid left join MEMBERCATEGORY c on c.membercategoryid = u.memcategoryid left JOIN MEMBERTYPE t on t.membertypeid = c.membertypeid left join SETUP_STATE s on s.statecode = a.statecode left join SETUP_STATE s2 on s2.statecode = a.STATECODE2 where u.username = '" + emailinSession + "'";

                    OracleCommand cmd = new OracleCommand(query, conn);

                    adpt = new OracleDataAdapter(cmd);

                    adpt.Fill(_userEmail);

                    if (_userEmail.Rows.Count > 0)
                    {
                        string _firstname = _userEmail.Rows[0]["firstname"].ToString();
                        string _middlename = _userEmail.Rows[0]["MIDDLENAME"].ToString();
                        string _lastname = _userEmail.Rows[0]["lastname"].ToString();
                        _biodataid = Convert.ToInt32(_userEmail.Rows[0]["biodataid"]);
                        string membertypeDisplay = _userEmail.Rows[0]["MEMBER TYPE"].ToString();

                        Session["active_biodata"] = _biodataid;


                        title.SelectedValue = _userEmail.Rows[0]["title"].ToString();
                        fullname.Value = _firstname + " " + _middlename + " " + _lastname;
                        //memstats.Value = _userEmail.Rows[0]["MEMBER TYPE"].ToString();
                        dob.Value = _userEmail.Rows[0]["DATEOFBIRTH"].ToString();
                        gender.Value = _userEmail.Rows[0]["GENDER"].ToString();
                        maritalstatus.SelectedValue = _userEmail.Rows[0]["maritalstatus"].ToString();
                        email.Value = _userEmail.Rows[0]["EMAIL"].ToString();
                        address.Value = _userEmail.Rows[0]["ADDRESS 1"].ToString();
                        addressII.Value = _userEmail.Rows[0]["ADDRESS 2"].ToString();
                        phonenum.Value = _userEmail.Rows[0]["PHONE"].ToString();
                        nos.Value = _userEmail.Rows[0]["NAMEOFSCHOOL"].ToString();
                        deg.SelectedValue = _userEmail.Rows[0]["HIGHESTDEGREE"].ToString();
                        graddate.Value = _userEmail.Rows[0]["GRADUATION DATE"].ToString();

                        // additional ones here.
                        recentEmp.Value = _userEmail.Rows[0]["mostrecentemployer"].ToString();
                        position.Value = _userEmail.Rows[0]["position"].ToString();
                        certyear.Value = _userEmail.Rows[0]["Other Certification"].ToString();
                        empII.Value = _userEmail.Rows[0]["otheremployer"].ToString();
                        posII.Value = _userEmail.Rows[0]["position2"].ToString();
                        empIII.Value = _userEmail.Rows[0]["OTHEREMPLOYER3"].ToString();
                        posIII.Value = _userEmail.Rows[0]["position3"].ToString();

                        memDisplay.Text = membertypeDisplay;

                     




                        if (File.Exists(Server.MapPath("/ICA/Content/Credentials/Passport/" + _biodataid + ".jpg")))
                        {
                            pictureDisplay.Text = "<b><p>Passport</p></b><img src='/ICA/Content/Credentials/Passport/" + _biodataid + ".JPG' width='200' height='200'/>";
                            // lblcac.Text = "<b><p>CAC Certificate</p></b><img src='../CAC/" + orgid.ToString() + ".JPG' width='600' />";
                        }

                    }
                    else
                        conn.Close();

                }
                catch (Exception ex)
                {

                }


            }

        }

        protected void update_Click(object sender, EventArgs e)
        {
            // view pictures
            try
            {


                UpdateDetail(title.SelectedValue, maritalstatus.SelectedValue, address.Value, addressII.Value, deg.SelectedValue, nos.Value, graddate.Value, certyear.Value, recentEmp.Value, position.Value, empII.Value, posII.Value, empIII.Value, posIII.Value);


            }
            catch (Exception ex)
            {

            }
        }

        private bool UpdateDetail(string _title, string _maritalstatus, string _addressI, string _addressII, string _highestdegree, string _nameofschool, string _graddate, string _certYear, string _recentemployer, string _position, string _otheremployerII, string _positionII, string _otheremployerIII, string _postionIII)
        {
            bool updateRecord = false;

            int biodataid = Convert.ToInt32(Session["active_biodata"]);

            try
            {
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("UPDATE_DETAILS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_TITLE", OracleDbType.Int32, Convert.ToInt32(_title), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MARITALSTATUS", OracleDbType.Int32, Convert.ToInt32(_maritalstatus), ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_ADDRESSI", OracleDbType.Varchar2, _addressI, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_ADDRESSII", OracleDbType.Varchar2, _addressII, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_HIGHESTDEGREE", OracleDbType.Int32, Convert.ToInt32(_highestdegree), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_NAMEOFSCHOOL", OracleDbType.Varchar2, _nameofschool, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_GRADDATE", OracleDbType.Date, Convert.ToDateTime(_graddate), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_OTHERCERTIFICATIONANDYEAR", OracleDbType.Varchar2, _certYear, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_MOSTRECENTEMPLOYER", OracleDbType.Varchar2, _recentemployer, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION", OracleDbType.Varchar2, _position, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_OTHEREMPLOYER", OracleDbType.Varchar2, _otheremployerII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION2", OracleDbType.Varchar2, _positionII, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_OTHEREMPLOYER3", OracleDbType.Varchar2, _otheremployerIII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION3", OracleDbType.Varchar2, _postionIII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_BIODATAID", OracleDbType.Int32, Convert.ToInt32(biodataid), ParameterDirection.Input));

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {

                            cmd.ExecuteNonQuery();
                            updateRecord = true;
                            uploadNotificationI.Text = utilities.ShowSuccess("Uploaded Successfully.");
                        }
                        catch (Exception ex)
                        {
                            //Response.Write("<script>alert('Successful');</script>");
                        }

                        if (FileUpload1.FileName.EndsWith("jpg"))
                        {
                            String fileName = Server.MapPath("~") + "/ICA/Content/Credentials/Passport/" + biodataid + ".jpg";
                            FileUpload1.SaveAs(fileName);
                            // uploadNotificationI.Text = utilities.ShowSuccess("Uploaded Successfully.");

                        }
                        else
                        {
                            //uploadNotificationI.Text = utilities.ShowError("Invalid File Format.");
                        }

                    }
                }
            }
            catch (Exception ex)
            {

            }
            return updateRecord;

        }
    }
}