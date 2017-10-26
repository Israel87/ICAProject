<%@ Page Title="Registration Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrationPayment.aspx.cs" Inherits="ICA.registrationPayment" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center">
        <img src="../images/ica.png" style="border-radius: 5px; width: 100px; height: 50px" class="text-center" />
        <br />

        <h3 style="font-family: Agency FB"><b>ASSOCIATE / FELLOW / MEMBER MEMBERSHIP</b> </h3>
        <h5><b>REGISTRATION FORM </b></h5>
    </div>


    <section style="background: #efefe9;">
        <div class="container">
            <div class="row">

                <div class="board">

                    <div class="board-inner">
                        <ul class="nav nav-tabs" id="myTab">
                            <%--<div class="liner"></div>--%>
                            <li>
                                <a id="personalDet" title="Personal Details">
                                    <span class="round-tabs one">
                                        <i class="glyphicon glyphicon-user"></i>
                                    </span>
                                </a></li>

                            <li><a id="education" title="Educational Records">
                                <span class="round-tabs two">
                                    <i class="glyphicon glyphicon-cloud"></i>
                                </span>
                            </a>
                            </li>
                            <li><a id="employment" title="Employment Records">
                                <span class="round-tabs three">
                                    <i class="glyphicon glyphicon-briefcase"></i>
                                </span></a>
                            </li>

                            <li><a id="credentials" title="Credentials">
                                <span class="round-tabs four">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                </span>
                            </a></li>

                            <li class="active"><a data-toggle="tab" id="payment" title="Payment">
                                <span class="round-tabs five">
                                    <i class="glyphicon glyphicon-credit-card"></i>
                                </span></a>
                            </li>

                        </ul>
                    </div>

                    <%--  beginning of tabs --%>

                    <div class="tab-content">
                      

                        <%--    End of tab one --%>

                      

                        <%-- End of tab two --%>


                      
                        <%--  End of tab three --%>

                       

                        <%--                         End of tab four--%>
                     <div>
                            <div class="container">
                                <h3 class="container">Select Payment Amount &nbsp;&nbsp;
                                    ( <asp:Label ID="emailDisplay" runat="server"></asp:Label> )
                                </h3>
                                <hr />
                                <br />
                                <div class="form-group container">
                                   
                                    <b class="col-lg-4 control-label">Choose a Payment Category  
                                    </b>
                                    <div class="col-lg-8" >
                                        <select class="form-control" name="paymentCat" id="paymentCatID" datatextfield="PAYMENTTEXT" datavaluefield="PAYMENTITEMID" style="border: 2px solid #0094ff; width: 700px; border-radius: 0px" runat="server" required="required">
                                            

                                        </select>
                                    </div>
                                    <br />

                                    <center><br /> <br /> 
                                        
                                           <p id="errorMsg"></p>
                                        
                                        <br /> <br /> 


                                         <%--<asp:Button runat="server" ID="saveButton" CssClass="btn btn-success custom-btn add-button" style="display: inline; border-radius:0px" OnClientClick="return makePayment();" Text="PROCEED TO PAYMENT" ></asp:Button> --%>

                                        <%--<button runat="server" id="saveUserButton" class="btn btn-success custom-btn add-button" style="display: inline; border-radius:0px" onclick="return makePayment();"><b>PROCEED TO PAYMENT</b> </button>--%>
                                   <%--     btn btn-outline-rounded btn-primary pull-right--%>
                                        <asp:Button runat="server" ID="saveButton" CssClass="btn btn-success btn-outline-rounded custom-btn add-button" style="display: inline; width: 300px; " OnClientClick="return makePayment();" Text="PAY" Font-Bold="true" ></asp:Button> 

                                    </center>

                                </div>

                            </div>
                        </div>
                        <%-- End of tab five--%>
                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>
        </div>
    </section>




    <div class="modal fade bd-example-modal2-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            </div>
        </div>
    </div>

   
     <script type="text/javascript" src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>
     <script src="/ica/js/navbar.js"></script>
   
     <%-- <script src="/ica/js/navbar.js"></script>--%>


</asp:Content>
