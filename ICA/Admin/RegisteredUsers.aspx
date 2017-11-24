<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisteredUsers.aspx.cs" Inherits="ICA.Admin.RegisteredUsers" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ICA - Registered Users</title>

     <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
     <script src="js/jquery-1.11.1.min.js"></script>
     <link href="css/jquery.dataTables.min.css" rel="stylesheet" />
   
   
    <script src="js/jquery.dataTables.min.js"></script>



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
                    <li class="active"><a class="" href="#">
                        <span class="fa fa-arrow-right">&nbsp;</span> Registered Users
                    </a></li>
                    <li class="active"><a class="" href="Manage.aspx">
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
                    <h3 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">List of Registered Users</h3>
                    <hr />
                </div>
            </div>


            <br />
            


           <table id="datatable" class="table table-responsive table-hover" >
               <thead>
                   <tr style="width:700px">
                      <%-- <th>BIODATAID</th>--%>
                       <th>FIRST NAME</th>
                       <th>MIDDLE NAME</th>
                       <th>LAST NAME</th>
                       <th>EMAIL</th>
                       <th>PHONE</th>
                       <th>GENDER</th>
                     <%--  <th>TITLE</th>--%>
                       <th>DATE OF BIRTH</th>
                       <th>DATE REGISTERED</th>
                   <%--    <th>LAST UPDATED </th>--%>
                   </tr>
               </thead>
           </table>
   
    

                   <br />
                <br />
            </div>

  
 
      <br />
      

    </form>

    

                    <br />  <br />
                    <br />  <br />
                    <br />
                    <br />


    <%--<script src="js/jquery-1.11.1.min.js"></script>--%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/custom.js"></script>


   <%--   <script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
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
            </script>--%>



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
    
    <script type="text/javascript">

        $(document).ready(function () {
            console.log("testing the ajax.");
            // $('#myTable').DataTable();
            $.ajax({
                type: "POST",
                url: "/ICA/Admin/ICAWebService.asmx/getRegisteredUsers",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    console.log("testing the ajax II.");
                    var _data = eval(data.d);
                        $('#datatable').dataTable({

                            data: _data,
                            columns: [
                               // { "data": "BIODATAID" },
                                { "data": "FIRSTNAME" },
                                { "data": "MIDDLENAME" },
                                { "data": "LASTNAME" },
                                { "data": "EMAIL" },
                                { "data": "PHONE" },
                                { "data": "GENDER" },
                              //  { "data": "TITLE" },
                                {
                                    "data": "DATEOFBIRTH"
                                    //"render": function (jsonDate) {
                                    //    var date = new Date(parseInt(jsonDate.substr(6)));
                                    //    var month = date.getMonth() + 1;
                                    //    return date.getDate() + "/" + month + "/" + date.getFullYear();
                                    //}


                                },
                                { "data": "DATEADDED" },
                               // { "data": "LASTUPDATED" }
                            ]
                        });
                }
            });
        });









    </script>
    
    

</body>
</html>



