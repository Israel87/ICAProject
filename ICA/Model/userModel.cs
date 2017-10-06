using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICA.Model
{
    public class userModel
    {
        public PersonalInfo personalInfo { get; set; }
        public EducationInfo educationInfo { get; set; }
        public EmploymentInfo employmentInfo { get; set; }
        public OtherEmpDetails otherempDetails { get; set; }
        public PaymentDetails paymentDetails { get; set; }
    }


    // class for personal information.
    public class PersonalInfo
    {
        public int BiodataID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Gender { get; set; }
        public string Title { get; set; }
        public DateTime DateofBirth { get; set; }
        public int MaritalStatus { get; set; }
        public DateTime DateAdded { get; set; }
        public DateTime LastUpdated { get; set; }
    }

    // class for educational information.
    public class EducationInfo
    {
        public int EducationinfoID { get; set; }
        public int BiodataID { get; set; }
        public string HighestDegree { get; set; }
        public string NameofSchool { get; set; }
        public DateTime Graddate { get; set; }
        public string Certifications { get; set; }
    }


    // class for employment information
    public class EmploymentInfo
    {
        public int EmploymentinfoID { get; set; }
        public int BiodataID { get; set; }
        public int YearsofExperience { get; set; }
        public string RecentEmployer { get; set; }
        public string Position { get; set; }
        public string Functions { get; set; }
        public DateTime DateEmployed { get; set; }
        public string JobDescription { get; set; }
    }

    // class for other  information 
    public class OtherEmpDetails
    {
        public int OtherExperienceID { get; set; }
        public int BiodataID { get; set; }
        public string EmployerName { get; set; }
        public string PositionII { get; set; }
        public string DateEmployedII { get; set; }
        public string EndYear { get; set; }
        public string Functions { get; set; }
    }

    // class for payment information 
    public class PaymentDetails
    {
        public int PaymentID { get; set; }
        public int UserID { get; set; }
        public string Description { get; set; }
        public string ReferenceID { get; set; }
        public int Status { get; set; }
        public DateTime Timestamp { get; set; }
        public string Response { get; set; }
        public int paymentitemID { get; set; }

    }
}