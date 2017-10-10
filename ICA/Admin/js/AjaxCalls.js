$(function () {

    $.ajax({
        type: "POST",
        url: "ICAWebService.asmx/GetActiveRegistrations",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            console.log("testing... ");
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                if (data.length != 0) {
                    $("#totalactivereg").html(data.Table[0]["ACTIVEREG"]);
                }
            }
        }
    });

    $.ajax({
        type: "POST",
        url: "ICAWebService.asmx/GetSuccessfulPayments",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                if (data.length != 0) {
                    $("#totalsuccessfulpayments").html(data.Table1[0]["SUCCESSFULPAYMENTS"]);
                }
            }
        }
    });


    $.ajax({
        type: "POST",
        url: "ICAWebService.asmx/GetApproved",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                if (data.length != 0) {
                    $("#totalapproved").html(data.Table2[0]["APPROVED"]);
                }
            }
        }
    });


    $.ajax({
        type: "POST",
        url: "ICAWebService.asmx/GetPending",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                if (data.length != 0) {
                    $("#totalpending").html(data.Table3[0]["PENDINGAPPROVALS"]);
                }
            }
        }
    })

   



































})