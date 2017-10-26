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
                    DateofBirth = DateTime.ParseExact(regUser.personalinfo.DateofBirth, "dd/MM/yyyy", CultureInfo.InvariantCulture),
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
                    

                    OtherEmployerII = regUser.employmentinfo.OtherEmployerII,
                    PositionII = regUser.employmentinfo.PositionII,
                    DateEmployedII = DateTime.ParseExact(regUser.employmentinfo.DateEmployedII, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    EndDateII = DateTime.ParseExact(regUser.employmentinfo.EndDateII, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    JobDescriptionII = regUser.employmentinfo.JobDescriptionII,

                    OtherEmployerIII = regUser.employmentinfo.OtherEmployerIII,
                    PositionIII = regUser.employmentinfo.PositionIII,
                    DateEmployedIII = DateTime.ParseExact(regUser.employmentinfo.DateEmployedIII, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    EndDateIII = DateTime.ParseExact(regUser.employmentinfo.EndDateIII, "dd/MM/yyyy", CultureInfo.InvariantCulture),
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