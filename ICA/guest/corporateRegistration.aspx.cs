using ICA.Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.guest
{
    public partial class corporateRegistration : System.Web.UI.Page
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
                MiddleName = "NA",
                LastName = lastname.Value,
                Email = email.Value,
                Password = password.Value,
                Phone = phoneNumber.Value,
                Gender = "M",
                Title = "1",
                DateofBirth = "01/01/1991",
                MaritalStatus = Convert.ToInt32("1"),

            };

            residentialInfo residentialinfo = new residentialInfo()
            {
                Streetname = streetAddress.Text,
                StreetnameII = "NA",
                City = city.Value,
                Zipcode = "NA",
                State = stateID.Value,
                Country = country.Value,

            };

            // add the business referee to the save method.



            educationInfo educationinfo = new educationInfo()
            {
                HighestDegree = "NA",
                NameofSchool = "NA",
                Graddate = "01/01/1991",
                Certifications = "NA",
            };

            employmentInfo employmentinfo = new employmentInfo()
            {
                YearsofExperience = "3",
                RecentEmployer = "NA",
                Position = "NA",
                DateEmployed = "01/01/1991",
                Functions = "NA",

                OtherEmployerII = "null",
                PositionII = "null",
                DateEmployedII = "01/01/1991",
                EndDateII = "01/01/1991",
                JobDescriptionII = "null",

                OtherEmployerIII = "null",
                PositionIII = "null",
                DateEmployedIII = "01/01/1991",
                EndDateIII = "01/01/1991",
                JobDescriptionIII = "null",
            };

            businessReferee businessreferee = new businessReferee()
            {
                RefereeFirstName = "NA",
                RefereeLastName = "NA",
                PositionOccupied = "NA",
                RefereeEmail = "NA",
                RefereePhoneNumber = "NA",

                RefereeFirstNameII = "NA",
                RefereeLastNameII = "NA",
                PositionOccupiedII = "NA",
                RefereeEmailII = "NA",
                RefereePhoneNumberII = "NA"
            };

            userInfo userinfo = new userInfo()
            {
                MemcategoryID = Convert.ToInt32(memcatgoryID.Value),
            };

            studentInfo studentinfo = new studentInfo()
            {
                NyscStateCode = "NA"
            };


            companyInfo companyinfo = new companyInfo()
            {
                Position = position.Value,
                CompanyName = nameofCompany.Value,
                CompanyAddress = adressofCompany.Text,
                CompanyEmail = companyEmail.Text,
                WebAddress = webAddress.Value,
            };
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
    }
}