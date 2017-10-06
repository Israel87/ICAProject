$(function () {
$('a[title]').tooltip();
});

// additional view for Educational Records
var count = 0;
$(function () {
    $(".add-button").click(function () {

        //if (count >= 2) {
        //    alert("You cannot add more than 3 entries!!");
        //    return;
        //}
        count++;
        var element = "<div id='prevInst" + count + "'><div class='form-group'><div class='col-lg-4 control-label'>&nbsp;</div><div class='col-lg-4'><input runat='server' name='instName" + count + "' id='instNameID" + count + "' class='form-control' style='border:2px solid #0094ff; width:600px; border-radius:0px' placeholder='Name of Institution'/></div><div class='col-lg-4'><input class='form-control' name='selDate" + count + "' id='selDateID" + count + "' type='date' style='width:200px; border:2px solid #0094ff; width:200px; border-radius:0px' runat='server' placeholder='Select Date'/></div ><br /></div><br/><br/><div class='form-group'><div class='col-lg-4 control-label'>&nbsp;</div><div class='col-lg-4'><input runat='server' name='certName" + count + "' id='certNameID" + count + "' class='form-control' style='border:2px solid #0094ff; width:600px; border-radius:0px'  placeholder='Name of Certification' /></div><div class='col-lg-4'><input class='form-control' name='selDateI" + count + "' id='seldateIID" + count + "' type='date' style='width:200px; border:2px solid #0094ff; width:200px; border-radius:0px' runat='server' placeholder='Select Date'/> <br /><a class='btn btn-danger custom-btn delete-button pull-right' style='display:inline; border-radius:0px' onclick='deleteEntry(" + count + ")'> × Delete </a></div>";
         $("#InstsAttended").append(element);

        //$('#prev_employmentlist input[name="date"]').datetimepicker({
        //    timepicker: false,
        //    //mask: true,
        //    format: 'd/m/Y',
        //    //minDate: '-1970/01/01',//yesterday is minimum date(for today use 0 or -1970/01/01)
        //    maxDate: '-1970/01/01'//tomorrow is maximum date calendar
        //    //onChangeDateTime: function (dp, $input) {
        //    //    alert($input.val())
        //    //}
        //});

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

        //if (countII >= 1) {
        //    alert("You cannot add more than 2 entries!!");
        //    return;
        //}
        countII++;
        var elementII = "<div id='prevEmp" + countII + "'><div class='form-group'><div class='col-lg-4 control-label'>&nbsp;</div><div class='col-lg-8'><select class='form-control' name='experience" + countII + "' id='experienceID" + countII + "' style='border:2px solid #0094ff; width:400px; border-radius:0px' runat='server'></div><option value='Null'>Select </option><option value='3' style='font-weight:bold'>&nbsp; 1 - 3 Years</option><option value='5' style='font-weight:bold'>&nbsp; 5+ Years</option><option value='15' style='font-weight:bold'>&nbsp; 15+ Years</option></select></div></div>&nbsp;<div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><input runat='server' name='nameOrg" + countII + "' id='nameOrgID" + countII + "' class='form-control' style='border:2px solid #0094ff; width: 600px; border-radius:0px' placeholder='Name of Organization'/></div><br /></div ><br /><div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><input runat='server' name='posOcc" + countII + "' id='posOccID" + countII + "' class='form-control' style='border:2px solid #0094ff; width:600px; border-radius:0px' placeholder='Position Occupied'/></div><br /></div ><br /><div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><input runat='server' name='dateEmp" + countII + "' id='dateEmpID" + countII + "' type='date' class='form-control' style='border:2px solid #0094ff; width: 600px; border-radius:0px'/></div><br /></div><br /><div class='form-group'><div class='col-lg-4 control-label'></div><div class='col-lg-8'><textarea runat='server' name='functions" + countII + "' id='functionID" + countII + "' type='date' class='form-control' style='border: 2px solid #0094ff; width:600px; border-radius:0px'/></div><br /><br /><br /></div><a class='btn btn-danger custom-btn delete-button pull-right' style='display:inline; border-radius:0px' onclick='deleteEntryII(" + countII + ")'> × Delete </a>&nbsp;</div>";
        $("#EmpDetails").append(elementII);

        //$('#prev_employmentlist input[name="date"]').datetimepicker({
        //    timepicker: false,
        //    //mask: true,
        //    format: 'd/m/Y',
        //    //minDate: '-1970/01/01',//yesterday is minimum date(for today use 0 or -1970/01/01)
        //    maxDate: '-1970/01/01'//tomorrow is maximum date calendar
        //    //onChangeDateTime: function (dp, $input) {
        //    //    alert($input.val())
        //    //}
        //});

    })
});


function deleteEntryII(index) {
    if (confirm("Are you sure?")) {
        $("#prevEmp" + index).remove();
        countII--
    }
}


function checkVal() {
    // Check form validations 
    if ($("#MainContent_lastname").val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Last Name must be Added **</h4>');
        return false;
    }
    if ($('#MainContent_firstname').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** First Name must be Added **</h4>');
        return false;
    }
    if ($('#MainContent_username').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** First Name must be Added **</h4>');
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
    if ($('#MainContent_phoneNUmber').val() == "") {
        $('#errorMsg').html('<h4 style="color:red"> ** Phone Number must be included **</h4>');
        return false;
    }
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