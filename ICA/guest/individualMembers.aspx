<%@ Page Title="Individual Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="individualMembers.aspx.cs" Inherits="ICA.individualMembers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />
<div class="container text-center">
          <a href="Default.aspx"><img src="../images/ica.png" style="border-radius: 5px" class="text-center"/> </a><br /><br /><br />

            <h3 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">INDIVIDUAL MEMBERSHIP </h3>
            <h5 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">The Categories under this Membership are : </h5>
            <br /><br />
    <center>
            <div class="row col-md-12 text-center" style="padding-left: 100px">
                <div class="col-md-4">

                    <div class="input-group">
                        <img src="../images/associatemember.png" style="width: 80px; height: 80px" /><br /><br />
                        
                            <P style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">ASSOCIATE MEMBERS </P> <br />
                           <%-- <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-md" style="border-radius:0px" Text="Click to Choose" Font-Bold="true" /> --%>
							
							 <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="true" CssClass="btn btn-warning btn-md" NavigateUrl="~/guest/registrationProcess.aspx" style="border-radius:0px">Click to Choose</asp:HyperLink>
							 
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-md" style="border-radius:0px"  data-toggle="modal" data-target=".bd-example-modal2-lg" Text="Read More" Font-Bold="true" />
							<%-- data-toggle="modal" data-target=".bd-example-modal3-lg" --%>
                    </div>

                </div>
                <div class="col-md-4">

                        <div class="input-group">
                            <img src="../images/member.png" style="width: 80px; height: 80px" /><br /><br />
                             <P style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"> MEMBERS </P><br />
                            <%-- <asp:Button ID="Button3" runat="server" CssClass="btn btn-success btn-md" style="border-radius:0px" Text="Click to Choose" Font-Bold="true" />--%>
							
							 <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="true" CssClass="btn btn-warning btn-md" NavigateUrl="~/guest/registrationProcess.aspx" style="border-radius:0px">Click to Choose</asp:HyperLink>
							 
                            <asp:Button ID="Button4" runat="server" CssClass="btn btn-success btn-md" style="border-radius:0px" data-toggle="modal" data-target=".bd-example-modal3-lg" Text="Read More" Font-Bold="true" />
							<%-- data-toggle="modal" data-target=".bd-example-modal2-lg" --%>
                    </div>

                </div>

                   <div class="row col-md-4">
            <div class="input-group">
                <img src="../images/fellow.png"  style="width: 80px; height: 80px" /><br /><br />
                     <P style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"> FELLOW </P> <br />
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true" CssClass="btn btn-warning btn-md" NavigateUrl="~/guest/registrationProcess.aspx" style="border-radius:0px">Click to Choose</asp:HyperLink>
                            <%--<asp:Button ID="Button5" runat="server" CssClass="btn btn-success btn-md" style="border-radius:0px" Text="Click to Choose" Font-Bold="true" />--%>
                            <asp:Button ID="Button6" runat="server" CssClass="btn btn-success btn-md" style="border-radius:0px" data-toggle="modal" data-target=".bd-example-modal-lg" Text="Read More" Font-Bold="true" />
            </div>
        </div>


      
            </div>

     
        </center>
  </div> <br/><br /> 


    <%--<button class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>--%>
<%--    Silver Membership --%>
            <div class="modal fade bd-example-modal2-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" style="width: 800px">
                <div class="modal-content" style="padding:50px">
                    <div class="container">
                          <div style="text-align:center">
                            <h4><b> ASSOCIATE MEMBERSHIP</b></h4>
                        </div><br />
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <img src="../images/membersare.png" style="width: 80px; height: 80px"  />
                                <h5><b>Members are:</b></h5><hr />
                                <p style="text-align:justify">
                                   Candidate must have completed the institute’s final professional examinations.
                                   However, a candidate with good honors degree or its equivalent in Accounting,
                                   Banking & Finance, Business Management, Marketing, etc with relevant work experience
                                   of not less than three years may be considered.<br /><br /><br />
                                   <center>
                                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="true" CssClass="btn btn-success btn-md" Width="200px" NavigateUrl="~/guest/registrationProcess.aspx" style="border-radius:0px">REGISTER</asp:HyperLink>
                                  </center>
                                </p><hr />
                            </div>

                              <div class="col-md-6 text-center">
                                <img src="../images/requirements.png" style="width: 80px; height: 80px"  />
                                <h5><b>Requirements:</b></h5><hr />
                              
                                    <ul style="text-align:justify">
                                        <li>Prospective member fills membership application form and upload curriculum vitae (CV) on ICA membership portal.</li>
                                        <li> Make payment of #5,000 membership application fee and submit application.</li>
                                        <li>Review of uploaded CV</li>
                                        <li> Approval of application for membership by authorized ICA official.</li>
                                        <li> Payment of direct AICA membership fee of #47,500 and issuance of receipt.</li>
                                        <li>Issuance of membership certificate with covering letter from ICA. Members collect their certificates on induction day.</li>
                                        <li>  Payment of AICA membership induction fee of #10.000 and issuance of receipt.</li>
                                        <li> Induction</li>
                                        <li>  Members collect their certificates on induction day</li>
                                    </ul>
                                    <br />
                                 
                                  
                               <hr />
                            </div>

                        </div>
                    </div>
         
                </div>
              </div>
            </div>
    <%--    Silver Membership --%>

    <%--    Platinum Membership --%>
            <div class="modal fade bd-example-modal3-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" style="width:800px;">
                  <div class="modal-content" style="padding:50px">
                    <div class="container">
                          <div style="text-align:center">
                            <h4><b> MEMBER</b></h4>
                        </div><br />
                   <div class="row">
                            <div class="col-md-6 text-center">
                                <img src="../images/membersare.png" style="width: 80px; height: 80px"  />
                                <h5><b>Members are:</b></h5><hr />
                                <p style="text-align:justify">
                                  Candidate must possess good honors degree or its equivalent with relevant work experience
                                  at middle management level with functions having to do with Credit Management, Accounting,
                                  Banking and Finance and Marketing of not less than five years. In addition,
                                  candidate must show evidence of professional membership in the same grade or “associate grade”
                                  obtained from relevant recognized professional body.<br /><br /><br />
                                   <center>
                                        <asp:HyperLink ID="HyperLink5" runat="server" Font-Bold="true" CssClass="btn btn-success btn-md" Width="200px" NavigateUrl="~/guest/registrationProcess.aspx" style="border-radius:0px">REGISTER</asp:HyperLink>
                                  </center>
                                </p><hr />
                            </div>

                              <div class="col-md-6 text-center">
                                <img src="../images/requirements.png" style="width: 80px; height: 80px"  />
                                <h5><b>Requirements:</b></h5><hr />
                              
                                    <ul style="text-align:justify">
                                        <li>Prospective member fills membership application form and upload curriculum vitae (CV) on ICA membership portal.</li>
                                        <li>Makes payment of #5,000 membership application fee and submit application.</li>
                                        <li>Review of uploaded CV</li>
                                        <li> Approval of application for membership by authorized ICA official.</li>
                                        <li> Payment of direct MICA membership fee of #67,000</li>
                                        <li>Issuance of membership certificate with covering letter from ICA. Members collect their certificates on induction day.</li>
                                        <li> Payment of MICA membership induction fee of #15.000 and issuance of receipt.</li>
                                        <li> Induction</li>
                                    
                                    </ul>
                                    <br />
                                 
                                  
                               <hr />
                            </div>

                        </div>
                    </div>
         
                </div>
              </div>
            </div>
    <%--    Platinum Membership --%>

    <%--    Gold Membership --%>
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" style="width: 800px">
                <div class="modal-content" style="padding: 50px" >
                    <div class="container">
                        <div style="text-align:center">
                            <h4><b> FELLOW MEMBERSHIP</b></h4>
                        </div><br />
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <img src="../images/membersare.png" style="width: 80px; height: 80px"  />
                                <h5><b>Members are:</b></h5><hr />
                                <p style="text-align:justify">
                                    Candidate of notable professional and academic
                                    achievements in the field of credit and financial
                                    management, or occupies top level position in
                                    management with functions having to do with credit,
                                    financial, accounting and marketing in a directorate or
                                    senior management capacity either at present or in
                                    the past; including membership of related
                                    professional institutes on similar grade.<br /><br /><br />

                                    <center>
                                         <asp:HyperLink ID="reg" runat="server" Font-Bold="true" CssClass="btn btn-success btn-md" Width="200px" NavigateUrl="~/guest/registrationProcess.aspx" style="border-radius:0px">REGISTER</asp:HyperLink>
                                    </center>

                                     
                                    
                                    <br /><br />
                                </p><hr />
                            </div>
                            <div class="col-md-6 text-center">
                                <img src="../images/requirements.png" style="width: 80px; height: 80px" />
                                <h5><b>Requirements</b></h5><hr />
                                 <ul style="text-align:justify">
                                        <li>Prospective member fills membership application form and upload curriculum vitae (CV) on ICA membership portal.</li>
                                        <li>Makes payment of #5,000 membership application fee and submit application.</li>
                                        <li>Review of uploaded CV</li>
                                        <li> Approval of application for membership by authorized ICA official.</li>
                                        <li> Payment of direct FICA membership fee of #150,000 and issuance of receipt</li>
                                        <li>Issuance of membership certificate with covering letter from ICA. Members collect their certificates on induction day.</li>
                                        <li> Payment of MICA membership induction fee of #15.000 and issuance of receipt.</li>
                                        <li> Induction</li>
                                    
                                    </ul>
                                <hr /> <br /><br />
                            </div>
                            
                            <center>
                                <br /> <hr /> <br /><br />

                               
                               
                                    <%--<button class="btn btn-primary btn-block" runat="server" style="width:300px" href="~/registrationProcess.aspx"><b> Register</b></button>--%>
          
                            </center>
                            
                        </div>
                    </div><br />
                </div>
              </div>
            </div>
    <%--    Gold Membership --%>
</asp:Content>
