﻿<%@ Page Title="Corporate Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="corporateMembership.aspx.cs" Inherits="ICA.corporateMembership" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />
<div class="container text-center">
         <a href="Default.aspx"><img src="../images/ica.png" style="border-radius: 5px" class="text-center"/> </a><br />

            <h3 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">CORPORATE MEMBERSHIP </h3>
            <h5 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">The categories under this membership are : </h5>
            <br /><br />
    <%-- <section style="background:#efefe9;"><br /><br />--%>
    <center>
            <div class="row col-md-12" style="padding-left: 100px">
                <div class="col-md-4 text-center">

                    <div class="input-group">
                      
                            <img src="../images/silvermembership.png" style="width: 80px; height: 80px" /> <br /><br />
                       <div>
                            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-primary" NavigateUrl="~/guest/corporateRegistration.aspx" style="background-color:transparent; border-color:green" ForeColor="green" Font-Bold="true">Click to Choose</asp:HyperLink>
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-outline-info"  Text="Read More" Font-Bold="true" />
                       </div>
                            
							
							<%-- data-toggle="modal" data-target=".bd-example-modal-lg" --%>

                    </div>

                </div>
               



                  <div class="row col-md-4 text-center" >
                    <div class="input-group">
                        
                        <img src="../images/Gold.png" style="width: 80px; height: 80px;" />
                            <br /><br />
                             <div>
                                 <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="~/guest/corporateRegistration.aspx" style="background-color:transparent; border-color:green" ForeColor="green" Font-Bold="true">Click to Choose</asp:HyperLink>
                                    <asp:Button ID="Button6" runat="server" CssClass="btn btn-outline-info"  Text="Read More" Font-Bold="true" />
                             </div>
                                   
									
									<%-- data-toggle="modal" data-target=".bd-example-modal-lg" --%>
									
									
                    </div>
                </div>

                 <div class="col-md-4 text-center">

                        <div class="input-group">
                            
                             <img src="../images/Platinum.png" style="width: 80px; height: 80px"/>
                            <br /><br />
                      <div>
                           <asp:HyperLink ID="HyperLink" runat="server" CssClass="btn btn-primary" NavigateUrl="~/guest/corporateRegistration.aspx" style="background-color:transparent; border-color:green" ForeColor="green" Font-Bold="true">Click to Choose</asp:HyperLink>
                            <asp:Button ID="Button4" runat="server" CssClass="btn btn-outline-info" Text="Read More" Font-Bold="true" />
                      </div>
                          
							<%-- data-toggle="modal" data-target=".bd-example-modal-lg" --%>
                    </div>

                </div>








      
            </div>

      
        </center><br /><br />
 <%--   </section>--%>
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
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
               b
                </div>
              </div>
            </div>
    <%--    Gold Membership --%>
</asp:Content>



