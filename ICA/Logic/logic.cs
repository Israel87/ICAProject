using ICA.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;


namespace ICA.Logic
{
    public class logic  
    {
        ConnectionManager conn = new ConnectionManager();

        internal bool RegisterUser(registrationViewModel regUser)
        {
            userModel userObj = new userModel()
            {
                personalInfo = new PersonalInfo()
                {
                    FirstName = regUser.personalinfo.FirstName,
                    MiddleName = regUser.personalinfo.MiddleName,
                    LastName = regUser.personalinfo.LastName,
                    Email = regUser.personalinfo.Email,
                    Phone = regUser.personalinfo.Phone,
                    Gender = regUser.personalinfo.Gender,
                    Title = regUser.personalinfo.Title,
                    DateofBirth = DateTime.ParseExact(regUser.personalinfo.DateofBirth, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    MaritalStatus = regUser.personalinfo.MaritalStatus

                },

                educationInfo = new EducationInfo()
                {
                    HighestDegree = regUser.educationinfo.HighestDegree,
                    NameofSchool = regUser.educationinfo.NameofSchool,
                    Graddate = DateTime.ParseExact(regUser.educationinfo.Graddate, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    Certifications = regUser.educationinfo.Certifications,

                },

                employmentInfo = new EmploymentInfo()
                {
                    YearsofExperience = Convert.ToInt32(regUser.employmentinfo.YearsofExperience),
                    RecentEmployer = regUser.employmentinfo.RecentEmployer,
                    Position = regUser.employmentinfo.Position,
                    DateEmployed = DateTime.ParseExact(regUser.employmentinfo.DateEmployed, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    Functions = regUser.employmentinfo.Functions,

                },

                //otherempDetails = new OtherEmpDetails()
                //{
                //    EmployerName = regUser.otherempdetails.EmployerName,
                //    Position = regUser.otherempdetails.Position,
                //    DateEmployed = regUser.otherempdetails.DateEmployed,
                //    EndYear = regUser.otherempdetails.EndYear,
                //    Functions = regUser.otherempdetails.Functions,
                //},

                paymentDetails = new PaymentDetails()
                {
                    Description = regUser.paymentdetails.Description,
                    ReferenceID = regUser.paymentdetails.ReferenceID,
                    paymentitemID = Convert.ToInt32(regUser.paymentdetails.PaymentItemID),
                    Status = 1,
                                    
                }
            };
            return conn.saveUser(userObj);
        }



    }
}