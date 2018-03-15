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
        ICA.Model.Util utilities = new Model.Util();

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
                MaritalStatus = Convert.ToInt32(maritStats.Value),

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

            // add the business referee to the save method.

          

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

            businessReferee businessreferee = new businessReferee()
            {
                RefereeFirstName = referenceFirstname.Value,
                RefereeLastName = referenceLastname.Value,
                PositionOccupied = positionOccupied.Value,
                RefereeEmail = referenceEmail.Value,
                RefereePhoneNumber = referencePhoneNumber.Value,

                RefereeFirstNameII = referenceFirstnameII.Value,
                RefereeLastNameII = referenceLastnameII.Value,
                PositionOccupiedII = positionOccupiedII.Value,
                RefereeEmailII = referenceLastnameII.Value,
                RefereePhoneNumberII = referencePhoneNumberII.Value
            };

            userInfo userinfo = new userInfo()
            {
                MemcategoryID = Convert.ToInt32(memcatgoryID.Value),
            };

            studentInfo studentinfo = new studentInfo()
            {
                NyscStateCode = null,
            };

            companyInfo companyinfo = new companyInfo()
            {
                Position = null,
                CompanyName = null,
                CompanyAddress = null,
                CompanyEmail = null,
                WebAddress = null,
            };
            //studentInfo studentinfo = new studentInfo()
            //{
            //    NyscStateCode = nyscstateCode.Value,
            //};

            //paymentDetails paymentdetails = new paymentDetails()
            //{
            //    Description = paymentCatID.Value,
            //    ReferenceID = transRefID.Value,
            //    PaymentItemID = paymentCatID.Value,
            //};

            registrationViewModel viewObj = new registrationViewModel()
            {
                personalinfo = personalinfo,
                residentinfo = residentialinfo,
                businessreferee = businessreferee,
                educationinfo = educationinfo,
                employmentinfo = employmentinfo,
                userinfo = userinfo,
                studentinfo = studentinfo,
                companyinfo = companyinfo
              //  studentinfo = studentinfo,

            };


            Session["ActiveMemCatID"] = userinfo.MemcategoryID;

            long biodataid = logic.RegisterUser(viewObj);
            //biodataid =Convert.ToInt64(Session["active_biodataid"]);

            if (biodataid > 0)
            {
                Session["UserEmail"] = personalinfo.Email;
                

             //   try
             //   {
             //       if (FileUpload1.FileName.EndsWith("jpg"))
             //       {
             //           String fileName = Server.MapPath("~") + "/ICA/Credentials/Passport/" + biodataid + ".jpg";
             //           FileUpload1.SaveAs(fileName);
             //           uploadNotificationI.Text = utilities.ShowSuccess("Uploaded Successfully.");
                        
             //       }
             //       else
             //       {
             //           uploadNotificationI.Text = utilities.ShowError("Invalid File Format.");
             //       }

             //// upload pdf files to the folder.

             //       if (FileUpload2.FileName.EndsWith("pdf"))
             //       {
             //           String fileNameII = Server.MapPath("~") + "/ICA/Credentials/Resume/" + biodataid + ".pdf";
             //           FileUpload2.SaveAs(fileNameII);
             //           uploadNotificationII.Text = utilities.ShowSuccess("Uploaded Successfully.");


             //       }
             //       else
             //       {
             //           uploadNotificationII.Text = utilities.ShowError("Invalid File Format.");
             //       }

                    

             //   }
             //   catch (Exception ex)
             //   {


             //   }
                Response.Write("<script>alert('Registration Process is Successful');</script>");
                Response.Redirect("~/guest/registrationPayment.aspx");
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