﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICA
{
    public class registrationViewModel
    {
        public personalInfo personalinfo { get; set; }
        public residentialInfo residentinfo { get; set; }
        public educationInfo educationinfo { get; set; }
        public employmentInfo employmentinfo { get; set; } 
        public businessReferee businessreferee { get; set; }
        public paymentDetails paymentdetails { get; set; }
        public userInfo userinfo { get; set; }
        public studentInfo studentinfo { get; set; }
        public companyInfo companyinfo { get; set; }
    }

    // class for personal information.
    public class personalInfo
    {
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Gender { get; set; }
        public string Title { get; set; }
        public string DateofBirth { get; set; }
        public int MaritalStatus { get; set; }
        public DateTime DateAdded { get; set; }
        public DateTime LastUpdated { get; set; }

    }


    public class residentialInfo
    {
        public string Streetname { get; set; }
        public string StreetnameII { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zipcode { get; set; }
        public string Country { get; set; }

    }

    
  
    // class for educational information.
    public class educationInfo
    {
        public string HighestDegree { get; set; }
        public string NameofSchool { get; set; }
        public string Graddate { get; set; }
        public string Certifications { get; set; }
    }


    // class for employment information
    public class employmentInfo
    {
        public string YearsofExperience { get; set; }
        public string RecentEmployer { get; set; }
        public string Position { get; set; }
        public string DateEmployed { get; set; }
        public string Functions { get; set; }

        public string OtherEmployerII { get; set; }
        public string PositionII { get; set; }
        public string DateEmployedII { get; set; }
        public string EndDateII { get; set; }
        public string JobDescriptionII { get; set; }

        public string OtherEmployerIII { get; set; }
        public string PositionIII { get; set; }
        public string DateEmployedIII { get; set; }
        public string EndDateIII { get; set; }
        public string JobDescriptionIII { get; set; }
    }

    // class for business referee information
    public class businessReferee
    {
        public string RefereeFirstName { get; set; }
        public string RefereeLastName { get; set; }
        public string PositionOccupied { get; set; }
        public string RefereeEmail { get; set; }
        public string RefereePhoneNumber { get; set; }

        public string RefereeFirstNameII { get; set; }
        public string RefereeLastNameII { get; set; }
        public string PositionOccupiedII { get; set; }
        public string RefereeEmailII { get; set; }
        public string RefereePhoneNumberII { get; set; }
    }


    // class for payment information 
    public class paymentDetails
    {
        public string Description { get; set; }
        public string PaymentItemID { get; set; }
        public string ReferenceID { get; set; }
    }

    public class userInfo
    {
        public int MemcategoryID { get; set; }
    }

    public class studentInfo
    {
        public string NyscStateCode { get; set; }
    }

    public class companyInfo
    {
        public string Position { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyEmail { get; set; }
        public string WebAddress { get; set; }
    }

}