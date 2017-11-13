var userinfo = "";


function makePayment() {
    var rnd = "ICA-" + Date.now();

    //log payment to db

    var selectedItem = $('#paymentCatID option:selected').text().split('|  ₦ ');
    var payment_desc = selectedItem[0].trim();
    var amount = parseInt(selectedItem[1].trim());
    var email = $('#emailDisplay').val();
    var payItemID = $('#paymentCatID option:selected').val();
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
                alert('Payment Successfull..' + flw_ref);
                $('#transRefID').val() = flw_ref;

                //update payment status
                updatePaymentInfo(activepayId, 1, "Successfull");

                // redirect to a success page


                return true;
            } else {
                //update payment status
                updatePaymentInfo(activepayId, 2, "Failed");

                // redirect to a failure page.
                alert('Payment Failed..');
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