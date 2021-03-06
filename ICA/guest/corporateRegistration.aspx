﻿<%@ Page Title="Corporate Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="corporateRegistration.aspx.cs" Inherits="ICA.guest.corporateRegistration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-center">
        <a href="Default.aspx">
            <img src="../images/ica.png" style="border-radius: 5px" class="text-center" />
        </a>
        <br />

        <h3 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">SILVER / GOLD / PLATINUM MEMBERSHIP</h3>
        <h5 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">REGISTRATION FORM</h5>
    </div>
    <section>
        <div class="container">
            <div class="row">

                <%--  <div class="board">--%>

                <div class="board-inner">
                    <ul class="nav nav-tabs text-center" id="myTab">
                        <%--<div class="liner"></div>--%>
                        <li class="active">
                            <a href="#home" data-toggle="tab" id="personalDet" title="company details">
                                <span class="round-tabs one">
                                    <i class="glyphicon glyphicon-user"></i>
                                </span>
                            </a></li>

                        <li>
                            <a href="#profile" data-toggle="tab" id="education" title="contact person details">
                                <span class="round-tabs two">
                                    <i class="glyphicon glyphicon-cloud"></i>
                                </span>
                            </a>
                        </li>
                        <%--  <li><a href="#messages" data-toggle="tab" id="employment" title="Employment Records">
                                <span class="round-tabs three">
                                    <i class="glyphicon glyphicon-briefcase"></i>
                                </span></a>
                            </li>

                            <li><a href="#settings" data-toggle="tab" id="credentials" title="Credentials">
                                <span class="round-tabs four">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                </span>
                            </a></li>--%>

                        <li><a id="payment" title="Payment">
                            <span class="round-tabs five">
                                <i class="glyphicon glyphicon-credit-card"></i>
                            </span></a>
                        </li>

                    </ul>
                </div>

                <%--  beginning of tabs --%>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class="container">
                            <h3 class="container" style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Company information </h3>
                            <h5 class="container"><b>Kindly fill the boxes below as appropriate with the requested personal information.</b></h5>
                            <h6 class="container" style="color: red"><b>All fields with bold blue borders are compulsory.</b></h6>
                            <hr />
                            <%--  <br />--%>
                            <%--<p style="font-family: monospace"> Kindly fill the boxes below as appropriate with the requested personal information </p><br />--%>

                            <%--                                <div class="row">--%>


                            <div class="row container">
                                <div class="form-group col-lg-6">
                                    <label for="usr">NAME OF COMPANY </label>
                                    <br />
                                    <input type="text" class="form-control" runat="server" id="nameofCompany">
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="">ADDRESS OF COMPANY</label>
                                    <br />
                                     <asp:TextBox ID="adressofCompany" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                  
                                </div>
                            </div>

                            <div class="row container">
                                <div class="col-lg-6">
                                    <label for="">ADDRESS II</label>
                                    <asp:TextBox ID="streetAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>


                                <div class="form-group col-lg-6">
                                    <label for="usr">CITY</label>
                                    <br />
                                    <input type="text" class="form-control" runat="server" id="city">
                                </div>

                            </div>

                            <div class="row container">

                                <div class="form-group col-lg-6">
                                    <label for="usr">STATE</label>
                                    <br />

                                    <select id="stateID" class="form-control" name="states" style="border: 2px solid #0094ff;" runat="server">
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

                                <div class="form-group col-lg-6">
                                    <label for="usr">COUNTRY</label>
                                    <br />

                                    <select id="country" class="form-control" name="country" style="border: 2px solid #0094ff; width: 400px;" runat="server">
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


                                <div class="row container">
                                    <div class="col-lg-6">
                                        <label for="">COMPANY EMAIL</label>
                                        <asp:TextBox ID="companyEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>


                                    <div class="form-group col-lg-6">
                                        <label for="usr">WEB ADDRESS</label>
                                        <br />
                                        <input type="Text" class="form-control" runat="server" id="webAddress">
                                    </div>

                                </div>

                            </div>


                            <br />
                            <br />

                            <center>
                                      <a class="btn btn-outline-rounded btn-primary" runat="server" style="border-radius:0px" onclick="document.getElementById('education').click();"><b>NEXT</b></a>
                                  </center>
                            <br />
                            <br />

                            <br />
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <div class="container">
                            <h3 class="container" style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Contact person details </h3>
                            <h5 class="container"><b>Please provide accurate details about your contact person</b></h5>
                            <h6 class="container" style="color: red"><b>All fields within this tab are compulsory.</b></h6>
                            <hr />
                            <div class="row container">

                                <div class="form-group col-lg-4">
                                    <label for="usr">First Name </label>
                                    <br />
                                    <input type="text" class="form-control" runat="server" id="firstname">
                                </div>

                                <div class="form-group col-lg-4">
                                    <label for="usr">Last Name</label>
                                    <br />
                                    <input type="text" class="form-control" runat="server" id="lastname">
                                </div>

                                <div class="col-lg-4">
                                    <label for="">Position</label>
                                    <input type="text" class="form-control" runat="server" id="position">
                                </div>

                            </div>

                            <div class="row container">
                                <div class="form-group col-lg-4">
                                    <label for="usr">Phonenumber</label>
                                    <br />
                                    <input type="text" class="form-control" runat="server" id="phoneNumber">
                                </div>

                                <div class="form-group col-lg-4">
                                    <label for="usr">Email</label>
                                    <br />
                                    <input type="text" class="form-control" runat="server" id="email">

                                    <br />

                                </div>
                                   <div class="form-group col-lg-4">
                                    <label for="usr">Corporate category</label>
                                    <br />
                                    <select id="memcatgoryID" class="form-control" name="memcategory" runat="server">
                                                <option value="Null">Select corporate category</option>
												<option value="1">Gold </option>
                                                <option value="2">Silver</option>
                                                <option value="3">Platinum</option>
                                            </select>

                                    <br />

                                </div>


                            </div>

                            <div class="row container">
                                <div class="form-group col-lg-4">
                                    <label for="">Password</label>
                                       <input class="form-control" type="password" runat="server" id="password" placeholder="Password" required/>
                                            <br />
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="">Confirm Password</label>
                                       <input class="form-control" type="password" runat="server" id="passwordII" placeholder="Password" required/>
                                            <br />
                                </div>
                            </div>

                            <center><br /> <br /> 
                                        
                                           <p id="errorMsg"></p>
                                        
                                        <br /> <br /> 
                                </center>




                        </div>

                        <center>
                                    <div class="container input-group"><br /> <br /><br /> <br /><br />
                                            <%--  <a class="btn btn-outline-rounded btn-primary pull-right" runat="server" style="border-radius:0px" onclick="document.getElementById('employment').click();" ><b>NEXT</b></a>
                                              <a class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius:0px" onclick="document.getElementById('personalDet').click();"><b>PREVIOUS</b></a>
                                     --%>
                                                       <asp:LinkButton ID="saveReg" runat="server" CssClass="btn btn-outline-rounded btn-primary pull-right" OnClientClick="return checkVal();"  OnClick="saveButton_Click"><b> PROCEED TO PAYMENT</b></asp:LinkButton>
                                          <a class="btn btn-outline-rounded btn-warning pull-right" runat="server" style="border-radius:0px" onclick="document.getElementById('personalDet').click();"><b>PREVIOUS</b></a>
                                        <%--<asp:LinkButton ID="saveReg" runat="server" CssClass="btn btn-outline-rounded btn-primary pull-right" OnClientClick="return checkVal();" OnClick="saveButton_Click"><b> PROCEED TO PAYMENT</b></asp:LinkButton>--%>
                     
                                         </div> 
                                </center>

                    </div>

                </div>


                <%-- End of tab five--%>









                <div class="clearfix"></div>
            </div>

            <%--  </div>--%>
            <%--   </div>--%>
        </div>
    </section>
</asp:Content>
