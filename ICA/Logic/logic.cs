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
                    // DateofBirth = regUser.personalinfo.DateofBirth != "" ? Convert.ToDateTime(regUser.personalinfo.DateofBirth) : new DateTime(),
                    DateofBirth = regUser.personalinfo.DateofBirth != "" ? DateTime.ParseExact(regUser.personalinfo.DateofBirth, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),
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
                    // Graddate = regUser.educationinfo.Graddate != "" ? Convert.ToDateTime(regUser.educationinfo.Graddate) : new DateTime(),
                    Graddate = regUser.educationinfo.Graddate != "" ? DateTime.ParseExact(regUser.educationinfo.Graddate, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),
                    Certifications = regUser.educationinfo.Certifications
                },

                employmentInfo = new EmploymentInfo()
                {
                    YearsofExperience = Convert.ToInt32(regUser.employmentinfo.YearsofExperience),
                    RecentEmployer = regUser.employmentinfo.RecentEmployer,
                    Position = regUser.employmentinfo.Position,
                    DateEmployed = regUser.employmentinfo.DateEmployed != "" ? DateTime.ParseExact(regUser.employmentinfo.DateEmployed, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),
                    Functions = regUser.employmentinfo.Functions,


                    OtherEmployerII = regUser.employmentinfo.OtherEmployerII,
                    PositionII = regUser.employmentinfo.PositionII,
                    DateEmployedII = regUser.employmentinfo.DateEmployedII != "" ? DateTime.ParseExact(regUser.employmentinfo.DateEmployedII, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),

                    EndDateII = regUser.employmentinfo.EndDateII != "" ? DateTime.ParseExact(regUser.employmentinfo.EndDateII, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),

                    JobDescriptionII = regUser.employmentinfo.JobDescriptionII,

                    OtherEmployerIII = regUser.employmentinfo.OtherEmployerIII,
                    PositionIII = regUser.employmentinfo.PositionIII,
                    DateEmployedIII = regUser.employmentinfo.DateEmployedIII != "" ? DateTime.ParseExact(regUser.employmentinfo.DateEmployedIII, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),

                    EndDateIII = regUser.employmentinfo.EndDateIII != "" ? DateTime.ParseExact(regUser.employmentinfo.EndDateIII, "dd/MM/yyyy", CultureInfo.InvariantCulture) : new DateTime(1900, 1, 1),

                    JobDescriptionIII = regUser.employmentinfo.JobDescriptionIII,
                },

                businessReferee = new BusinessReferee()
                {
                    RefereeFirstName = regUser.businessreferee.RefereeFirstName,
                    RefereeLastName = regUser.businessreferee.RefereeLastName,
                    Position = regUser.businessreferee.PositionOccupied,
                    RefereeEmail = regUser.businessreferee.RefereeEmail,
                    RefereePhoneNumber = regUser.businessreferee.RefereePhoneNumber,

                    RefereeFirstNameII = regUser.businessreferee.RefereeFirstNameII,
                    RefereeLastNameII = regUser.businessreferee.RefereeLastNameII,
                    PositionII = regUser.businessreferee.PositionOccupiedII,
                    RefereeEmailII = regUser.businessreferee.RefereeEmailII,
                    RefereePhoneNumberII = regUser.businessreferee.RefereePhoneNumberII

                },

                userInfo = new UserInfo()
                {
                    MemcategoryID = regUser.userinfo.MemcategoryID,
                    
                },
                
                studentInfo = new StudentInfo()
                {
                    NyscStateCode = regUser.studentinfo.NyscStateCode
                },

                companyInfo = new CompanyInfo()
                {
                    Position = regUser.companyinfo.Position,
                    CompanyName = regUser.companyinfo.CompanyName,
                    CompanyAddress = regUser.companyinfo.CompanyAddress,
                    CompanyEmail = regUser.companyinfo.CompanyEmail,
                    WebAddress = regUser.companyinfo.WebAddress
                }
                //paymentDetails = new PaymentDetails()
                //{
                //    Description = regUser.paymentdetails.Description,
                //    ReferenceID = regUser.paymentdetails.ReferenceID,
                //    paymentitemID = Convert.ToInt32(regUser.paymentdetails.PaymentItemID),
                //    Status = 1,

                //}

            };

            int memcatID = regUser.userinfo.MemcategoryID;
            if (memcatID == 7)
                return conn.saveStudent(userObj);
            else if (memcatID == 4 || memcatID == 5 || memcatID == 6)
                return conn.saveUser(userObj);
            else
                return conn.saveCorporateData(userObj);
        }



    }
}