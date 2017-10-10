<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ICA.Admin.Manage" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ICA - Manage</title>
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
                <%--				<ul class="nav navbar-top-links navbar-right">
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
            <li><a href="CreatePayment.aspx"><em class="fa fa-bar-chart">&nbsp;</em> Create Payment</a></li>

            <li class="parent "><a data-toggle="collapse" href="#sub-item-1">
                <em class="fa fa-navicon">&nbsp;</em> Registration <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
            </a>
                <ul class="children collapse" id="sub-item-1">
                    <li class="active"><a class="" href="#">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage
                    </a></li>
                </ul>
            </li>
            <li><a href="login.html"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
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
                <div class="form-group">
                    <label for="title" class="col-lg-2 control-label">
                        Select from the list : 
                    </label>
                    <div class="col-lg-4">
                        <select id="appStatusID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" datavaluefield="APPLICATIONFLAGID" datatextfield="APPLICATIONFLAG" required="required">
                            <%-- <option value="Null">Select Status</option>
                                                <option value="1">Not Yet Approved</option>
                                                <option value="2">Approved</option>--%>
                        </select>
                    </div>


                    <div class="col-lg-4">
                        <select id="memberCatID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" datavaluefield="MEMBERTYPEID" datatextfield="MEMBERTYPE" required="required">
                            <%--<option value="Null">Select Category</option>
                                                <option value="">Associate Member</option>
                                                <option value="">Fellow</option>
                                                <option value="">Member</option>--%>
                        </select><br />

                    </div>

                    <div class="col-lg-2">
                         <asp:Button ID="Button1"  runat="server" CssClass="btn btn-outline-rounded btn-primary" style="border-radius:0px; width: 200px;" OnClick="manageRegID_Click" Text="SEARCH" Font-Bold="true" />
                    </div>
                </div>
            </div>



<%--            <center> <br /><br /> <br /><br />
                      <asp:Button ID="manageRegID"  runat="server" CssClass="btn btn-outline-rounded btn-primary" style="border-radius:0px; width: 200px;" OnClick="manageRegID_Click" Text="VIEW" Font-Bold="true" />
            </center>--%>

            <br />
            <br />

            <div class="col-lg-12">


                <div class="">
                    <div class="table-responsive">
                        <asp:GridView ID="regResults" runat="server" CssClass="table table-striped table-bordered gvv" AutoGenerateColumns="false" Font-Size="Medium" ForeColor="Black" Width="100%" HeaderStyle-CssClass="bg-primary">
                            <Columns>

                                <asp:BoundField DataField="" HeaderText="PREVIEW" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="FULLNAME" HeaderText="FULL NAME" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="USERNAME" HeaderText="EMAIL ADDRESS" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="MEMBERCATEGORY" HeaderText="MEMBER CATEGORY" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="APPLICATION STATUS" HeaderText="MEMBER STATUS" ControlStyle-Font-Bold="true" />
                                <%--  <asp:BoundField DataField="STATUS" HeaderText="CARD STATUS" ControlStyle-Font-Bold="true"  />--%>
                            </Columns>

                        </asp:GridView>

                    </div>

                </div>


                <%-- <table class="content-box table table-condensed table-striped table-responsive table-hover" width: 100px">
                          <thead>
                              <tr>
                                  <th>#</th>
                                  <th>Full Name</th>
                                  <th>Username</th>
                                  <th>Member Category</th>
                                  <th>Application Status</th>
                              </tr>
                          </thead>
                          <tbody id ="t_body" runat="server">
                          </tbody>
                      </table>--%>
            </div>


        </div>
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
