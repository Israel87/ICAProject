<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SiteCorporate.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="ICA.Corporate.changePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <form runat="server">
            <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">change password</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h4 class="page-header">Change Password</h4>
			</div>
		</div><!--/.row-->
		
	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">

                    <asp:Label ID="changePasswordNotification" runat="server"></asp:Label>
                    <asp:Label ID="passwordCheck" runat="server"></asp:Label>

					
					<div class="panel-body container"><br /><br /><br />
						<div class="col-lg-9">
                            <div class="form-group">
                                    <label for="gender" class="col-lg-4 control-label"> Current Password </label>
                                    <input class="form-control col-lg-8" type="password" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="currentPass"  /><br /><br />
                            </div>
                            <div class="form-group">
                                    <label for="gender" class="col-lg-4 control-label"> New Password </label>
                                    <input class="form-control col-lg-8" type="password" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="newPass"  /><br /><br />
                            </div>

                            <div class="form-group">
                                    <label for="gender" class="col-lg-4 control-label"> Confirm Password </label>
                                    <input class="form-control col-lg-8" type="password" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="confirm"  /><br /><br />
                            </div>

                            <br />

                        <%--  
                            <asp:LinkButton ID="change" runat="server" CssClass="btn btn-outline-rounded btn-info col-lg-8" Style="border-radius: 0px; text-align:center; width: 200px;" Font-Bold="true"  OnClientClick="return checkVal();" OnClick="change_Click"> CHANGE</asp:LinkButton>--%>
                            
                       <%--     <asp:LinkButton ID="changePass" runat="server" CssClass="btn btn-outline-rounded btn-info col-lg-8" Style="border-radius: 0px; text-align:center; width: 200px;" Font-Bold="true"  OnClientClick="return checkVal();" OnClick="change_Click">CHANGE</asp:LinkButton>--%>
                             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-rounded btn-info col-lg-8" Style="border-radius: 0px; text-align:center; width: 200px;" Font-Bold="true"  OnClientClick="return checkVal();" OnClick="change_Click"><b>CHANGE</b></asp:LinkButton>
                    <%--        <asp:LinkButton ID="saveReg" runat="server" CssClass="btn btn-outline-rounded btn-info col-lg-8"  OnClientClick="return checkVal();" OnClick="change_Click"> PROCEED TO PAYMENT </asp:LinkButton>--%>
                            
                            <br /><br /><br /><br />
						</div>
                            
                        <div class="col-lg-3">
                                <asp:Label ID="errorLbl" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                               <%-- <asp:Label ID="succLbl" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>--%>
                        </div>
                        
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<!--/.row-->
		
		<!--/.row-->
	</div>	<!--/.main-->
    </form>
        <script type="text/javascript">

            function checkVal() {
                if ($('#newPass').val() != $('#confirm').val()) {
                    $('#errorLbl').html('<h4 style="color:red"> ** Password and Confirm Password Does not Match **</h4>');
                    return false;
                }
            }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

