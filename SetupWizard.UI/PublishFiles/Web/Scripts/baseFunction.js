//var _DomainName = '';
//var DomainName = '';
jQuery(document).ready(function () {

    App.init(DomainName);
    FormComponents.init(DomainName);
    CapitalInput("clsCapital");   
    $("input:checkbox, input:radio").uniform();
    handleSidebarAndContentHeight();
    $(window).keydown(function(event) {
        //if(event.which == 113) { //F2
        //    $(".page-breadcrumb.breadcrumb").click();
        //    //return false;
        //}
        //else
        if (event.which == 27) { //Esc
            $(".close").click();
            //return false;
        }
    });
    // Change Setting Popup Start
    $("#page-breadcrumb").click(function () {
        App.blockUI({
            target: '#changeLocDiv',
            cenrerY: true,
            boxed: true
        });
        var StrURL1 = DomainName + "/ChangeSetting/popUpIndex";
        $.ajax({
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            url: StrURL1,
            data: {},
            success: function (data1) {
                $("#changeLocDiv").html(data1);
                //$('select').select2();
                $('#changeSetting_LocCode').select2();
                $('#changeSetting_FinYear').select2();
                $('#changeSetting_CompanyCode').select2();
                $("#ChangeSetting").keydown(function (e) {
                    if (e.keyCode == 13) { //Enter
                        $("#ChangeSetting #btnSubmit").click();
                    }
                });
                $("#ChangeSetting").on("click", "#btnSubmit", function (event) {
                    App.blockUI({
                        target: '#changeLocDiv',
                        cenrerY: true,
                        boxed: true
                    });
                    var btn = $(this);
                    btn.button('loading');
                    $.post($("#ChangeSetting").attr('action'), $("#ChangeSetting").serialize(), function (data, status) {
                        var finalStatus = data.split('-');
                        if (finalStatus[0] == "success") {
                            TosterNotification("success", "Record has been saved successfully..!!", "Success");
                            if (finalStatus[1] == "Y") {
                                window.location.reload();
                            }
                            else {
                                window.location = DomainName + "/Home/Index";
                            }
                        }
                        else {
                            TosterNotification("error", "Error !! There was an error druing process. Please check your internet connection or contact administrator.", "Error");
                        }
                    });
                });
            },
            error: function () {
                alert("error");
                App.unblockUI();
            }
        });
        $("#changeSettingPopUp").click();
    });
    // Change Setting Popup End
    //$('select').select2();
    $(".select2").select2({
        placeholder: "Select an option",
        allowClear: true
    });
});
//$(document).ajaxStart(function () {
//    App.blockUI({ boxed: true });
//});
//$(document).ajaxComplete(function () {
//    App.unblockUI();
//});
// add suresh for hsrm

var setDomainName = function (DomainName) {
    _DomainName = DomainName;
}

var setDomainName = function (DomainName1) {
    DomainName = DomainName1;
    //alert('hi' + DomainName)
}

var postAndRedirect = function (url, postData) {
    var postFormStr = "<form method='POST' action='" + url + "'>\n";
    for (var key in postData) {
        if (postData.hasOwnProperty) {
            postFormStr += "<input type='hidden' name='" + key + "' value='" + postData[key] + "'></input>";
        }
    }
    postFormStr += "</form>";
    var formElement = $(postFormStr);
    $('.portlet-body').find('form').remove();
    $('.portlet-body').append(formElement);
    $(formElement).submit();
};

var HRMSFormValidate = function (DomainName, formId) {
    var form = $('#' + formId);
    var error = $('.alert-danger', form);
    var success = $('.alert-success', form);
    form.validate({
        doNotHideMessage: true,
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {},
        messages: {},
        invalidHandler: function (event, validator) {
            success.hide();
            error.show();
            App.scrollTo(error, -200);
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        success: function (label) {
            label.closest('.form-group').removeClass('has-error');
        },
        submitHandler: function (form) {
            success.show();
            error.hide();
        }
    });
};

function errorResult(jqXHR, exception) {
    var msg = '';
    if (jqXHR.status === 0) {
        msg = 'Not connect.\nVerify Network.';
    } else if (jqXHR.status == 404) {
        msg = 'Requested page not found. [404]';
    } else if (jqXHR.status == 500) {
        msg = 'Internal Server Error [500].';
    } else if (exception === 'parsererror') {
        msg = 'Requested JSON parse failed.';
    } else if (exception === 'timeout') {
        msg = 'Time out error.';
    } else if (exception === 'abort') {
        msg = 'Ajax request aborted.';
    } else {
        msg = 'Uncaught Error.\n' + jqXHR.responseText;
    }
    return msg;
}

//  DropDown : Single-Value Search With Single Character ----------------------------------------------------------------------------------
var ddlSearch = function (ddlName, strUrl, param) {
    $("#" + ddlName + " ,." + ddlName).select2({
        placeholder: "Search Here",
        minimumInputLength: 1,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    SearchText: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = $(item).val();
            if (id !== "") {
                $.ajax(strUrl + '?' + param + '=' + id, {
                    dataType: "json"
                }).done(function (result) {
                    
                    if (result.length > 0)
                        var data = {
                            id: result[0].id,
                            text: result[0].text
                        };
                    else {
                        var text = item.data('option');
                        var data = {
                            id: id,
                            text: text
                        };
                    }
                    callback(data);
                });
            }
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id + " - " + item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

//  DropDown : Multi-Value Selection ----------------------------------------------------------------------------------
var ddlMultiValue = function (ddlName, serachtext, strUrl) {
    var ddllist = $.ajax({
        url: strUrl,
        dataType: 'json',
        data: {
            str: serachtext
        },
        success: function (response) {
            $("#" + ddlName).select2({
                tags: response,
                placeholder: 'Search Here',
                multiple: true,
                allowClear: true
            });
        }
    });
};

function ddlFill(ddlName, StrURL, message) {
    $("#" + ddlName).get(0).options.length = 0;
    $("#" + ddlName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + ddlName).empty();
    $("#" + ddlName).find("option").remove();
    var select = $("#" + ddlName);
    select.empty();
    $.get(StrURL, function (data) {
        $("#" + ddlName).append('<option value="">Select ' + message + '</option>');
        for (i = 0; i < data.length; i++) {
            $("#" + ddlName).append('<option value="' + data[i].id + '">' + data[i].text + '</option>');
            $("#" + ddlName).trigger("liszt:updated");
        }
        App.unblockUI();
        if (data.length > 0) {
            $("#" + ddlName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + ddlName).trigger("liszt:updated");
    $("#" + ddlName).val($("#target option:first").val());
    $("#" + ddlName).addClass("required2");
}

var handleDatePicker = function () {
    $('.date-picker').datepicker({
        isRTL: App.isRTL(),
        format: "dd M yyyy",
        autoclose: true,
        pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
        todayBtn: true
    });
    $('body').removeClass("modal-open");
}

var FutureDatePicker = function () {
    $('.ftdate-picker').datepicker({
        isRTL: App.isRTL(),
        format: "dd M yyyy",
        autoclose: true,
        pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
        startDate: new Date(),
        todayBtn: true
    });
    $('.bkdate-picker').datepicker({
        isRTL: App.isRTL(),
        format: "dd M yyyy",
        autoclose: true,
        pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
        endDate: new Date(),
        todayBtn: true
    });
    $('body').removeClass("modal-open");
}

var PastDatePicker = function () {
    //if (jQuery().datepicker) {
    $('.ptdate-picker').datepicker({
        isRTL: App.isRTL(),
        format: "dd MM yyyy",
        autoclose: true,
        pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
        endDate: new Date(),

        todayBtn: true
    });
    $('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
    //}
}

var jsGetReportFields = function (DDLName, StrURL1) {
    //alert("hiiiii" + DomainName);
    // var StrURL1 = DomainName + '/Reports/GetReportFields?SubReportType=' + SubReportType;
    //  alert("SSSS "+StrURL1);
    $.ajax({
        url: StrURL1,
        cache: false,
        data: {},
        type: 'POST',
        success: function (html) {
            $("." + DDLName).empty();
            $("." + DDLName).append(html);

            $("input:checkbox, input:radio").uniform();
            App.unblockUI();
        },
        error: function (req, status, error) {
            App.unblockUI();
            alert("error " + req + "   " + status + "   " + error);
        }
    });

}

var CapitalInput = function (ControlName) {
    $('input[type=text]').keyup(function (event) {
        if (!$(this).hasClass('email')) {
            var textBox = event.target;
            var start = textBox.selectionStart;
            var end = textBox.selectionEnd;
            textBox.value = textBox.value.toUpperCase();
            textBox.setSelectionRange(start, end);
        }
    });
}

var handleDateTimePicker_ddmmyyyy = function (DDLName, StartDate, EntDate) {
    if (jQuery().datepicker) {
        $("#" + DDLName + " ,." + DDLName).datepicker({
            rtl: App.isRTL(),
            format: "dd MM yyyy",
            showMeridian: true,
            autoclose: true,
            pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
            startDate: new Date(StartDate),
            endDate: new Date(EntDate),
            todayBtn: true
        });
    }
}

var handleDateTimePicker_ddmmyyyyInvoice = function (DDLName, StartDate, EntDate) {
    if (jQuery().datepicker) {
        $("#" + DDLName + " ,." + DDLName).datepicker({
            rtl: App.isRTL(),
            format: "dd MM yyyy",
            showMeridian: true,
            autoclose: true,
            pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
            //startDate: new Date(StartDate),
            //endDate: new Date(EntDate),
            //todayBtn: true
        });
    }
}

var handleDateTimePicker = function (StartDate, EntDate) {
    if (jQuery().datepicker) {
        $('.datetime-picker').datetimepicker({
            rtl: App.isRTL(),
            format: "dd MM yyyy  HH:ii P",
            showMeridian: true,
            autoclose: true,
            pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
            startDate: new Date(StartDate),
            endDate: new Date(EntDate),
            todayBtn: true
        });
    }
}

var handleDateRangePickers = function (DatePickerId, FromDateId, ToDateId) {

    $('#' + DatePickerId).daterangepicker({
        opens: (App.isRTL() ? 'left' : 'right'),
        startDate: moment().subtract('days', 29),
        endDate: moment(),
        maxDate: new Date(),
        showDropdowns: true,
        showWeekNumbers: true,
        timePicker: false,
        timePickerIncrement: 1,
        timePicker12Hour: true,
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
            'Last 7 Days': [moment().subtract('days', 6), moment()],
            'Last 30 Days': [moment().subtract('days', 29), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
        },
        buttonClasses: ['btn'],
        applyClass: 'green',
        cancelClass: 'default',
        format: 'MM/DD/YYYY',
        separator: ' to ',
        locale: {
            applyLabel: 'Apply',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom Range',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
        }
    }, function (start, end) {
        $('#' + FromDateId).val(start.format('DD MMM YYYY'));
        $('#' + ToDateId).val(end.format('DD MMM YYYY'));
        $('#' + DatePickerId + ' span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    });
    $('#' + DatePickerId + ' span').html(moment().subtract('days', 29).format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
    $('#' + FromDateId).val(moment().subtract('days', 29).format('DD MMM YYYY'));
    $('#' + ToDateId).val(moment().format('DD MMM YYYY'));
}

var FormValidate = function (DomainName) {
    console.log('FormValidate')
    var form1 = $('#form_sample');
    var error1 = $('.alert-danger', form1);
    var success1 = $('.alert-success', form1);
    form1.validate({
        doNotHideMessage: true,
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {},
        messages: {},
        invalidHandler: function (event, validator) {
            success1.hide();
            error1.show();
            App.scrollTo(error1, -200);
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        success: function (label) {
            label.closest('.form-group').removeClass('has-error');
        },
        submitHandler: function (form) {
            success1.show();
            error1.hide();
            document.forms["form_sample"].submit()
        }
    });
}

var _calculateFixedSidebarViewportHeight = function () {
    var sidebarHeight = $(window).height() - $('.header').height() + 1;
    if ($('body').hasClass("page-footer-fixed")) {
        sidebarHeight = sidebarHeight - $('.footer').outerHeight();
    }

    return sidebarHeight;
}

var handleSidebarAndContentHeight = function () {
    var content = $('.page-content');
    var sidebar = $('.page-sidebar');
    var body = $('body');
    var height;
    if (body.hasClass("page-footer-fixed") === true && body.hasClass("page-sidebar-fixed") === false) {
        var available_height = $(window).height() - $('.footer').outerHeight() - $('.header').outerHeight();
        if (content.height() < available_height) {
            content.attr('style', 'min-height:' + available_height + 'px !important');
        }
    } else {
        if (body.hasClass('page-sidebar-fixed')) {
            height = _calculateFixedSidebarViewportHeight();
        } else {
            height = sidebar.height() + 20; var headerHeight = $('.header').outerHeight();
            var footerHeight = $('.footer').outerHeight();
            if ($(window).width() > 1024 && (height + headerHeight + footerHeight) < $(window).height()) {
                height = $(window).height() - headerHeight - footerHeight;
            }
        }
        if (height >= content.height()) {
            content.attr('style', 'min-height:' + height + 'px !important');
        }
    }
}

var TosterNotification = function (Type, Message, Title) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-top-full-width",
        "onclick": null,
        "showDuration": "1000",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "show",
        "hideMethod": "hide"
    }
    if (Type == "success") {
        toastr.success(Message, Title);
    }
    if (Type == "error") {
        toastr.error(Message, Title);
    }
    if (Type == "info") {
        toastr.info(Message, Title);
    }
}

var BottomTosterNotification = function (Type, Message, Title) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-bottom-right",
        "onclick": null,
        "showDuration": "1000",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "show",
        "hideMethod": "hide"
    }
    if (Type == "success") {
        toastr.success(Message, Title);
    }
    if (Type == "error") {
        toastr.error(Message, Title);
    }
    if (Type == "info") {
        toastr.info(Message, Title);
    }
}

function validateFloatfor2point(el, evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    var number = el.value.split('.');
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    //just one dot
    if (number.length > 1 && charCode == 46) {
        return false;
    }
    //get the carat position
    var caratPos = getSelectionStart(el);
    var dotPos = el.value.indexOf(".");
    if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
        return false;
    }
    return true;
}

function getSelectionStart(o) {
    if (o.createTextRange) {
        var r = document.selection.createRange().duplicate()
        r.moveEnd('character', o.value.length)
        if (r.text == '') return o.value.length
        return o.value.lastIndexOf(r.text)
    } else return o.selectionStart
}

function validFloat(e, txtid) {
    var code;
    var tb = document.getElementById(txtid);
    var txt = tb.value;
    if (!e) var e = window.event;
    if (e.keyCode)
        code = e.keyCode;
    else if (e.which)
        code = e.which;
    else
        return true;
    if (code == 13 || code == 8 || code == 9)
        return true;
    if (code == 46)
        if (txt.indexOf('.') != -1)
            code = 0;
    if ((code < 46 || code > 57) || code == 47) {
        code = 0;
        return false;
    }
}

function validDigits(e, txtid) {
    var code;
    var tb = document.getElementById(txtid);
    var txt = tb.value;
    if (!e) var e = window.event;
    if (e.keyCode)
        code = e.keyCode;
    else if (e.which)
        code = e.which;
    else
        return true;
    if (code == 13 || code == 8 || code == 9)
        return true;
    if (code == 46)
        if (txt.indexOf('.') != -1)
            code = 0;
    if ((code < 46 || code > 57) || code == 47 || code == 46) {
        code = 0;
        return false;
    }
}

function ChangeInJQDate(dateObject) {
    var arrmonths = new Array("", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
    var DateArr = dateObject.split('/');
    var day = DateArr[0];
    var month = DateArr[1];
    var year = DateArr[2];
    var date = day + " " + arrmonths[parseInt(month)] + " " + year;
    return date;
};

function myDateFormatter(dateObject) {
    var arrmonths = new Array("", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
    var d = new Date(dateObject);
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    if (day < 10) {
        day = "0" + day;
    }
    var date = day + " " + arrmonths[month] + " " + year;
    return date;
};

function GetRadioButtonfromOthers(DDLName, StrURL, DllType, DefaultValue) {

    //alert(StrURL)

    $.get(StrURL, function (data) {
        //$("#" + DDLName).get(0).options.length = 0;
        //$("#" + DDLName).get(0).options[0] = new Option("Select " + DllType, "-1");


        for (i = 0; i < data.length; i++) {

            // alert(data[i].Text)

            $("." + DDLName).append('<label class="radio-inline"><input type="radio" name="' + DDLName.toUpperCase() + '" id="' + data[i].Value + '" value="' + data[i].Value + '" class="cls' + DDLName.toUpperCase() + '"> ' + data[i].Text + '</label>');

            //if (data[i].Value == DefaultValue) {
            //    $("#" + data[i].Value).attr("checked", true);
            //    $("#" + data[i].Value).addClass("checked");
            //}
        }

        //  alert( " - " + DefaultValue)

        $(".cls" + DDLName).each(function () {
            // alert($(this).val() + " - " + DefaultValue)
            if (DefaultValue == $(this).val()) {
                $(this).attr("checked", true);
                $(this).parents('span').addClass("checked");

            } else {
                $(this).attr("checked", false);
                $(this).parents('span').removeClass("checked");
            }
        });


        $("input:checkbox, input:radio").uniform();
    }, "json");


}

function GetCheckBoxButtonfromOthers(DDLName, StrURL, DllType, DefaultValue) {

    //alert(StrURL)

    $.get(StrURL, function (data) {
        //$("#" + DDLName).get(0).options.length = 0;
        //$("#" + DDLName).get(0).options[0] = new Option("Select " + DllType, "-1");


        for (i = 0; i < data.length; i++) {

            // alert(data[i].Text)

            $("." + DDLName).append('<label class="checkbox-inline"><input type="checkbox" name="' + DDLName.toUpperCase() + '" id="' + data[i].Value + '" value="' + data[i].Value + '" class="cls' + DDLName.toUpperCase() + '"> ' + data[i].Text + '</label>');

            //if (data[i].Value == DefaultValue) {
            //    $("#" + data[i].Value).attr("checked", true);
            //    $("#" + data[i].Value).addClass("checked");
            //}
        }

        $(".cls" + DDLName).each(function () {
            // alert($(this).val() + "  " + DefaultValue)
            if (DefaultValue == $(this).val()) {
                $(this).attr("checked", true);
                $(this).parents('span').addClass("checked");

            } else {
                $(this).attr("checked", false);
                $(this).parents('span').removeClass("checked");
            }
        });


        $("input:checkbox, input:radio").uniform();
    }, "json");


}

function FillDropDownfromOther(DDLName, StrURL, DllType) {
    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
        $("#" + DDLName).append('<option value="">Select ' + DllType + '</option>');
        for (i = 0; i < data.length; i++) {
            $("#" + DDLName).append('<option value="' + data[i].Value + '">' + data[i].Text + '</option>');
            $("#" + DDLName).trigger("liszt:updated");
        }
        App.unblockUI();
        if (data.length > 0) {
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    $("#" + DDLName).val($("#target option:first").val());
    $("#" + DDLName).addClass("required2");
}

function FillDropDownfromOtherWithoutSelect(DDLName, StrURL, DllType) {
    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
        for (i = 0; i < data.length; i++) {
            $("#" + DDLName).append('<option value="' + data[i].Value + '">' + data[i].Text + '</option>');
            $("#" + DDLName).trigger("liszt:updated");
        }
        App.unblockUI();
        if (data.length > 0) {
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    //$("#" + DDLName).val($("#target option:first").val());
    $("#" + DDLName).addClass("required2");
}

function FillDropDownfromOtherDisabled(DDLName, StrURL, DllType) {
    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
        $("#" + DDLName).append('<option value="">Select ' + DllType + '</option>');
        for (i = 0; i < data.length; i++) {
            var finalText = '<option value="' + data[i].id + '">' + data[i].text + '</option>';
            //alert(data[i].text)
            if (data[i].text.indexOf("In Transit") > 0) {
                finalText = '<option value="' + data[i].id + '" disabled>' + data[i].text + '</option>';;
            }
            $("#" + DDLName).append(finalText);
            $("#" + DDLName).trigger("liszt:updated");
        }
        App.unblockUI();
        if (data.length > 0) {
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    $("#" + DDLName).val($("#target option:first").val());
    $("#" + DDLName).addClass("required2");
}

function FillDropDownfromOther(DDLName, StrURL, DllType) {
    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
        $("#" + DDLName).append('<option value="">Select ' + DllType + '</option>');
        for (i = 0; i < data.length; i++) {
            $("#" + DDLName).append('<option value="' + data[i].Value + '">' + data[i].Text + '</option>');
            $("#" + DDLName).trigger("liszt:updated");
        }
        App.unblockUI();
        if (data.length > 0) {
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    $("#" + DDLName).val($("#target option:first").val());
    $("#" + DDLName).addClass("required2");
}

function EmptyDDL(DDLName) {
    $("#" + DDLName).empty();
}

function FillDropDownfromOtherSelectFirst(DDLName, StrURL, DllType, DefaultValue) {
    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
        for (i = 0; i < data.length; i++) {
            $("#" + DDLName).append('<option value="' + data[i].Value + '">' + data[i].Text + '</option>');
            $("#" + DDLName).trigger("liszt:updated");
            if (i == 0 && DefaultValue == null) {
                FirstText = data[i].Text;
                $("#" + DDLName).select2("data", {
                    id: data[i].Value,
                    text: data[i].Text
                });
            } else if (DefaultValue == data[i].Value) {
                $("#" + DDLName).select2("data", {
                    id: data[i].Value,
                    text: data[i].Text
                });
            }
        }
        App.unblockUI();
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    $("#" + DDLName).addClass("required2");
}

function FillDropDownfromOtherSelectFirstReport(DDLName, StrURL, DllType, DefaultValue) {
    if (DDLName == "ReportCategory1") {
        // alert("DefaultValue " + DefaultValue);
    }

    if (DefaultValue == null) {
        DefaultValue = "";
    }
    if (DefaultValue == "undefined") {
        DefaultValue = "";
    }    

    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
   
        for (i = 0; i < data.length; i++) {

            $("#" + DDLName).append('<option value="' + data[i].Value + '">' + data[i].Text + '</option>');
            $("#" + DDLName).trigger("liszt:updated");

            if (i == 0 && DefaultValue == "") {
                FirstText = data[i].Text;

                $("#" + DDLName).select2("data", { id: data[i].Value, text: data[i].Text });
            }
            else if (DefaultValue == data[i].Value) {
                $("#" + DDLName).select2("data", { id: data[i].Value, text: data[i].Text });
                $("#" + DDLName).val(DefaultValue).trigger('change');
            }
        }
        App.unblockUI();
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    // $("#" + DDLName).val($("#target option:first").val());

    $("#" + DDLName).addClass("required2");

    setTimeout(
        function () {
            $("#" + DDLName).change();
        }, 1500);
}

function FillDropDownfromOther1(DDLName, StrURL, DllType) {
    $("#" + DDLName).get(0).options.length = 0;
    $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
    $("#" + DDLName).empty();
    $("#" + DDLName).find("option").remove();
    var select = $("#" + DDLName);
    select.empty();
    $.get(StrURL, function (data) {
        $("#" + DDLName).append('<option value="">Select ' + DllType + '</option>');
        for (i = 0; i < data.length; i++) {
            $("#" + DDLName).append('<option value="' + data[i].id + '">' + data[i].text + '</option>');
            $("#" + DDLName).trigger("liszt:updated");
        }
        App.unblockUI();
        if (data.length > 0) {
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    $("#" + DDLName).val($("#target option:first").val());
}

function MultiSelectDDL(DDLName, strUrl, IsMultiple) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search for a Account Code",
        minimumInputLength: 1,
        allowClear: true,
        multiple: IsMultiple,
        tags: [],
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id + " - " + item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function MultiSelectDDLCON(DDLName, strUrl, IsMultiple) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search for a Account Code",
        minimumInputLength: 0,
        allowClear: true,
        multiple: IsMultiple,
        tags: [],
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function DLLTextSelected(DDLName, strUrl, IsMultiple, SerachLength, SerachCaption) {
    $("#" + DDLName + " ,." + DDLName).select2({
        minimumInputLength: SerachLength,
        placeholder: "Search " + SerachCaption,
        multiple: IsMultiple,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div> ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop"
    });
}

function GetMultipleDropdownWithSearch(DDLName, StrURL1) {
    $("#" + DDLName).select2({
        placeholder: "Search for a Location",
        multiple: true,
        tags: [],
        minimumInputLength: 1,
        allowClear: true,
        ajax: {
            url: StrURL1,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = { id: id, text: id };
            callback(data);
        },
        formatResult: function (item) { return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>'); },
        formatSelection: function (item) { return (item.id + ':' + item.text); },
        escapeMarkup: function (m) { return m; },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller


    });
    App.unblockUI();
}

function JsonDDL(DDLName, strUrl) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        minimumInputLength: 1,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text,               
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text  + '</div>');
        },
        formatSelection: function (item) {
            return (item.id + " - " + item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function JsonDDLItem(DDLName, strUrl) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        minimumInputLength: 1,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text,               
            };
            callback(data);
        },
        formatResult: function (item) {
            if(item.type == 1)
            {
             return ('<div><b>' + item.id + ' </b>: ' + item.text + ' </b>- ' + item.itemVariantDesc + '</div>');
            }
            else
            {
                return ('<div><b>' + item.id + ' </b>: ' + item.text + ' </b>- ' + item.vehicleName + '</div>');
            }
           
        },
        formatSelection: function (item) {
            if(item.type == 1)
            {
                return (item.id + " : " + item.text + " - " + item.itemVariantDesc);
            }
            else
            {
                return (item.id + " : " + item.text + " - " + item.vehicleName);
            }
           
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function JsonDDL_Disable(DDLName, strUrl) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        minimumInputLength: 1,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.text + ' </b></div>');
        },
        formatSelection: function (item) {
            return (item.id);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function GetPartyNameCode(DDLName, Location, Paybas) {
    var StrURL = DomainName + "/Operation/GetBillingParty?Location=" + Location + "&Paybas=" + Paybas;
    JsonDDL(DDLName, StrURL);
}

function GetPartyNameCode_Octroi(DDLName, Location, Paybas) {
    var StrURL = DomainName + "/Operation/GetBillingParty_OctroiBill?Location=" + Location + "&Paybas=" + Paybas;
    JsonDDL(DDLName, StrURL);
}

function GetPartyCode(DDLName, Location, Paybas) {
    var StrURL = DomainName + "/Operation/GetBillingParty?Location=" + Location + "&Paybas=" + Paybas;
    JsonDDLSelectCode(DDLName, StrURL);
}

function GetEmployeeCode(DDLName, Location) {
    var StrURL = DomainName + "/Master/GetEmployeeCodeList?Location=" + Location;
    JsonDDL(DDLName, StrURL);
}

function JsonDDLSelectCode(DDLName, strUrl) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function JsonDDLSelectCodeWithName(DDLName, strUrl) {
    //console.log(strUrl);
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return ('<b>' + item.id + ' </b>- ' + item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
    });
}

function initTableById(tblId) {
    $('#' + tblId).dataTable({
        "aLengthMenu": [
            [5, 10, 15, 20, -1],
            [5, 10, 15, 20, "All"]
        ],
        "iDisplayLength": 10,
        "sPaginationType": "bootstrap",
        "bProcessing": true,
        "oLanguage": {
            "sLengthMenu": "_MENU_ records",
            "oPaginate": {
                "sPrevious": "Prev",
                "sNext": "Next"
            }
        },
        "bDestroy": true,
    });
    jQuery('#' + tblId + '_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline");
    jQuery('#' + tblId + '_wrapper .dataTables_filter').addClass("pull-right");
    jQuery('#' + tblId + '_wrapper .dataTables_length select').addClass("form-control input-xsmall");
    jQuery('#' + tblId + '_wrapper .dataTables_length select').select2();
}

function formateDataTable(tblId) {
    jQuery('#' + tblId + '_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline");
    jQuery('#' + tblId + '_wrapper .dataTables_filter').addClass("pull-right");
    jQuery('#' + tblId + '_wrapper .dataTables_length select').addClass("form-control input-xsmall");
    jQuery('#' + tblId + '_wrapper .dataTables_length select').select2();
}

function ValidateAlpha(evt) {
    var keyCode = (evt.which) ? evt.which : evt.keyCode
    if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
        return false;
    return true;
}

function validInt(event) {
    if (event.keyCode == 13) {
        return true;
    }
    if (event.keyCode < 48 || event.keyCode > 57) {
        event.keyCode = 0;
        return false;
    }
}

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var monthsShort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

function FillDropDownfromOtherWithJson(Method, Parameters, DDLName) {
    var strUrl = DomainName + "/Home/GetData";
    $.ajax({
        url: strUrl,
        async: false,
        type: 'POST',
        dataType: "json",
        data: {
            Method: Method,
            parameters: Parameters
        },
        success: function (data) {
            var Headers = GetHeaders(data[0]);
            $("#" + DDLName).get(0).options.length = 0;
            $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
            $("#" + DDLName).empty();
            $("#" + DDLName).find("option").remove();
            $("#" + DDLName).select2("data", null);
            var select = $("#" + DDLName);
            select.empty();
            $("#" + DDLName).append('<option value="">Select ' + DDLName + '</option>');
            for (i = 0; i < data.length; i++) {
                $("#" + DDLName).append('<option value="' + data[i][Headers[0].data] + '" > ' + data[i][Headers[1].data] + '</option > ');
                $("#" + DDLName).trigger("liszt:updated");
            }
            App.unblockUI();
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
            $("#" + DDLName).trigger("liszt:updated");
            $("#" + DDLName).val($("#target option:first").val());
            $("#" + DDLName).addClass("required2");
        },
        error: function (jqXHR, exception) {
            App.unblockUI();
            TosterNotification("error", errorResult(jqXHR, exception), "Error");
        }
    });
}

function GetHeaders(obj) {
    var cols = new Array();
    var count = false;
    for (var key in obj) {
        cols.push({
            data: key,
            title: key
        });
    }
    return cols;
}

function roundNumber(num, dec) {
    if (num == "." || num == ".0" || num == "0" || num == "0." || num == "" || !num) {
        if (dec == "0")
            return "0";
        else if (dec == "1")
            return "0.0"
        else if (dec == "2")
            return "0.00"
    }
    var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
    if (isNaN(result))
        result = "0";
    var len = 0;
    var number = result.toString();
    len = number.length;
    if (number == "." || number == ".0" || number == "0" || number == "0." || num == "" || !num) {
        if (dec == "0")
            return "0";
        else if (dec == "1")
            return "0.0"
        else if (dec == "2")
            return "0.00"
    }
    switch (dec) {
        case 2:
            if (number.indexOf('.') == parseInt(len - 2) && len >= 2) {
                number = number + "0";
            } else if (number.indexOf('.') == parseInt(len - 1)) {
                number = number + "00";
            } else if (number.indexOf('.') == -1) {
                number = number + ".00";
            }
            break;
        case 1:
            if (number.indexOf('.') == parseInt(len)) {
                number = number + "0";
            } else if (number.indexOf('.') == -1) {
                number = number + ".0";
            }
            break;
    }
    return number;
}

function GetType(DDLName, str, url) {
    var tag_list = $.ajax({
        url: url,
        dataType: 'json',
        data: {
            str: str
        },
        success: function (response) {
            $("#" + DDLName).select2({
                tags: true,
                data: response,
                placeholder: "Search for a Type",
                multiple: true,
                allowClear: true
            });
        }
    });
}

function GetVendorCode(DDLName) {
    $("#" + DDLName).select2({
        placeholder: "Search for a Vendor",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Operation/GetVenderCode',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop"
    });
}

function GetVendorName(DDLName) {
    $("#" + DDLName).select2({
        placeholder: "Search for a Vendor",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Operation/GetVenderCode',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop"
    });
}

function GetPartyName(DDLName) {
    $("#" + DDLName).select2({
        placeholder: "Search for a customer",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Finance/GetCustomer',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop"
    });
}

function FillDropDownfromOtherWithJson(Method, Parameters, DDLName) {
    var strUrl = DomainName + "/Home/GetData";
    $.ajax({
        url: strUrl,
        async: false,
        type: 'POST',
        dataType: "json",
        data: {
            Method: Method,
            parameters: Parameters
        },
        success: function (data) {
            var Headers = GetHeaders(data[0]);
            $("#" + DDLName).get(0).options.length = 0;
            $("#" + DDLName).get(0).options[0] = new Option("Loading names", "-1");
            $("#" + DDLName).empty();
            $("#" + DDLName).find("option").remove();
            $("#" + DDLName).select2("data", null);
            var select = $("#" + DDLName);
            select.empty();
            $("#" + DDLName).append('<option value="">Select ' + DDLName + '</option>');
            for (i = 0; i < data.length; i++) {
                $("#" + DDLName).append('<option value="' + data[i][Headers[0].data] + '" > ' + data[i][Headers[1].data] + '</option > ');
                $("#" + DDLName).trigger("liszt:updated");
            }
            App.unblockUI();
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
            $("#" + DDLName).trigger("liszt:updated");
            $("#" + DDLName).val($("#target option:first").val());
            $("#" + DDLName).addClass("required2");
        },
        error: function (jqXHR, exception) {
            App.unblockUI();
            TosterNotification("error", errorResult(jqXHR, exception), "Error");
        }
    });
}

function GetHeaders(obj) {
    var cols = new Array();
    var count = false;
    for (var key in obj) {
        cols.push({
            data: key,
            title: key
        });
    }
    return cols;
}

function GetVehicleEmployeeUserName(DDLName, Type) {
    $("#" + DDLName).select2({
        placeholder: "Search for a customer",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Voucher/GetCustUserEmployeeVehicle',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term,
                    Type: Type
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop"
    });
}

function GetAccountCode(DDLName) {
    $("#" + DDLName).select2({
        placeholder: "Search for account code",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Voucher/GetAccountCode',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) {
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop"
    });
}

function GetLocationNameCode(DomainName, DDLName) {
    var StrURL = DomainName + "/Operation/GetLocationSeachList";
    JsonDDL(DDLName, StrURL);
}

function rounditn(Num, decplaces) {
    Places = decplaces
    if (Places > 0) {
        if ((Num.toString().length - Num.toString().lastIndexOf('.')) > (Places + 1)) {
            if (Num.toString().lastIndexOf('.') < 0) {
                return Num.toString() + '.00';
            }
            var Rounder = Math.pow(10, Places);
            return Math.round(Num * Rounder) / Rounder;
        } else {
            if (Num.toString().lastIndexOf('.') < 0) {
                return Num.toString() + '.00';
            } else {
                if (Num.toString().lastIndexOf('.') + 1 == Num.toString().length - 1)
                    return Num.toString() + '0';
                else
                    return Num.toString();
            }
        }
    } else return Math.round(Num);
}

function GCView(GCNo) {
    var ReportURL = '@ViewBag.ReportURL';
    var strWinFeature = "menubar=no,toolbar=no,location=no,resizable=yes,scrollbars=yes,width=800 ,height=600,status=no,left=60,top=50"
    var strPopupURL = ReportURL + DomainName + "/ViewPrint/DocketViewPrint?Type=1&DocketNo=" + GCNo;
    winNew = window.open(strPopupURL, "_blank", strWinFeature)
    return false;
}

function JsonDDLWithoutInput(DDLName, strUrl) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        allowClear: true,
        //multiple: IsMultiple,
        //tags: [],
        ajax: {
            url: strUrl,
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.id + " - " + item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        //dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
}

function GetPartyName_BranchWise(DDLName) {

    $("#" + DDLName).select2({
        placeholder: "Search for a customer",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Voucher/GetCustomer_BranchWise',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
}

function GetVehicleEmployeeUserName_BranchWise(DDLName, Type) {

    $("#" + DDLName).select2({
        placeholder: "Search for a customer",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Voucher/GetCustUserEmployeeVehicle_BranchWise',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term,
                    Type: Type
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
}

function BackDateControl(StartDate, EndDate) {

    $(".clsBackDateControl").datepicker({
        rtl: App.isRTL(),
        format: "dd MM yyyy",
        showMeridian: true,
        autoclose: true,
        pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
        startDate: new Date(StartDate),
        endDate: new Date(EndDate),
        todayBtn: true
    });
}

function GetVehicleEmployeeUserName_Type_Wise(DDLName, Type, SubType) {

    $("#" + DDLName).select2({
        placeholder: "Search for a customer",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/BranchAccounting/GetVehicleEmployeeUserName_Type_Wise',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term,
                    Type: Type,
                    SubType: SubType
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
}

function GetDistace(source, destination, IsCity, LocationName, LocationCode, TotalKMID, GoogleHoursID) {

    App.blockUI({ boxed: true });

    var strurl = DomainName + "/BranchAccounting/GetDistanceFromTable?FromCity=" + source + "&ToCity=" + destination + "&IsCity=" + IsCity + "&LocationName=" + LocationName + "&LocationCode=" + LocationCode;

    if (source != destination) {
        $.ajax({
            url: strurl,
            cache: false,
            data: {},
            type: 'POST',
            success: function (data) {

                if (data.TotalKm == 0) {

                    var directionsDisplay;
                    var directionsService = new google.maps.DirectionsService();

                    google.maps.event.addDomListener(window, 'load', function () {

                        new google.maps.places.SearchBox(source);

                        new google.maps.places.SearchBox(destination);
                        directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
                    });

                    var mumbai = new google.maps.LatLng(18.9750, 72.8258);
                    var mapOptions = {
                        zoom: 7,
                        center: mumbai
                    };

                    //*********DIRECTIONS AND ROUTE**********************//

                    //source = document.getElementById("CWE_FromCity").value;

                    //destination = document.getElementById("CWE_ToCity").value;

                    //destination = document.getElementById("CWE_ToCity").value;
                    if (source == "korba" || source == "KORBA") {
                        source = "korba(India)";
                    }
                    else {
                        source = source;
                    }

                    if (destination == "korba" || destination == "KORBA") {
                        destination = "korba(India)";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "SALTLAKE" || source == "saltlake") {
                        source = "SALTLAKE(India)";
                    }
                    else {
                        source = source;
                    }

                    if (destination == "SALTLAKE" || destination == "saltlake") {
                        destination = "SALTLAKE(India)";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "PATAN" || source == "patan") {
                        source = "PATAN(Gujarat)";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "PATAN" || destination == "patan") {
                        destination = "PATAN(Gujarat)";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "DIU" || source == "diu") {
                        source = "DIU(Gujarat)";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "DIU" || destination == "diu") {
                        destination = "DIU(Gujarat)";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "WELLINGTON" || source == "WELLINGTON") {
                        source = "WELLINGTON(tamilnadu)";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "WELLINGTON" || destination == "WELLINGTON") {
                        destination = "WELLINGTON(tamilnadu)";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "REWA" || source == "REWA") {
                        source = "REWA(madhyapradesh)";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "REWA" || destination == "REWA") {
                        destination = "REWA(madhyapradesh)";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "KASHMIR" || source == "KASHMIR") {
                        source = "KASHMIR(Himachal Pradesh)";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "KASHMIR" || destination == "KASHMIR") {
                        destination = "KASHMIR(Himachal Pradesh)";
                    }
                    else {
                        destination = destination;
                    }
                    if (source == "MOHANA" || source == "MOHANA") {
                        source = "Mohana, Madhya Pradesh";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "MOHANA" || destination == "MOHANA") {
                        destination = "Mohana, Madhya Pradesh";
                    }
                    else {
                        destination = destination;
                    }

                    if (source == "JAGRAWAN" || source == "JAGRAWAN") {
                        source = "Jagrawan, Punjab";
                    }
                    else {
                        source = source;
                    }
                    if (destination == "JAGRAWAN" || destination == "JAGRAWAN") {
                        destination = "Jagrawan, Punjab";
                    }
                    else {
                        destination = destination;
                    }
                    var request = {
                        origin: source,
                        destination: destination,
                        travelMode: google.maps.TravelMode.DRIVING
                    };

                    source = source + ',India';
                    destination = destination + ',India';

                    //*********DISTANCE AND DURATION**********************//
                    //if (source == destination) {
                    //    document.getElementById(""+TotalKMID).value = "30";
                    //}
                    //else {
                    var service = new google.maps.DistanceMatrixService();
                    service.getDistanceMatrix({
                        origins: [source],
                        destinations: [destination],
                        travelMode: google.maps.TravelMode.DRIVING,
                        unitSystem: google.maps.UnitSystem.METRIC,
                        avoidHighways: false,
                        avoidTolls: false
                    }, function (response, status) {
                        if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                            var distance = response.rows[0].elements[0].distance.text;
                            var duration = response.rows[0].elements[0].duration.text;

                            var TotalKM = distance.replace("km", "").replace(" ", "").replace(",", "").replace("m", "");
                            duration = duration.toUpperCase();
                            var TotalTime = duration.replace("DAY", "DAY ");

                            document.getElementById("" + TotalKMID).value = parseInt(TotalKM);
                            document.getElementById("" + GoogleHoursID).value = (TotalTime);

                            var strurl12 = DomainName + "/BranchAccounting/InsertDistanceFromTable?FromCity=" + source + "&ToCity=" + destination + "&TotalKM=" + TotalKM + "&Duration=" + TotalTime + "&IsCity=" + IsCity + "&LocationName=" + LocationName + "&LocationCode=" + LocationCode;

                            $.ajax({
                                url: strurl12,
                                cache: false,
                                data: {},
                                type: 'POST',
                                success: function (data) {
                                }
                            });


                            //if (parseInt(TotalKM) < 2500) {
                            $("#" + TotalKMID).prop("readonly", true)
                            App.unblockUI();
                            //}
                            //else {
                            //    $("#" + TotalKMID).prop("readonly", false)
                            //    App.unblockUI();
                            //}

                            if (parseInt(TotalKM) < 31) {
                                $("#" + TotalKMID).val("30");
                                $("#" + GoogleHoursID).val("1");
                                App.unblockUI();
                            }
                        }

                        else if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status == "ZERO_RESULTS") {

                            // if ($("#CWE_FromCity").val() != "" && $("#CWE_ToCity").val() != "") {
                            if (source != "" && destination != "") {
                                $("#" + TotalKMID).prop("readonly", false)
                                App.unblockUI();
                            }
                        }
                        else {
                            alert("Unable to find the distance via road.");
                            App.unblockUI();
                        }
                    });
                    //  }
                }
                else {
                    document.getElementById("" + TotalKMID).value = data.TotalKm;
                    document.getElementById("" + GoogleHoursID).value = data.TotalTime;

                    //if (parseInt(data.TotalKm) < 2500) {
                    $("#" + TotalKMID).prop("readonly", true)
                    App.unblockUI();
                    //}
                    //else {
                    //    $("#" + TotalKMID).prop("readonly", false)
                    //    App.unblockUI();
                    //}
                    if (parseInt(data.TotalKm) < 31) {
                        $("#" + TotalKMID).val("30");
                        $("#" + GoogleHoursID).val("1");
                        App.unblockUI();
                    }
                }
            },
            error: function (req, status, error) {
                alert("error--" + req + "---" + status + "---" + error);
                App.unblockUI();
            }
        });
    }
    else {
        document.getElementById("" + TotalKMID).value = "30";
        document.getElementById("" + GoogleHoursID).value = "1";
        App.unblockUI();
    }
}

function GetVendor_Wise(DDLName, Type) {

    $("#" + DDLName).select2({
        placeholder: "Search for a Driver",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/BranchAccounting/GetVendor_Wise',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term,
                    Type: Type
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
}

function Get_Driver_BranchWise(DDLName, Type) {

    $("#" + DDLName).select2({
        placeholder: "Search for a Driver",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/BranchAccounting/Get_Driver_BranchWise',
            dataType: 'json',
            data: function (term) {
                return {
                    searchTerm: term,
                    Type: Type
                };
            },
            results: function (data) { // parse the results into the format expected by Select2.
                // since we are using custom formatting functions we do not need to alter remote JSON data
                //  alert("Hello");
                // alert(data);
                //    alert(data.CMP);
                return {
                    results: data
                };
            }
        },
        initSelection: function (item, callback) {
            var id = item.val();
            var text = item.data('option');
            var data = {
                id: id,
                text: text
            };
            callback(data);
        },
        formatResult: function (item) {
            return ('<div><b>' + item.id + ' </b>- ' + item.text + '</div>');
        },
        formatSelection: function (item) {
            return (item.text);
        },
        escapeMarkup: function (m) {
            return m;
        },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
}

//----------------------------Location Control
var LocationContraol = function () {
    // alert("Hello");
    $(".clsLocation").live("change", function () {

        $("#Location").val($(this).val());

        //alert("Hello");
        App.blockUI({ boxed: true });
        var StrURL1 = DomainName + "/Reporting/GetLocationLevel/" + $(this).val();
        // alert("Hello " + StrURL1);
        $.ajax({
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            url: StrURL1,
            dataType: 'json',
            data: {},
            success: function (data1) {


                $("#LocationLevel").val(data1.LocationLevel);
                App.unblockUI();
                //  alert("error");
            },
            error: function () {
                alert("error");
            }
        });

        var ContId = parseInt($(this).attr("id").replace("LOC", "")) + 1;

        //alert(ContId + "  " + $("#MaxId").val())

        if (ContId == $("#MaxId").val()) {

            var StrURL = DomainName + "/Reporting/GetLocationFromRegion/" + $(this).val();
            //alert(StrURL)
            FillDropDownfromOtherSelectFirst("LOC" + ContId, StrURL, "Location");
        }
    });

    $(".clsLocationZone").live("change", function () {

        $("#Location").val($(this).val());

        //alert("Hello");
        App.blockUI({ boxed: true });
        var StrURL1 = DomainName + "/Master/GetLocationZoneLevel/" + $(this).val();
        // alert("Hello " + StrURL1);
        $.ajax({
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            url: StrURL1,
            dataType: 'json',
            data: {},
            success: function (data1) {


                $("#LocationLevel").val(data1.LocationLevel);
                App.unblockUI();
                //  alert("error");
            },
            error: function () {
                alert("error");
            }
        });

        var ContId = parseInt($(this).attr("id").replace("LOC", "")) + 1;

        //  alert(ContId + "  " + $("#MaxId").val())

        //if (ContId == $("#MaxId").val()) {

        var StrURL = DomainName + "/Master/GetLocationZoneFromRegion/" + $(this).val();
        //alert(StrURL)
        FillDropDownfromOtherSelectFirst("LOC" + ContId, StrURL, "Location");
        //}
    });
}

var Set_Remove_Default_Zero_Values = function (DomainName) {

    $(".cls_Remove_Zero").live("focus", function () {
        var Total_Weight = parseInt($(this).val())
        if (Total_Weight == 0) {
            $(this).val("");
        }
    });

    $(".cls_Set_Zero").live("focusout", function () {
        var Total_Weight = $(this).val()
        if (Total_Weight == "" || Total_Weight == null) {
            $(this).val("0.00");
        }
    });

    $(".cls_Set_Remove_Zero").live("focus", function () {
        var Total_Weight = parseInt($(this).val())
        if (Total_Weight == 0) {
            $(this).val("");
        }
    });

    $(".cls_Set_Remove_Zero").live("focusout", function () {
        var Total_Weight = $(this).val()
        if (Total_Weight == "" || Total_Weight == null) {
            $(this).val("0.00");
        }
    });
}

function generateRandomString(lenth) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < lenth; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

var MONTH_NAMES = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
var DAY_NAMES = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
function LZ(x) { return (x < 0 || x > 9 ? "" : "0") + x }

function formatDate(date, format) {
    format = format + "";
    var result = "";
    var i_format = 0;
    var c = "";
    var token = "";
    var y = date.getYear() + "";
    var M = date.getMonth() + 1;
    var d = date.getDate();
    var E = date.getDay();
    var H = date.getHours();
    var m = date.getMinutes();
    var s = date.getSeconds();
    var yyyy, yy, MMM, MM, dd, hh, h, mm, ss, ampm, HH, H, KK, K, kk, k;
    // Convert real date parts into formatted versions
    var value = new Object();
    if (y.length < 4) { y = "" + (y - 0 + 1900); }
    value["y"] = "" + y;
    value["yyyy"] = y;
    value["yy"] = y.substring(2, 4);
    value["M"] = M;
    value["MM"] = LZ(M);
    value["MMM"] = MONTH_NAMES[M - 1];
    value["NNN"] = MONTH_NAMES[M + 11];
    value["d"] = d;
    value["dd"] = LZ(d);
    value["E"] = DAY_NAMES[E + 7];
    value["EE"] = DAY_NAMES[E];
    value["H"] = H;
    value["HH"] = LZ(H);
    if (H == 0) { value["h"] = 12; }
    else if (H > 12) { value["h"] = H - 12; }
    else { value["h"] = H; }
    value["hh"] = LZ(value["h"]);
    if (H > 11) { value["K"] = H - 12; } else { value["K"] = H; }
    value["k"] = H + 1;
    value["KK"] = LZ(value["K"]);
    value["kk"] = LZ(value["k"]);
    if (H > 11) { value["a"] = "PM"; }
    else { value["a"] = "AM"; }
    value["m"] = m;
    value["mm"] = LZ(m);
    value["s"] = s;
    value["ss"] = LZ(s);
    while (i_format < format.length) {
        c = format.charAt(i_format);
        token = "";
        while ((format.charAt(i_format) == c) && (i_format < format.length)) {
            token += format.charAt(i_format++);
        }
        if (value[token] != null) { result = result + value[token]; }
        else { result = result + token; }
    }
    return result;
}