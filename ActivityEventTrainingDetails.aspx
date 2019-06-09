<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityEventTrainingDetails.aspx.cs" Inherits="ActivityEventTrainingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ની વિગત </li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1" class="active"><a href="#first1" onclick="ViewDiv1();">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમની વિગત ઉમેરો/સુધારો </a></li>                           
                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <div class="row" padding-top:"20px"; border-radius:"8px";>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlAET" CssClass="form-control" runat="server" onChange="BindType()">     
                                                        <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="પ્રવૃત્તિ" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="ઇવેન્ટ" Value="2"></asp:ListItem> 
                                                        <asp:ListItem Text="તાલીમ" Value="3"></asp:ListItem>                                                 
                                                    </asp:DropDownList>
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ</label>
                                                </div>
                                            </div>
                                            
                                        </div>

                                       

                                        <div class="row" id="divDisTalVilInst">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlAETtype" runat="server" CssClass="form-control" onChange="BindSub()"></asp:DropDownList>                                                   
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર</label>
                                                </div>
                                            </div>                                                                                
                                        </div>
                                       
                                        <div class="row" id="div2">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>વિષય</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPlace" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <label>સ્થળ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <div class="input-daterange input-group" id="demo-date-range">
                                                        <div class="input-group-content">
                                                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control cssdate"></asp:TextBox>
                                                            <label>પ્રોગ્રામ ની તારીખ</label>
                                                        </div>
                                                        <span class="input-group-addon">થી</span>
                                                        <div class="input-group-content">
                                                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control cssdate"></asp:TextBox>
                                                            <div class="form-control-line"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <asp:TextBox runat="server"  ID="txtTime" CssClass="form-control time12-mask"></asp:TextBox>
                                                    <label>સમય</label>
                                                    <p class="help-block">સમય: am/pm</p>
                                                </div>
                                            </div>
                                        </div>
                                         <%--<div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>--%>
                                       
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    ભાગ લેનાર સભ્યો (લાભાર્થી) દાખલ કરો</button>
                                                <input type="hidden" id="hdnSubmitVal" value="0" />
                                            </div>
                                            <div class="col-sm-1">
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    રદ કરો</button>
                                                 <input type="hidden" id="hdnReset" value="0" />
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/jquery.autosize.min.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/bootstrap-tagsinput.min.js"></script>
    <script src="assets/js/jquery.multi-select.js"></script>
    <script src="assets/js/jquery.inputmask.bundle.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datepicker.js"></script>
    <script src="assets/js/typeahead.bundle.min.js"></script>
    <script src="assets/js/dropzone.min.js"></script>
    <script src="assets/js/jquery.nanoscroller.min.js"></script>
   
    <link href="assets/css/bootstrap.css" rel="stylesheet" />	
    <link href="assets/css/materialadmin.css" rel="stylesheet" />	
    <link href="assets/css/select2.css" rel="stylesheet" />	
    <link href="assets/css/multi-select.css" rel="stylesheet" />	
    <link href="assets/css/datepicker3.css" rel="stylesheet" />	
    <link href="assets/css/jquery-ui-theme.css" rel="stylesheet" />	
    <link href="assets/css/bootstrap-tagsinput.css" rel="stylesheet" />	
    <link href="assets/css/typeahead.css" rel="stylesheet" />	
    <link href="assets/css/dropzone-theme.css" rel="stylesheet" />

    
    
    <script type="text/javascript">

      

        $(function () {
            SetMenu("liTransaction", "ulTransaction", "liactivityeventtrainingdetails", "aActivityEventTrainingDetails", "", "");
            ListSubjects(0, 0);
            ListTypes(0, 0);
        });

        $(function () {

            $("#btnReset").bind("click", function () {
                $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnReset]").attr('disabled', 'disabled');
                $("#hdnReset").val("1");
                ClearAll();
                if ($("#hdnReset").val() == "1") {
                    $("[id*=btnReset]").html("રદ કરો");
                    $("[id*=btnReset]").removeAttr('disabled');
                    $("#hdnReset").val(0);
                }
            });

            $("#btnSave").bind("click", function () {

                var EventID = document.getElementById("<%=this.ddlSubject.ClientID %>");
                var PlaceG = document.getElementById("<%=this.txtPlace.ClientID %>");
                var FromDate = document.getElementById("<%=this.txtFromDate.ClientID %>");
                var ToDate = document.getElementById("<%=this.txtToDate.ClientID %>");
                var Time = document.getElementById("<%=this.txtTime.ClientID %>");
                var ProgramID = document.getElementById("<%=this.ddlAET.ClientID %>");
                var IsEdit;
                var Members = "";
                var TimeFilter = /^(0?[1-9]|1[012])(:[0-5]\d)[APap][mM]$/;

               

                if (EventID.value == "0") {
                    EventID.focus();
                    swal("", "વિષય પસંદ કરો", "warning");

                    return false;
                }
                else if (PlaceG.value == "") {
                    PlaceG.focus();
                    swal("", "સ્થળ પસંદ કરો", "warning");

                    return false;
                }
                else if (FromDate.value == "") {
                    FromDate.focus();
                    swal("", "તારીખ પસંદ કરો", "warning");
                    return false;
                }
                else if (ToDate.value == "") {
                    ToDate.focus();
                    swal("", "તારીખ પસંદ કરો", "warning");
                    return false;
                }
                else if (Time.value == "") {
                    Time.focus();
                    swal("", "સમય દાખલ કરો", "warning");
                    return false;
                }
               
                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                   
                    var AETid = document.getElementById("<%=this.ddlAET.ClientID %>").value;
                    var AETtype = document.getElementById("<%=this.ddlAETtype.ClientID %>").value;

                    var Subject = document.getElementById("<%=this.ddlSubject.ClientID %>").value;
                    var Place= document.getElementById("<%=this.txtPlace.ClientID %>").value;
                    var FromDate = document.getElementById("<%=this.txtFromDate.ClientID %>").value;
                    var ToDate = document.getElementById("<%=this.txtToDate.ClientID %>").value; 
                    var Time = document.getElementById("<%=this.txtTime.ClientID %>").value; 

                    var Event = {};
                    Event.EventID = document.getElementById("<%=this.ddlSubject.ClientID %>").value;
                    Event.ProgramID = document.getElementById("<%=this.ddlAET.ClientID %>").value;
                    Event.PlaceG = document.getElementById("<%=this.txtPlace.ClientID %>").value;
                    Event.FromDate = document.getElementById("<%=this.txtFromDate.ClientID %>").value;
                    Event.ToDate = document.getElementById("<%=this.txtToDate.ClientID %>").value;
                    Event.Time = document.getElementById("<%=this.txtTime.ClientID %>").value;

                   
                    $.ajax({
                        type: "POST",
                        url: "ActivityEventTrainingDetails.aspx/CheckEventVigat",
                        data: '{AETid: ' + JSON.stringify(AETid) + ',AETtype: ' + JSON.stringify(AETtype) + ',Subject: ' + JSON.stringify(Subject) + ',Place: ' + JSON.stringify(Place) + ',FromDate: ' + JSON.stringify(FromDate) + ',ToDate: ' + JSON.stringify(ToDate) + ',Time: ' + JSON.stringify(Time) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {                            
                            var msg = response.d;
                          
                            if (msg == "0") {
                                $.ajax({
                                    type: "POST",
                                    url: "ActivityEventTrainingDetails.aspx/ManageEvent",
                                    data: '{Events: ' + JSON.stringify(Event) + '}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        //swal("Done!", response.d, "success");
                                        var msg = response.d;
                                        ClearAll();
                                        window.location.href = 'ActivityEventTrainingDataEntry.aspx?DetailID=' + msg + '&AETid=' + AETid + '&AETtype=' + AETtype;
                                        //window.open('ActivityEventTrainingDataEntry.aspx?Mid=' + Event.EventID, '_blank');
                                    },
                                    failure: function (response) {
                                        swal(response.d);
                                    },
                                    error: function (response) {
                                        swal(response.d);
                                    }
                                });
                            }
                            else {
                                window.location.href = 'ActivityEventTrainingDataEntry.aspx?DetailID=' + msg + '&AETid=' + AETtype + '&AETtype=' + AETtype.value;
                                ClearAll();
                            }
                        },
                        failure: function (response) {
                            swal(response.d);
                        },
                        error: function (response) {
                            swal(response.d);
                        }
                    });

                    if ($("#hdnSubmitVal").val() == "1") {
                        $("[id*=btnSave]").html("ભાગ લેનાર સભ્યો (લાભાર્થી) દાખલ કરો");
                        $("[id*=btnSave]").removeAttr('disabled');
                        $("#hdnSubmitVal").val(0);
                    }

                  //  var type = document.getElementById("<%=this.ddlAETtype.ClientID %>").value;
                   // var Event = {};
                  //  Event.EventID = document.getElementById("<%=this.ddlSubject.ClientID %>").value;
                   // Event.ProgramID = document.getElementById("<%=this.ddlAET.ClientID %>").value;
                   // Event.PlaceG = document.getElementById("<%=this.txtPlace.ClientID %>").value;
                  //  Event.FromDate = document.getElementById("<%=this.txtFromDate.ClientID %>").value;
                  ///  Event.ToDate = document.getElementById("<%=this.txtToDate.ClientID %>").value;
                   // Event.Time = document.getElementById("<%=this.txtTime.ClientID %>").value;
                   // Event.IsEdit = 0;

                    //$.ajax({
                    //    type: "POST",
                    //    url: "ActivityEventTrainingDetails.aspx/ManageEvent",
                    //    data: '{Events: ' + JSON.stringify(Event) + '}',
                    //    contentType: "application/json; charset=utf-8",
                    //    dataType: "json",
                    //    success: function (response) {
                    //        //swal("Done!", response.d, "success");
                    //        var msg = response.d;
                    //        ClearAll();
                    //        window.location.href = 'ActivityEventTrainingDataEntry.aspx?DetailID=' + msg + '&AETid=' + Event.ProgramID + '&AETtype=' + type;
                    //        //window.open('ActivityEventTrainingDataEntry.aspx?Mid=' + Event.EventID, '_blank');
                    //    },
                    //    failure: function (response) {
                    //        swal(response.d);
                    //    },
                    //    error: function (response) {
                    //        swal(response.d);
                    //    }
                    //});
                }


            });
        });

function ClearAll() {
    document.getElementById("<%=this.ddlAET.ClientID %>").value = 0;
    document.getElementById("<%=this.ddlAETtype.ClientID %>").value = 0;
    document.getElementById("<%=this.ddlSubject.ClientID %>").value = 0;
    document.getElementById("<%=this.txtPlace.ClientID %>").value = "";
    document.getElementById("<%=this.txtFromDate.ClientID %>").value = "";
    document.getElementById("<%=this.txtToDate.ClientID %>").value = "";
    document.getElementById("<%=this.txtTime.ClientID%>").value = "";
}

function BindSub() {
    ListSubjects(document.getElementById("<%=this.ddlAETtype.ClientID %>").value, 0);
    if (document.getElementById("<%=this.ddlAETtype.ClientID %>").value == 0) {
        ListSubjects(0, 0);
    }
}

function ListSubjects(ProgramTypeID, selectedProgramID) {

    var AETid = document.getElementById("<%=this.ddlAET.ClientID %>").value;
    $.ajax({
        type: "POST",
        url: "ActivityEventTrainingDetails.aspx/ListSubjects",
        data: '{AETtypeid: "' + ProgramTypeID + '",AETid: ' + AETid + '}',
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            var ddlSubject = $("[id*=ddlSubject]");
            $("[id*=ddlSubject]").empty();
            $.each(r.d, function () {
                if (selectedProgramID == this['Value'])
                    ddlSubject.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                else
                    ddlSubject.append($("<option></option>").val(this['Value']).html(this['Text']));
            });
        }
    });
    return false;
}

function BindType() {
    ListTypes(document.getElementById("<%=this.ddlAET.ClientID %>").value, 0);
    if (document.getElementById("<%=this.ddlAET.ClientID %>").value == 0) {
        ListTypes(0, 0);
        ListSubjects(0, 0);
    }
    else {
        ListSubjects(0, 0);
    }
}

function ListTypes(ProgramID, selectedProgramID) {
    $.ajax({
        type: "POST",
        url: "ActivityEventTrainingDetails.aspx/ListTypes",
        data: '{ ProgramID: ' + ProgramID + '}',
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            var ddlAETtype = $("[id*=ddlAETtype]");
            $("[id*=ddlAETtype]").empty();
            $.each(r.d, function () {
                if (selectedProgramID == this['Value'])
                    ddlAETtype.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                else
                    ddlAETtype.append($("<option></option>").val(this['Value']).html(this['Text']));
            });
        }
    });
    return false;
}


    </script>
</asp:Content>

