<%@ Page Title="Student Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentmembership.aspx.cs" Inherits="ICA.studentmembership" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />

      <div class="row text-center"><br /><br />
             <a href="Default.aspx"><img src="../images/ica.png" style="border-radius: 5px" class="text-center"/> </a><br /><br /><br />
  <%--  <div class="container text-center">--%>
            <img src="../images/student.png" style="width:120px; height:120px" />
        <br /><br />
          <center>
                 
                <h5 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Candidates must hold a BSc/HND degree,<br /> Candidate must also be a serving corp member.</h5>
      
          </center>
       <br />
          <asp:HyperLink ID="studentReg" runat="server" Font-Bold="true" CssClass="btn btn-info btn-md" Width="300px" NavigateUrl="~/guest/studentRegistration.aspx" style="background-color:transparent; border-color:green" ForeColor="green">REGISTER</asp:HyperLink>
         

          <br />
          
         
    </div>
    

      <br />  <br />  <br />  <br />






</asp:Content>