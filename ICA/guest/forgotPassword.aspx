<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="ICA.forgotPassword" %>--%>

<%@ Page Title="ICA Membership Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="ICA.forgotPassword" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



        <div class="container text-center">
             <a href="Default.aspx"><img src="../images/ica.png" style="border-radius: 5px" class="text-center"/> </a><br /><br />
                  <h3 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"> THE INSTITUTE OF CREDIT ADMINISTRATION </h3>
                    <h5 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Forgot Password</h5>
            
      </div>


  <center>
        <div class="col-lg-12 container"><br />

                     <asp:Label ID="resetID" runat="server" Font-Bold="true" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif" Visible="true"> 
                         Please type in your email address to receive a notification. 
                     </asp:Label>
                <br />  <br />  <br />
                    <asp:Label ID="emailLabel" runat="server" Font-Bold="true"></asp:Label>
     

                         <input class="form-control" type="text" style="border: 2px solid #0094ff; width:400px; border-radius: 0px" runat="server" id="emailID" placeholder="enter email address... " /><br />
               
                  <asp:Button ID="forgotPasswordID" runat="server" CssClass="btn btn-warning btn-md " style="border-radius:0px; width:400px;" Text="RESET" Font-Bold="true" OncLick="forgotPasswordID_Click" />
            <br />

            
          
           </div>
  </center>
      
  
   
           
      <br /><br /><br /><br /><br />  



</asp:Content>
