<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RptActivityEventTraining.aspx.cs" Inherits="RptActivityEventTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ પ્રમાણે અહેવાલ</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">                    
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-2">
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
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlAETtype" runat="server"  class="form-control"  onChange="BindSub()" >
                                                    </asp:DropDownList>
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlSubject" runat="server" class="form-control">
                                                    </asp:DropDownList>
                                                    <label id ="sub">વિષય</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1" id="divFromdate" style="display: none;">
                                               <div class="form-group ">
                                                    <asp:TextBox ID="txtFromdate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>શરૂઆતની તારીખ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1" id="divTodate"  style="display: none;">
                                                 <div class="form-group ">
                                                    <asp:TextBox ID="txtTodate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>અંત તારીખ</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%--<div class="col-sm-2">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary btn-loading-state"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                    અહેવાલ</button>
                                            </div>--%>
                                            <div class="col-sm-2">
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintPage();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    અહેવાલ જુઓ</button>
                                            </div>
                                            <div class="col-sm-2" id="divActivity" style="display: none;">
                                                <button id="btnActivity" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintAgriCultureActivityReport();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    Agriculture Activity Wise-Villagewise Report</button>
                                            </div>
                                            <div class="col-sm-2" id="divTraining" style="display: none;">
                                                <button id="btnTraining" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintCapacityBuildingReport();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    Capacity Building Report</button>
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
    <script>

        $(function () {
            SetMenu("liReport", "ulReport", "lirptactivityeventtraining", "aRptActivityEventTraining", "", "");
            ListTypes(0, 0);
            ListSubjects(0, 0);
            $("[id*=divActivity]").css({ 'display': "none" });
            $("[id*=divTraining]").css({ 'display': "none" });
            $("[id*=divFromdate]").css({ 'display': "none" });
            $("[id*=divTodate]").css({ 'display': "none" });
            document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
        });
        
        function BindType() {
            ListTypes(document.getElementById("<%=this.ddlAET.ClientID %>").value, 0);

            if (document.getElementById("<%=this.ddlAET.ClientID %>").value == 0) {
                ListTypes(0, 0);
                $("[id*=divFromdate]").css({ 'display': "none" });
                $("[id*=divTodate]").css({ 'display': "none" });

            }
            else {

            }
            if (document.getElementById("<%=this.ddlAET.ClientID %>").value == 1) {
                $("[id*=ddlSubject]").css({ 'display': "none" });
                $("[id*=divTraining]").css({ 'display': "none" });
                $("[id*=divActivity]").css({ 'display': "block" });
                $("[id*=divFromdate]").css({ 'display': "block" });
                $("[id*=divTodate]").css({ 'display': "block" });
                $("[id*=sub]").css({ 'display': "none" });
                ListSubjects(0, 0);

            }
            else if (document.getElementById("<%=this.ddlAET.ClientID %>").value == 3) {
                $("[id*=ddlSubject]").css({ 'display': "block" });
                $("[id*=divActivity]").css({ 'display': "none" });
                $("[id*=divTraining]").css({ 'display': "block" });
                $("[id*=sub]").css({ 'display': "block" });
                $("[id*=divFromdate]").css({ 'display': "block" });
                $("[id*=divTodate]").css({ 'display': "block" });
                ListSubjects(0, 0);
            }
            else {
                $("[id*=ddlSubject]").css({ 'display': "block" });
                $("[id*=divActivity]").css({ 'display': "none" });
                $("[id*=divTraining]").css({ 'display': "none" });
                $("[id*=sub]").css({ 'display': "block" });
                $("[id*=divFromdate]").css({ 'display': "none" });
                $("[id*=divTodate]").css({ 'display': "none" });
                ListSubjects(0, 0);
            }
        }

        function ListTypes(AET, selectedProgramID) {
            $.ajax({
                type: "POST",
                url: "RptActivityEventTraining.aspx/ListTypes",
                data: '{ AET: ' + AET + '}',
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

        function BindSub() {
            ListSubjects(document.getElementById("<%=this.ddlAETtype.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlAETtype.ClientID %>").value == 0) {
                ListSubjects(0, 0);
            }
        }

        function ListSubjects(AETtypeid, selectedProgramID) {

            var AETid = document.getElementById("<%=this.ddlAET.ClientID %>").value;
            $.ajax({
                type: "POST",
                url: "RptActivityEventTraining.aspx/ListSubjects",
                data: '{AETtypeid: "' + AETtypeid + '",AETid: ' + AETid + '}',
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

        function PrintPage() {

            var AET = document.getElementById("<%=this.ddlAET.ClientID %>");

            if (AET.value == "0") {
                AET.focus();
                swal("", "પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ પસંદ કરો", "warning");

                return false;
            }
            else {
                var selct = document.getElementById("<%=this.ddlAET.ClientID%>").value;

                if (selct == 1) {
                    window.open("Reports/PrintAgricultureActivityFormat.aspx?AETid=" + $("[id*=ddlAET]").val() + "&AETtypeid=" + $("[id*=ddlAETtype]").val() + "&Subject=" + $("[id*=ddlSubject]").val() + "");
                    ListTypes(0, 0);
                    ListSubjects(0, 0);
                    document.getElementById("<%=this.ddlAET.ClientID%>").value = 0;
                    $("[id*=ddlSubject]").css({ 'display': "block" });
                    $("[id*=sub]").css({ 'display': "block" });
                    $("[id*=divActivity]").css({ 'display': "none" });
                    $("[id*=divTraining]").css({ 'display': "none" });
                    document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
                    document.getElementById("<%=this.txtTodate.ClientID%>").value = "";
                }
                else if (selct == 2) {
                    window.open("Reports/PrintMassEventDetailsReport.aspx?AETid=" + $("[id*=ddlAET]").val() + "&AETtypeid=" + $("[id*=ddlAETtype]").val() + "&Subject=" + $("[id*=ddlSubject]").val() + "");
                    ListTypes(0, 0);
                    ListSubjects(0, 0);
                    document.getElementById("<%=this.ddlAET.ClientID%>").value = 0;
                    $("[id*=divActivity]").css({ 'display': "none" });
                    $("[id*=divTraining]").css({ 'display': "none" });
                    document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
                    document.getElementById("<%=this.txtTodate.ClientID%>").value = "";
                }
                else if (selct == 3) {
                    window.open("Reports/PrintTrainingDataFormat.aspx?AETid=" + $("[id*=ddlAET]").val() + "&AETtypeid=" + $("[id*=ddlAETtype]").val() + "&Subject=" + $("[id*=ddlSubject]").val() + "");
                    ListTypes(0, 0);
                    ListSubjects(0, 0);
                    document.getElementById("<%=this.ddlAET.ClientID%>").value = 0;
                    $("[id*=divActivity]").css({ 'display': "none" });
                    $("[id*=divTraining]").css({ 'display': "none" });
                    document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
                    document.getElementById("<%=this.txtTodate.ClientID%>").value = "";
                }
    }
}

function PrintAgriCultureActivityReport() {
    var AET = document.getElementById("<%=this.ddlAET.ClientID %>");
            var formdate = document.getElementById("<%=this.txtFromdate.ClientID%>");
            var todate = document.getElementById("<%=this.txtTodate.ClientID%>");

            if (AET.value == "0") {
                AET.focus();
                swal("", "પ્રોગ્રામ પસંદ કરો", "warning");

                return false;
            }
            else if (formdate.value == "") {
                formdate.focus();
                swal("", "તારીખ પસંદ કરો", "warning");

                return false;
            }
            else if (todate.value == "") {
                todate.focus();
                swal("", "તારીખ પસંદ કરો", "warning");

                return false;
            }
            else {
                window.open("Reports/PrintRptAgriCultureActivityVillageWise.aspx?AETid=" + $("[id*=ddlAET]").val() + "&AETtypeid=" + $("[id*=ddlAETtype]").val() + "&FromDate=" + $("[id*=txtFromdate]").val() + "&ToDate=" + $("[id*=txtTodate]").val() + "");

                document.getElementById("<%=this.ddlAET.ClientID%>").value = 0;
                ListTypes(0, 0);
                ListSubjects(0, 0);
                $("[id*=sub]").css({ 'display': "block" });
                $("[id*=ddlSubject]").css({ 'display': "block" });
                $("[id*=divActivity]").css({ 'display': "none" });
                $("[id*=divTraining]").css({ 'display': "none" });
                $("[id*=divFromdate]").css({ 'display': "none" });
                $("[id*=divTodate]").css({ 'display': "none" });
                document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
                document.getElementById("<%=this.txtTodate.ClientID%>").value = "";
            }
}

function PrintCapacityBuildingReport() {

    var AET = document.getElementById("<%=this.ddlAET.ClientID %>");
            var formdate = document.getElementById("<%=this.txtFromdate.ClientID%>");
            var todate = document.getElementById("<%=this.txtTodate.ClientID%>");

            if (AET.value == "0") {
                AET.focus();
                swal("", "પ્રોગ્રામ પસંદ કરો", "warning");

                return false;
            }
            else if (formdate.value == "") {
                formdate.focus();
                swal("", "તારીખ પસંદ કરો", "warning");

                return false;
            }
            else if (todate.value == "") {
                todate.focus();
                swal("", "તારીખ પસંદ કરો", "warning");

                return false;
            }
            else {

                window.open("Reports/PrintCapacityBuildingReport.aspx?AETid=" + $("[id*=ddlAET]").val() + "&AETtypeid=" + $("[id*=ddlAETtype]").val() + "&Subject=" + $("[id*=ddlSubject]").val() + "&FromDate=" + $("[id*=txtFromdate]").val() + "&ToDate=" + $("[id*=txtTodate]").val() + "");

                document.getElementById("<%=this.ddlAET.ClientID%>").value = 0;
                ListTypes(0, 0);
                ListSubjects(0, 0);
                $("[id*=sub]").css({ 'display': "block" });
                $("[id*=ddlSubject]").css({ 'display': "block" });
                $("[id*=divActivity]").css({ 'display': "none" });
                $("[id*=divTraining]").css({ 'display': "none" });
                $("[id*=divFromdate]").css({ 'display': "none" });
                $("[id*=divTodate]").css({ 'display': "none" });
                document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
                document.getElementById("<%=this.txtTodate.ClientID%>").value = "";
            }
}

    </script>
</asp:Content>

