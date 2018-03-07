<%@ Page Title="Select Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="selectCategory.aspx.cs" Inherits="ICA.selectCategory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row text-center"><br />
            <a href="Default.aspx"><img src="../images/ica.png" style="border-radius: 5px" class="text-center"/> </a>
          <br /><br /><br />
          <h4 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"> Choose a Membership Type</h4> 
          <br /><br /><br />
          <center>
          <div class="input-group" >
              <div class="col-md-4">

                   <a href="corporateMembership.aspx">
                       <img src="../images/corporate2.png" style="width:120px; height:120px"/>
                   </a>   
              </div>

                <div class="col-md-4">
                   <a href="studentmembership.aspx">
                       <img src="../images/student.png" style="width:120px; height:120px" />
                   </a>   
              </div>

              <div class="col-md-4">
                   <a  href="individualMembers.aspx" >
                       <img src="../images/individual2.png" style="width:120px; height:120px" />
                   </a>   
              </div>
            
          </div>
          </center>

      </div>

    <br /><br /><br /><br /><br />

</asp:Content>