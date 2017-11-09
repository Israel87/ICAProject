<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePayment.aspx.cs" Inherits="ICA.Admin.CreatePayment" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ICA - Create Payment Item</title>
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
                <%--	<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
						<em class="fa fa-envelope"></em><span class="label label-danger">15</span>
					</a>
						<ul class="dropdown-menu dropdown-messages">
							<li>
								<div class="dropdown-messages-box"><a href="profile.html" class="pull-left">
									<img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
									</a>
									<div class="message-body"><small class="pull-right">3 mins ago</small>
										<a href="#"><strong>John Doe</strong> commented on <strong>your photo</strong>.</a>
									<br /><small class="text-muted">1:24 pm - 25/03/2015</small></div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box"><a href="profile.html" class="pull-left">
									<img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
									</a>
									<div class="message-body"><small class="pull-right">1 hour ago</small>
										<a href="#">New message from <strong>Jane Doe</strong>.</a>
									<br /><small class="text-muted">12:27 pm - 25/03/2015</small></div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="all-button"><a href="#">
									<em class="fa fa-inbox"></em> <strong>All Messages</strong>
								</a></div>
							</li>
						</ul>
					</li>
					<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
						<em class="fa fa-bell"></em><span class="label label-info">5</span>
					</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li><a href="#">
								<div><em class="fa fa-envelope"></em> 1 New Message
									<span class="pull-right text-muted small">3 mins ago</span></div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
								<div><em class="fa fa-heart"></em> 12 New Likes
									<span class="pull-right text-muted small">4 mins ago</span></div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
								<div><em class="fa fa-user"></em> 5 New Followers
									<span class="pull-right text-muted small">4 mins ago</span></div>
							</a></li>
						</ul>
					</li>
				</ul>--%>
            </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="profile-sidebar">
            <center>
                <img src="../images/ica.png" style="width:160px; height:100px" />
            </center>

            <!--<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Username</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>-->
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
                    <li><a class="" href="Manage.aspx">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage Approvals
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
              <asp:Button ID="excelExport"  runat="server" CssClass="btn btn-outline-rounded btn-success pull-right" style="border-radius:0px; width: 200px;" OnClick="excelExport_Click" Text="EXPORT TO EXCEL" Font-Bold="true"  /><br /><br /><br /><br />
            <div class="col-lg-12">
                <asp:GridView ID="displayPayments" runat="server" CssClass="table table-striped table-bordered gvv" AutoGenerateColumns="false" Font-Size="Medium" ForeColor="Black" Width="100%" HeaderStyle-CssClass="bg-primary" AllowPaging="true" OnPageIndexChanging="displayPayments_PageIndexChanging" OnDataBound="displayPayments_DataBound" PageSize="10">
                     <%--OnPageIndexChanging="regResults_PageIndexChanging" PageSize="5" OnDataBound="regResults_DataBound"--%>

                    <Columns>
                        <asp:BoundField DataField="MEMBERTYPE" HeaderText="MEMBER TYPE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="MEMBERCATEGORY" HeaderText="MEMBER CATEGORY" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="PAYMENTTYPE" HeaderText="PAYMENT TYPE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" ControlStyle-Font-Bold="true" />

                    </Columns>

                     <PagerTemplate>
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

                       <PagerSettings Mode="NextPrevious" Position="Bottom" />


                </asp:GridView>
            </div>


        </form>

    </div>


    <script src="js/jquery-1.11.1.min.js"></script>
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

