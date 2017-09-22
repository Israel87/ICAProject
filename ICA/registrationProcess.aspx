<%@ Page Title="Registration Membership" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrationProcess.aspx.cs" Inherits="ICA.registrationProcess" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center">
        <img src="images/ica.png" style="border-radius: 5px; width:100px; height:50px " class="text-center"/> <br />

            <h3 style="font-family:Agency FB"><b>ASSOCIATE / FELLOW / MEMBER MEMBERSHIP</b> </h3>
            <h5><b> REGISTRATION FORM </b></h5>
    </div>
  

    <section style="background:#efefe9;">
        <div class="container">
            <div class="row">
              
                <div class="board">
                  
                    <div class="board-inner">
                    <ul class="nav nav-tabs" id="myTab">
                    <div class="liner"></div>
                     <li class="active">
                     <a href="#home" data-toggle="tab" title="Personal Details">
                      <span class="round-tabs one">
                              <i class="glyphicon glyphicon-user"></i>
                      </span> 
                  </a></li>

                  <li><a href="#profile" data-toggle="tab" title="Educational Records">
                     <span class="round-tabs two">
                         <i class="glyphicon glyphicon-cloud"></i>
                     </span> 
           </a>
                 </li>
                 <li><a href="#messages" data-toggle="tab" title="Employment Records">
                     <span class="round-tabs three">
                          <i class="glyphicon glyphicon-briefcase"> </i>
                     </span> </a>
                     </li>

                     <li><a href="#settings" data-toggle="tab" title="Credentials">
                         <span class="round-tabs four">
                              <i class="glyphicon glyphicon-folder-open"></i>
                         </span> 
                     </a></li>

                     <li><a href="#doner" data-toggle="tab" title="Confirmation">
                         <span class="round-tabs five">
                              <i class="glyphicon glyphicon-ok"></i>
                         </span> </a>
                     </li>
                     
                     </ul></div>

                  <%--  beginning of tabs --%>

                     <div class="tab-content">
                      <div class="tab-pane fade in active" id="home">
                          <div class="container">  
                              <h3 class="container"> Personal Information </h3>
                            <h5 class="container"><b>Kindly fill the boxes below as appropriate with the requested personal information.</b></h5>
                                 <hr />
                            <%--  <br />--%>
                              <%--<p style="font-family: monospace"> Kindly fill the boxes below as appropriate with the requested personal information </p><br />--%>

                              <div class="row">

                                   <div class="form-group">
                                       <label for="title" class="col-lg-1 control-label"> 
                                           <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>

                                       </label>
                                           <div class="col-lg-6">
                                                <select  id="title" class="form-control" name="title" style="border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" >
                                                    <option value="Null">Select Title</option>
                                                    <option value="Master">Master</option>                              
                                                    <option value="Miss">Miss</option>
                                                    <option value="Mr">Mr</option>
                                                    <option value="Mrs">Mrs</option>
                         
                                                </select>
                                            </div>


                                         <div class="col-lg-5">
                                                <select  id="select1" class="form-control" name="title" style="border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" >
                                                    <option value="Null">Select Gender</option>
                                                    <option value="Male">Male</option>                              
                                                    <option value="Female">Female</option>
                                              
                         
                                                </select><br />
                                                
                                            </div>
                                </div>

                                     <div class="form-group">
                                            <label for="title" class="col-lg-1 control-label"> 
                                           <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>

                                       </label>
                                          <div class="col-lg-4">
                                              <input class="form-control" type="text" style="width:200px; border:2px solid #0094ff; width:220px; border-radius:0px" runat="server" placeholder="Last Name" />
                                          </div>

                                           <div class="col-lg-3">
                                            
                                             <input class="form-control" type="text" style="width:200px; border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" placeholder="First Name" /><br />
                                            </div>

                                        <div class="col-lg-4">
                                          <input class="form-control" type="text" style="width:200px; border:2px solid #0094ff; width:220px; border-radius:0px" runat="server" placeholder="Middle Name" /><br />
                                      </div>
                                    </div>
                                 

                       

                                      <div class="form-group">
                                            <label for="title" class="col-lg-1 control-label"> 
                                           <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>

                                       </label>
                                      <div class="col-lg-5">
                                          <input class="form-control" type="date" style="width:200px; border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" placeholder="Select Date" />
                                      </div>
                                                <div class="col-lg-6">
                                          <input class="form-control" type="text" style="width:200px; border:2px solid #0094ff; width:220px; border-radius:0px" runat="server" placeholder="Email Address" /><br />
                                      </div>
                                          <%-- <div class="col-lg-5"><asp:TextBox runat="server"></asp:TextBox>
                                            
                                             <input class="form-control" type="text" style="width:200px; border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" placeholder="Last Name" />
                                            </div>--%>
                                </div>

                                  <div class="form-group">
                                       <label for="contactAddress" class="col-lg-1 control-label"> </label>
                                  <div class="col-lg-6">
                                       <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px" TextMode="MultiLine" placeholder="Contact Address"></asp:TextBox><br />
                                  </div>
                                      
                                      <div class="col-lg-5">
                                           <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px" TextMode="MultiLine" placeholder="Address II"></asp:TextBox><br />
                                  </div>
                                  </div>
                                 
                                  <div class="form-group">
                                       <label for="city" class="col-lg-1 control-label"> </label>
                                  <div class="col-lg-6">
                                       <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px"  placeholder="City"></asp:TextBox>
                                  </div>
                                      
                                      <div class="col-lg-5">
                                           <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px"  placeholder="Province/State"></asp:TextBox><br />
                                  </div>
                                  </div>
                                  <div class="form-group">
                                       <label for="city" class="col-lg-1 control-label"> </label>
                                  <div class="col-lg-6">
                                       <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px"  placeholder="Postal/Zip Code"></asp:TextBox>
                                  </div>
                                      
                                     <div class="col-lg-5">
                                                <select  id="select2" class="form-control" name="country" style="border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" >
                                                    <option value="Null">Select Country</option>
                                                    <option value="NG">Nigeria</option>                              
                                                    <option value="GH">Ghana</option>
                                              
                         
                                                </select><br />
                                                
                                            </div>
                                  </div>

                                    <div class="form-group">
                                       <label for="city" class="col-lg-1 control-label"> </label>
                                  <div class="col-lg-6">
                                       <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px"  placeholder="Phone Number"></asp:TextBox>
                                  </div>
                                      
                                     <div class="col-lg-5">
                                                <select  id="select3" class="form-control" name="country" style="border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" >
                                                    <option value="Null">Select Marital Status</option>
                                                    <option value="Single">Single</option>                              
                                                    <option value="Married">Married</option>
                                                    <option value="Divorced">Divorced</option>
                                                    <option value="Seperated">Seperated</option>
                                                </select><br />
                                                
                                            </div>
                                  </div>
                                  <br /><br />

                                  <center>
                                      <button class="btn btn-outline-rounded btn-primary" runat="server" style="border-radius:0px"><b>NEXT</b></button>
                                  </center>    
                              </div>
                  </div>

                      </div>

                     <%--    End of tab one --%>

                      <div class="tab-pane fade" id="profile">
                            <div class="container">
                                  <h3 class="container"> Educational Qualification </h3>
                            <h5 class="container"><b>Please provide accurate details about your educational background</b></h5>
                                 <hr />

                                 <div class="form-group">
                                       <b class="col-lg-4 control-label"> 
                                           Highest Degree Attained   <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                     </b>
                                           <div class="col-lg-8">
                                                <select  id="Select4" class="form-control" name="title" style="border:2px solid #0094ff; width:400px; border-radius:0px" runat="server" >
                                                    <option value="Null">Select </option>
                                                    <option value="MBA">Master of Business Administrations</option>
                                                    <option value="MSc">Master of Science</option>
                                                    <option value="BSc">Bachelor of Science</option>                              
                                                    <option value="SSCE">SSCE</option>
                                                    <option value="FSLC">First School Leaving Certificate</option>
                                                 </select>
                                            </div><br /><br />
                                    </div>


                                  
                                       <div id="InstsAttended">
                                       <div class="prevInst">
                                            <div class="form-group">
                                             <b class="col-lg-4 control-label">Institutions Attended with Date</b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                 
                                           <div class="col-lg-4">
                                                 <input runat="server" name="instName" id="instNameID" Class="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px"  placeholder="Name of Institution" />
                                            </div>

                                           <div class="col-lg-4">
                                                 <input class="form-control" name="selDate" id="selDateID"  type="date" style="width:200px; border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" placeholder="Select Date" />
                                                
                                            </div><br />
                                            </div><br />


                                            <div class="form-group">
                                             <b class="col-lg-4 control-label">Other Certifications with Date </b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                 
                                           <div class="col-lg-4">
                                                 <input runat="server" name="certName" id="certNameID" Class="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px"  placeholder="Name of Certification" />
                                             
                                            </div>
                                            <div class="col-lg-4">
                                                 <input class="form-control" name="selDateI" id="seldateIID" type="date" style="width:200px; border:2px solid #0094ff; width:200px; border-radius:0px" runat="server" placeholder="Select Date" /> <br />
                                                   <br /> 
                                            </div>
                                                <center>
                                                     <a class="btn btn-info custom-btn add-button" style="display: inline; border-radius:0px" ><b>&plus; Add More</b> </a>
                                                </center>
                                                
                                           

                                             </div> 



                                       </div>
                                 </div>
                                        
                                         <div class="container input-group"><br /> 
                                              <button class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius:0px"><b>NEXT</b></button>
                                              <button class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius:0px"><b>PREVIOUS</b></button>
                                     
                                  </div> 
                                    </div>


                            
                          
                      </div>

                       <%-- End of tab two --%>


                      <div class="tab-pane fade" id="messages">
                         <div class="container">
                                  <h3 class="container"> Employment Records </h3>
                            <h5 class="container" style="text-align:justify">Please complete the fields below with information regarding your employment records. The records expected here are jobs considered to have given you the minimum requirements based on the different grades of membership as specified.</h5>
                                 <hr />

                          
                             <div id="EmpDetails">
                                       <div class="prevEmp">
                                 <div class="form-group">
                                       <b class="col-lg-4 control-label"> 
                                          Years of Experience  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                     </b>
                                           <div class="col-lg-8">
                                                <select class="form-control" name="experience" id="experienceID" style="border:2px solid #0094ff; width:400px; border-radius:0px" runat="server" >
                                                    <option value="Null">Select </option>
                                                    <option value="3" style="font-weight:bold">&nbsp; 1 - 3 Years</option>
                                                    <option value="5" style="font-weight:bold">&nbsp; 5+ Years</option>
                                                    <option value="15" style="font-weight:bold">&nbsp; 15+ Years</option>                              
                                                  
                                                 </select>
                                            </div><br />
                                    </div>
                                <br />
                                   <div class="form-group">
                                             <b class="col-lg-4 control-label">Most Recent Work Experience</b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                 
                                           <div class="col-lg-8">
                                                 <input runat="server" name="nameOrg" id="nameOrgID" Class="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px" placeholder="Name of Organization" />
                                            </div>

                                          <br />
                                            </div><br />

                              <div class="form-group">
                                             <b class="col-lg-4 control-label">Position Occupied </b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                 
                                           <div class="col-lg-8">
                                                 <input runat="server" name="posOcc" id="posOccID" Class="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px" placeholder="Position Occupied" />
                                            </div>

                                          <br />
                                </div><br />

                             <div class="form-group">
                                             <b class="col-lg-4 control-label">Date Employed</b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                 
                                           <div class="col-lg-8">
                                                 <input runat="server" name="dateEmp" id="dateEmpID" type="date" Class="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px" />
                                            </div>

                                          <br />
                                </div><br />

                              <div class="form-group">
                                             <b class="col-lg-4 control-label">Functions</b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                 
                                           <div class="col-lg-8">
                                                 <textarea runat="server" name="functions" id="functionID" type="date" Class="form-control" style="border:2px solid #0094ff; width:600px; border-radius:0px" />
                                            </div>

                                          <br /><br /> <br />
                                </div> 
                             <center><br /> <br />
                                  <a class="btn btn-info custom-btn add-buttons" style="display: inline; border-radius:0px"><b>&plus; Add More Employment Details </b> </a> 

                             </center>
                              
                                 
                                 </div>
                             </div>

                             <div class="container input-group"><br /> <br />
                                              <button class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius:0px"><b>NEXT</b></button>
                                              <button class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius:0px"><b>PREVIOUS</b></button>
                                     
                                  </div> 
                        </div>
                      </div>
                       <%--  End of tab three --%>

                      <div class="tab-pane fade" id="settings">
                            <div class="container">
                                  <h3 class="container"> Upload Credentials</h3>
                                 <hr /><br />
                                <div class="form-group">
                                     <b class="col-lg-4 control-label" style="text-align:right">Upload C.V </b> 
                                    <div class="col-lg-8">
                                              <asp:FileUpload ID="FileUpload2" runat="server" />   
                                            </div><br />
                                </div><br />
                                 <div class="form-group"><br />
                                     <b class="col-lg-4 control-label" style="text-align:right">Upload Passport</b> 
                                    <div class="col-lg-8">
                                              <asp:FileUpload ID="FileUpload1" runat="server" />   
                                            </div><br />
                                </div><br />

                                    <center><br /> <br />
                                         <a class="btn btn-success custom-btn add-button" style="display: inline; border-radius:0px"><b>PROCEED TO PAYMENT</b> </a> 
                                    </center>

                                    <div class="container input-group"><br /> <br /><br /> <br />
                                              <button class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius:0px"><b>NEXT</b></button>
                                              <button class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius:0px"><b>PREVIOUS</b></button>
                                     
                                  </div> 
                            </div>
                        
                      </div>

<%--                         End of tab four--%>
                      <div class="tab-pane fade" id="doner">
                        <div class="container"><br /><br />
                                  
                            <center>


                                 <div class="alert alert-success" role="alert">
                                       <b> Registration Successful.</b>
                                 </div>


                                <div class="tab-pane panel panel-success panel-group">
                                    <center>

                                  <h4 style="font-family:Agency FB" ><b>Thank you for registering with ICA. <br />
                                    Your Application is being processes,<br /> You will receive a mail once your application is approved.</b> 
                                </h4>
                                    </center>
                               <br /><br />


                                </div>
                               
                            </center>
                        </div>
                     </div>
                        <%-- End of tab five--%>
                <div class="clearfix"></div>
        </div>

        </div>
        </div>
        </div>
</section>
                   



    <div class="modal fade bd-example-modal2-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
            
                </div>
              </div>
            </div>


























</asp:Content>