using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using ICA.Model;
using System.Data;
using System;

namespace ICA
{
    public class ConnectionManager
    {
        private static string connString = ConfigurationManager.ConnectionStrings["icaname"].ConnectionString;

        internal OracleConnection getConnection()
        {
            OracleConnection con = new OracleConnection(connString);
            return con;
        }

        internal long saveUser(userModel usermodel)
        {
            long biodataid = 0;

            try
            {
                using (OracleConnection conn = getConnection())
                {
                    using (OracleCommand cmd = new OracleCommand("INSERTDATA", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        //Biodata
                        cmd.Parameters.Add(new OracleParameter("V_FIRSTNAME", OracleDbType.Varchar2, usermodel.personalInfo.FirstName, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MIDDLENAME", OracleDbType.Varchar2, usermodel.personalInfo.MiddleName, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LASTNAME", OracleDbType.Varchar2, usermodel.personalInfo.LastName, ParameterDirection.Input));
                     
                        cmd.Parameters.Add(new OracleParameter("V_EMAIL", OracleDbType.Varchar2, usermodel.personalInfo.Email, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PHONE", OracleDbType.Varchar2, usermodel.personalInfo.Phone, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_GENDER", OracleDbType.Varchar2, usermodel.personalInfo.Gender, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_TITLE", OracleDbType.Int32, usermodel.personalInfo.Title, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DOB", OracleDbType.Date, usermodel.personalInfo.DateofBirth, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MARITALSTATUS", OracleDbType.Int32, usermodel.personalInfo.MaritalStatus, ParameterDirection.Input));



                        //Education
                        cmd.Parameters.Add(new OracleParameter("V_DEGREE", OracleDbType.Int32, usermodel.educationInfo.HighestDegree, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_SCHNAME", OracleDbType.Varchar2, usermodel.educationInfo.NameofSchool, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_GRADDATE", OracleDbType.Date, usermodel.educationInfo.Graddate, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_OTHERCERT", OracleDbType.Varchar2, usermodel.educationInfo.Certifications, ParameterDirection.Input));




                        //Employment
                        cmd.Parameters.Add(new OracleParameter("V_YEARSEXPERIENCE", OracleDbType.Int32, usermodel.employmentInfo.YearsofExperience, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_RECENTEMPLOYER", OracleDbType.Varchar2, usermodel.employmentInfo.RecentEmployer, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION", OracleDbType.Varchar2, usermodel.employmentInfo.Position, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DATEEMPLOYED", OracleDbType.Date, usermodel.employmentInfo.DateEmployed, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_FUNCTIONS", OracleDbType.Varchar2, usermodel.employmentInfo.Functions, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_OTHEREMPLOYERII", OracleDbType.Varchar2, usermodel.employmentInfo.OtherEmployerII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION2", OracleDbType.Varchar2, usermodel.employmentInfo.PositionII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DATEEMPLOYED2", OracleDbType.Date, usermodel.employmentInfo.DateEmployedII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_ENDDATE2", OracleDbType.Date, usermodel.employmentInfo.EndDateII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_JOBDESCRIPTION2", OracleDbType.Varchar2, usermodel.employmentInfo.JobDescriptionII, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_OTHEREMPLOYER3", OracleDbType.Varchar2, usermodel.employmentInfo.OtherEmployerIII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION3", OracleDbType.Varchar2, usermodel.employmentInfo.PositionIII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DATEEMPLOYED3", OracleDbType.Date, usermodel.employmentInfo.DateEmployedIII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_ENDDATE3", OracleDbType.Date, usermodel.employmentInfo.EndDateIII, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_JOBDESCRIPTION3", OracleDbType.Varchar2, usermodel.employmentInfo.JobDescriptionIII, ParameterDirection.Input));


                        // Residential Information
                        cmd.Parameters.Add(new OracleParameter("V_STREETNAME", OracleDbType.Varchar2, usermodel.residentialInfo.Streetname, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_CITY", OracleDbType.Varchar2, usermodel.residentialInfo.City, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_ZIPCODE", OracleDbType.Varchar2, usermodel.residentialInfo.Zipcode, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_STATECODE", OracleDbType.Varchar2, usermodel.residentialInfo.State, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_STREET2", OracleDbType.Varchar2, usermodel.residentialInfo.StreetnameII, ParameterDirection.Input));
                                            
                        cmd.Parameters.Add(new OracleParameter("V_COUNTRY", OracleDbType.Varchar2, usermodel.residentialInfo.Country, ParameterDirection.Input));


                                         

                        // Password
                        cmd.Parameters.Add(new OracleParameter("V_PASSWORD", OracleDbType.Varchar2, usermodel.personalInfo.Password, ParameterDirection.Input));

                        ////Payment Details 
                        //cmd.Parameters.Add(new OracleParameter("V_DESCRIPTION", OracleDbType.Varchar2, usermodel.paymentDetails.Description, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_PAYMENTID", OracleDbType.Int32, usermodel.paymentDetails.paymentitemID, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_REFERNCE", OracleDbType.Varchar2, usermodel.paymentDetails.ReferenceID, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("RETVAL", OracleDbType.Int64)).Direction = ParameterDirection.Output;


                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {
                            cmd.ExecuteNonQuery();
                            biodataid = Convert.ToInt64(cmd.Parameters["RETVAL"].Value.ToString());

                        }
                        catch (Exception ex)
                        {
                            return -1;
                            //Response.Write("<script>alert('Successful');</script>");
                        }
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return biodataid;
        }

        internal bool saveLoginInfo(userModel usermodel)
        {
            bool insertres = false;

            try
            {
                using (OracleConnection conn = getConnection())
                {
                    using (OracleCommand cmd = new OracleCommand("INSERTLOGININFO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        //Biodata 
                        cmd.Parameters.Add(new OracleParameter("V_DESCRIPTION", OracleDbType.Varchar2, usermodel.paymentDetails.Description, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PAYMENTID", OracleDbType.Varchar2, usermodel.paymentDetails.paymentitemID, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_REFERNCE", OracleDbType.Varchar2, usermodel.paymentDetails.ReferenceID, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("OUT_BIODATAID", OracleDbType.Int64)).Direction = ParameterDirection.Output;


                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {
                            cmd.ExecuteNonQuery();
                            long biodataid = Convert.ToInt64(cmd.Parameters["OUT_BIODATAID"].Value.ToString());
                            if (biodataid > 0)
                            {
                                insertres = true;
                            }
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
            return insertres;
        }
    }


}
// }