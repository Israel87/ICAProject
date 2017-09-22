<%@ Page Title="Individual Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="individualMembers.aspx.cs" Inherits="ICA.individualMembers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />
<div class="container text-center">
         <img src="images/ica.png" style="border-radius: 5px" class="text-center"/> <br /><br /><br />

            <h3><b>INDIVIDUAL MEMBERSHIP </b> </h3>
            <h5><b>The Categories under this Membership are : </b></h5>
            <br /><br />
    <center>
            <div class="row col-md-12">
                <div class="col-md-6">

                    <div class="input-group">
                        <img src="images/associatemember.png" style="width: 80px; height: 80px" />
                        
                            <b>Associate Members </b> <br /><br />
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-md" Text="Click to Choose" Font-Bold="true" />
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-info btn-md"  data-toggle="modal" data-target=".bd-example-modal3-lg" Text="Read More" Font-Bold="true" />

                    </div>

                </div>
                <div class="col-md-6">

                        <div class="input-group">
                            <img src="images/member.png" style="width: 80px; height: 80px" />
                             <b> Members </b><br /><br />
                            <asp:Button ID="Button3" runat="server" CssClass="btn btn-success btn-md" Text="Click to Choose" Font-Bold="true" />
                            <asp:Button ID="Button4" runat="server" CssClass="btn btn-info btn-md" data-toggle="modal" data-target=".bd-example-modal2-lg" Text="Read More" Font-Bold="true" />

                    </div>

                </div>
      
            </div>

        <div class="row col-md-12">
            <div class="input-group">
                <img src="images/fellow.png"  style="width: 80px; height: 80px" />
                     <b> Fellow </b> <br /><br />
                            <asp:Button ID="Button5" runat="server" CssClass="btn btn-success btn-md" Text="Click to Choose" Font-Bold="true" />
                            <asp:Button ID="Button6" runat="server" CssClass="btn btn-info btn-md" data-toggle="modal" data-target=".bd-example-modal-lg" Text="Read More" Font-Bold="true" />
            </div>
        </div>
        </center>
  </div> <br/><br /> 


    <%--<button class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>--%>
<%--    Silver Membership --%>
            <div class="modal fade bd-example-modal2-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  ...
                </div>
              </div>
            </div>
    <%--    Silver Membership --%>

    <%--    Platinum Membership --%>
            <div class="modal fade bd-example-modal3-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                 a
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
                                <img src="images/membersare.png" style="width: 80px; height: 80px"  />
                                <h5><b>Members are:</b></h5>
                                <p style="text-align:justify">
                                    Candidate of notable professional and academic
                                    achievements in the field of credit and financial
                                    management, or occupies top level position in
                                    management with functions having to do with credit,
                                    financial, accounting and marketing in a directorate or
                                    senior management capacity either at present or in
                                    the past; including membership of related
                                    professional institutes on similar grade.
                                </p>
                            </div>
                            <div class="col-md-6 text-center">
                                <img src="images/requirements.png" style="width: 80px; height: 80px" />
                                <h5><b>Requirements</b></h5>
                                <p style="text-align:justify">
                                    Prospective member fills membership application form and upload curriculum
                                    vitae (CV) on ICA membership portal.
                                    Makes payment of #5,000 membership application fee and submit application.
                                    Review of uploaded CV
                                    Approval of application for membership
                                    Payment of direct FICA membership fee of #150,000 and issuance of receipt
                                    Issuance of membership certificate with covering letter from ICA.Members
                                    collect their certificates on induction day
                                    Payment of AICA membership induction fee of #20.000 and issuance of receipt.
                                    Induction
                                </p>
                            </div>
                            
                            <center>
                                <br /> <hr /> <br />
                                <button class="btn btn-primary btn-block" runat="server" style="width:300px"><b> Register</b></button>
                            </center>
                            
                        </div>
                    </div><br />
                </div>
              </div>
            </div>
    <%--    Gold Membership --%>
</asp:Content>
