using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ICA.registrationViewModel;
using ICA.Logic;

namespace ICA
{
    public partial class registrationProcess : System.Web.UI.Page
    {
        logic logic = new logic();
        EmailWS.WebService Emal = new EmailWS.WebService();
        ICA.Model.Util utilities = new Model.Util();
        string _usermail;
        string _fullname;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            personalInfo personalinfo = new personalInfo()
            {
                FirstName = firstname.Value,
                MiddleName = middlename.Value,
                LastName = lastname.Value,
                Email = email.Value,
                Password = password.Value,
                Phone = phoneNUmber.Text,
                Gender = gender.Value,
                Title = title.Value,
                DateofBirth = dob.Value,
                MaritalStatus = 1,

            };

            residentialInfo residentialinfo = new residentialInfo()
            {
                Streetname = addressI.Text,
                StreetnameII = addressII.Text,
                City = city.Text,
                Zipcode = zip.Text,
                State = stateID.Value,
                Country = country.Value,

            };

            educationInfo educationinfo = new educationInfo()
            {
                HighestDegree = degreeID.Value,
                NameofSchool = instNameID.Value,
                Graddate = graddate.Value,
                Certifications = certNameID.Value,
            };

            employmentInfo employmentinfo = new employmentInfo()
            {
                YearsofExperience = experienceID.Value,
                RecentEmployer = nameOrgID.Value,
                Position = posOccID.Value,
                DateEmployed = dateEmp.Value,
                Functions = functionID.Value,

                OtherEmployerII = nameOrgI.Value,
                PositionII = posOccI.Value,
                DateEmployedII = startDateI.Value,
                EndDateII = endDateI.Value,
                JobDescriptionII = functionsI.Value,

                OtherEmployerIII = nameOrgII.Value,
                PositionIII = posOccII.Value,
                DateEmployedIII = startDateII.Value,
                EndDateIII = endDateII.Value,
                JobDescriptionIII = functionsII.Value,
            };

            userInfo userinfo = new userInfo()
            {
                MemcategoryID = Convert.ToInt32(memcatgoryID.Value),
            };


            registrationViewModel viewObj = new registrationViewModel()
            {
                personalinfo = personalinfo,
                residentinfo = residentialinfo,
                educationinfo = educationinfo,
                employmentinfo = employmentinfo,
                userinfo = userinfo,

            };



            long biodataid = logic.RegisterUser(viewObj);
            //biodataid =Convert.ToInt64(Session["active_biodataid"]);

            if (biodataid > 0)
            {
                try
                {
                    if (FileUpload1.FileName.EndsWith("jpg"))
                    {
                        String fileName = Server.MapPath("~") + "/Content/Credentials/Passport/" + biodataid + ".jpg";
                        FileUpload1.SaveAs(fileName);
                        uploadNotificationI.Text = utilities.ShowSuccess("Uploaded Successfully.");
                        
                    }
                    else
                    {
                        uploadNotificationI.Text = utilities.ShowError("Invalid File Format.");
                    }

             // upload pdf files to the folder.

                    if (FileUpload2.FileName.EndsWith("pdf"))
                    {
                        String fileNameII = Server.MapPath("~") + "/Content/Credentials/Resume/" + biodataid + ".pdf";
                        FileUpload2.SaveAs(fileNameII);
                        uploadNotificationII.Text = utilities.ShowSuccess("Uploaded Successfully.");


                    }
                    else
                    {
                        uploadNotificationII.Text = utilities.ShowError("Invalid File Format.");
                    }
                }
                catch (Exception ex)
                {


                }
                // send notification to the user 
                Session["UserEmail"] = personalinfo.Email;
                Session["FirstName"] = personalinfo.FirstName;
                Session["LastName"] = personalinfo.LastName;

                _usermail = Session["UserEmail"].ToString();
                _fullname = Session["FirstName"].ToString() + ", " + Session["LastName"].ToString();

                string _subject = "ICA Successfull Registration.";

                string _body = "Dear " + _fullname + " have successfully registered on ICA, Please log in using this address: 154.113.0.163:1010/ICA to sign in and view your personal page.";

                try
                {

                    string response = Emal.sendmail1(_usermail, _subject, _body);

                }
                catch (Exception ex)
                {

                }

                Response.Redirect("~/guest/registrationPayment.aspx");
                

            }
            else if(biodataid == -1)
            {
                Response.Write("<script>alert('Email Address already exists.');</script>");
            }
            else
            {

            }
        }

        protected void checkValBtnOne(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(lastname.Value))
            {
                lastname.Value = "*";
            }

        }

    }
}