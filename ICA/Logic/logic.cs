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

        internal long RegisterUser(registrationViewModel regUser)
        {
            userModel userObj = new userModel()
            {
                personalInfo = new PersonalInfo()
                {
                    FirstName = regUser.personalinfo.FirstName,
                    MiddleName = regUser.personalinfo.MiddleName,
                    LastName = regUser.personalinfo.LastName,
                    Email = regUser.personalinfo.Email,
                    Password = regUser.personalinfo.Password,
                    Phone = regUser.personalinfo.Phone,
                    Gender = regUser.personalinfo.Gender,
                    Title = regUser.personalinfo.Title,
                    DateofBirth = regUser.personalinfo.DateofBirth != "" ? Convert.ToDateTime(regUser.personalinfo.DateofBirth) : new DateTime(),
                    MaritalStatus = regUser.personalinfo.MaritalStatus,
                  
          

                },

                residentialInfo = new ResidentialInfo()
                {
                    Streetname = regUser.residentinfo.Streetname,
                    StreetnameII = regUser.residentinfo.StreetnameII,
                    City = regUser.residentinfo.City,
                    State = regUser.residentinfo.State,
                    Zipcode = regUser.residentinfo.Zipcode,
                    Country = regUser.residentinfo.Country,

                },

                educationInfo = new EducationInfo()
                {
                    HighestDegree = regUser.educationinfo.HighestDegree,
                    NameofSchool = regUser.educationinfo.NameofSchool,
                    Graddate = regUser.educationinfo.Graddate != "" ? Convert.ToDateTime(regUser.educationinfo.Graddate) : new DateTime(),
                    Certifications = regUser.educationinfo.Certifications
                },

                employmentInfo = new EmploymentInfo()
                {
                    YearsofExperience = Convert.ToInt32(regUser.employmentinfo.YearsofExperience),
                    RecentEmployer = regUser.employmentinfo.RecentEmployer,
                    Position = regUser.employmentinfo.Position,
                    DateEmployed = regUser.employmentinfo.DateEmployed != "" ? Convert.ToDateTime(regUser.employmentinfo.DateEmployed) : new DateTime(),
                    Functions = regUser.employmentinfo.Functions,
                    

                    OtherEmployerII = regUser.employmentinfo.OtherEmployerII,
                    PositionII = regUser.employmentinfo.PositionII,
                    DateEmployedII = regUser.employmentinfo.DateEmployedII != "" ? Convert.ToDateTime(regUser.employmentinfo.DateEmployedII) : new DateTime(),

                    EndDateII = regUser.employmentinfo.EndDateII != "" ? Convert.ToDateTime(regUser.employmentinfo.EndDateII) : new DateTime(),
                  
                    JobDescriptionII = regUser.employmentinfo.JobDescriptionII,

                    OtherEmployerIII = regUser.employmentinfo.OtherEmployerIII,
                    PositionIII = regUser.employmentinfo.PositionIII,
                    DateEmployedIII = regUser.employmentinfo.DateEmployedIII != "" ? Convert.ToDateTime(regUser.employmentinfo.DateEmployedIII) : new DateTime(),

                    EndDateIII = regUser.employmentinfo.EndDateIII != "" ? Convert.ToDateTime(regUser.employmentinfo.EndDateIII) : new DateTime(),
               
                    JobDescriptionIII = regUser.employmentinfo.JobDescriptionIII,
                },

                //paymentDetails = new PaymentDetails()
                //{
                //    Description = regUser.paymentdetails.Description,
                //    ReferenceID = regUser.paymentdetails.ReferenceID,
                //    paymentitemID = Convert.ToInt32(regUser.paymentdetails.PaymentItemID),
                //    Status = 1,
                                    
                //}
            };
            return conn.saveUser(userObj);
        }



    }
}