<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SectionwiseMonthlyProgressReport.aspx.cs" Inherits="SectionwiseMonthlyProgressReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">પ્રવૃત્તિનો સેક્સન મુજબ મહિના પ્રમાણે અહેવાલ</li>
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
                                                    <asp:DropDownList ID="ddlCircle" class="form-control" runat="server" onchange="BindDivision()">
                                                    </asp:DropDownList>
                                                    <label id="lblCircle" runat="server">વર્તુળ <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlDivision" class="form-control" runat="server" onchange="BindSubDivision()"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnBeatID" runat="server" />
                                                    <label>વિભાગ <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlSubDivision" class="form-control" runat="server" onchange="BindSection()"></asp:DropDownList>
                                                    <label>પેટા વિભાગ <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlSection" class="form-control" runat="server"></asp:DropDownList>
                                                    <label>સેક્શન <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1" id="divFromdate">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFromdate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>શરૂઆતની તારીખ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1" id="divTodate">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtTodate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>અંત તારીખ</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">                                        
                                            <div class="col-sm-2">
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintPage();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    સેક્સન મુજબ મહિના પ્રમાણે અહેવાલ જુઓ </button>
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
    <script type="text/javascript">
        $(function () {
            ListCircle();
            ListDivison(0,0);
            ListSubDivision(0,0);
            ListSection(0,0);
        });

        function PrintPage() {

            var SectionID = document.getElementById("<%=this.ddlSection.ClientID %>");
            var formdate = document.getElementById("<%=this.txtFromdate.ClientID%>");
            var todate = document.getElementById("<%=this.txtTodate.ClientID%>");

            if (SectionID.value == "0") {
                SectionID.focus();
                 swal("", "સેક્સન પસંદ કરો", "warning");

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
                 window.open("Reports/PrintSectionwiseMonthlyProgressReport.aspx?SectionID=" + $("[id*=ddlSection]").val() + "&FromDate=" + $("[id*=txtFromdate]").val() + "&ToDate=" + $("[id*=txtTodate]").val() + "");
                 ListCircle();
                 ListDivison(0, 0);
                 ListSection(0, 0);
                 ListSubDivision(0, 0);
                    document.getElementById("<%=this.txtFromdate.ClientID%>").value = "";
                    document.getElementById("<%=this.txtTodate.ClientID%>").value = "";               
            }
         }





        function ListCircle() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListCircle",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlCircle]");
                    $("[id*=ddlCircle]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindDivision() {
            ListDivison($("[id*=ContentPlaceHolder1_ddlCircle]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlCircle]").val() == 0) {
                ListDivison(0, 0);
                ListSubDivision(0, 0);
                ListSection(0, 0);
            }
            else {
                ListSubDivision(0, 0);
                ListSection(0, 0);
            }
        }
        function ListDivison(circleid, selectedDivID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDivision",
                data: '{CircleID: ' + circleid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlDivision = $("#ContentPlaceHolder1_ddlDivision");

                    $("#ContentPlaceHolder1_ddlDivision").empty();

                    $.each(r.d, function () {
                        if (selectedDivID == this['Value'])
                            ddlDivision.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else {
                            ddlDivision.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }

                    });



                }
            });
        }

        function BindSubDivision() {
            ListSubDivision($("[id*=ContentPlaceHolder1_ddlDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlDivision]").val() == 0) {

                ListSubDivision(0, 0);
                ListSection(0, 0);
            }
            else {

                ListSection(0, 0);
            }
        }
        function ListSubDivision(divisionid, selectedsubDivID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListSubDivision",
                data: '{DivisionID: ' + divisionid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSubDivision = $("[id*=ContentPlaceHolder1_ddlSubDivision]");

                    $("[id*=ContentPlaceHolder1_ddlSubDivision]").empty();

                    $.each(r.d, function () {
                        if (selectedsubDivID == this['Value'])
                            ddlSubDivision.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else {
                            ddlSubDivision.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }

                    });


                }
            });
        }

        function BindSection() {
            ListSection($("[id*=ContentPlaceHolder1_ddlSubDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSubDivision]").val() == 0) {
                ListSection(0, 0);
            }

        }
        function ListSection(subdivisionid, selectedsectionID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListSection",
                data: '{SubDivisionID: ' + subdivisionid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSection = $("[id*=ddlSection]");

                    $("[id*=ddlSection]").empty();

                    $.each(r.d, function () {
                        if (selectedsectionID == this['Value']) {

                            ddlSection.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        }
                        else {
                            ddlSection.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }

                    });

                }
            });
        }

        </script>
</asp:Content>

