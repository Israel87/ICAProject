<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payments.aspx.cs" Inherits="ICA.Admin.payments" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ICA - Payments</title>
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
				<a class="navbar-brand" href="#"><span>INSTITUTE OF CREDIT ADMINISTRATION</span>Admin</a>
			
			</div>
		</div><!-- /.container-fluid -->
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
			<li ><a href="index.aspx"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
			<li class="active"><a href="#"><em class="fa fa-calendar">&nbsp;</em> Payment Report</a></li>
			<li><a href="CreatePayment.aspx"><em class="fa fa-bar-chart">&nbsp;</em> Create Payment</a></li>
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
	</div><!--/.sidebar-->

    	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            	<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Payments</li>
			</ol>
		</div><!--/.row-->
		

        <form runat="server">
            <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">View Reports</h1>
                <hr />
			</div>

            <div class="input-group container">
                <br />
                    <asp:Label ID="DataRecordNotification" runat="server"></asp:Label>
                <br />
                    <label for="title" class="col-lg-3 control-label">
                         SELECT REPORT : 
                   </label>
                    <div class="col-lg-7">
                         <select id="memcatID" class="form-control" name="title" style="border: 2px solid #0094ff; width:400px; border-radius: 0px" runat="server" datavaluefield="MEMBERTYPEID" datatextfield="MEMBERTYPE" required="required">
                           </select>
                    </div>


                                        <div class="col-lg-2">
                                          
                                           <asp:Button ID="generateReport"  runat="server" CssClass="btn btn-outline-rounded btn-primary" style="border-radius:0px; width: 200px;" OnClick="generateReport_Click" Text="GENERATE" Font-Bold="true" />
                                       
                                            
                                        </div>
                                    </div>

            <br />


               
            <div class="col-lg-12">
              
                <%-- <asp:Label ID="dataRec" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>--%>
                <br />
                  <asp:Button ID="exportExcel"  runat="server" CssClass="btn btn-outline-rounded btn-success" style="border-radius:0px; width: 200px; " OnClick="exportExcel_Click" Text="EPORT TO EXCEL" Font-Bold="true" Visible="false" />
                <br /> <br /> 
                <asp:GridView ID="gvData" runat="server"  CssClass="table table-striped table-bordered gvv" AutoGenerateColumns="false" Font-Size="Medium" ForeColor="Black" Width="100%" HeaderStyle-CssClass="bg-primary" AllowPaging="true" OnPageIndexChanging="gvData_PageIndexChanging" PageSize="10" OnDataBound="gvData_DataBound">
                    <Columns>
                        <asp:BoundField DataField="FULLNAME" HeaderText="FULL NAME" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="USERNAME" HeaderText="EMAIL" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="MEMBERCATEGORY" HeaderText="MEMBER CATEGORY" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="PAYMENTREFERENCE" HeaderText="PAYMENT REFERENCE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="TRANSACTION DATE" HeaderText="TRANSACTION DATE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="MEMBER CATEGORY FOR MEMBER TYPE" ControlStyle-Font-Bold="true" />
                        <asp:BoundField DataField="APPLICATION STATUS" HeaderText="APPLICATION STATUS" ControlStyle-Font-Bold="true" />
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

                  <%--<table class="content-box table table-condensed table-striped table-responsive table-hover" style="width:100%;" >
                          <thead>
                              <tr>
                                  <th>#</th>
                                  <th style="font-weight:100">FULL NAME</th>
                                  <th style="font-weight:100">USERNAME</th>
                                  <th style="font-weight:100">MEMBER CATEGORY</th>
                                  <th style="font-weight:100">PAYMENT REFERENCE</th>
                                  <th style="font-weight:100">TRANSACTION DATE</th>
                                  <th style="font-weight:100">AMOUNT</th>
                                  <th style="font-weight:100">DESCRIPTION </th>
                                  <th style="font-weight:100">APPLICATION STATUS</th>
                              </tr>
                          </thead>
                          <tbody id ="t_body" runat="server">

                          </tbody>
                      </table>--%>
            </div>
		</div><!--/.row-->



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
	</script>
		
</body>
</html>
