<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteCorporate.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ICA.Corporate.profile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">

            <div class="col-lg-12">
				<h3 class="page-header">Profile</h3>
                
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Edit company details.</li>
			</ol>
			</div>

		</div><!--/.row-->

        <div class="row">
            <form runat="server">

			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
                    <div class="container">
                            <div class="col-lg-12">
                            <div class="col-lg-9">
                                <br />
                                <div class="text-center container"><h3>View company profile details</h3><br />
                                  <h5 style="color: forestgreen">* &nbsp; to update details, edit the editable and click the update button below</h5> <br /><br />
                                       <asp:Label ID="uploadNotificationI" runat="server"></asp:Label><br />
                               
                                </div><br />

                               <h5><b> Company details</b></h5>
                                <br /> <br />
                            <div class="form-group">

                                    <label for="fullname" class="col-lg-4 control-label">NAME OF COMPANY</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="companyname" disabled /><br /><br />
                            </div>
                             
                  
                            <div class="form-group">
                                    <label for="address" class="col-lg-4 control-label">ADDRESS OF COMPANY</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="companyaddress"  /><br /><br />
                            </div>

                             <div class="form-group">
                                    <label for="addressII" class="col-lg-4 control-label">ADDRESS II</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="addressII"  /><br /><br />
                            </div>

                            <div class="form-group">
                                    <label for="email" class="col-lg-4 control-label">COMPANY EMAIL</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="companyemail" disabled /><br /><br />
                            </div>

                              <div class="form-group">
                                    <label for="phoneNo" class="col-lg-4 control-label">WEB ADDRESS</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="webaddress"  /><br /><br />
                            </div>


<%--                            <div class="form-group">
                                    <label for="phoneNo" class="col-lg-4 control-label">PHONE NUMBER</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="phonenum"  /><br /><br />
                            </div>--%>

                              <br />
                                <h5><b>Details of contact person</b> </h5>
                            <br />
                            <div class="form-group">
                                    <label for="nos" class="col-lg-4 control-label">FIRSTNAME </label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="firstname"  /><br /><br />
                            </div>

                              

                             <div class="form-group">
                                    <label for="graddate" class="col-lg-4 control-label">LASTNAME</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="lastname"  /><br /><br />
                            </div>


                               <%-- starting the additional information here --%>

                           
                                <div class="form-group">
                                    <label for="position" class="col-lg-4 control-label">POSITION</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="position"  /><br /><br />
                                </div>
                                   <div class="form-group">
                                    <label for="certyear" class="col-lg-4 control-label">PHONE NUMBER</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="phonenumber"  /><br /><br />
                                </div>
                                  <div class="form-group">
                                    <label for="empII" class="col-lg-4 control-label">EMAIL</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="email"  /><br /><br />
                                </div>
                                <div class="form-group">
                                    <label for="posII" class="col-lg-4 control-label">CATEGORY</label>
                                    <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="category"  /><br /><br />
                                </div>

                       
                                 <input type="text" id="biodataid" hidden runat="server" />

                            
                
                            </div>


                                <%--constant 3 column for picture upload--%>
                            <div class="col-lg-3"><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                                <asp:Label ID="pictureDisplay" runat="server"></asp:Label><br /><br />
                                <p><b>change passport</b></p>
                                <asp:FileUpload ID="FileUpload1" runat="server"  /><br />
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-rounded btn-primary col-lg-8" Style="border-radius: 0px; width: 100px;" Text="upload" Font-Bold="true"  />
                                <br /><br /><br />
                                 <asp:Label ID="memDisplay" runat="server" Font-Bold="true" ForeColor="#5d6df5"></asp:Label><br /><br />
                                <br />

                                 <asp:Button runat="server" Text="UPDATE" CssClass="btn btn-success pull-right" style="width:300px;" Font-Bold="true"/>
                            
                                
                            </div>
                                
                       </div>
                </div>







					<%--    this is the second panel--%>
					</div>
				</div>
			</div>
            </form>
		</div><!--/.row-->
  </div>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
