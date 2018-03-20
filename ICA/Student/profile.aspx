<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteStudent.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ICA.Student.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <form runat="server">
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
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
                    <div class="container">
                            <div class="col-lg-12">
                            <div class="col-lg-9">
                                <br />
                                <div class="text-center container"><h3>View Personal Details</h3><br />
                                  <h5 style="color: forestgreen">* &nbsp; to update details, edit the editable and click the update button below</h5> <br /><br />
                                       <asp:Label ID="uploadNotificationI" runat="server"></asp:Label>
                                    
                                    <hr />
                               
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
                    
                                      
                                    <br /><br /><br /><br />
                                </div>
                                 <input type="text" id="biodataid" hidden runat="server" />

                           
                
                            </div>


                                <%--constant 3 column for picture upload--%>
                            <div class="col-lg-3"><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                                <asp:Label ID="pictureDisplay" runat="server"></asp:Label><br /><br />
                                <p><b>change passport</b></p>
                                <asp:FileUpload ID="FileUpload1" runat="server"  /><br />
                                <%--<asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-rounded btn-primary col-lg-8" Style="border-radius: 0px; width: 100px;" Text="upload" Font-Bold="true"  />--%>
                                <br /><br /><br />
                                 <asp:Label ID="memDisplay" runat="server" Font-Bold="true" ForeColor="#5d6df5"></asp:Label><br /><br />
                                <br />
                                    <%--             <asp:Button ID="update" runat="server" CssClass="btn btn-outline-rounded btn-success col-lg-8" Style="border-radius: 0px; width: 200px;" Text="UPDATE" Font-Bold="true" OnClick="update_Click" />--%>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-rounded btn-success col-lg-8" Style="width: 300px;" Text="UPDATE" Font-Bold="true" />

                                
                            </div>
                       </div>
                </div>







					<%--    this is the second panel--%>
					</div>
				</div>
			</div>
		</div><!--/.row-->

        </div>

    </form>
         



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
