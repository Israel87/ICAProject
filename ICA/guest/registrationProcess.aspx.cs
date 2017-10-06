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
            personalInfo personalinfo = new personalInfo() {
                FirstName = firstname.Value,
                MiddleName = middlename.Value,
                LastName = lastname.Value,
                Email = email.Value,
                Phone = phoneNUmber.Text,
                Gender = gender.Value,
                Title = title.Value,
                DateofBirth = dob.Value,
                MaritalStatus = 1,
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
                Functions = functionID.Value
            };

            paymentDetails paymentdetails = new paymentDetails()
            {
               Description = paymentCatID.Value,
               ReferenceID = transRefID.Value,
               PaymentItemID = paymentCatID.Value,
            };

            registrationViewModel viewObj = new registrationViewModel()
            {
                personalinfo = personalinfo,
                educationinfo = educationinfo,
                employmentinfo = employmentinfo,
                paymentdetails = paymentdetails

            };


            try
            {
                if (FileUpload1.HasFile)
                {
                    // save passport
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Credentials/Passport/") + FileUpload1.FileName);
                    //lblMessage.Text = "Successful";
                    Response.Write("<script>alert('Successful...');</script>");
                    // lblMessage.Text = "Successful...";
                }
            }
            catch
            {
                Response.Write("<script>alert('Error saving Passport.');</script>");
                //lblMessage.Text = "Error Occurred...";
            }

            try
            {
                if (FileUpload2.HasFile)
                {
                    // save Resume
                    FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Credentials/Resume/") + FileUpload2.FileName);
                    //lblMessage.Text = "Successful";
                    Response.Write("<script>alert('Successful...');</script>");
                    // lblMessage.Text = "Successful...";
                }
            }
            catch
            {
                Response.Write("<script>alert('Error saving Resume.');</script>");
                //lblMessage.Text = "Error Occurred...";
            }


            if (logic.RegisterUser(viewObj))
            {
                Response.Write("<script>alert('Registration Process is Successful');</script>");
            }
            else
            {
                Response.Write("<script>alert('Registration Process Failed')</script>");
            }
        }

        protected void checkValBtnOne(object sender, EventArgs e)
        {
           if (String.IsNullOrEmpty(lastname.Value) )
            {
                lastname.Value = "*";
            }
            //if (String.IsNullOrEmpty(firstname.Value))
            //{
            //    firstnameVal.Text = "*";
            //}

            //if (String.IsNullOrEmpty(dob.Value))
            //{
            //    dobVal.Text = "*";
            //}

            //if (String.IsNullOrEmpty(email.Value))
            //{
            //    emailVal.Text = "*";
            //}

        }

    }
}