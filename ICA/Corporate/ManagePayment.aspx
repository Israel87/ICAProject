﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteCorporate.Master" AutoEventWireup="true" CodeBehind="ManagePayment.aspx.cs" Inherits="ICA.Corporate.ManagePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
     <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#">
                        <em class="fa fa-home"></em>
                    </a></li>
                    <li class="active"><b>Make payments & view payment history</b></li>
                </ol>
                    <div class="col-lg-12">
                    <h3 class="page-header">Make Payments</h3>
                </div>
            </div>

           
         <form runat="server">
                  <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <br />
                         <input runat="server" name="emailDisplay" id="emailDisplay" hidden />
                        <br />
                        <div class="panel-body container">
                            <h4><b>Choose Payment Items </b></h4>
                            <br />
                            <br />
                            <div class="form-group col-lg-12">
                                <b class="col-lg-4 control-label">Outstanding Payment Item(s) </b>
                                <div class="col-lg-5">
                                    <select class="form-control" name="paymentCat" id="paymentCatID" style="border: 2px solid #0094ff; width: 320px; border-radius: 0px; font-size: 11px" runat="server" datavaluefield="PAYMENTITEMID" datatextfield="PAYMENTTEXT">
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Button runat="server" ID="membersPayID" CssClass="btn btn-success custom-btn add-button" Style="display: inline; border-radius: 0px" OnClientClick="return makePayment();" Text="PROCEED TO PAYMENT"></asp:Button>
                                </div>

                            </div>
                            <br />
                            <br />

                            <div class="form-group col-lg-12">

                                <asp:Label ID="recordList" runat="server"></asp:Label>
                            </div>
                            <br />
                            <br />



                        </div>
                        <br />
                        <br />
                    </div>
                </div>
            </div>


                  <div class="col-lg-12">
                    <h3 class="page-header">View payment history</h3>
                </div>


          <div class="row">
                   <div class="col-md-12">
                    <div class="panel panel-default"></div>
                     

                <table class="table table-responsive table-hover table-striped" id="datatable">

                     <thead>
                                <tr style="width: 700px">
                                    <th>DESCRIPTION</th>
                                    <th>TIME STAMP</th>
                                    <th>RESPONSE</th>
                                    <th>PAYMENT REFERENCE</th>
                                    <%--<th>STATUS </th>--%>
                                </tr>
                            </thead>
                               <tbody id ="t_body" runat="server">
                              </tbody>
                </table>

       <br /><br /><br />





                       </div>
             </div>
         </form>
    </div>



<%--    <script type="text/javascript" src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>
    <script src="../Member/js/MemberPayment.js"></script>
        <script src="../Member/js/jquery-1.11.1.min.js"></script>--%>
    
    <script src="../js/moment.js"></script>
    <script src="../js/jquery.datetimepicker.min.js"></script>
  <%--  <script src="../js/navbar.js"></script>--%>
    <script src="../js/bootstrap-datetimepicker.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
