function select2formatSelection(val) {
    return val.text;
}

var TosterNotification = function (Type, Message, Title) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "1000",
        "hideDuration": "1000",
        "timeOut": "4000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "show",
        "hideMethod": "hide",
        "progressBar": true
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
    if (Type == "warning") {
        toastr.warning(Message, Title);
    }
    if (Type == "errorReload") {
        toastr.error(Message, Title);
        setTimeout(function () {
            window.location.reload(true);
        }, 3000);
    }
}

var DatePicker = function () {
    $('.datepicker').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        autoclose: true,
        todayBtn: true,
        startDate: new Date(),
        endDate: new Date(),
        format: "dd M yyyy",
    });

    $('.alldatepicker').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        autoclose: true,
        todayBtn: true,
        //startDate: new Date(),
        //endDate: new Date(),
        format: "dd M yyyy",
    });

    $('.PastDatepicker').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        autoclose: true,
        todayBtn: true,
        //startDate: new Date(),
        endDate: new Date(),
        format: "dd M yyyy",
    });

    $('.StudentDatePick').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        autoclose: true,
        todayBtn: true,
        endDate: new Date(),
        format: "dd M yyyy",
    });


    $('.PastDatepickerManual').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        autoclose: true,
        todayBtn: true,
        //startDate: new Date(),
        endDate: new Date(),
        format: "dd/mm/yyyy",
    });
}


function MaskDatePicker(value) {
    var date = value;
    if (date != null || date != '') {
        var tmp = date.split('/');
        var day = tmp[0];
        var month = tmp[1];
        var year = tmp[2];
        if (day >= 1 && day <= 31) {
            if (month >= 1 && month <= 12) {
                if (year >= 1900 && year <= 2099) {
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            return false;
        }
        return true;
    }
    return false;
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

function validInt(event) {
    if (event.keyCode == 13) {
        return true;
    }
    if (event.keyCode < 48 || event.keyCode > 57) {
        event.keyCode = 0;
        return false;
    }
}

function ValidateAlpha(event) {
    var keyCode = (event.which) ? event.which : event.keyCode
    if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
        return false;
    return true;
}

function generateRandomString(lenth) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (var i = 0; i < lenth; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
    //generateRandomString(6)
}

function FillDropDownfromOtherWithJson(Method, Parameters, DDLName) {
    var strUrl = DomainName + "/Home/GetData";
    $.ajax({
        url: strUrl,
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
            //App.unblockUI();
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
            $("#" + DDLName).trigger("liszt:updated");
            $("#" + DDLName).val($("#target option:first").val());
            $("#" + DDLName).addClass("required required2");
        },
        error: function (req, status, error) {
            TosterNotification("error", 'Operation fail..!! There is some issue while loading data. Please try again later..', "Oppps..!!");
            //App.unblockUI();
        }
    });
}

function JsonDDLSelectCode(DDLName, strUrl) {
    $("#" + DDLName + " ,." + DDLName).select2({
        placeholder: "Search Here",
        minimumInputLength: 3,
        allowClear: true,
        formatSelection: select2formatSelection,
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
        escapeMarkup: function (m) {
            return m;
        },
    });
}

$("#page-breadcrumb").click(function () {
    //App.blockUI({
    //    target: '.scroller',
    //    cenrerY: true,
    //    boxed: true
    //});
    console.log("test");
    var StrURL1 = DomainName + "/ChangeSetting/popUpIndex";
    $.ajax({
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        url: StrURL1,
        data: {},
        success: function (data1) {
            $(".scroller").html(data1);
            $('#changeSetting_CompanyCode').select2();
            $('#changeSetting_School').select2();
            $('#changeSetting_FinYear').select2();
            $("#ChangeSetting").keydown(function (e) {
                if (e.keyCode == 13) { //Enter
                    $("#ChangeSetting #btnSubmit").click();
                }
            });
            $("#ChangeSetting").on("click", "#btnSubmit", function (event) {
                //App.blockUI({
                //    target: '.scroller',
                //    cenrerY: true,
                //    boxed: true
                //});
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
            //App.unblockUI();
        }
    });
    $("#changeSettingPopUp").click();
});

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

    $("#" + DDLName).addClass("required required2");

    setTimeout(
        function () {
            $("#" + DDLName).change();
        }, 1500);
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
        /*App.unblockUI();*/
        if (data.length > 0) {
            $("#" + DDLName).select2({
                placeholderOption: 'first'
            });
        }
    }, "json");
    $("#" + DDLName).trigger("liszt:updated");
    $("#" + DDLName).val($("#target option:first").val());
    $("#" + DDLName).addClass("required required2");
}

function GetCustEmpVendByType(DDLName, Type) {
    $("#" + DDLName).select2({
        placeholder: "Search for a customer",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Voucher/GetCustEmpVendByType',
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

function GetAllAccounts(DDLName, Type) {
    $("#" + DDLName).select2({
        placeholder: "Search for a Account",
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            url: DomainName + '/Voucher/GetAllAccounts',
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

function GetMultipleDropdownWithSearch(DDLName, StrURL1) {
    console.log("GetMultipleDropdownWithSearch");
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
        formatSelection: function (item) { return (item.id); },
        escapeMarkup: function (m) { return m; },
        dropdownCssClass: "bigdrop" // apply css that makes the dropdown taller
    });
    App.unblockUI();
}
var dataTableById = function (tableId, sortingColumn, sortingType, IsScrollX) {
    var responsiveHelper_dt_basic = undefined;
    var responsiveHelper_datatable_fixed_column = undefined;
    var responsiveHelper_datatable_col_reorder = undefined;
    var responsiveHelper_datatable_tabletools = undefined;
    sortingColumn = (sortingColumn == "undefine" || sortingColumn == null || sortingColumn == "") ? 0 : sortingColumn;
    sortingType = (sortingType == "undefine" || sortingType == null || sortingType == "") ? "asc" : sortingType;
    IsScrollX = (IsScrollX == "undefine" || IsScrollX == null || IsScrollX == "") ? false : IsScrollX;

    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    $('#' + tableId).DataTable({
        "destroy": true,
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
            "t" +
            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_dt_basic) {
                responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#' + tableId), breakpointDefinition);
            }
        },
        "rowCallback": function (nRow) {
            responsiveHelper_dt_basic.createExpandIcon(nRow);
        },
        "drawCallback": function (oSettings) {
            responsiveHelper_dt_basic.respond();            
        },
        "aLengthMenu": [
            [5, 10, 15, 20, -1],
            [5, 10, 15, 20, "All"]
        ],
        "iDisplayLength": 10,
        "scrollX": IsScrollX,
        /*"order": [orderBy],*/
        "order": [[sortingColumn, sortingType]],
        "bSort": true,
        "columnDefs": [
            {
                //"targets": [0], //first column / numbering column
                "targets": 'no-sort',
                "orderable": false, //set not orderable
                "order": []
            },
        ],
    });
    $(".dataTables_filter input").attr("placeholder", "Search here...");
    //$(".dataTables_empty").html('<i class="fa fa-rotate-right fa-spin" style="font-size:20px;"></i> Fetching data.. Please wait..!!');//No data available in table
    $(".dataTables_empty").html('<i class="fa fa-exclamation-triangle" style="font-size:20px;"></i> No data available in table..!!');//No data available in table

    //if ($('#' + tableId).DataTable().rows().data().length == 0) {
    //    $(".dataTables_empty").html("");
    //    $(".dataTables_empty").html('<i class="fa fa-exclamation-triangle" style="font-size:20px;"></i> No data available in table..!!');//No data available in table
    //}
    //else {
    //    $(".dataTables_empty").html("");
    //    $(".dataTables_empty").html('<i class="fa fa-rotate-right fa-spin" style="font-size:20px;"></i> Fetching data.. Please wait..!!');//No data available in table
    //}

    $('#' + tableId).attr("style", "max-width:100%;");
    console.log("Data Count : " + $('#' + tableId).DataTable().rows().data().length);
}
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
function removeTags(str) {
    if ((str === null) || (str === ''))
        return false;
    else
        str = str.toString();

    // Regular expression to identify HTML tags in
    // the input string. Replacing the identified
    // HTML tag with a null string.
    return str.replace(/(<([^>]+)>)/ig, '');
}


var pagedDataTableById = function (tableId, sortingColumn, sortingType, IsScrollX, pagingConfig, colLength) {
    var responsiveHelper_dt_basic = undefined;
    var responsiveHelper_datatable_fixed_column = undefined;
    var responsiveHelper_datatable_col_reorder = undefined;
    var responsiveHelper_datatable_tabletools = undefined;
    sortingColumn = (sortingColumn == "undefine" || sortingColumn == null || sortingColumn == "") ? 0 : sortingColumn;
    sortingType = (sortingType == "undefine" || sortingType == null || sortingType == "") ? "asc" : sortingType;
    IsScrollX = (IsScrollX == "undefine" || IsScrollX == null || IsScrollX == "") ? false : IsScrollX;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };

    var dynamicColumns = [];
    for (var i = 0; i < colLength; i++) {
        dynamicColumns.push({ data: null }); // Push empty mapping
    }

    $('#' + tableId).DataTable({
        responsive: true,
        processing: false,
        // Updated dom structure
        dom: "<'dt-toolbar'<'col-6 col-sm-6'f><'col-6 col-sm-6 text-end'l>>" +
            "<'row'<'col-12'tr>>" +
            "<'row mt-2'<'col-6 col-sm-6'i><'col-6 col-sm-6 text-end'p>>",
        autoWidth: true,
        preDrawCallback: function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_dt_basic) {
                responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#' + tableId), breakpointDefinition);
            }
        },
        rowCallback: function (nRow) {
            responsiveHelper_dt_basic.createExpandIcon(nRow);
        },
        drawCallback: function (oSettings) {
            responsiveHelper_dt_basic.respond();
            $("[rel='tooltip']").tooltip();

        },
        destroy: true,
        serverSide: true,
        paging: true,
        search: {
            return: true
        },
        ordering: false,
        scrollX: IsScrollX,
        pageLength: 10,
        "aLengthMenu": [
            [10, 25, 50, 100, 200],
            [10, 25, 50, 100, 200]
        ],
        "iDisplayLength": 10,
        "bSort": true,
        ajax: pagingConfig, // ✅ Inject full AJAX config here
        columns: dynamicColumns,
      
    
        initComplete: function () {
            var input = $('.dataTables_filter input').unbind(); // remove default
            var self = this.api();

            // Bind custom event on Enter key
            input.bind('keyup', function (e) {
                if (e.keyCode === 13) { // Enter key
                    self.search(this.value).draw();
                }
            });

        }
    });
    $(".dataTables_filter input").attr("placeholder", "Search here...");
    //$(".dataTables_empty").html('<i class="fa fa-rotate-right fa-spin" style="font-size:20px;"></i> Fetching data.. Please wait..!!');//No data available in table
    $(".dataTables_empty").html('<i class="fa fa-exclamation-triangle" style="font-size:20px;"></i> No data available in table..!!');//No data available in table

    //if ($('#' + tableId).DataTable().rows().data().length == 0) {
    //    $(".dataTables_empty").html("");
    //    $(".dataTables_empty").html('<i class="fa fa-exclamation-triangle" style="font-size:20px;"></i> No data available in table..!!');//No data available in table
    //}
    //else {
    //    $(".dataTables_empty").html("");
    //    $(".dataTables_empty").html('<i class="fa fa-rotate-right fa-spin" style="font-size:20px;"></i> Fetching data.. Please wait..!!');//No data available in table
    //}


    console.log("Data Count : " + $('#' + tableId).DataTable().rows().data().length);
}