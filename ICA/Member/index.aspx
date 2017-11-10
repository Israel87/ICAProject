<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ICA.Member.index" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ICA Member - Profile </title>


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
             <li ><a href="overview.aspx"><em class="fa fa-dashboard">&nbsp;</em> Overview</a></li>
			<li class="active"><a href="index.aspx"><em class="fa fa-user-plus">&nbsp;</em> Profile</a></li>
		
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
				<li class="active">Personal Profile.</li>
			</ol>
		</div><!--/.row-->
		
		<%--<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Profile</h1>
			</div>
		</div--%><!--/.row-->
		
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
                    <div class="container">
                            <div class="col-lg-12">
                            <div class="col-lg-9">
                                <br />
                                <div class="text-center container"><h3>View Personal Details</h3><br />
                                  <h5 style="color: forestgreen">* &nbsp; to update details, edit the editable and click the update button below</h5>  <hr />
                                </div>


                                <div class="form-group"><br /><br />
                                    <label for="title" class="col-lg-4 control-label"> TITLE </label>
                                      <%--<input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="title"  />--%>

                           <%--       <select id="title" name="title" class="form-control col-lg-8" style="border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" required="required">
                                                <option value="Null">Select Title</option>
                                                <option value="1">Master</option>
                                                <option value="2">Miss</option>
                                                <option value="3">Mr</option>
                                                <option value="4">Mrs</option>

                                            </select>--%>
                                    <asp:DropDownList ID="title" CssClass="col-lg-8 form-control" runat="server" style="border: 2px solid #0094ff; width: 420px; border-radius: 0px" >
                                        <asp:ListItem Value="1" Text="MR">MR</asp:ListItem>
                                        <asp:ListItem Value="2" Text="MRS">MRS</asp:ListItem>
                                        <asp:ListItem Value="3" Text="MASTER">MASTER</asp:ListItem>
                                        <asp:ListItem Value="4" Text="MS">MS</asp:ListItem>
                                        <asp:ListItem Value="5" Text="MISS">MISS</asp:ListItem>
                                    </asp:DropDownList>

                                    <br /><br />
                                </div>
                            <div class="form-group">

                                    <label for="fullname" class="col-lg-4 control-label">FULLNAME</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="fullname" disabled /><br /><br />
                            </div>

                            <%--    <div class="form-group">
                                    <label for="memstats" class="col-lg-4 control-label">MEMBER STATUS </label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="memstats" disabled /><br /><br />
                            </div>--%>

                             <div class="form-group">
                                    <label for="dob" class="col-lg-4 control-label">DATE OF BIRTH</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="dob" disabled /><br /><br />
                            </div>

                             <div class="form-group">
                                    <label for="gender" class="col-lg-4 control-label"> GENDER </label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="gender" disabled /><br /><br />
                            </div>

                            <div class="form-group">
                                    <label for="marStatus" class="col-lg-4 control-label">MARITAL STATUS</label>


                                     <asp:DropDownList ID="maritalstatus" CssClass="col-lg-8 form-control" runat="server" style="border: 2px solid #0094ff; width: 420px; border-radius: 0px">
                                        <asp:ListItem Value="1" Text="Married">Married</asp:ListItem>
                                        <asp:ListItem Value="2" Text="Single">Single</asp:ListItem>
                                        <asp:ListItem Value="3" Text="Divorced">Seperated</asp:ListItem>
                                        <asp:ListItem Value="4" Text="Divorced">Divorced</asp:ListItem>
                                         <asp:ListItem Value="5" Text="Widowed">Widowed</asp:ListItem>
                                    </asp:DropDownList>

                                <br /><br />
                            </div>

                            <div class="form-group">
                                    <label for="email" class="col-lg-4 control-label">EMAIL</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="email" disabled /><br /><br />
                            </div>

                            <div class="form-group">
                                    <label for="address" class="col-lg-4 control-label">ADDRESS</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="address"  /><br /><br />
                            </div>

                             <div class="form-group">
                                    <label for="addressII" class="col-lg-4 control-label">ADDRESS II</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="addressII"  /><br /><br />
                            </div>

                                <div class="form-group">
                                    <label for="phoneNo" class="col-lg-4 control-label">PHONE NUMBER</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="phonenum"  /><br /><br />
                            </div>

                                <div class="form-group">
                                    <label for="nos" class="col-lg-4 control-label">NAME OF SCHOOL </label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="nos"  /><br /><br />
                            </div>

                                <div class="form-group">
                                    <label for="degree" class="col-lg-4 control-label">DEGREE </label>


                                      <asp:DropDownList ID="deg" CssClass="col-lg-8 form-control" runat="server" style="border: 2px solid #0094ff; width: 420px; border-radius: 0px">
                                        <asp:ListItem Value="1" Text="Bachelor of Science">Bachelor of Science</asp:ListItem>
                                        <asp:ListItem Value="2" Text="Master of Science">Master of Science</asp:ListItem>
                                        <asp:ListItem Value="3" Text="PhD">PhD</asp:ListItem>
                                        <asp:ListItem Value="4" Text="OND">OND</asp:ListItem>
                                        <asp:ListItem Value="5" Text="HND">HND</asp:ListItem>
                                        <asp:ListItem Value="6" Text="SSCE">SSCE</asp:ListItem>
                                        <asp:ListItem Value="7" Text="MBA">MBA</asp:ListItem>
                                    </asp:DropDownList>


                                    <br /><br />
                            </div>

                             <div class="form-group">
                                    <label for="graddate" class="col-lg-4 control-label">GRADUATION DATE </label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="graddate"  /><br /><br />
                            </div>


                               <%-- starting the additional information here --%>

                                <div class="form-group">
                                    <label for="graddate" class="col-lg-4 control-label">RECENT EMPLOYER</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="recentEmp"  /><br /><br />
                                </div>
                                <div class="form-group">
                                    <label for="position" class="col-lg-4 control-label">POSITION</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="position"  /><br /><br />
                                </div>
                                   <div class="form-group">
                                    <label for="certyear" class="col-lg-4 control-label">OTHER CERTIFICATE</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="certyear"  /><br /><br />
                                </div>
                                  <div class="form-group">
                                    <label for="empII" class="col-lg-4 control-label">EMPLOYER II</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="empII"  /><br /><br />
                                </div>
                                <div class="form-group">
                                    <label for="posII" class="col-lg-4 control-label">POSITION II</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="posII"  /><br /><br />
                                </div>

                                 <div class="form-group">
                                    <label for="empIII" class="col-lg-4 control-label">EMPLOYER III</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="empIII"  /><br /><br />
                                </div>

                                <div class="form-group">
                                    <label for="posIII" class="col-lg-4 control-label">POSITION III</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="posIII"  /><br /><br />
                                    <br />
                                     <asp:Button ID="update" runat="server" CssClass="btn btn-outline-rounded btn-success col-lg-8" Style="border-radius: 0px; width: 200px;" Text="UPDATE" Font-Bold="true" OnClick="update_Click" />
                                    <br /><br /><br /><br />
                                </div>
                                 <input type="text" id="biodataid" hidden runat="server" />

                           
                
                            </div>


                                <%--constant 3 column for picture upload--%>
                            <div class="col-lg-3"><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                                <asp:Label ID="pictureDisplay" runat="server"></asp:Label><br /><br />
                                <p><b>change passport</b></p>
                                <asp:FileUpload ID="FileUpload1" runat="server"  /><br />
                                <%--<asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-rounded btn-primary col-lg-8" Style="border-radius: 0px; width: 100px;" Text="upload" Font-Bold="true"  />--%>
                                <br /><br /><br />
                                 <asp:Label ID="memDisplay" runat="server" Font-Bold="true" ForeColor="#5d6df5"></asp:Label><br /><br />
                                
                                
                                <br /><br /><br />


                                
                            </div>
                       </div>
                </div>







					<%--    this is the second panel--%>
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
