<%@ Page Title="Student Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentmembership.aspx.cs" Inherits="ICA.studentmembership" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />

      <div class="row text-center"><br /><br />
            <img src="images/ica.png" style="border-radius: 5px"/> <br /><br /><br />
  <%--  <div class="container text-center">--%>
            <img src="images/student.png" style="width:120px; height:120px" />
        <br /><br />
          <center>
                 
                <h5><b>Candidates must hold a BSc/HND degree,<br /> Candidate must also be a serving corp member.</b></h5>
      
          </center>
       <br />
          <asp:HyperLink ID="studentReg" runat="server" Font-Bold="true" CssClass="btn btn-info btn-md" Width="300px" NavigateUrl="~/registrationProcess.aspx" style="border-radius:0px">REGISTER</asp:HyperLink>
         

          <br />
          
         
    </div>
    

      <br />  <br />  <br />  <br />






</asp:Content>