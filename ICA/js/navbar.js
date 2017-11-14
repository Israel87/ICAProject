var userinfo = "";

$(function () {
    $('a[title]').tooltip();
});

// additional view for Educational Records
var count = 0;
$(function () {
    $(".add-button").click(function () {

        count++;
        var element = "<div id='prevInst" + count + "'><div class='form-group'><div class='col-lg-4 control-label'>&nbsp;</div><div class='col-lg-4'><input runat='server' name='instName" + count + "' id='instNameID" + count + "' class='form-control' style='border:2px solid #0094ff; width:600px; border-radius:0px' placeholder='Name of Institution'/></div><div class='col-lg-4'><input class='form-control' name='selDate" + count + "' id='selDateID" + count + "' type='date' style='width:200px; border:2px solid #0094ff; width:200px; border-radius:0px' runat='server' placeholder='Select Date'/></div ><br /></div><br/><br/><div class='form-group'><div class='col-lg-4 control-label'>&nbsp;</div><div class='col-lg-4'><input runat='server' name='certName" + count + "' id='certNameID" + count + "' class='form-control' style='border:2px solid #0094ff; width:600px; border-radius:0px'  placeholder='Name of Certification' /></div><div class='col-lg-4'><input class='form-control' name='selDateI" + count + "' id='seldateIID" + count + "' type='date' style='width:200px; border:2px solid #0094ff; width:200px; border-radius:0px' runat='server' placeholder='Select Date'/> <br /><a class='btn btn-danger custom-btn delete-button pull-right' style='display:inline; border-radius:0px' onclick='deleteEntry(" + count + ")'> × Delete </a></div>";

    })
});


function deleteEntry(index) {
    if (confirm("Are you sure?")) {
        $("#prevInst" + index).remove();
        count--
    }
}

// additional view for employment records.
var countII = 0;
$(function () {
    $(".add-buttons").click(function () {
        countII++;
        var elementII = "<div id='prevEmp" + countII + "'><div class='form-group'><div class='col-lg-4 control-label'>&nbsp;</div><div class='col-lg-8'><select class='form-control' name='experience" + countII + "' id='experienceID" + countII + "' style='border:2px solid #0094ff; width:400px; border-radius:0px' runat='server'></div><option value='Null'>Select </option><option value='3' style='font-weight:bold'>&nbsp; 1 - 3 Years</option><option value='5' style='font-weight:bold'>&nbsp; 5+ Years</option><option value='15' style='font-weight:bold'>&nbsp; 15+ Years</option></select></div></div>&nbsp;<div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><input runat='server' name='nameOrg" + countII + "' id='nameOrgID" + countII + "' class='form-control' style='border:2px solid #0094ff; width: 600px; border-radius:0px' placeholder='Name of Organization'/></div><br /></div ><br /><div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><input runat='server' name='posOcc" + countII + "' id='posOccID" + countII + "' class='form-control' style='border:2px solid #0094ff; width:600px; border-radius:0px' placeholder='Position Occupied'/></div><br /></div ><br /><div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><input runat='server' name='dateEmp" + countII + "' id='dateEmpID" + countII + "' type='date' class='form-control' style='border:2px solid #0094ff; width: 600px; border-radius:0px'/></div><br /></div><br /><div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><textarea runat='server' name='functions" + countII + "' id='functionID" + countII + "' type='date' class='form-control' style='border: 2px solid #0094ff; width:600px; border-radius:0px'/></div><br /><br /><br /></div><a class='btn btn-danger custom-btn delete-button pull-right' style='display:inline; border-radius:0px' onclick='deleteEntryII(" + countII + ")'> × Delete </a>&nbsp;</div>";
        $("#EmpDetails").append(elementII);

    })
});


function deleteEntryII(index) {
    if (confirm("Are you sure?")) {
        $("#prevEmp" + index).remove();
        countII--
    }
}


function makePayment() {
    var rnd = "ICA-" + Date.now();

    //log payment to db

    var selectedItem = $('#MainContent_paymentCatID option:selected').text().split('|  ₦ ');
    var payment_desc = selectedItem[0].trim();
    var amount = parseInt(selectedItem[1].trim());
    var email = $('#MainContent_emailDisplay').text();
    var payItemID = $('#MainContent_paymentCatID option:selected').val();
    var response = '';



    //get transaction details by email
    getInfoByEmail(email);

    //log paymnt to db
    logPaymentInfoDB("{'biodataid': '" + userinfo.Table[0].BIODATAID + "', 'description': '" + payment_desc + "', 'response': '" + response + "', 'payItemId': '" + payItemID + "', 'payRef': '" + rnd + "', 'status': 0 }");

    getpaidSetup({
        customer_email: email,
        customer_firstname: userinfo.Table[0].FIRSTNAME,
        customer_phone: userinfo.Table[0].PHONE,
        customer_lastname: userinfo.Table[0].LASTNAME,
        amount: amount,
        currency: "NGN",
        country: "NG",
        //payment_method: "card",
        custom_logo: "http://imgur.com/uuRnkV9",
        custom_description: payment_desc,
        //custom_title: "The Start",
        txref: rnd,
        //integrity_hash: "<PASS YOUR GENERATED INTEGRITY HASH HERE>",//
        PBFPubKey: "FLWPUBK-cfd98c44ead933747503ff12631ba1c9-X",
        onclose: function (response) {
            //update payment status
            if (triggerPayment == false) {
                updatePaymentInfo(activepayId, 0, "Cancelled");
                alert('Payment Cancelled..');
            }

            return false;
        },
        callback: function (response) {
            var flw_ref = response.tx.flwRef;// collect flwRef returned and pass to a  server page to complete status check.
            console.log("This is the response returned after a charge", response);

            triggerPayment = true;

            if (response.tx.chargeResponse == '00' || response.tx.chargeResponse == '0') {
              
                //update payment status
                updatePaymentInfo(activepayId, 2, "Failed");
                 // redirect to a failure page.
               
                return true;
            } else {
                alert('Payment Successfull..' + flw_ref);
                $('#transRefID').val() = flw_ref;
                //update payment status
                updatePaymentInfo(activepayId, 1, "Successfull");

               // redirect to a success page
                alert('Payment Successfull..');
                return false;
            }
        }
    });

    return false;
}

function getInfoByEmail(email) {

    $.ajax({
        type: "POST",
        url: "/ICA/Admin/ICAWebService.asmx/GetInfoByEmail",
        data: '{email : "' + email + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d != "") {
                var data = JSON.parse(result.d);
                if (data.length != 0) {
                    //console.log(data)
                    userinfo = data;
                }
            }
        }
    });
}
var activepayId;
function logPaymentInfoDB(payinfo) {
    $.ajax({
        type: "POST",
        url: "/ICA/Admin/ICAWebService.asmx/logPaymentInfoDB",
        data: payinfo,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d != "") {
                var data = JSON.parse(result.d);
                if (data.length != 0) {
                    console.log(data)
                    activepayId = data;
                }
            }
        }
    });
}

function updatePaymentInfo(payid, status, response) {
    $.ajax({
        type: "POST",
        url: "/ICA/Admin/ICAWebService.asmx/updatePaymentInfoDB",
        data: "{paymentid: '" + payid + "', status:  '" + status + "', response:  '" + response + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {

            if (result.d != "") {
                var data = JSON.parse(result.d);
                if (data.length != 0) {
                    console.log(data);
                }
            }
        }
    });
}

function confirmPass() {
    alert('Password don\'t match');
};



function bvnPhoneNumber(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) || evt.delegateTarget.value.length > 10)
        return false;
    return true;
}


// validate email 
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

// bindings for email and phonenumber validations
$('#MainContent_phoneNUmber').bind('keypress', bvnPhoneNumber);
//$('#MainContent_email').bind('kepress', checkVal);


function checkVal() {
    var email = $('#MainContent_email').val();

    // Check form validations 

    if ($("#MainContent_title").val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Title must be Selected **</h4>');
        return false;
    }


    if ($("#MainContent_gender").val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Gender must be Selected **</h4>');
        return false;
    }



    if ($("#MainContent_lastname").val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Last Name must be Added **</h4>');
        return false;
    }
    if ($('#MainContent_firstname').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** First Name must be Added **</h4>');
        return false;
    }

    if ($('#MainContent_password').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** First Name must be Added **</h4>');
        return false;
    }

    if ($('#MainContent_password').val() != $('#MainContent_passwordII').val()) {
        $('#errorMsg').html('<h4 style="color:red"> ** Password and Confirm Password Does not Match **</h4>');
        return false;
    }

    if ($('#MainContent_dob').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please Select a Date Of Birth **</h4>');
        return false;
    }
    if ($('#MainContent_email').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Email field must be included **</h4>');
        return false;
    }
    if (!validateEmail(email)) {
        $('#errorMsg').html('<h4 style="color:red"> ** Email field  not in the right format **</h4>');
        return false;
    }
    if ($('#MainCOntent_addressI').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Address should be included **</h4>');
        return false;
    }
    if ($('#MainContent_city').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** city should be included **</h4>');
        return false;
    }
    if ($('#MainContent_state').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** state should be included **</h4>');
        return false;
    }

    if (($('#MainContent_phoneNUmber').val()).length == 7 || ($('#MainContent_phoneNUmber').val()).length == 11) {

    }
    else {
        $('#errorMsg').html('<h4 style="color:red"> **  Phone Number  must either be 7 or 11 digits **</h4>');
        return false;
    }

    //if ($('#MainContent_phoneNUmber').val() == "") {
    //    $('#errorMsg').html('<h4 style="color:red"> ** Phone Number must be included **</h4>');
    //    return false;
    //}
    if ($('#MainContent_maritStats').val() == "Null") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please Select a Marital Status **</h4>');
        return false;
    }
    if ($('#MainCOntent_degreeID').val() == "Null") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please Select a Degree  from Education Records Tab **</h4>');
        return false;
    }
    if ($('#MainContent_instNameID').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please Include a Name of Institution from Education Records Tab**</h4>');
        return false;
    }
    if ($('#MainContent_graddateID').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please Select a Graduation Date from Education Records Tab**</h4>');
        return false;
    }
    if ($('#MainContent_experienceID').val() == "Null") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please Select a range for years of experience from Employment Records Tab**</h4>');
        return false;
    }
    if ($('#MainContent_nameOrgID').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please add the Name of Organization from Employment Records Tab**</h4>');
        return false;
    }
    if ($('#MainContent_posOccID').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please add the position you occupied from Employment Records Tab**</h4>');
        return false;
    }
    if ($('#MainContent_dateEmpID').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please add the Date Employed from Employment Records Tab**</h4>');
        return false;
    }
    if ($('#MainContent_functionID').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Please add Job Functions from Employment Records Tab **</h4>');
        return false;
    }
    // end of check.
}


function payWithPaystack() {

    var email = $('#email').val() == "" ? 'nnajiisrael@gmail.com' : $('#email').val();

    var handler = PaystackPop.setup({
        key: 'pk_test_0f6e11e3b9594ac996658aeeb94f30ac98f51186',
        email: email,
        amount: 15000000,
        //ref: '' + Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
        metadata: {
            custom_fields: [
                {
                    display_name: "Mobile Number",
                    variable_name: "mobile_number",
                    value: "+2348135801114"
                }
            ]
        },
        callback: function (response) {
            alert('Registration and Payment is successful. transaction ref is ' + response.reference);
            $('#transRefID').val() = response.reference;
            return true;
        },
        onClose: function () {
            alert('window closed');
            return false;
        }
    });
    handler.openIframe();
}

$(document).ready(function () {

    $('._date').datetimepicker({
        timepicker: false,
        //mask: true,
        format: 'm/d/Y',
        //minDate: '-1970/01/01',//yesterday is minimum date(for today use 0 or -1970/01/01)
        maxDate: '-1970/01/01'//tomorrow is maximum date calendar
        //onChangeDateTime: function (dp, $input) {
        //    alert($input.val())
        //}
    });

    // other date formats
})
