using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
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

        //private bool updateCorporateData(string _firstname, string _lastname, string _position, string _phonenumber,
        //    string _email, string _companyname, string _companyaddress, string _addressII, string _companyemail, string _webaddress )
        //{
        //    bool updateRecord = false;
        //    try {

        //        using (OracleConnection conn = new OracleConnection(cs))
        //        {
        //            using (OracleCommand cmd = new OracleCommand("UPDATECORPORATEDETAILS", conn))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;

        //                cmd.Parameters.Add(new OracleParameter("V_FIRSTNAME", OracleDbType.Varchar2, _firstname, ParameterDirection.Input));
                      
        //                cmd.Parameters.Add(new OracleParameter("V_BIODATAID", OracleDbType.Int32, Convert.ToInt32(biodataid), ParameterDirection.Input));

        //                if (conn.State != ConnectionState.Open)
        //                {
        //                    conn.Open();
        //                }
        //                try
        //                {

        //                    cmd.ExecuteNonQuery();
        //                    updateRecord = true;

        //                }
        //                catch (Exception ex)
        //                {
        //                    //Response.Write("<script>alert('Successful');</script>");
        //                }

        //                if (FileUpload1.FileName.EndsWith("jpg"))
        //                {
        //                    String fileName = Server.MapPath("~") + "/Content/Credentials/Passport/" + biodataid + ".jpg";
        //                    FileUpload1.SaveAs(fileName);
        //                }
        //                else
        //                {
        //                    //uploadNotificationI.Text = utilities.ShowError("Invalid File Format.");
        //                }
        //                uploadNotificationI.Text = utilities.ShowSuccess("Uploaded Successfully.");

        //            }
        //        }

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    int biodataid = Convert.ToInt32(Session["active_biodata"]);



        //    return true;
        //}
    }
}