var OnLoadFunction = function (DomainName, Prefix) {

    var GetChequedate = $("#" + Prefix + "Chequedate").val();

    $("#" + Prefix + "TransactionMode").change(function () {

        $("#" + Prefix + "CashAmount").val(0);
        $("#" + Prefix + "ChequeAmount").val(0);
        $("#" + Prefix + "ChequeNo").val("");
        $("#" + Prefix + "Chequedate").val("");
        $("#" + Prefix + "ReceivedFromBank").val("");
        $("#" + Prefix + "PaymentMode").val("");
        $("#" + Prefix + "PaymentMode").select2().find(":selected").data("");
        $("#" + Prefix + "CashAccount").select2('data', null);
        $("#" + Prefix + "DepositedInBank").select2('data', null);

        if ($("#" + Prefix + "TransactionMode").val() == "PAYMENT") {
            //$("input[name=optionsRadios1]").attr("disabled", true);
            //$('#' + Prefix + 'IsonAccount').attr("disabled", true);
            //$('#' + Prefix + 'IsonAccount').attr("checked", false);
            //$('#' + Prefix + 'IsonAccount').parent('span').removeClass('checked');
            //$('#' + Prefix + 'IsonAccount').val(false);CASHBANKLABEL
            $('#labelBank').text("Issued in bank");
            $('#CASHBANKLABEL').hide();
        }
        else {

            //$("input[name=optionsRadios1]").attr("disabled", false);
            //$('#' + Prefix + 'IsonAccount').attr("checked", false);
            //$('#' + Prefix + 'IsonAccount').parent('span').removeClass('checked');
            //$('#' + Prefix + 'IsonAccount').val(false);
            $('#labelBank').text("Deposited in bank");
            $("#" + Prefix + "DepositedInBank").attr("disabled", true);
            $('#CASHBANKLABEL').show();
        }
    });

    $("#" + Prefix + "PaymentMode").change(function () {

        var PaymentMode = $(this).val();

        if (PaymentMode == "Cash") {

            App.blockUI({ boxed: true });

            var StrURL = DomainName + "/Voucher/GetBankCashList?Type=" + PaymentMode;
            $("#" + Prefix + "CashAccount").select2('data', null);
            $("#" + Prefix + "DepositedInBank").select2('data', null);
            $("#" + Prefix + "DepositedInBank").attr("disabled", true);
            $("#" + Prefix + "CashAccount").attr("disabled", false);
            FillDropDownfromOther(Prefix + "CashAccount", StrURL, "Cash Account");
            $("#" + Prefix + "CashAccount option:selected").remove();
            $("#" + Prefix + "ChequeAmount").val(0);
            $("#" + Prefix + "CashAmount").val($(".clsTotal").val());
            $("#" + Prefix + "CashAmount").attr("readonly", true);
            $("#" + Prefix + "ChequeNo").attr("disabled", true);
            $("#" + Prefix + "ChequeAmount").attr("readonly", true);
            $("#" + Prefix + "Chequedate").attr("disabled", true);
            $("#" + Prefix + "Chequedate").val("");
            $(".input-group-btn").hide();
            //$('#' + Prefix + 'IsonAccount').attr("checked", false);
            //$('#' + Prefix + 'IsonAccount').parent('span').removeClass('checked');
            //$('#' + Prefix + 'IsonAccount').val(false);
            $("#" + Prefix + "ReceivedFromBank").removeClass('required required2');
            $("#" + Prefix + "CashAccount").addClass('required required2');
            $("#" + Prefix + "DepositedInBank").removeClass('required required2');

            App.unblockUI();
        }

        else if (PaymentMode == "Bank") {

            App.blockUI({ boxed: true });

            var StrURL = DomainName + "/Voucher/GetBankCashList?Type=" + PaymentMode;
            $("#" + Prefix + "DepositedInBank").select2('data', null);
            $("#" + Prefix + "CashAccount").select2('data', null);
            $("#" + Prefix + "DepositedInBank").attr("disabled", false);
            $("#" + Prefix + "CashAccount").attr("disabled", true);
            FillDropDownfromOther(Prefix + "DepositedInBank", StrURL, "Bank Account");
            $(".input-group-btn").show();
            $("#" + Prefix + "CashAmount").val(0);
            $("#" + Prefix + "CashAmount").attr("readonly", true);
            $("#" + Prefix + "ChequeAmount").val($(".clsTotal").val());
            $("#" + Prefix + "ChequeAmount").attr("readonly", true);
            $("#" + Prefix + "ChequeNo").attr("disabled", false);
            $("#" + Prefix + "Chequedate").attr("disabled", false);
            $("#" + Prefix + "Chequedate").val(GetChequedate);
            $("#" + Prefix + "ChequeNo").addClass('required required2');
            $("#" + Prefix + "ReceivedFromBank").addClass('required required2');
            $("#" + Prefix + "CashAccount").removeClass('required required2');
            $("#" + Prefix + "DepositedInBank").addClass('required required2');

            App.unblockUI();
        }
        else {

            App.blockUI({ boxed: true });

            var StrURL = DomainName + "/Voucher/GetBankCashList?Type=Cash";
            $("#" + Prefix + "CashAccount").select2('data', null);
            FillDropDownfromOther(Prefix + "CashAccount", StrURL, "Cash Account");
            var StrURL1 = DomainName + "/Voucher/GetBankCashList?Type=Bank";
            $("#" + Prefix + "DepositedInBank").select2('data', null);
            FillDropDownfromOther(Prefix + "DepositedInBank", StrURL1, "Bank Account");
            $("#" + Prefix + "CashAmount").val(0);
            $("#" + Prefix + "ChequeAmount").val(0);
            $("#" + Prefix + "ChequeNo").attr("disabled", false);
            $("#" + Prefix + "CashAmount").attr("readonly", false);
            $("#" + Prefix + "ChequeAmount").attr("readonly", false);
            $("#" + Prefix + "Chequedate").attr("disabled", false);
            $("#" + Prefix + "Chequedate").val(GetChequedate);
            //$('#' + Prefix + 'IsonAccount').attr("checked", false);
            //$('#' + Prefix + 'IsonAccount').parent('span').removeClass('checked');
            //$('#' + Prefix + 'IsonAccount').val(false);
            $("#" + Prefix + "ReceivedFromBank").addClass('required required2');
            $("#" + Prefix + "DepositedInBank").attr("disabled", false);
            $("#" + Prefix + "CashAccount").attr("disabled", false);
            $("#" + Prefix + "CashAccount").addClass('required required2');
            $("#" + Prefix + "DepositedInBank").addClass('required required2');

            App.unblockUI();
        }
    });

    if ($("#WAD_Vouchertype").val() != "DEBITCREDIT") {
debugger
        //$("#" + Prefix + "NETAMOUNT").removeAttr('readonly');
        $("#" + Prefix + "NETAMOUNT").attr("number", true).attr("min", 1).addClass("required required2");
    }

    $("#" + Prefix + "NETAMOUNT").live('change', function () {
        var PaymentMode = $("#" + Prefix + "PaymentMode").val();
        var PaymentAmount = $("#" + Prefix + "NETAMOUNT").val();
        if (PaymentMode.toUpperCase() == "CASH") {
            $("#" + Prefix + "ChequeAmount").val(0);
            $("#" + Prefix + "CashAmount").val(PaymentAmount);
            $(".clsTotal").val(PaymentAmount);
        }
        if (PaymentMode.toUpperCase() == "BANK") {
            $("#" + Prefix + "CashAmount").val(0);
            $("#" + Prefix + "ChequeAmount").val(PaymentAmount);
            $(".clsTotal").val(PaymentAmount);
        }
    });

    $("input[name='numberTypeR']").live("change", function () {

        var numberType = $('input[name=numberTypeR]:checked').val();
        $("#" + Prefix + "numberType").val(numberType);
        $("#" + Prefix + "ChequeNo").attr("placeholder", $('input[name=numberTypeR]:checked').parents('label').text().trim());
        if (numberType == "C") {
            $("#" + Prefix + "ChequeNo").attr("maxlength", "6");
            $("#" + Prefix + "ChequeNo").attr("minlength", "6");
            $("#" + Prefix + "ChequeNo").attr("number", true);
        }
        else {
            $("#" + Prefix + "ChequeNo").attr("maxlength", "22");
            $("#" + Prefix + "ChequeNo").attr("minlength", "6");
            $("#" + Prefix + "ChequeNo").removeAttr("number");
        }
    });

    $("#TDSRate").on("change", function () {
        $("#" + Prefix + "NETAMOUNT").val(Math.round($("#WAD_GSTBillAmount").val()));
        $("#" + Prefix + "AmountApplicable").val(Math.round($("#WAD_GSTBillAmount").val()));
    });
}

