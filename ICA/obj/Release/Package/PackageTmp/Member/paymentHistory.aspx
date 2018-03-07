<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentHistory.aspx.cs" Inherits="ICA.Member.paymentHistory" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ICA Member - Payment History</title>

    <script type="text/javascript">
           function preventBack() { window.history.forward(); }
           setTimeout("preventBack()", 0);
           window.onunload = function () { null };
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
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#"><span>INSTITUTE OF CREDIT ADMINISTRATION&nbsp </span>MEMBER</a>
				<%--<ul class="nav navbar-top-links navbar-right">
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
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
			<div class="profile-sidebar">
			<%--<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>--%>
            
				<div style="text-align:center">
                  
                         <img src="../images/ica.png" style="width:180px; height:80px" />
                  
                   
				</div>
				<%--<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>--%>
			
			
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">

            <li><a href="overview.aspx"><em class="fa fa-dashboard">&nbsp;</em> Overview</a></li>
			<li><a href="index.aspx"><em class="fa fa-user-plus">&nbsp;</em> Profile</a></li>
		
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> Payments <span data-toggle="collapse" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="makePayment.aspx">
						<span class="fa fa-arrow-right">&nbsp;</span> Make Payments
					</a></li>
					<li class="active"><a class="" href="paymentHistory.aspx">
						<span class="fa fa-arrow-right">&nbsp;</span> Payment History
					</a></li>
				
				</ul>
			</li>

            <li><a href="uploads.aspx"><em class="fa fa-calendar">&nbsp;</em> E-Certificates </a></li>
			<li><a href="downloads.aspx"><em class="fa fa-bar-chart">&nbsp;</em> News & Downloads</a></li>
			<li><a href="changePassword.aspx"><em class="fa fa-toggle-off">&nbsp;</em> Change Password</a></li>
		
			<li><a href="../logout.aspx"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div><!--/.sidebar-->
		<form runat="server">
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Payments</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Payment History</h1>
			</div>
		</div><!--/.row-->
		
	
		<div class="row">
			<div class="col-md-12">

                 <asp:Label ID="paymentHistoryNotification" runat="server"></asp:Label>
				<div class="panel panel-default">
					<asp:Button ID="excelExport"  runat="server" CssClass="btn btn-outline-rounded btn-success" style="border-radius:0px; width: 200px;" OnClick="excelExport_Click" Text="EPORT TO EXCEL" Font-Bold="true" Visible="false" /> <br /><br />
					<div class="panel-body">
                        
                        <div class="container">
                            <asp:GridView ID="payHistoryID" runat="server" CssClass="table table-striped table-bordered gvv" AutoGenerateColumns="false" Font-Size="Medium" ForeColor="Black" Width="100%" HeaderStyle-CssClass="bg-primary" AllowPaging="true" OnPageIndexChanging="payHistoryID_PageIndexChanging" OnDataBound="payHistoryID_DataBound"  >
                                <Columns>
                                    <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION"  ControlStyle-Font-Bold="true"  />
                                    <asp:BoundField DataField="TIMESTAMP" HeaderText="PAYMENT TIME"  ControlStyle-Font-Bold="true"  />
                                    <asp:BoundField DataField="RESPONSE" HeaderText="PAYMENT RESPONSE"  ControlStyle-Font-Bold="true"  />
                                    <asp:BoundField DataField="PAYMENTREFERENCE" HeaderText="PAYMENT REFERENCE"  ControlStyle-Font-Bold="true"  />
                                    <asp:BoundField DataField="PAYMENTREFERENCE" HeaderText="PAYMENT REFERENCE"  ControlStyle-Font-Bold="true"  />
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
						
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<!--/.row-->
		
		<!--/.row-->
	</div>	<!--/.main-->
            </form>
	
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
	</script>
		
</body>
</html>
