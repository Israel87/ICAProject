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

        internal bool saveUser (userModel usermodel)
        {
            bool insertres = false;

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
                        cmd.Parameters.Add(new OracleParameter("V_YEARSEXPERIENCE ", OracleDbType.Int32, usermodel.employmentInfo.YearsofExperience, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_RECENTEMPLOYER", OracleDbType.Varchar2, usermodel.employmentInfo.RecentEmployer, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_POSITION", OracleDbType.Varchar2, usermodel.employmentInfo.Position, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DATEEMPLOYED", OracleDbType.Date, usermodel.employmentInfo.DateEmployed, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_FUNCTIONS", OracleDbType.Varchar2, usermodel.employmentInfo.Functions, ParameterDirection.Input));

                        //Other Work Experience
                        //cmd.Parameters.Add(new OracleParameter("V_EMPLOYERNAME", OracleDbType.Varchar2, usermodel.otherempDetails.EmployerName, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_POSITIONII", OracleDbType.Varchar2, usermodel.otherempDetails.PositionII, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_DATEEMPLOYEDII", OracleDbType.Varchar2, usermodel.otherempDetails.DateEmployedII, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_ENDYEAR", OracleDbType.Varchar2, usermodel.otherempDetails.EndYear, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_JOBDESCRIPTIONII", OracleDbType.Varchar2, usermodel.otherempDetails.Functions, ParameterDirection.Input));



                        cmd.Parameters.Add(new OracleParameter("V_PASSWORD", OracleDbType.Varchar2, "password", ParameterDirection.Input));

                        //Payment Details 
                        cmd.Parameters.Add(new OracleParameter("V_DESCRIPTION", OracleDbType.Varchar2, usermodel.paymentDetails.Description, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PAYMENTID", OracleDbType.Int32, usermodel.paymentDetails.paymentitemID, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_REFERNCE", OracleDbType.Varchar2, usermodel.paymentDetails.ReferenceID, ParameterDirection.Input));

                        //cmd.Parameters.Add(new OracleParameter("OUT_BIODATAID", OracleDbType.Int64)).Direction = ParameterDirection.Output;


                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {
                            cmd.ExecuteNonQuery();
                            insertres = true;
                            //long biodataid = Convert.ToInt64(cmd.Parameters["OUT_BIODATAID"].Value.ToString());
                            //if (biodataid > 0)
                            //{
                            //    insertres = true;
                            //}                                  
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