<%@ Page Title="ICA Membership Sign In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="ICA.signIn" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
          <div class="container text-center">
            <img src="images/ica.png" style="border-radius: 5px; width:200px; height:80px" class="text-center" /><br /><br />
                  <h3><b>INSTITUTE OF CREDIT ADMINISTRATION</b> </h3>
                    <h5>SIGN IN</h5>
             <br /> 
            <%--<h4><b>SIGN IN</b></h4>--%>
            <br />
    </div>
   

           <div class="col-md-12 col-md-offset-4">
              
                                <%--<div class="login-panel panel panel-default" id="_header" style="padding:10px 10px 0 10px; margin-top: 10px; width: 400px;">
                                    <div class="panel-body" style="padding-bottom:0">--%>
                                        
                                                <div class="input-group" style="align-content:center">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <asp:TextBox ID="textUsername" type="text" CssClass="form-control" runat="server" placeholder="Username" style="width:500px; border-radius:0px; border:2px solid #0094ff"></asp:TextBox>
                                               
                                                </div><br />
                                                <div class="input-group" style="align-content:center">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                    <asp:TextBox ID="textPassword" type="password" CssClass="form-control" runat="server" placeholder="password" style="width:500px; border-radius:0px; border:2px solid #0094ff"></asp:TextBox>
                                             
                                                </div> 
                                           
                                            <br />
                                            <%--<asp:CheckBox ID="chkBox" Text="Remember Me"  runat="server"/><br />--%>
                                             <%--<asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-block btn-warning" runat="server" Text="Cancel" /><br />--%>  
                                   
                                            <div class="input-group">
             
                                                    <asp:Button ID="Button5" runat="server" CssClass="btn btn-success btn-md" style="width:150px; border-radius:0px; border:2px solid #ffd800" Text="LOGIN" Font-Bold="true" />
                                                    <asp:Button ID="Button6" runat="server" CssClass="btn btn-info btn-md" data-toggle="modal" style="width:150px; border:2px solid #0094ff; border-radius:0px" data-target=".bd-example-modal-lg" Text="REGISTER" Font-Bold="true" />
                                            </div>
                                       
                                             <%--<a class="text-center" href="ChangePassword.aspx" style="text-decoration:none"><b>Change Password</b></a> <br /> <br />--%>
                                                                         
                                <%--    </div>
                                </div>--%><br />
                                        <asp:Label ID="errlbl" CssClass="" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label><br />
                                <%--<p id="error_lbl" style="color:red" runat="server"></p>--%>
                  

           </div>
    </asp:Content>