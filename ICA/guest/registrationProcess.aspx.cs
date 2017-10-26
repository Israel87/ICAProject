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
                Graddate = graddateID.Value,
                Certifications = certNameID.Value,
            };

            employmentInfo employmentinfo = new employmentInfo()
            {
                YearsofExperience = experienceID.Value,
                RecentEmployer = nameOrgID.Value,
                Position = posOccID.Value,
                DateEmployed = dateEmpID.Value,
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
                educationinfo = educationinfo,
                employmentinfo = employmentinfo,

            };



            long biodataid = logic.RegisterUser(viewObj);
            //biodataid =Convert.ToInt64(Session["active_biodataid"]);

            if (biodataid > 0)
            {
                Session["UserEmail"] = personalinfo.Email;
                

                try
                {
                    if (FileUpload1.FileName.EndsWith("jpg"))
                    {
                        String fileName = Server.MapPath("~") + "/Credentials/Passport/" + biodataid + ".jpg";
                        FileUpload1.SaveAs(fileName);
                        Response.Write("<script>alert('Successful...');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error saving Passport, Kindly upload with the right format.');</script>");
                    }

             // upload pdf files to the folder.

                    if (FileUpload2.FileName.EndsWith("pdf"))
                    {
                        String fileNameII = Server.MapPath("~") + "/Credentials/Resume/" + biodataid + ".pdf";
                        FileUpload2.SaveAs(fileNameII);

                        Response.Write("<script>alert('Successful...');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error saving Resume, Kindly upload with the right format.');</script>");
                    }

                    

                }
                catch (Exception ex)
                {


                }
                Response.Write("<script>alert('Registration Process is Successful');</script>");
                Response.Redirect("/guest/registrationPayment.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration Process Failed')</script>");
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