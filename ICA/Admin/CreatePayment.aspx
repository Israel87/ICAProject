<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePayment.aspx.cs" Inherits="ICA.Admin.CreatePayment" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ICA - Create Payment Item</title>


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



                //$( function() {
                //    $("#datepickerID").datepicker();

                //    $("#datepickerIDB").datepicker();
                // });


                $(document).ready(function () {
                    $('#datatable').DataTable({
                        "dom": 'Bfrtip',
                        "buttons": [
                            {

                                extend: 'excel',
                                text: 'Download Excel'


                            },

                        ],
                        "paging": true,
                        "ordering": true,
                        "info": false,
                        // "buttons": true,

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
            <li class="active"><a href="#"><em class="fa fa-bar-chart">&nbsp;</em> Create Payment</a></li>
            <!--<li><a href="elements.html"><em class="fa fa-toggle-off">&nbsp;</em> UI Elements</a></li>
			<li><a href="panels.html"><em class="fa fa-clone">&nbsp;</em> Alerts &amp; Panels</a></li>-->
            <li class="parent "><a data-toggle="collapse" href="#sub-item-1">
                <em class="fa fa-navicon">&nbsp;</em> Registration <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
            </a>
                <ul class="children collapse" id="sub-item-1">

                    <li class="active"><a class="" href="RegisteredUsers.aspx">
                        <span class="fa fa-arrow-right">&nbsp;</span> Registered Users
                    </a></li>

                    <li><a class="" href="Manage.aspx">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage
                    </a></li>
                    <!--<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Create Payment
					</a></li>-->
                    <!--<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 3
					</a></li>-->
                </ul>
            </li>
            <li><a href="../logout.aspx"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
        </ul>
    </div>
    <!--/.sidebar-->

    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
                <li class="active">Create Payments</li>
            </ol>
        </div>
        <!--/.row-->


        <form runat="server" method="post">
            
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Payment Items</h1>
                        <hr />
                    </div>
            
            <br />
            <asp:Button ID="createPayment" runat="server" Text="CREATE PAYMENTS & ITEMS" OnClick="createPayment_Click" CssClass="btn btn-outline-rounded btn-warning" Font-Bold="true" style="border-radius:0px; width: 300px;" />
            <br /><br />
             
          <div id="ViewPanel" runat="server" visible="false">
            
                    <div class="row col-lg-12 responsive">

                        
                       <div class="col-lg-6">
                            <h4> Create Payment Type </h4>

                            <div class="col-lg-12">
                             
                        
                                <asp:Label ID="paymentTypeNotifications" runat="server"></asp:Label>
                                <br />
                                  <input class="form-control" type="text" style="border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="typeID" placeholder="Add Payment Type" required="required" />
                                <br /><br />
                                  <asp:LinkButton ID="createPaymentType" runat="server" CssClass="btn btn-outline-rounded btn-primary" style="border-radius: 0px; width: 200px;" Text="CREATE" OnClick="createPaymentType_Click" Font-Bold="true" />


                            </div>

                        </div>

                        <div class="col-lg-6">
                            <div class="input-group container">

                                <div class="col-lg-12">
                                    <h4>Create a Payment Item  </h4>
                                
                                    <asp:Label ID="paymentItemNotification" runat="server"></asp:Label>
                                    <br />
                                    <select id="paymentID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" required="required">
                                    </select><br />
                                </div>

                                <br />
                                <br />

                            </div>

                             <br />
                            <div class="form-group container">


                                <div class="col-lg-12">
                                    <input class="form-control" type="text" style="border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="amount" placeholder="Amount" required="required" />
                                </div>
                            </div>


                            <div class="form-group container">


                                <div class="col-lg-12">
                                    <select id="categoryID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" required="required" datavaluefield="MEMBERCATEGORYID" datatextfield="MEMBERCATEGORY">
                                    </select><br />
                                </div>
                            </div>


                            <div class="form-group container">

                                <div class="col-lg-12">

                                    <asp:LinkButton ID="createpayments" runat="server" CssClass="btn btn-outline-rounded btn-primary" Style="border-radius: 0px; width: 200px;" Text="CREATE" OnClick="createpayments_Click" Font-Bold="true" />

                                </div>

                            </div>

                        </div>

                    </div>
           </div>   <br />     
            
            <br /><br />

            <%--  <asp:Button ID="excelExport"  runat="server" CssClass="btn btn-outline-rounded btn-success pull-right" style="border-radius:0px; width: 200px;" OnClick="excelExport_Click" Text="EXPORT TO EXCEL" Font-Bold="true" CausesValidation="false" OnClientClick="javascript:Page_ValidationActive = false;"/><br /><br /><br /><br />--%>
            <div class="col-lg-12">

                <table class="table table-responsive table-hover table-striped" id="datatable">

                     <thead>
                                <tr style="width: 700px">
                                    <th>MEMBERTYPE</th>
                                    <th>MEMBERCATEGORY</th>
                                    <th>PAYMENTTYPE</th>
                                    <th>AMOUNT</th>
                                    <%--<th>STATUS </th>--%>
                                </tr>
                            </thead>
                               <tbody id ="t_body" runat="server">
                              </tbody>
                </table>

            </div><br /><br /><br />
          <%--  <div class="col-lg-12">

                 <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                 </asp:ScriptManager>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:GridView ID="displayPayments" runat="server"  AllowPaging="True" CssClass="gvv display" AutoGenerateColumns="False">
              

                    <Columns>
                        <asp:BoundField DataField="MEMBERTYPE" HeaderText="MEMBER TYPE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="MEMBERCATEGORY" HeaderText="MEMBER CATEGORY" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="PAYMENTTYPE" HeaderText="PAYMENT TYPE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" ControlStyle-Font-Bold="true" />

                    </Columns>



                </asp:GridView>
                    </ContentTemplate>

        </asp:UpdatePanel>
             
            </div>--%>


        </form><br /><br /><br />

    </div>


    <%--<script src="js/jquery-1.11.1.min.js"></script>--%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/custom.js"></script>
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


        $(function () {
            var checkbox = $("#add");
            var hidden = $("#addNew");
            var memtypes = $("#paymentID");

            memtypes.show();
            hidden.hide();

            checkbox.change(function () {
                if (checkbox.is(':checked')) {
                    // Show and hide fields
                    memtypes.hide();
                    hidden.show();

                }
                else {
                    // make sure that the fields are done doing what you want.
                    hidden.hide();
                    memtypes.show();
                }

            });
        });

    </script>

</body>
</html>

