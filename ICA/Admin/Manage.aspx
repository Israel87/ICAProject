<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ICA.Admin.Manage"  %>

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

            </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="profile-sidebar">
            <center>
                <img src="../images/ica.png" style="width:160px; height:100px" />
            </center>
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
            <li><a href="../logout.aspx"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
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
                        </select>
                    </div>


                    <div class="col-lg-4">
                        <select id="memberCatID" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" datavaluefield="MEMBERTYPEID" datatextfield="MEMBERTYPE" required="required">
                        </select><br />

                    </div>

                    <div class="col-lg-2">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-rounded btn-primary" Style="border-radius: 0px; width: 200px;" OnClick="manageRegID_Click" Text="SEARCH" Font-Bold="true" />
                    </div>
                </div>
            </div>



            <br />
            <br />

            <div class="col-lg-12">


                <div class="">
                    <div class="table-responsive">
                        <asp:GridView ID="regResults" runat="server" CssClass="table table-striped table-bordered gvv" AutoGenerateColumns="false" Font-Size="Medium" ForeColor="Black" Width="100%" HeaderStyle-CssClass="bg-primary" AllowPaging="true" OnPageIndexChanging="regResults_PageIndexChanging" PageSize="2">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%--<a href="#ViewPanel?id=<%# Eval("BIODATAID").ToString()%>" class="btn btn-primary" onclick="viewReg_Click"> VIEW </a>--%>
                                        <asp:Button ID="viewReg" CssClass="btn btn-primary" runat="server" Text="VIEW" Font-Bold="true" OnClick="viewReg_Click" CommandArgument='<%# Eval("BIODATAID").ToString()%>' Style="width: 150px; border-radius: 0px" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="FULLNAME" HeaderText="FULL NAME" ControlStyle-Font-Bold="true"  />
                                <asp:BoundField DataField="USERNAME" HeaderText="EMAIL ADDRESS" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="MEMBERCATEGORY" HeaderText="MEMBER CATEGORY" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="APPLICATION STATUS" HeaderText="MEMBER STATUS" ControlStyle-Font-Bold="true" />
                                <asp:BoundField DataField="DATEADDED" HeaderText="DATE" ControlStyle-Font-Bold="true" />
                            </Columns>

                        </asp:GridView>

                    </div>
                    <br />
                    <br />
                </div>

            </div>

            <div id="ViewPanel" runat="server" visible="false">
                <%-- <hr />
                <div class="panel panel-primary">--%>

                <div class="row container">
                    <div class="col-lg-12">
                        <div class="input-group">

                            <asp:Button ID="resume" runat="server" CssClass="btn btn-outline-rounded btn-primary" Style="border-radius: 0px; width: 200px;" Text="VIEW RESUME" Font-Bold="true" OnClick="resume_Click" />
                            <asp:Button ID="passport" runat="server" CssClass="btn btn-outline-rounded btn-warning" Style="border-radius: 0px; width: 200px;" Text="VIEW PASSPORT" Font-Bold="true" OnClick="passport_Click"/>
                             <asp:Button ID="approve" runat="server" CssClass="btn btn-outline-rounded btn-success" Style="border-radius: 0px; width: 200px;" Text="APPROVE" OnClick="approve_Click" Font-Bold="true" />
                        </div>

                    </div><br /><br />
                    <div class="col-lg-12">
                        <div class="input-group">
                           
                            <asp:Label ID="passportDisplay" runat="server">

                            </asp:Label>
                        </div>
                    </div>
                    <br />
                  
                </div>

                  <br />
                    <br />
                    <br />

                <div class="row">

                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">FULLNAME</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="fullname" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">MEMBER STATUS</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="memberstatus"  disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>


                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">GENDER</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="gender" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">DATE OF BIRTH</label>
                                <input class="form-control col-lg-8" type="text" id="dateofbirth" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>




                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">MARITAL STATUS</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="maritalstatus" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">ADDRESS </label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="address" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>


                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">ADDRESS II</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="addressII" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">EMAIL</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="email" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>



                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">PHONE NUMBER</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="phonenumber"  disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">NAME OF SCHOOL</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="nameofschool" disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-group">
                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">HIGHEST DEGREE</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="highestdegree" disabled />
                            </div>


                            <div class="col-lg-6">
                                <label for="fullname" class="col-lg-4 control-label">GRADUATE DATE</label>
                                <input class="form-control col-lg-8" type="text" style="width: 200px; border: 2px solid #0094ff; width: 420px; border-radius: 0px" runat="server" id="graduationdate"  disabled /><br />
                                <br />
                                <br />
                            </div>

                        </div>
                    </div>


                    <br />
                    <br />


                </div>

                <br />
                <br />
                    
                        <div class="col-lg-12 text-center">
                           
                            <asp:Label ID="pdfDisplay" runat="server" >
                            </asp:Label>     

                        </div>
              
            </div>
    

                   <br />
                <br />


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
