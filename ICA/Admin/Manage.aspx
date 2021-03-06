﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ICA.Admin.Manage"  %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ICA - Manage</title>
         <script src="js/jquery-1.11.1.min.js"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" />
        <script src="js/jquery.dataTables.min.js"></script>



            <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
            <script src="js/dataTables.bootstrap.min.js"></script>

            <script src="js/dataTables.buttons.min.js"></script>
            <script src="js/buttons.flash.min.js"></script>
            <script src="js/jszip.min.js"></script>
            <script src="js/pdfmake.min.js"></script>
            <script src="js/vfs_fonts.js"></script>
            <script src="js/buttons.html5.min.js"></script>
            <script src="js/buttons.print.min.js"></script>


     <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
         window.onunload = function () { null };



        
             $(document).ready(function() {
                 $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                     "lengthMenu": [[3, 5, 10, 25, -1], [3, 5, 10, 25, "All"]] //value:item pair
                 });
    });
    
    </script>




    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--Custom Font-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span>INSTITUTE OF CREDIT ADMINISTRATION</span>Admin</a>

            </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="profile-sidebar">
            <center>
                <img src="../images/ica.png" style="width:160px; height:100px" />
            </center>
            <div class="clear"></div>
        </div>
        <div class="divider"></div>
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </form>
        <ul class="nav menu">
            <li><a href="index.aspx"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
            <li><a href="payments.aspx"><em class="fa fa-calendar">&nbsp;</em> Payment Report</a></li>
            <li><a href="CreatePayment.aspx"><em class="fa fa-bar-chart">&nbsp;</em> Create Payment</a></li>

            <li class="parent "><a data-toggle="collapse" href="#sub-item-1">
                <em class="fa fa-navicon">&nbsp;</em> Registration <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
            </a>
                <ul class="children collapse" id="sub-item-1">
                    <li class="active"><a class="" href="RegisteredUsers.aspx">
                        <span class="fa fa-arrow-right">&nbsp;</span> Registered Users
                    </a></li>
                    <li class="active"><a class="" href="#">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage
                    </a></li>
                </ul>
            </li>
            <li><a href="../logout.aspx"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
        </ul>
    </div>
    <!--/.sidebar-->

    <form runat="server">
        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#">
                        <em class="fa fa-home"></em>
                    </a></li>
                    <li class="active">Registrations</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Registrations</h1>
                    <hr />
                </div>
            </div>
            <!--/.row-->

            <div class="">
                <br />
                <asp:Label ID="approvalNotification" runat="server"></asp:Label>
                <asp:Label ID="DataRecordNotification" runat="server"></asp:Label>
                <br />

                <div class="form-group">
                    <label for="title" class="col-lg-2 control-label">
                        Select from the list : 
                    </label>
                    <div class="col-lg-4">
                        <select id="appStatusID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" datavaluefield="APPLICATIONFLAGID" datatextfield="APPLICATIONFLAG" required="required">
                        </select>
                    </div>


                    <div class="col-lg-4">
                        <select id="memberCatID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" datavaluefield="MEMBERTYPEID" datatextfield="MEMBERTYPE" required="required">
                        </select><br />

                    </div>

                    <div class="col-lg-2">
                        <asp:Button ID="manage_RegID" runat="server" CssClass="btn btn-outline-rounded btn-primary" Style="border-radius: 0px; width: 200px;" OnClick="manageRegID_Click" Text="SEARCH" Font-Bold="true" />
                    </div>
                </div>
            </div>



            <br />
            <br />

            <div class="col-lg-12">

               <%--   <asp:Button ID="exportExcel"  runat="server" CssClass="btn btn-outline-rounded btn-success" style="border-radius:0px; width: 200px;" OnClick="exportExcel_Click" Text="EPORT TO EXCEL" Font-Bold="true" Visible="false" />--%>
                <asp:Button ID="excelExport"  runat="server" CssClass="btn btn-outline-rounded btn-success" style="border-radius:0px; width: 200px;" OnClick="excelExport_Click" Text="EXPORT TO EXCEL" Font-Bold="true" Visible="false" />
                <br /><br />
                <div class="">
                    <div class="table-responsive">
                        <asp:GridView ID="regResults" runat="server" CssClass="table table-striped table-bordered gvv display" AutoGenerateColumns="false" Font-Size="Medium" ForeColor="Black" Width="100%" HeaderStyle-CssClass="bg-primary" AllowPaging="true" PageSize="5">
                            
                            <Columns>
                                <asp:TemplateField HeaderText="ACTION" ControlStyle-Font-Bold="true" >
                                    <ItemTemplate>
                                        <%--<a href="#ViewPanel?id=<%# Eval("BIODATAID").ToString()%>" class="btn btn-primary" onclick="viewReg_Click"> VIEW </a>--%>
                                        <asp:Button ID="viewReg" CssClass="btn btn-primary" runat="server" Text="VIEW" Font-Bold="true" OnClick="viewReg_Click" CommandArgument='<%# Eval("BIODATAID").ToString()%>' Style="width: 150px; border-radius: 0px" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="FULLNAME" HeaderText="FULL NAME" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="USERNAME" HeaderText="EMAIL ADDRESS" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="MEMBERTYPE" HeaderText="MEMBER TYPE" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="MEMBERCATEGORY" HeaderText="MEMBER CATEGORY" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="APPLICATION STATUS" HeaderText="MEMBER STATUS" ControlStyle-Font-Bold="true" />
                                 <asp:BoundField DataField="PAYMENT STATUS" HeaderText="PAYMENT STATUS" ControlStyle-Font-Bold="true" />
                                
                                <asp:BoundField DataField="DATEADDED" HeaderText="DATE" ControlStyle-Font-Bold="true" />
                            </Columns>

                     <%--       <PagerTemplate>
                                <table>
                                    <tr>
                                        
                                        <td>
                                            <asp:LinkButton ID="L1" runat="server" Text="PREVIOUS" CommandName="Page" CommandArgument="Prev" />
                                             <asp:LinkButton ID="L2" runat="server" Text="NEXT" CommandName="Page" CommandArgument="Next" />
                                        </td>
                                        <td>
                                           Page No:  <asp:Label ID="L3" runat="server"></asp:Label>
                                           Total Page <asp:Label ID="L4" runat="server"></asp:Label>
                                        </td>
                                       
                                    </tr>
                                </table>
                            </PagerTemplate>
                            <PagerSettings Mode="NextPrevious" Position="Bottom" />--%>

                        </asp:GridView>

                    </div>
                    <br />
                    <br />
                </div>

            </div>

            <div id="ViewPanel" runat="server" visible="false">
                <%-- <hr />
                <div class="panel panel-primary">--%>

                <div class="row container">
                    <div class="col-lg-12">
                        <div class="input-group">                 
                            <%--    <asp:Button ID="passport" runat="server" CssClass="btn btn-outline-rounded btn-warning" Style="border-radius: 0px; width: 200px;" Text="VIEW PASSPORT" Font-Bold="true" OnClick="passport_Click"/>--%>
                             <asp:Button ID="approve" runat="server" CssClass="btn btn-outline-rounded btn-success pull-right" Style="border-radius: 0px; width: 200px;" Text="APPROVE" OnClick="approve_Click" Font-Bold="true" visible="true"/>
                        </div>

                          <div class="input-group" style="float:right">
                                 <asp:Label ID="passportDisplay" runat="server"></asp:Label>
                       </div>

                    </div><br /><br />

                    
                  <%--  <div class="col-lg-12">--%>
                        <%--<div class="col-lg-8"></div>
                        <div class="col-lg-4"> </div>--%>
                        


                   <%-- </div>--%>
                    <br />
                  
                </div>

                  <br />
                    <br />
                    <br />

                <div class="row">

                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">FULLNAME</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="fullname" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">MEMBER STATUS</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="memberstatus"  disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>


                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">GENDER</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="gender" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">DATE OF BIRTH</label>
                                <input class="form-control col-lg-8" type="text" id="dateofbirth" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>




                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">MARITAL STATUS</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="maritalstatus" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">ADDRESS </label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="address" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>


                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">ADDRESS II</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="addressII" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">EMAIL</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="email" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>



                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">PHONE NUMBER</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="phonenumber"  disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">NAME OF SCHOOL</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="nameofschool" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">HIGHEST DEGREE</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="highestdegree" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">GRADUATE DATE</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="graduationdate"  disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>


                    <br />
                    <br />


                </div>

                <br />
                <br />
                    
                        <div class="col-lg-12 text-center">

                          <asp:Label ID="pdfDisplay" runat="server"></asp:Label>  
                          
                                <br /><br />
              

                        </div>
              
            </div>
    

                   <br />
                <br />
            </div>

    </form>

    
 
 
      <br />
                    <br />  <br />
                    <br />  <br />
                    <br />
                    <br />


   <%-- <script src="js/jquery-1.11.1.min.js"></script>--%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/custom.js"></script>


      <script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
            <script type="text/javascript">
                $('#excelExport').click(function () {
                    $('#regResults').table2excel({
                        name: "Report",
                        filename: "ReportByCategory"
                    });
                });

                //$('#paging')
                //    .tablesorter({ widthFixed: true, widgets: ['zebra'] })
                //    .tablesorterPager({
                //        container: $("#pager")

                //    });
            </script>














    <script>
        window.onload = function () {
            var chart1 = document.getElementById("line-chart").getContext("2d");
            window.myLine = new Chart(chart1).Line(lineChartData, {
                responsive: true,
                scaleLineColor: "rgba(0,0,0,.2)",
                scaleGridLineColor: "rgba(0,0,0,.05)",
                scaleFontColor: "#c5c7cc"
            });
        };
    </script>  
    
    


</body>
</html>
