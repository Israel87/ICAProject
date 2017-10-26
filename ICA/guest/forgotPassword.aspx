<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="ICA.forgotPassword" %>--%>

<%@ Page Title="ICA Membership Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="ICA.forgotPassword" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



        <div class="container text-center">
            <img src="../images/ica.png" style="border-radius: 5px; width:200px; height:80px" class="text-center" /><br /><br />
                  <h3><b>INSTITUTE OF CREDIT ADMINISTRATION</b> </h3>
                    <h5><b>Forgot Password</b></h5>
             <br /> 
          
            <br />
      </div>


  <center>
        <div class="col-lg-12 container"><br />
                 <h6><b>Please type in your email address to receive a notification.</b></h6><br />

            <asp:Label ID="emailLabel" runat="server" Text=""  Font-Bold="true"></asp:Label>
            <br />

                         <input class="form-control" type="text" style="border: 2px solid #0094ff; width:400px; border-radius: 0px" runat="server" id="emailID" placeholder="enter email address... " /><br />
               
                  <asp:Button ID="forgotPasswordID" runat="server" CssClass="btn btn-primary btn-md " style="border-radius:0px; width:400px;" Text="RESET" Font-Bold="true" OncLick="forgotPasswordID_Click" />
            <br />

            
          
           </div>
  </center>
      
  
   
           
      <br /><br /><br /><br /><br />  



</asp:Content>
