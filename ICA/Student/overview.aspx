<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteStudent.Master" AutoEventWireup="true" CodeBehind="overview.aspx.cs" Inherits="ICA.Student.overview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    <a href="profile.aspx" style="text-decoration:none">
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
                    <a href="ManagePayment.aspx" style="text-decoration:none">
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
                    <a href="eCertificates.aspx" style="text-decoration:none">
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
                    <a href="News.aspx" style="text-decoration:none">
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
	</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
