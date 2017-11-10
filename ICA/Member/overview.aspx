<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="overview.aspx.cs" Inherits="ICA.Member.overview" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ICA Member - Overview </title>
    
  <%--  Disable the browser back button from getting in after logout--%>
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
			<li class="active"><a href="#"><em class="fa fa-dashboard">&nbsp;</em> Overview</a></li>
		    <li><a href="index.aspx"><em class="fa fa-user-plus">&nbsp;</em> Profile</a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> Payments <span data-toggle="collapse" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="makePayment.aspx">
						<span class="fa fa-arrow-right">&nbsp;</span> Make Payments
					</a></li>
					<li><a class="" href="paymentHistory.aspx">
						<span class="fa fa-arrow-right">&nbsp;</span> Payment History
					</a></li>
				
				</ul>
			</li>

            <li><a href="uploads.aspx"><em class="fa fa-calendar">&nbsp;</em> E-Certificates </a></li>
			<li><a href="downloads.aspx"><em class="fa fa-bar-chart">&nbsp;</em>News & Downloads</a></li>
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
				<li class="active">Overview.</li>
			</ol>
		</div><!--/.row-->
		
	<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
<br />
        <div class="">
			<div class="col-xs-6 col-md-4">
				<div class="panel panel-default">
                    <a href="index.aspx" style="text-decoration:none">
                        <div class="panel-body easypiechart-panel"><br />
						<h4>Profile</h4>
						<div class="" >
                            <img src="../images/profile.png" style="width: 80px; height:80px"/><br /><br /><br />
						</div>
                        
					</div>
                    </a>
					
				</div>
			</div>
			<div class="col-xs-6 col-md-4">
				<div class="panel panel-default">
                    <a href="makePayment.aspx" style="text-decoration:none">
                        <div class="panel-body easypiechart-panel"><br />
						<h4>Payments</h4>
						<div class="" >
                            <img src="../images/payment.png" style="width: 80px; height:80px"/><br /><br /><br />
						</div>
					</div>
                    </a>
					
				</div>
			</div>

            		<div class="col-xs-6 col-md-4">
				<div class="panel panel-default">
                    <a href="uploads.aspx" style="text-decoration:none">
                      <div class="panel-body easypiechart-panel"><br />
						<h4>E-Certificates</h4>
						<div class="" >
                            <img src="../images/uploads.png" style="width: 80px; height:80px"/><br /><br /><br />
						</div>
					</div>
                    </a>
				
				</div>
			</div>
			
             </div><br />






        <div class="">
            <div class="col-xs-6 col-md-4">
				<div class="panel panel-default">
                    <a href="downloads.aspx" style="text-decoration:none">
                        <div class="panel-body easypiechart-panel"><br />
						<h4>News & Downloads </h4>
						<div class="" >
                            <img src="../images/News.png" style="width: 80px; height:80px"/><br /><br /><br />
						</div>
					</div>
                    </a>
					
				</div>
			</div>
            <div class="col-xs-6 col-md-4">
				<div class="panel panel-default">
                    <a href="changePassword.aspx" style="text-decoration:none">
                        <div class="panel-body easypiechart-panel"><br />
						<h4>Change Password</h4>
						<div class="" >
                            <img src="../images/changepassword.png" style="width: 80px; height:80px"/><br /><br /><br />
						</div>
					</div>
                    </a>
					
				</div>
			</div>
            <div class="col-xs-6 col-md-4">
				<div class="panel panel-default">
                    <a href="../logout.aspx" style="text-decoration:none">
                        <div class="panel-body easypiechart-panel"><br />
						<h4>Log Out</h4>
						<div class="" >
                            <img src="../images/logout.png" style="width: 80px; height:80px"/><br /><br /><br />
						</div>
					</div>
                    </a>
					
				</div>
			</div>
       
        </div>
			
       
		</div><!--/.row-->

	
		
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

