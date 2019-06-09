<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SectionMaster.aspx.cs" Inherits="SectionMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
      
        .Pager span {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 25px;
            margin-right: 5px;
            margin-bottom:5px;
            line-height: 150%;
            border: 1px solid #ccc;
        }

        .Pager a {
            text-align: center;
            display: inline-block;
            width: 25px;
            border: 1px solid #ccc;
            color: #fff;
            color: #333;
            margin-right: 5px;
            margin-bottom:5px;
            line-height: 150%;
            text-decoration: none;
        }

        .highlight {
            background-color: #FFFFAF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">સેક્સનની માહિતી</li>
        </ol>

    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">સેક્સન ઉમેરો/સુધારો</a></li>
                            <li id="tab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>

                        </ul>
                    </div>

                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlCircle" class="form-control" runat="server" onchange="BindDivision()">
                                            </asp:DropDownList>                                           
                                            <label id="lblCircle" runat="server">વર્તુળ </label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlDivision" class="form-control" runat="server" onchange="BindSubDivision()"></asp:DropDownList>
                                            <asp:HiddenField ID="hdnSectionID" runat="server" />
                                            <label>વિભાગ </label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSubDivision" class="form-control" runat="server" ></asp:DropDownList>
                                            <label>પેટા વિભાગ </label>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtSectionName" class="form-control" runat="server" onblur="CheckAlreadyExists()" MaxLength="300" Style="text-transform: uppercase"></asp:TextBox>
                                                    <label>સેક્સન </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtSectionNameG" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                                                    <label>સેક્સન (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                    દાખલ કરો</button>
                                                  <input type="hidden" id="hdnSubmitVal" value="0" />
                                            </div>
                                            <div class="col-sm-2">
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    રદ કરો</button>
                                                 <input type="hidden" id="hdnReset" value="0" />
                                            </div>
                                            <div class="col-sm-2">
                                                <button id="btnSet" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    ફરી સેટ કરો</button>
                                                <input type="hidden" id="hdnSet" value="0" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="divSecond" style="display: none;">
                            <div class="tab-pane" id="second1">

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchCircle" class="form-control" runat="server" onchange="BindDivisionSrch()">
                                            </asp:DropDownList>                                            
                                            <label id="lblSrchCircle" runat="server">વર્તુળ (ગુજરાતી)</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchDivision" class="form-control" runat="server" onchange="BindSubDivisionSrch()"></asp:DropDownList>
                                            <label>વિભાગ (ગુજરાતી)</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchSubDivision" class="form-control" runat="server"></asp:DropDownList>
                                            <label>પેટા વિભાગ (ગુજરાતી)</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-2">
                                            <button id="btnFindUser" type="button" class="btn ink-reaction btn-raised btn-primary" data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" style="padding: 2px 15px">
                                                માહિતી શોધો
                                            </button>
                                            <input type="hidden" id="hdnFindUser" value="0" />
                                        </div>
                                    </div>
                                    <br />
                                </div>

                                <div style="display: none" id="divGrid">

                                    <div class="row">
                                        <%--<div class="col-md-12">
                                            <div class="card-head style-primary">
                                                <header>
                                                    યાદી
                                                </header>
                                            </div>
                                        </div>--%>

                                        <div class="col-lg-12">
                                            <div class="table-responsive">
                                                <%--<table id="datatable1" class="table table-striped table-hover">--%>

                                                    <asp:GridView ID="dgvSectionMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                        <Columns>
                                                            <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="CircleNameG" HeaderText="વર્તુળ" SortExpression="CircleNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ" SortExpression="DivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SubDivisionNameG" HeaderText="પેટા વિભાગ" SortExpression="SubDivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SectionName" HeaderText="સેક્સન" SortExpression="SectionName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SectionNameG" HeaderText="સેક્સન (ગુજરાતી)" SortExpression="SectionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>સુધારો</HeaderTemplate>
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="3%" />
                                                                <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White"/>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>રદ</HeaderTemplate>
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="3%" />
                                                                <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White"/>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <%--<div class="Pager">
                                        </div>--%>
                                                <%--</table>--%>
                                                 <div class="Pager">
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
    </div>

    <script>

        $(".Pager").on("click", '.page', function () {
            GetCustomers(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "lisectionmaster", "aSectionMaster", "", "");
            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
            $("#divFirst").css({ 'display': "block" });

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aSectionMaster";
            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListRigthsByUser",
                data: '{UserID: "' + userid + '",FormNameID: "' + formnameid + '", LoginType: "' + logintype + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var res = response.d;
                    if (res.length > 0) {
                        rights = res[0].RightsID;
                    }
                }
            });
        });

        $("#btnFindUser").bind("click", function () {
            $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnFindUser]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");
            $("#divGrid").css({ 'display': "block" });
            GetCustomers(1);
            //GetCustomers(1);

            if ($("#hdnFindUser").val() == "1") {
                $("[id*=btnFindUser]").html("માહિતી શોધો");
                $("[id*=btnFindUser]").removeAttr('disabled');
                $("#hdnFindUser").val(0);
            }

        });

       

        $("#btnSet").bind("click", function () {
            $("[id*=btnSet]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSet]").attr('disabled', 'disabled');
            $("#hdnSet").val("1");
            if ($("[id=ContentPlaceHolder1_ddlCircle] > option").length == 1) {
                ListDivison($("[id=ContentPlaceHolder1_ddlCircle]").val(), 0);
                ListSubDivision($("[id=ContentPlaceHolder1_ddlDivision]").val(), 0);
            }
            else {
                $("[id=ContentPlaceHolder1_ddlCircle]").val('0');
                ListDivison(0, 0);
                ListSubDivision(0, 0);
            }

            $("#ContentPlaceHolder1_ddlCircle").prop("disabled", false);
            $("#ContentPlaceHolder1_ddlDivision").prop("disabled", false);
            $("#ContentPlaceHolder1_ddlSubDivision").prop("disabled", false);
            if ($("#hdnSet").val() == "1") {
                $("[id*=btnSet]").html("ફરી સેટ કરો");
                $("[id*=btnSet]").removeAttr('disabled');
                $("#hdnSet").val(0);
            }
        });

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            GetCustomers(1);

        }

      

        $(function () {
            $("[id=tab1]").attr("class", "active");
            
            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
            $("#divFirst").css({ 'display': "block" });
            //GetCustomers();
            ListCircle();
            ListCircleSrch();
            ListDivison(0, 0);
            ListSubDivision(0, 0);
            ListDivisonSrch(0, 0);
            ListSubDivisionSrch(0, 0);
        });

        function CheckAlreadyExists() {
            var sectiontooltip = document.getElementById('<%= txtSectionName.ClientID %>').title;
            var section = document.getElementById('<%= txtSectionName.ClientID %>');
            var subdivisionid = document.getElementById('<%= ddlSubDivision.ClientID %>');

            if (sectiontooltip != "") {
                if (section.value != sectiontooltip) {
                    $.ajax({
                        type: "POST",
                        url: "SectionMaster.aspx/CheckSectionName",
                        data: '{SectionName: "' + section.value + '", SubDivisionID: "' + subdivisionid.value + '"}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                section.focus();
                                swal("", "સેક્શન પહેલેથી દાખલ કરેલ છે.", "warning");
                                return false;
                            }
                        },
                        failure: function (response) {
                            swal(response.d);
                        },
                        error: function (response) {
                            swal("error");
                        }
                    });
                }
            }
            else {
                if (section.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "SectionMaster.aspx/CheckSectionName",
                        data: '{SectionName: "' + section.value + '", SubDivisionID: "' + subdivisionid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                section.focus();
                                swal("", "સેક્શન પહેલેથી દાખલ કરેલ છે.", "warning");
                                return false;
                            }
                        },
                        failure: function (response) {
                            swal(response.d);
                        },
                        error: function (response) {
                            swal("error");
                        }
                    });
                }
            }
        }

        function CheckAlreadyExistsSectionNameG() {
            var sectionGtooltip = document.getElementById('<%= txtSectionNameG.ClientID %>').title;
            var sectionG = document.getElementById('<%= txtSectionNameG.ClientID %>');
            var subdivisionid = document.getElementById('<%= ddlSubDivision.ClientID %>');

            if (sectionGtooltip != "") {
                if (sectionG.value != sectionGtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "SectionMaster.aspx/CheckSectionName",
                        data: '{SectionNameG: "' + sectionG.value + '", SubDivisionID: "' + subdivisionid.value + '"}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                sectionG.focus();
                                swal("", "સેક્શન પહેલેથી દાખલ કરેલ છે. (ગુજરાતી)", "warning");
                                return false;
                            }
                        },
                        failure: function (response) {
                            swal(response.d);
                        },
                        error: function (response) {
                            swal("error");
                        }
                    });
                }
            }
            else {
                if (sectionG.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "SectionMaster.aspx/CheckSectionName",
                        data: '{SectionNameG: "' + sectionG.value + '", SubDivisionID: "' + subdivisionid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                sectionG.focus();
                                swal("", "સેક્શન પહેલેથી દાખલ કરેલ છે. (ગુજરાતી)", "warning");
                                return false;
                            }
                        },
                        failure: function (response) {
                            swal(response.d);
                        },
                        error: function (response) {
                            swal("error");
                        }
                    });
                }
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

        function ListCircleSrch() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListCircle",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlSrchCircle]");
                    $("[id*=ddlSrchCircle]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindDivision() {
            ListDivison($("[id=ContentPlaceHolder1_ddlCircle]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlCircle]").val() == 0) {
                ListDivison(0, 0);
                ListSubDivision(0, 0);
            }
            else {
                ListSubDivision(0, 0);
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

        function BindDivisionSrch() {
            ListDivisonSrch($("[id=ContentPlaceHolder1_ddlSrchCircle]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSrchCircle]").val() == 0) {
                ListDivisonSrch(0, 0);
                ListSubDivisionSrch(0, 0);
            }
            else {
                ListSubDivisionSrch(0, 0);
            }
        }
        function ListDivisonSrch(circleid, selectedDivID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDivision",
                data: '{CircleID: ' + circleid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlDivision = $("#ContentPlaceHolder1_ddlSrchDivision");

                    $("#ContentPlaceHolder1_ddlSrchDivision").empty();

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
            ListSubDivision($("[id=ContentPlaceHolder1_ddlDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlDivision]").val() == 0) {
                ListSubDivision(0, 0);
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

        function BindSubDivisionSrch() {
            ListSubDivisionSrch($("[id=ContentPlaceHolder1_ddlSrchDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSrchDivision]").val() == 0) {
                ListSrchSubDivison(0, 0);               
            }           
        }
        function ListSubDivisionSrch(divisionid, selectedsubDivID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListSubDivision",
                data: '{DivisionID: ' + divisionid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSubDivision = $("[id*=ContentPlaceHolder1_ddlSrchSubDivision]");

                    $("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").empty();

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

        function ClearAll() {
            $("[id=ContentPlaceHolder1_txtSectionName]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtSectionNameG]").attr('title', '');
            $("[id*=hdnSectionID]").val('');
            $("[id=ContentPlaceHolder1_txtSectionName]").val('');
            $("[id=ContentPlaceHolder1_txtSectionNameG]").val('');
            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
        }

        $(function () {
            $("#btnReset").bind("click", function () {
                $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnReset]").attr('disabled', 'disabled');
                $("#hdnReset").val("1");
                ClearAll();
                $("#ContentPlaceHolder1_ddlCircle").prop("disabled", false);
                $("#ContentPlaceHolder1_ddlDivision").prop("disabled", false);
                $("#ContentPlaceHolder1_ddlSubDivision").prop("disabled", false);
                if ($("#hdnReset").val() == "1") {
                    $("[id*=btnReset]").html("રદ કરો");
                    $("[id*=btnReset]").removeAttr('disabled');
                    $("#hdnReset").val(0);
                }
            });
            $("#btnSave").bind("click", function () {
                var sectionid = $("[id*=hdnSectionID]").val();
                var ddlCircle = document.getElementById("ContentPlaceHolder1_ddlCircle");
                var ddlDivision = document.getElementById("ContentPlaceHolder1_ddlDivision");
                var ddlSubDivision = document.getElementById("ContentPlaceHolder1_ddlSubDivision");
                var sectionname = document.getElementById("ContentPlaceHolder1_txtSectionName");
                var sectionnameG = document.getElementById("ContentPlaceHolder1_txtSectionNameG");

                if (ddlCircle.value == "0") {
                    ddlCircle.focus();
                    swal("", "વર્તુળ પસંદ કરો", "warning");
                    return false;
                }
                else if (ddlDivision.value == "0") {
                    ddlDivision.focus();
                    swal("", "વિભાગ પસંદ કરો", "warning");
                    return false;
                }

                else if (ddlSubDivision.value == "0") {
                    ddlSubDivision.focus();
                    swal("", "પેટા વિભાગ પસંદ કરો", "warning");
                    return false;
                }
                else if (sectionname.value == "") {
                    sectionname.focus();
                    swal("", "સેક્શન દાખલ કરો", "warning");
                    return false;
                }
                else if (sectionnameG.value == "") {
                    sectionnameG.focus();
                    swal("", "સેક્શન દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    //$(this).html('<i class="ace-icon fa fa-spinner fa-spin  bigger-125"></i>પ્રતિક્ષા કરો');
                    var section = {};
                    
                    section.SubDivisionId = $("[id=ContentPlaceHolder1_ddlSubDivision]").val();
                    section.SectionName = $("[id=ContentPlaceHolder1_txtSectionName]").val();
                    section.SectionNameG = $("[id=ContentPlaceHolder1_txtSectionNameG]").val();

                    if (sectionid == "")
                        section.SectionID = 0
                    else
                        section.SectionID = sectionid;

                    $.ajax({
                        type: "POST",
                        url: "SectionMaster.aspx/SectionManage",
                        data: '{section: ' + JSON.stringify(section) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                                return false;
                            }
                            else if ($("[id*=hdnSectionID]").val() != "") {
                                swal("Updated", msg, "success");
                                GetCustomers(1);
                                ClearAll();
                            }
                            else {
                                swal("Inserted", msg, "success");
                                GetCustomers(1);
                                $("[id=ContentPlaceHolder1_txtSectionName]").val('');
                                $("[id=ContentPlaceHolder1_txtSectionNameG]").val('');
                            }
                           
                        }
                    });
                    //$(this).html('<i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
                    if ($("#hdnSubmitVal").val() == "1") {
                        $("[id*=btnSave]").html("દાખલ કરો");
                        $("[id*=btnSave]").removeAttr('disabled');
                        $("#hdnSubmitVal").val(0);
                    }
                    return false;
                }
            });
        });

        function SearchCircleWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchCircle]").val());
        };

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchDivision]").val());
        };

        function SearchSubDivisionWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchSubDivision]").val());
        };

        function GetCustomers(pageIndex) {
            $.ajax({
                type: "POST",
                url: "SectionMaster.aspx/GetSection",
                //data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '", pageIndex: ' + pageIndex + '}',
                data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '", pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal(response.d);
                }
            });
        }

        var row;
        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Section");
            if (row == null) {
                row = $("[id*=dgvSectionMaster] tr:last-child").clone(true);
            }
            $("[id*=dgvSectionMaster] tr").not($("[id*=dgvSectionMaster] tr:first-child")).remove();
            if (customers.length > 0) {
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("CircleNameG").text());
                    $("td", row).eq(2).html($(this).find("DivisionNameG").text());
                    $("td", row).eq(3).html($(this).find("SubDivisionNameG").text());
                    $("td", row).eq(4).html($(this).find("SectionName").text());
                    $("td", row).eq(5).html($(this).find("SectionNameG").text());


                    if (jQuery.inArray("2", rights) != '-1') {
                    $("td", row).eq(6).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return EditSection(' + $(this).find("SectionID").text() + ')";><i class="fa fa-edit"></i> </button>'));
                    }
                    else { $("td", row).eq(6).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }


                    if (jQuery.inArray("3", rights) != '-1') {
                    $("td", row).eq(7).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return DeleteSection(' + $(this).find("SectionID").text() + ')";><i class="fa fa-trash"></i> </button>'));
                    }
                    else { $("td", row).eq(7).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=dgvSectionMaster]").append(row);
                    row = $("[id*=dgvSectionMaster] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });
            
            //    $(".CircleName").each(function () {
            //        var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
            //        $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
            //    });
            //    $(".DivisionNameGuj").each(function () {
            //        var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
            //        $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
            //    });
            //    $(".SubDivisionName").each(function () {
            //        var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
            //        $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
            //    });
            //    $(".SectionName").each(function () {
            //        var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
            //        $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
            //    });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=dgvSectionMaster]").append(empty_row);
            }
        };

        function EditSection(lnk) {
            $.ajax({
                type: "POST",
                url: "SectionMaster.aspx/GetSectionDetail",
                data: '{SectionID: "' + JSON.stringify(lnk) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnCircleSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function OnCircleSuccess(response) {
       
            var res = response.d;
            $("[id=ContentPlaceHolder1_txtSectionName]").attr('title', res[0].SectionName);
            $("[id=ContentPlaceHolder1_txtSectionNameG]").attr('title', res[0].SectionNameG);
            $("[id=ContentPlaceHolder1_ddlCircle]").val(res[0].CircleID);
            //$("[id*=ContentPlaceHolder1_ddlCircle]").removeAttr("disabled");
            $("[id=ContentPlaceHolder1_ddlDivision]").val(res[0].DivisionID);
            //$("[id*=ContentPlaceHolder1_ddlDivision]").removeAttr("disabled");
            $("[id=ContentPlaceHolder1_ddlSubDivision]").val(res[0].SubDivisionID);
            //$("[id*=ContentPlaceHolder1_ddlSubDivision]").removeAttr("disabled");
            $("[id=ContentPlaceHolder1_txtSectionName]").val(res[0].SectionName);
            $("[id=ContentPlaceHolder1_txtSectionNameG]").val(res[0].SectionNameG);
            $("[id*=hdnSectionID]").val(res[0].SectionID);
            ListDivison(res[0].CircleID, res[0].DivisionID);
            ListSubDivision(res[0].DivisionID, res[0].SubDivisionID);
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteSection(lnk) {
            $.ajax({
                type: "POST",
                url: "SectionMaster.aspx/CheckDataInSection",
                data: '{SectionID : ' + lnk + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var msg = response.d;

                    if (msg == "1") {
                        swal("", "સેક્શન પહેલેથી ઉપયોગમાં છે.", "warning");
                    }
                    else {
                        swal({
                            title: "શું તમે ડેટા કાઢી નાખવા માટે ચોક્કસ છો?",
                            type: "warning",
                            showCancelButton: true,
                            cancelButtonText: "ના",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "હા",
                            closeOnConfirm: false

                        }, function () {

                            $.ajax({
                                type: "POST",
                                url: "SectionMaster.aspx/DeleteSection",
                                data: '{SectionID : ' + JSON.stringify(lnk) + '}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var msg = response.d;
                                    swal("Deleted!", "સેક્શનની માહિતી રદ થઇ ગઈ છે.", "success");
                                    GetCustomers();
                                },
                                failure: function (response) {
                                    swal(response.d);
                                },
                                error: function (err) {
                                    swal(err);
                                    swal(err.text);
                                }
                            });
                        });
                    }
                },
                failure: function (response) {
                    swal(response.d);
                },
                error: function (err) {
                    swal(err);
                    swal(err.text);
                }
            });
        }

    </script>
</asp:Content>

