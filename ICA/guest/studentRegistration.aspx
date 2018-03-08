<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="studentRegistration.aspx.cs" Inherits="ICA.guest.studentRegistration" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container text-center">
        <a href="Default.aspx"><img src="../images/ica.png" style="border-radius: 5px" class="text-center"/> </a>
        <br />

        <h3 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">STUDENT MEMBERSHIP </h3>
        <h5 style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">REGISTRATION FORM</h5>
    </div>

      <section>
        <div class="container">
            <div class="row">

              <%--  <div class="board">--%>

                    <div class="board-inner">
                        <ul class="nav nav-tabs" id="myTab">
                            <%--<div class="liner"></div>--%>
                            <li class="active">
                                <a href="#home" data-toggle="tab" id="personalDet" title="Personal Details">
                                    <span class="round-tabs one">
                                        <i class="glyphicon glyphicon-user"></i>
                                    </span>
                                </a></li>

                            <li><a href="#profile" data-toggle="tab" id="education" title="Educational Records">
                                <span class="round-tabs two">
                                    <i class="glyphicon glyphicon-cloud"></i>
                                </span>
                            </a>
                            </li>
                            <li><a href="#messages" data-toggle="tab" id="employment" title="Employment Records">
                                <span class="round-tabs three">
                                    <i class="glyphicon glyphicon-briefcase"></i>
                                </span></a>
                            </li>

                            <li><a href="#settings" data-toggle="tab" id="credentials" title="Credentials">
                                <span class="round-tabs four">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                </span>
                            </a></li>

                            <li><a id="payment" title="Payment">
                                <span class="round-tabs five">
                                    <i class="glyphicon glyphicon-credit-card"></i>
                                </span></a>
                            </li>

                        </ul>
                    </div>

                    <%--  beginning of tabs --%>

                    <div class="tab-content col-lg-12 col-sm-6 col-xs-3">
                        <div class="tab-pane fade in active" id="home">
                            <div class="container">
                                <h3 class="container" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Personal information </h3>
                                <h5 class="container"><b>Kindly fill the boxes below as appropriate with the requested personal information.</b></h5>
                                <h6 class="container" style="color:red"> <b>All fields with bold blue borders are compulsory.</b></h6>
                                <hr />
                                <%--  <br />--%>
                                <%--<p style="font-family: monospace"> Kindly fill the boxes below as appropriate with the requested personal information </p><br />--%>

                                <div class="row">

                                    <div class="form-group">
                                        <label for="title" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <select id="title" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" required="required">
                                                <option value="">Select Title</option>
                                                <option value="1">MR</option>
                                                <option value="2">MRS</option>
                                                <option value="3">MASTER</option>
                                                <option value="4">MS</option>
												<option value="5">MISS</option>

                                            </select>
                                        </div>


                                        <div class="col-lg-5">
                                            <select id="gender" class="form-control" name="title" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" required="required">
                                                <option value="">Select Gender</option>
                                                <option value="M">Male</option>
                                                <option value="F">Female</option>


                                            </select><br />

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-lg-1 control-label" id="lastnameVal"> </label>
                                        <div class="col-lg-6">
                                            <input class="form-control" type="text" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" id="lastname" placeholder="Last Name" required="required" />
                                        </div>

                                        <div class="col-lg-5">

                                            <input class="form-control" type="text" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" id="firstname" placeholder="First Name" required="required" /><br />
                                        </div>

                                    </div>

                                      <div class="form-group">
                                        <label for="title" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <input class="form-control" type="text" style="width: 200px; border: 2px solid #aed6f1; width: 400px; border-radius: 0px" runat="server" id="middlename" placeholder="Middle Name" required="required" /><br />
                                             <input class="form-control" type="text" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" id="nyscStateCode" placeholder="NYSC state code" required="required" /><br />
                                             <%-- <select id="memcatgoryID" class="form-control" name="memcategory" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server">
                                                <option value="Null">Select Member Category</option>
												<option value="4">Associate </option>
                                                <option value="5">Member</option>
                                                <option value="6">Fellow</option>
                                            </select>--%>


                                        </div>
                                        <div class="col-lg-5">

                                            <input class="form-control" type="password" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" id="password" placeholder="Password" required/>
                                            <br />
											 <input class="form-control" type="password" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" id="passwordII" placeholder="Confirm Password" required />
											 <br/>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label for="title" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <input class="form-control _date" type="text" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" name="dob" id="dob" placeholder="Date of Birth" required="required" />
                                          
                                        </div>
                                        <div class="col-lg-5">
                                            <input class="form-control" type="text" style="width: 200px; border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server" id="email" placeholder="Email Address" required="required" /><br />
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="contactAddress" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="addressI" runat="server" CssClass="form-control" Style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" TextMode="MultiLine" placeholder="Contact Address" required="required"></asp:TextBox><br />
                                        </div>

                                        <div class="col-lg-5">
                                            <asp:TextBox ID="addressII" runat="server" CssClass="form-control" Style="border: 2px solid #aed6f1; width: 400px;  border-radius: 0px" TextMode="MultiLine" placeholder="Address II" required="required"></asp:TextBox><br />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="city" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="city" runat="server" CssClass="form-control" Style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" placeholder="City"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-5">
                                            <select id="stateID" class="form-control" name="states" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server">
                                                <option selected="selected">Select State</option>
                                                <option value="Abia">Abia</option>
                                                <option value="Adamawa">Adamawa</option>
                                                <option value="AkwaIbom">AkwaIbom</option>
                                                <option value="Anambra">Anambra</option>
                                                <option value="Bauchi">Bauchi</option>
                                                <option value="Bayelsa">Bayelsa</option>
                                                <option value="Benue">Benue</option>
                                                <option value="Borno">Borno</option>
                                                <option value="CrossRivers">CrossRivers</option>
                                                <option value="Delta">Delta</option>
                                                <option value="Ebonyi">Ebonyi</option>
                                                <option value="Edo">Edo</option>
                                                <option value="Ekiti">Ekiti</option>
                                                <option value="Enugu">Enugu</option>
                                                <option value="Gombe">Gombe</option>
                                                <option value="Imo">Imo</option>
                                                <option value="Jigawa">Jigawa</option>
                                                <option value="Kaduna">Kaduna</option>
                                                <option value="Kano">Kano</option>
                                                <option value="Katsina">Katsina</option>
                                                <option value="Kebbi">Kebbi</option>
                                                <option value="Kogi">Kogi</option>
                                                <option value="Kwara">Kwara</option>
                                                <option value="Lagos">Lagos</option>
                                                <option value="Nasarawa">Nasarawa</option>
                                                <option value="Niger">Niger</option>
                                                <option value="Ogun">Ogun</option>
                                                <option value="Ondo">Ondo</option>
                                                <option value="Osun">Osun</option>
                                                <option value="Oyo">Oyo</option>
                                                <option value="Plateau">Plateau</option>
                                                <option value="Rivers">Rivers</option>
                                                <option value="Sokoto">Sokoto</option>
                                                <option value="Taraba">Taraba</option>
                                                <option value="Yobe">Yobe</option>
                                                <option value="Zamfara">Zamafara</option>
                                            </select><br />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="zip" runat="server" CssClass="form-control" Style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Postal/Zip Code"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-5">
                                            <select id="country" class="form-control" name="country" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server">
                                                <option value="Null">Select Country</option>
                                                <option value="AF">Afghanistan</option>
                                                <option value="AX">Åland Islands</option>
                                                <option value="AL">Albania</option>
                                                <option value="DZ">Algeria</option>
                                                <option value="AS">American Samoa</option>
                                                <option value="AD">Andorra</option>
                                                <option value="AO">Angola</option>
                                                <option value="AI">Anguilla</option>
                                                <option value="AQ">Antarctica</option>
                                                <option value="AG">Antigua and Barbuda</option>
                                                <option value="AR">Argentina</option>
                                                <option value="AM">Armenia</option>
                                                <option value="AW">Aruba</option>
                                                <option value="AU">Australia</option>
                                                <option value="AT">Austria</option>
                                                <option value="AZ">Azerbaijan</option>
                                                <option value="BS">Bahamas</option>
                                                <option value="BH">Bahrain</option>
                                                <option value="BD">Bangladesh</option>
                                                <option value="BB">Barbados</option>
                                                <option value="BY">Belarus</option>
                                                <option value="BE">Belgium</option>
                                                <option value="BZ">Belize</option>
                                                <option value="BJ">Benin</option>
                                                <option value="BM">Bermuda</option>
                                                <option value="BT">Bhutan</option>
                                                <option value="BO">Bolivia, Plurinational State of</option>
                                                <option value="BQ">Bonaire, Sint Eustatius and Saba</option>
                                                <option value="BA">Bosnia and Herzegovina</option>
                                                <option value="BW">Botswana</option>
                                                <option value="BV">Bouvet Island</option>
                                                <option value="BR">Brazil</option>
                                                <option value="IO">British Indian Ocean Territory</option>
                                                <option value="BN">Brunei Darussalam</option>
                                                <option value="BG">Bulgaria</option>
                                                <option value="BF">Burkina Faso</option>
                                                <option value="BI">Burundi</option>
                                                <option value="KH">Cambodia</option>
                                                <option value="CM">Cameroon</option>
                                                <option value="CA">Canada</option>
                                                <option value="CV">Cape Verde</option>
                                                <option value="KY">Cayman Islands</option>
                                                <option value="CF">Central African Republic</option>
                                                <option value="TD">Chad</option>
                                                <option value="CL">Chile</option>
                                                <option value="CN">China</option>
                                                <option value="CX">Christmas Island</option>
                                                <option value="CC">Cocos (Keeling) Islands</option>
                                                <option value="CO">Colombia</option>
                                                <option value="KM">Comoros</option>
                                                <option value="CG">Congo</option>
                                                <option value="CD">Congo, the Democratic Republic of the</option>
                                                <option value="CK">Cook Islands</option>
                                                <option value="CR">Costa Rica</option>
                                                <option value="CI">Côte d'Ivoire</option>
                                                <option value="HR">Croatia</option>
                                                <option value="CU">Cuba</option>
                                                <option value="CW">Curaçao</option>
                                                <option value="CY">Cyprus</option>
                                                <option value="CZ">Czech Republic</option>
                                                <option value="DK">Denmark</option>
                                                <option value="DJ">Djibouti</option>
                                                <option value="DM">Dominica</option>
                                                <option value="DO">Dominican Republic</option>
                                                <option value="EC">Ecuador</option>
                                                <option value="EG">Egypt</option>
                                                <option value="SV">El Salvador</option>
                                                <option value="GQ">Equatorial Guinea</option>
                                                <option value="ER">Eritrea</option>
                                                <option value="EE">Estonia</option>
                                                <option value="ET">Ethiopia</option>
                                                <option value="FK">Falkland Islands (Malvinas)</option>
                                                <option value="FO">Faroe Islands</option>
                                                <option value="FJ">Fiji</option>
                                                <option value="FI">Finland</option>
                                                <option value="FR">France</option>
                                                <option value="GF">French Guiana</option>
                                                <option value="PF">French Polynesia</option>
                                                <option value="TF">French Southern Territories</option>
                                                <option value="GA">Gabon</option>
                                                <option value="GM">Gambia</option>
                                                <option value="GE">Georgia</option>
                                                <option value="DE">Germany</option>
                                                <option value="GH">Ghana</option>
                                                <option value="GI">Gibraltar</option>
                                                <option value="GR">Greece</option>
                                                <option value="GL">Greenland</option>
                                                <option value="GD">Grenada</option>
                                                <option value="GP">Guadeloupe</option>
                                                <option value="GU">Guam</option>
                                                <option value="GT">Guatemala</option>
                                                <option value="GG">Guernsey</option>
                                                <option value="GN">Guinea</option>
                                                <option value="GW">Guinea-Bissau</option>
                                                <option value="GY">Guyana</option>
                                                <option value="HT">Haiti</option>
                                                <option value="HM">Heard Island and McDonald Islands</option>
                                                <option value="VA">Holy See (Vatican City State)</option>
                                                <option value="HN">Honduras</option>
                                                <option value="HK">Hong Kong</option>
                                                <option value="HU">Hungary</option>
                                                <option value="IS">Iceland</option>
                                                <option value="IN">India</option>
                                                <option value="ID">Indonesia</option>
                                                <option value="IR">Iran, Islamic Republic of</option>
                                                <option value="IQ">Iraq</option>
                                                <option value="IE">Ireland</option>
                                                <option value="IM">Isle of Man</option>
                                                <option value="IL">Israel</option>
                                                <option value="IT">Italy</option>
                                                <option value="JM">Jamaica</option>
                                                <option value="JP">Japan</option>
                                                <option value="JE">Jersey</option>
                                                <option value="JO">Jordan</option>
                                                <option value="KZ">Kazakhstan</option>
                                                <option value="KE">Kenya</option>
                                                <option value="KI">Kiribati</option>
                                                <option value="KP">Korea, Democratic People's Republic of</option>
                                                <option value="KR">Korea, Republic of</option>
                                                <option value="KW">Kuwait</option>
                                                <option value="KG">Kyrgyzstan</option>
                                                <option value="LA">Lao People's Democratic Republic</option>
                                                <option value="LV">Latvia</option>
                                                <option value="LB">Lebanon</option>
                                                <option value="LS">Lesotho</option>
                                                <option value="LR">Liberia</option>
                                                <option value="LY">Libya</option>
                                                <option value="LI">Liechtenstein</option>
                                                <option value="LT">Lithuania</option>
                                                <option value="LU">Luxembourg</option>
                                                <option value="MO">Macao</option>
                                                <option value="MK">Macedonia, the former Yugoslav Republic of</option>
                                                <option value="MG">Madagascar</option>
                                                <option value="MW">Malawi</option>
                                                <option value="MY">Malaysia</option>
                                                <option value="MV">Maldives</option>
                                                <option value="ML">Mali</option>
                                                <option value="MT">Malta</option>
                                                <option value="MH">Marshall Islands</option>
                                                <option value="MQ">Martinique</option>
                                                <option value="MR">Mauritania</option>
                                                <option value="MU">Mauritius</option>
                                                <option value="YT">Mayotte</option>
                                                <option value="MX">Mexico</option>
                                                <option value="FM">Micronesia, Federated States of</option>
                                                <option value="MD">Moldova, Republic of</option>
                                                <option value="MC">Monaco</option>
                                                <option value="MN">Mongolia</option>
                                                <option value="ME">Montenegro</option>
                                                <option value="MS">Montserrat</option>
                                                <option value="MA">Morocco</option>
                                                <option value="MZ">Mozambique</option>
                                                <option value="MM">Myanmar</option>
                                                <option value="NA">Namibia</option>
                                                <option value="NR">Nauru</option>
                                                <option value="NP">Nepal</option>
                                                <option value="NL">Netherlands</option>
                                                <option value="NC">New Caledonia</option>
                                                <option value="NZ">New Zealand</option>
                                                <option value="NI">Nicaragua</option>
                                                <option value="NE">Niger</option>
                                                <option value="NG">Nigeria</option>
                                                <option value="NU">Niue</option>
                                                <option value="NF">Norfolk Island</option>
                                                <option value="MP">Northern Mariana Islands</option>
                                                <option value="NO">Norway</option>
                                                <option value="OM">Oman</option>
                                                <option value="PK">Pakistan</option>
                                                <option value="PW">Palau</option>
                                                <option value="PS">Palestinian Territory, Occupied</option>
                                                <option value="PA">Panama</option>
                                                <option value="PG">Papua New Guinea</option>
                                                <option value="PY">Paraguay</option>
                                                <option value="PE">Peru</option>
                                                <option value="PH">Philippines</option>
                                                <option value="PN">Pitcairn</option>
                                                <option value="PL">Poland</option>
                                                <option value="PT">Portugal</option>
                                                <option value="PR">Puerto Rico</option>
                                                <option value="QA">Qatar</option>
                                                <option value="RE">Réunion</option>
                                                <option value="RO">Romania</option>
                                                <option value="RU">Russian Federation</option>
                                                <option value="RW">Rwanda</option>
                                                <option value="BL">Saint Barthélemy</option>
                                                <option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
                                                <option value="KN">Saint Kitts and Nevis</option>
                                                <option value="LC">Saint Lucia</option>
                                                <option value="MF">Saint Martin (French part)</option>
                                                <option value="PM">Saint Pierre and Miquelon</option>
                                                <option value="VC">Saint Vincent and the Grenadines</option>
                                                <option value="WS">Samoa</option>
                                                <option value="SM">San Marino</option>
                                                <option value="ST">Sao Tome and Principe</option>
                                                <option value="SA">Saudi Arabia</option>
                                                <option value="SN">Senegal</option>
                                                <option value="RS">Serbia</option>
                                                <option value="SC">Seychelles</option>
                                                <option value="SL">Sierra Leone</option>
                                                <option value="SG">Singapore</option>
                                                <option value="SX">Sint Maarten (Dutch part)</option>
                                                <option value="SK">Slovakia</option>
                                                <option value="SI">Slovenia</option>
                                                <option value="SB">Solomon Islands</option>
                                                <option value="SO">Somalia</option>
                                                <option value="ZA">South Africa</option>
                                                <option value="GS">South Georgia and the South Sandwich Islands</option>
                                                <option value="SS">South Sudan</option>
                                                <option value="ES">Spain</option>
                                                <option value="LK">Sri Lanka</option>
                                                <option value="SD">Sudan</option>
                                                <option value="SR">Suriname</option>
                                                <option value="SJ">Svalbard and Jan Mayen</option>
                                                <option value="SZ">Swaziland</option>
                                                <option value="SE">Sweden</option>
                                                <option value="CH">Switzerland</option>
                                                <option value="SY">Syrian Arab Republic</option>
                                                <option value="TW">Taiwan, Province of China</option>
                                                <option value="TJ">Tajikistan</option>
                                                <option value="TZ">Tanzania, United Republic of</option>
                                                <option value="TH">Thailand</option>
                                                <option value="TL">Timor-Leste</option>
                                                <option value="TG">Togo</option>
                                                <option value="TK">Tokelau</option>
                                                <option value="TO">Tonga</option>
                                                <option value="TT">Trinidad and Tobago</option>
                                                <option value="TN">Tunisia</option>
                                                <option value="TR">Turkey</option>
                                                <option value="TM">Turkmenistan</option>
                                                <option value="TC">Turks and Caicos Islands</option>
                                                <option value="TV">Tuvalu</option>
                                                <option value="UG">Uganda</option>
                                                <option value="UA">Ukraine</option>
                                                <option value="AE">United Arab Emirates</option>
                                                <option value="GB">United Kingdom</option>
                                                <option value="US">United States</option>
                                                <option value="UM">United States Minor Outlying Islands</option>
                                                <option value="UY">Uruguay</option>
                                                <option value="UZ">Uzbekistan</option>
                                                <option value="VU">Vanuatu</option>
                                                <option value="VE">Venezuela, Bolivarian Republic of</option>
                                                <option value="VN">Viet Nam</option>
                                                <option value="VG">Virgin Islands, British</option>
                                                <option value="VI">Virgin Islands, U.S.</option>
                                                <option value="WF">Wallis and Futuna</option>
                                                <option value="EH">Western Sahara</option>
                                                <option value="YE">Yemen</option>
                                                <option value="ZM">Zambia</option>
                                                <option value="ZW">Zimbabwe</option>


                                            </select><br />

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="city" class="col-lg-1 control-label"></label>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="phoneNUmber" runat="server" CssClass="form-control" Style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" placeholder="Phone Number"></asp:TextBox>
                                         

                                        </div>

                                        <div class="col-lg-5">
                                            <select id="maritStats" class="form-control" name="country" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server">
                                                <option value="Null">Select Marital Status</option>
												<option value="Married">Married</option>
                                                <option value="Single">Single</option>
                                                <option value="Separated">Separated</option>
                                                <option value="Divorced">Divorced</option>
                                                <option value="Widowed">Widowed</option>
                                            </select><br />

                                        </div>
                                    </div>
                                    <br />
                                    <br />

                                    <center>
                                      <a class="btn btn-outline-rounded btn-primary" runat="server" style="border-radius:0px" onclick="document.getElementById('education').click();"><b>NEXT</b></a>
                                  </center> <br />
                                    <br />
                                </div>
                            </div>

                        </div>

                        <%--    End of tab one --%>

                        <div class="tab-pane fade" id="profile">
                            <div class="container">
                                <h3 class="container" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Educational qualification </h3>
                                <h5 class="container"><b>Please provide accurate details about your educational background</b></h5>
                                <h6 class="container" style="color:red"> <b>All fields within this tab are compulsory.</b></h6>
                                <hr />

                                <div class="form-group">
                                    <b class="col-lg-4 control-label">Highest Degree Attained   <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>
                                    </b>
                                    <div class="col-lg-8">
                                        <select id="degreeID" class="form-control" name="degree" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" runat="server">
                                            <option value="Null">Select </option>
                                            <option value="1">Bachelor of Science</option>
                                            <option value="2">Master of Science</option>
                                            <option value="3">PhD</option>
                                            <option value="4">OND</option>
                                            <option value="5">HND</option>
											<option value="6">SSCE</option>
											<option value="7">MBA</option>
                                        </select>
                                    </div>
                                    <br />
                                    <br />
                                </div>
                                <br />


                                <%--<div id="InstsAttended">--%>
                                <%--<div class="prevInst">--%>
                                <div class="form-group">
                                    <b class="col-lg-4 control-label">Institution attended with date</b>  <%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>

                                    <div class="col-lg-4">
                                        <textarea runat="server" name="instName" id="instNameID" class="form-control" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" placeholder="Name of Institution" />
                                    </div>

                                    <div class="col-lg-4">
                                        <input class="form-control _date" type="text" name="graddate" id="graddate" style="width: 400px; border: 2px solid #0094ff; width: 200px; border-radius: 0px" runat="server" placeholder="Select Date" required="required" />

                                       

                                    </div>
                                    <br />
                                </div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />


                                <div class="form-group">
                                    <b class="col-lg-4 control-label">Other certifications with date </b><%--<span style="color: red; font-style: italic; text-align: right">*</span>--%>

                                    <div class="col-lg-4">
                                        <textarea runat="server" name="certName" id="certNameID" class="form-control" style="border: 2px solid #0094ff; width: 400px; border-radius: 0px" placeholder="Name of Certification" />

                                    </div>
                                    <div class="col-lg-4">
                                   
                                    </div>
                          
                                </div>



                           
                            </div>

                            <center>
                                    <div class="container input-group"><br /> <br /><br /> <br /><br />
                                              <a class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius:0px" onclick="document.getElementById('employment').click();" ><b>NEXT</b></a>
                                              <a class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius:0px" onclick="document.getElementById('personalDet').click();"><b>PREVIOUS</b></a>
                                     
                                         </div> 
                                </center>

                        </div>

                        <%-- End of tab two --%>


                        <div class="tab-pane fade" id="messages">
                            <div class="container">
                                <h3 class="container" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Upload records </h3>
                               <%-- <h5 class="container" style="text-align: justify">Please complete the fields below with information regarding your employment records. The records expected here are jobs considered to have given you the minimum requirements based on the different grades of membership as specified.</h5>
                                <h6 class="container" style="color:red"> <b>Only the current work experience fields within this tab are compulsory.</b></h6>--%>
                                <hr />


                                
                                 <div class="form-group">
                                    <br />
                                    <b class="col-lg-4 control-label" style="text-align: right">UPLOAD PASSPORT
                                        <br />
                                        | .jpg files only |
                                    </b>
                                    <div class="col-lg-8">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                    <br />
                                </div>  <br />

                                <div class="form-group">
                                    <b class="col-lg-4 control-label" style="text-align: right">UPLOAD RESUME
                                        <br />
                                        | .pdf files only |
                                    </b>

                                    <div class="col-lg-8">
                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                    </div>
                                    <br />
                                </div><br />

                                
                                <div class="form-group">
                                    <b class="col-lg-4 control-label" style="text-align: right">UPLOAD NYSC ID card
                                        <br />
                                        | .pdf files only |
                                    </b>

                                    <div class="col-lg-8">
                                        <asp:FileUpload ID="FileUpload3" runat="server" />
                                    </div>
                                    <br />
                                </div>
                                <br />
                                <div class="col-lg-12">
                           

                                </div>
                                <div class="container input-group">
                                    <br />
                                    <br />
                                    <a class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius: 0px" onclick="document.getElementById('credentials').click();"><b>NEXT</b></a>
                                    <a class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius: 0px" onclick="document.getElementById('education').click();"><b>PREVIOUS</b></a>

                                </div>
                            </div>
                        </div>
                        <%--  End of tab three --%>

                     <div class="tab-pane fade" id="settings">
                            <div class="container">
                                <h3 class="container" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Business referees</h3>
                                 <h6 class="container" style="color:red"> <b>All fields with bold blue borders are compulsory.</b></h6>
                                <hr />
                                <br />

                                 <div class="col-lg-6">
                                        <br />
                                        <b>Reference I</b>

                                        <div class="form-group">
                                            <br />
                                            <br />

                                            <div class="col-lg-8">
                                                <%--  <p>Experience </p>--%>
                                                <input runat="server" name="referenceFirstname" id="referenceFirstname" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Reference First Name" />
                                            </div>
                                            <br />
                                        </div>
                                        <br />

                                        <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="referenceLastname" id="referenceLastname" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Reference Last Name" />
                                            </div>

                                            <br />
                                        </div>
                                        <br />

                                        <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="positionOccupied" id="positionOccupied" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Position Occupied" />
                                            </div>

                                            <br />
                                        </div>
                                        <br />

                                          <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="referenceEmail" id="referenceEmail" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Email" />
                                            </div>

                                            <br />
                                        </div>
                                        <br />




                                        <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="referencePhoneNumber" id="referencePhoneNumber" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="PhoneNumber" />
                                            </div>

                                            <br />
                                        </div>
                                        

                                    </div>
                                <div class="col-lg-6">
                                        <br />
                                        <b>Reference II</b>

                                        <div class="form-group">
                                            <br />
                                            <br />

                                            <div class="col-lg-8">
                                                <%--  <p>Experience </p>--%>
                                                <input runat="server" name="referenceFirstname" id="Text1" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Reference First Name" />
                                            </div>
                                            <br />
                                        </div>
                                        <br />

                                        <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="referenceLastname" id="Text2" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Reference Last Name" />
                                            </div>

                                            <br />
                                        </div>
                                        <br />

                                        <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="positionOccupied" id="Text3" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Position Occupied" />
                                            </div>

                                            <br />
                                        </div>
                                        <br />

                                          <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="referenceEmail" id="Text4" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="Email" />
                                            </div>

                                            <br />
                                        </div>
                                        <br />




                                        <div class="form-group">
                                            <%--  <b class="col-lg-4 control-label">Position Occupied </b>--%>

                                            <div class="col-lg-8">
                                                <%-- <p>Position Occupied</p>--%>
                                                <input runat="server" name="referencePhoneNumber" id="Text5" class="form-control" style="border: 2px solid ridge; width: 400px; border-radius: 0px" placeholder="PhoneNumber" />
                                            </div>

                                            <br />
                                        </div>
                                        <br /><br /><br /><br />

                                    </div>
                                    
                                 <asp:Label ID="uploadNotificationI" runat="server"></asp:Label>
                                 <asp:Label ID="uploadNotificationII" runat="server"></asp:Label>
                                <br />

                                <br />
                                 
                                    <br /> <br />
                                 
                                    <br />
                                
                                  <center><br /> <br /> 
                                        
                                           <p id="errorMsg"></p>
                                        
                                        <br /> <br /> 
                                </center>


                                <div class="container input-group">
                                    <br />
                                 
                                    <br />
                                    <%--<asp:LinkButton ID="saveReg" runat="server" CssClass="btn btn-outline-rounded btn-primary pull-right" OnClientClick="return checkVal();" OnClick="saveButton_Click"><b> PROCEED TO PAYMENT</b></asp:LinkButton>--%>
                                    <asp:LinkButton ID="saveReg" runat="server" CssClass="btn btn-outline-rounded btn-primary pull-right" OnClientClick="return checkVal();"><b> PROCEED TO PAYMENT</b></asp:LinkButton>
                                  <%--  <a class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius: 0px" onclick="document.getElementById('payment').click();"><b>SAVE</b></a>--%>
                                    <a class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius: 0px" onclick="document.getElementById('employment').click();"><b>PREVIOUS</b></a>
                                    <br /><br />
                                </div>
                            </div>
                        </div>

                        <%-- End of tab five--%>
                        <div class="clearfix"></div>
                    </div>

              <%--  </div>--%>
            </div>
        </div>
    </section>

</asp:Content>
