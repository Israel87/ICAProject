using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICA
{
    public class registrationViewModel
    {
        public personalInfo personalinfo { get; set; }
        public educationInfo educationinfo { get; set; }
        public employmentInfo employmentinfo { get; set; }
        public residentialInfo residentinfo { get; set; }
        public paymentDetails paymentdetails { get; set; }
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


    // class for payment information 
    public class paymentDetails
    {
        public string Description { get; set; }
        public string PaymentItemID { get; set; }
        public string ReferenceID { get; set; }
    }
}