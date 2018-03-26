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
namespace ICA.Corporate
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

                    string query = "select b.biodataid, b.firstname, b.middlename, b.lastname, b.phone, b.email, u.username, u.memcategoryid, m.membercategory, c.companyname,c.companyaddress,e.street2, c.companyemail, c.webaddress, c.position from BIODATA b LEFT JOIN \"USERS\" u ON b.BIODATAID = u.BIODATAID LEFT JOIN MEMBERCATEGORY m on u.memcategoryid = m.membercategoryid LEFT JOIN ENROLEEADDRESS e on b.BIODATAID = e.BIODATAID LEFT JOIN CORPORATEDATA c ON b.BIODATAID = c.BIODATAID where u.USERNAME = '" + emailinSession + "'";

                    OracleCommand cmd = new OracleCommand(query, conn);

                    adpt = new OracleDataAdapter(cmd);

                    adpt.Fill(_userEmail);

                    if (_userEmail.Rows.Count > 0)
                    {
                        string _firstname = _userEmail.Rows[0]["firstname"].ToString();
                        string _middlename = _userEmail.Rows[0]["middlename"].ToString();
                        string _lastname = _userEmail.Rows[0]["lastname"].ToString();
                        _biodataid = Convert.ToInt32(_userEmail.Rows[0]["biodataid"]);
                        // string membertypeDisplay = _userEmail.Rows[0]["MEMBER TYPE"].ToString();

                        Session["active_biodata"] = _biodataid;


                        companyname.Value = _userEmail.Rows[0]["COMPANYNAME"].ToString();
                        // fullname.Value = _firstname + " " + _middlename + " " + _lastname;
                        companyaddress.Value = _userEmail.Rows[0]["COMPANYADDRESS"].ToString();
                        //memstats.Value = _userEmail.Rows[0]["MEMBER TYPE"].ToString();
                        addressII.Value = _userEmail.Rows[0]["STREET2"].ToString();
                        companyemail.Value = _userEmail.Rows[0]["COMPANYEMAIL"].ToString();
                        webaddress.Value = _userEmail.Rows[0]["WEBADDRESS"].ToString();

                        firstname.Value = _firstname;
                        lastname.Value = _lastname;
                        position.Value = _userEmail.Rows[0]["POSITION"].ToString();
                        phonenumber.Value = _userEmail.Rows[0]["PHONE"].ToString();
                        email.Value = _userEmail.Rows[0]["EMAIL"].ToString();
                        category.Value = _userEmail.Rows[0]["MEMBERCATEGORY"].ToString();

                    }
                    else
                        conn.Close();

                }
                catch (Exception ex)
                {

                }


            }
        }

        private bool updateCorporateData(string _firstname, string _lastname, string _phonenumber, string _email, string _addressII,
          string _companyaddress, string _companyemail, string _webaddress, string _position)
        {
            bool updateCorporateRecord = false;
            int biodataid = Convert.ToInt32(Session["active_biodata"]);


            try
            {
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("UPDATECORPORATEDETAILS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_FIRSTNAME", OracleDbType.Varchar2, _firstname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LASTNAME", OracleDbType.Varchar2, _lastname, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_PHONE", OracleDbType.Varchar2, _phonenumber, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_EMAIL", OracleDbType.Varchar2, _email, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_STREETADDRESSII", OracleDbType.Varchar2, _addressII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_COMPANYADDRESS", OracleDbType.Varchar2, _companyaddress, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_COMPANYEMAIL", OracleDbType.Varchar2, _companyemail, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_WEBADDRESS", OracleDbType.Varchar2, _webaddress, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_POSITION", OracleDbType.Varchar2, _position, ParameterDirection.Input));
                        ;
                        cmd.Parameters.Add(new OracleParameter("V_BIODATAID", OracleDbType.Int32, Convert.ToInt32(biodataid), ParameterDirection.Input));

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {

                            cmd.ExecuteNonQuery();
                            updateCorporateRecord = true;

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
            return updateCorporateRecord;


        }


        protected void update_Click(object sender, EventArgs e)
        {
            // view pictures
            try
            {


                updateCorporateData(firstname.Value, lastname.Value, phonenumber.Value, email.Value, addressII.Value, companyaddress.Value, companyemail.Value, webaddress.Value, position.Value);


            }
            catch (Exception ex)
            {

            }

        }
    }
}