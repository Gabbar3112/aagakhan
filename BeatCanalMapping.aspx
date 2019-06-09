<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BeatCanalMapping.aspx.cs" Inherits="BeatCanalMapping" %>

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
            <li class="active">બીટ પ્રમાણે નહેરની માહિતી </li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">બીટ પ્રમાણે નહેર ઉમેરો/સુધારો</a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlCircle" runat="server" CssClass="form-control" onchange="BindDivision()"></asp:DropDownList>
                                                    <label>વર્તુળ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlDivision" class="form-control" runat="server" onchange="BindSubDivision()"></asp:DropDownList>
                                                    <label>વિભાગ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlSubDivision" class="form-control" onchange="BindSection()" runat="server"></asp:DropDownList>
                                                    <label>પેટા વિભાગ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlSection" class="form-control" onchange="BindBeat()" runat="server"></asp:DropDownList>
                                                    <label>સેક્શન</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlBeat" class="form-control" runat="server"></asp:DropDownList>
                                                      <asp:HiddenField ID="hdnBeatID" runat="server" />
                                                    <label>બીટ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divCanalsofRoot"></div>
                                                    <label>-- રૂટ --</label>
                                                </div>
                                                <input type="hidden" id="checkedRootCanals" />
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divSakha"></div>
                                                    <label id="lbldiv">-- શાખા --</label>
                                                </div>
                                                <input type="hidden" id="checkedsakha" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divDistry"></div>
                                                    <label id="lblsubdiv">-- ડીસ્ટ્રીબ્યુટ્રી --</label>
                                                </div>
                                                <input type="hidden" id="checkeddistry" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divMinor"></div>
                                                    <label id="lblsec">-- માયનોર --</label>
                                                </div>
                                                <input type="hidden" id="checkedminor" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divSubMinor"></div>
                                                    <label id="lblbeat">-- સબ માયનોર --</label>
                                                </div>
                                                <input type="hidden" id="checkedsubminor" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-1">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    દાખલ કરો</button>
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

                        <div id="divSecond" style="display: none;">
                            <div class="tab-pane" id="second1">


                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchCircle" runat="server" CssClass="form-control" onchange="BindDivisionSrch()"></asp:DropDownList>
                                            <label>વર્તુળ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchDivision" class="form-control" runat="server" onchange="BindSubDivisionSrch()"></asp:DropDownList>
                                            <label>વિભાગ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchSubDivision" class="form-control" onchange="BindSectionSrch()" runat="server"></asp:DropDownList>
                                            <label>પેટા વિભાગ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchSection" class="form-control" onchange="BindBeatSrch()" runat="server"></asp:DropDownList>
                                            <label>સેક્શન</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchBeat" class="form-control" runat="server"></asp:DropDownList>
                                            <label>બીટ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <button id="btnSearch" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                            માહિતી શોધો</button>
                                         <input type="hidden" id="hdnSearch" value="0" />
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table id="datatable1" class="table table-striped table-hover">
                                                <asp:GridView ID="gvBeatCanalMapping" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                        <asp:BoundField DataField="CircleNameG" HeaderText="વર્તુળ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="CircleNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="DivisionNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="SubDivisionNameG" HeaderText="પેટા વિભાગ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="SubDivisionNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="SectionNameG" HeaderText="સેક્સન" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="SectionNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="BeatNameG" HeaderText="બીટ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BeatNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="CanalTypeG" HeaderText="નહેર પ્રકાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="CanalTypeG"></asp:BoundField>
                                                        <asp:BoundField DataField="CanalNameG" HeaderText="નહેર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="CanalNameG"></asp:BoundField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>સુધારો</HeaderTemplate>
                                                            <ItemTemplate>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="3%" />
                                                            <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>રદ</HeaderTemplate>
                                                            <ItemTemplate>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="3%" />
                                                            <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </table>
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
    <script type="text/javascript">

        $(".Pager").on("click", '.page', function () {
            GetRecords(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            SetMenu("liTransaction", "ulTransaction", "libeatcanalmapping", "aBeatCanalMapping", "", "");
            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aBeatCanalMapping";

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

            $("#divFirst").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            $("[id*=litab1]").attr('class', 'active');

            ListCircle();
         
            ListDivison(0, 0);
            ListSubDivision(0, 0);
            ListSection(0, 0);
            ListBeat(0, 0);
            FillCanalType();
        })

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            ListCircleSrch();
            ListDivisonSrch(0, 0);
            ListSubDivisionSrch(0, 0);
            ListSectionSrch(0, 0);
            ListBeatSrch(0, 0);
            GetRecords(1);
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
            if ($("[id=ContentPlaceHolder1_ddlCircle]").val() == 0)
            {
                ListDivison(0, 0);
                ListSubDivision(0, 0);
                ListSection(0, 0);
                ListBeat(0, 0);
            }
            else {
                ListSubDivision(0, 0);
                ListSection(0, 0);
                ListBeat(0, 0);
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
            if ($("[id=ContentPlaceHolder1_ddlSrchCircle]").val() == 0) {
                ListDivisonSrch(0, 0);
                ListSubDivisionSrch(0, 0);
                ListSectionSrch(0, 0);
                ListBeatSrch(0, 0);
            }
            else {
                ListSubDivisionSrch(0, 0);
                ListSectionSrch(0, 0);
                ListBeatSrch(0, 0);
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
            ListSubDivision($("[id*=ContentPlaceHolder1_ddlDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlDivision]").val() == 0) {
            
                ListSubDivision(0, 0);
                ListSection(0, 0);
                ListBeat(0, 0);
            }
            else {
                ListSection(0, 0);
                ListBeat(0, 0);
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
            ListSubDivisionSrch($("[id*=ContentPlaceHolder1_ddlSrchDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSrchDivision]").val() == 0) {

                ListSubDivisionSrch(0, 0);
                ListSectionSrch(0, 0);
                ListBeatSrch(0, 0);
            }
            else {
                ListSectionSrch(0, 0);
                ListBeatSrch(0, 0);
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



        function BindSection() {
            ListSection($("[id*=ContentPlaceHolder1_ddlSubDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSubDivision]").val() == 0) {

                ListSection(0, 0);
                ListBeat(0, 0);
            }
            else {
              
                ListBeat(0, 0);
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

        function BindSectionSrch() {
            ListSectionSrch($("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").val() == 0) {

                ListSectionSrch(0, 0);
                ListBeatSrch(0, 0);
            }
            else {

                ListBeatSrch(0, 0);
            }
        }
        function ListSectionSrch(subdivisionid, selectedsectionID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListSection",
                data: '{SubDivisionID: ' + subdivisionid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSection = $("[id*=ddlSrchSection]");

                    $("[id*=ddlSrchSection]").empty();

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




        function BindBeat() {
            ListBeat($("[id*=ContentPlaceHolder1_ddlSection]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSection]").val() == 0) {
                ListBeat(0, 0);
            }
        }
        function ListBeat(SectionID, selectedBeatID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListBeat",
                data: '{ SectionID: ' + SectionID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlBeat]");

                    $("[id*=ddlBeat]").empty();
                    $.each(r.d, function () {
                        if (selectedBeatID == this['Value'])
                            ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else {
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }
                    });
                }
            });
        }

        function BindBeatSrch() {
            ListBeatSrch($("[id*=ContentPlaceHolder1_ddlSrchSection]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSrchSection]").val() == 0) {
                ListBeatSrch(0, 0);
            }

        }
        function ListBeatSrch(SectionID, selectedBeatID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListBeat",
                data: '{ SectionID: ' + SectionID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlSrchBeat]");

                    $("[id*=ddlSrchBeat]").empty();
                    $.each(r.d, function () {
                        if (selectedBeatID == this['Value'])
                            ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else {
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }
                    });
                }
            });
        }




        function FillCanalType() {

            //$.ajax({
            //    type: "POST",
            //    url: "BeatCanalMapping.aspx/ListCanalType",
            //    data: '{}',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (r) {
            //        if (r.d.length > 0) {
            //            $.each(r.d, function () {
            //                if (this['Value'] == 1) {
            //                    var strGroups = "";
            //                    strGroups += "<div class='col-md-6 col-xs-12 col-sm-12'> " + this['Text'] + "</div>" + "</br>";
            //                    $("#divCanalTypeRoot").html(strGroups);
            //                }
            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/ListCanalByType",
                data: '{ CanalTypeID: ' + 1 + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if (r.d.length > 0) {

                        $.each(r.d, function () {
                           
                            strGroups += "<div class='col-sm-6'><div class='checkbox checkbox-styled' ><label><input id='chk" + this['Value'] + "' onclick='ListSakha(this,this.value);' name='rootCanals' type='checkbox'  text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>" + this['Text'] + "</span></label></div></div>";
                        });

                        $("#divCanalsofRoot").html(strGroups);
                    }
                }
            });
            //            });
            //        }
            //    }
            //});


        }

        function ListSakha(cir, canals) {

            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/ListSakha",
                data: '{ CanalID: "' + canals + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";

                    if (r.d.length > 0) {
                        $.each(r.d, function () {
                            if ($(cir).is(':checked') == true) {
                                strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' onclick='ListDistry(this,this.value);'  name='SakhaCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>" + this['Text'] + "</span></label></div></div>";
                            }
                            else {
                                RemoveSakha(this['Value']);
                                $('#divSakha').find('#abc' + this['Value']).remove();
                            }
                        });
                        $("#divSakha").append(strGroups);
                     
                    }
                    ListDistry(cir, canals);
                    ListMinor(cir, canals);
                    //ListSubMinor(cir, canals);
                   
                }
            });
        }

        function ListDistry(cir, canals) {

            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/ListDistry",
                data: '{ CanalID: "' + canals + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if (r.d.length > 0) {
                        $.each(r.d, function () {
                            if ($(cir).is(':checked') == true) {
                                strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' onclick='ListMinor(this,this.value);'  name='DistryCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>" + this['Text'] + "</span></label></div></div>";
                            }
                            else {
                                RemoveDistry(this['Value']);
                                $('#divDistry').find('#abc' + this['Value']).remove();

                            }
                        });
                        $("#divDistry").append(strGroups);

                    }
                }
            });
        }

        function ListMinor(cir, canals) {
          
            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/ListMinor",
                data: '{ CanalID: "' + canals + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if (r.d.length > 0) {
                        $.each(r.d, function () {
                            if ($(cir).is(':checked') == true) {
                                strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' onclick='ListSubMinor(this,this.value);'  name='MinorCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>" + this['Text'] + "</span></label></div></div>";
                            }
                            else {
                                RemoveSubMinor(this['Value']);
                                $('#divMinor').find('#abc' + this['Value']).remove();

                            }
                        });
                        $("#divMinor").append(strGroups);
                        //ListSubMinor(cir, canals);
                    }
                }
            });
        }
        //START - Old ListSubMinor
        //function ListSubMinor(cir, canals) {
        //    $.ajax({
        //        type: "POST",
        //        url: "BeatCanalMapping.aspx/ListSubMinor",
        //        data: '{ CanalID: "' + canals + '"}',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (r) {
        //            var strGroups = "";
        //            if (r.d.length > 0) {
        //                $.each(r.d, function () {
        //                    if ($(cir).is(':checked') == true) {
        //                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' name='SubMinorCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
        //                    }
        //                    else {
        //                        $('#divSubMinor').find('#abc' + this['Value']).remove();
        //                    }
        //                });
        //                $("#divSubMinor").append(strGroups);
        //            }
        //        }
        //    });
        //}
        //END - Old ListSubMinor

        function ListSubMinor(cir, canals) {
            
            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/ListSubMinor",
                data: '{ CanalID: "' + canals + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    var strGroups1 = "";
                    
                    if (r.d.length > 0) {
                        $.each(r.d, function () {
                            
                            if ($(cir).is(':checked') == true) {
                                if (this['CanalTypeID'] == "5")
                                {
                                    strGroups += "<div class='col-sm-6' id='abc" + this['CanalIDD'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' onclick='ListSubMinor(this,this.value);' name='SubMinorCanals' text='" + this['CanalNameG'] + "' value='" + this['CanalIDD'] + "' /><span class='lbl'>" + this['CanalNameG'] + "</span></label></div></div>";
                                }
                                else if (this['CanalTypeID'] == "4")
                                {
                                    strGroups1 += "<div class='col-sm-6' id='abc" + this['CanalIDD'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' onclick='ListSubMinor(this,this.value);' name='MinorCanals' text='" + this['CanalNameG'] + "' value='" + this['CanalIDD'] + "' /><span class='lbl'>" + this['CanalNameG'] + "</span></label></div></div>";
                                }
                            }
                            else {
                                $('#divSubMinor').find('#abc' + this['CanalIDD']).remove();
                                $('#divMinor').find('#abc' + this['CanalIDD']).remove();
                            }
                        });
                        $("#divSubMinor").append(strGroups);
                        $("#divMinor").append(strGroups1);
                    }
                }
            });
        }



        function RemoveSakha(RootID) {

            if ($('input[name="rootCanals"]:checked').length == 0) {

                $('#divSakha').find('div').remove();
                $('#divDistry').find('div').remove();
                $('#divMinor').find('div').remove();
                $('#divSubMinor').find('div').remove();


            }
            else {
                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/ListSakha",
                    data: '{ CanalID: "' + RootID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                $('#divSakha').find('#abc' + this['Value']).remove();

                            });
                        }
                        else {
                            if ($('input[name="rootCanals"]:checked').length == 0) {

                            }
                            else {
                                RemoveDistry(RootID);
                            }
                        }
                    }
                })
            }
        }

        function RemoveDistry(SakhaID) {


            if ($('input[name="SakhaCanals"]:checked').length == 0) {



                $('#divDistry').find('div').remove();
                $('#divMinor').find('div').remove();
                $('#divSubMinor').find('div').remove();

                //$('#divDistryBySakha').find('div').remove();


            }
            else {

                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/ListDistry",
                    data: '{ CanalID: "' + SakhaID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";
                        if (r.d.length > 0) {
                            $.each(r.d, function () {

                                $('#divDistry').find('#abc' + this['Value']).remove();
                                //$('#divDistryBySakha').find('#abc' + this['Value']).remove();
                                RemoveMinor(this['Value']);

                            });
                        }
                        else {

                            if ($('input[name="SakhaCanals"]:checked').length == 0) {
                            }
                            else {
                                RemoveMinor(SakhaID);
                            }
                        }
                    }
                });

            }
        }

        function RemoveMinor(DistryID) {

            if ($('input[name="DistryCanals"]:checked').length == 0) {

                $('#divMinor').find('div').remove();
                $('#divSubMinor').find('div').remove();

            }
            else {
                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/ListMinor",
                    data: '{ CanalID: "' + DistryID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {


                            $.each(r.d, function () {

                                $('#divMinor').find('#abc' + this['Value']).remove();

                                RemoveSubMinor(this['Value']);
                            });


                        }
                        else {
                            if ($('input[name="DistryCanals"]:checked').length == 0) {
                            }
                            else {

                                RemoveSubMinor(DistryID);
                            }
                        }

                    }
                })
            }
        }

        function RemoveSubMinor(MinorID) {


            if ($('input[name="MinorCanals"]:checked').length == 0) {
                if ($('input[name="DistryCanals"]:checked').length == 0) {

                    $('#divMinor').find('div').remove();
                    $('#divSubMinor').find('div').remove();

                    //$('#divSections').find('#lblsec').attr("style", "display:block");
                    //$('#divBeats').find('#lblbeat').attr("style", "display:block");
                }
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/ListSubMinor",
                    data: '{ CanalID: "' + MinorID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                $('#divSubMinor').find('#abc' + this['Value']).remove();

                            });
                        }
                    }
                });
            }
        }


        $(function () {
            $("#btnSave").bind("click", function () {


                var circle = document.getElementById("<%=this.ddlCircle.ClientID %>");
                var division = document.getElementById("<%=this.ddlDivision.ClientID %>");
                var subdivision = document.getElementById("<%=this.ddlSubDivision.ClientID %>");
                var section = document.getElementById("<%=this.ddlSection.ClientID %>");
                var beat = document.getElementById("<%=this.ddlBeat.ClientID %>");

                if (circle.value == "0") {
                    circle.focus();
                    swal("", "વર્તુળ પસંદ કરો.", "warning");
                    return false;
                }
                else if (division.value == "0") {
                    division.focus();
                    swal("", "વિભાગ પસંદ કરો.", "warning");
                    return false;
                }
                else if (subdivision.value == "0") {
                    subdivision.focus();
                    swal("", "પેટા વિભાગ પસંદ કરો", "warning");
                    return false;
                }
                else if (section.value == "0") {
                    section.focus();
                    swal("", "સેક્સન પસંદ કરો", "warning");
                    return false;
                }
                else if (beat.value == "0") {
                    beat.focus();
                    swal("", "બીટ પસંદ કરો", "warning");
                    return false;
                }

                else if ($("input[name='rootCanals']:checked").length == 0) {
                    swal("", "કોઈ એક રુટ પસંદ કરો", "warning");
                    return false;
                }

                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    $.ajax({
                        type: "POST",
                        url: "BeatCanalMapping.aspx/DeleteBeatCanal",
                        data: '{BeatID: "' + $("[id*=ddlBeat]").val() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            var user = {};
                            user.BeatID = $("[id*=ddlBeat]").val();

                            var checkedcanals = "";

                            $('input[name="rootCanals"]:checked').each(function () {
                                checkedcanals += $(this).val() + ",";
                            });

                            $('input[name="SakhaCanals"]:checked').each(function () {
                                checkedcanals += $(this).val() + ",";
                            });

                            $('input[name="DistryCanals"]:checked').each(function () {
                                checkedcanals += $(this).val() + ",";
                            });

                            $('input[name="MinorCanals"]:checked').each(function () {
                                checkedcanals += $(this).val() + ",";
                            });

                            $('input[name="SubMinorCanals"]:checked').each(function () {
                                checkedcanals += $(this).val() + ",";
                            });

                            user.CanalID = checkedcanals;

                            user.UserID = 0

                            $.ajax({
                                type: "POST",
                                url: "BeatCanalMapping.aspx/BeatCanalManage",
                                data: '{user: ' + JSON.stringify(user) + '}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var msg = response.d;

                                    if (msg.indexOf("Error") > -1) {

                                        swal(msg);
                                    }
                                    else {
                                        if ($("[id*=BeatID]").val() != "") {
                                            swal({
                                                title: "બીટ મુજબ નહેરની માહિતી સુધારાઇ ગઇ છે",
                                                type: "success",
                                                showCancelButton: false,
                                                confirmButtonColor: "#5cb85c",
                                                confirmButtonText: "OK",
                                                closeOnConfirm: true
                                            },
                                          function (isConfirm) {
                                              if (isConfirm) {
                                                  GetRecords(1);
                                                  clearall();
                                              }
                                          });
                                        }
                                        else {
                                            swal({
                                                title: "બીટ મુજબ નહેરની માહિતી દાખલ ગઈ છે",
                                                type: "success",
                                                showCancelButton: false,
                                                confirmButtonColor: "#5cb85c",
                                                confirmButtonText: "OK",
                                                closeOnConfirm: true
                                            },
                                       function (isConfirm) {
                                           if (isConfirm) {
                                               GetRecords(1);
                                               clearall();
                                           }
                                       });
                                        }
                                    }
                                }
                            });
                            return false;
                        },

                        failure: function (response) {
                            alert(response.d);
                        },
                        error: function (response) {
                            alert("error");
                        }
                    });
                    if ($("#hdnSubmitVal").val() == "1") {
                        $("[id*=btnSave]").html("દાખલ કરો");
                        $("[id*=btnSave]").removeAttr('disabled');
                        $("#hdnSubmitVal").val(0);
                    }
                }
            });
        });

        $("#btnReset").bind("click", function () {
            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset]").attr('disabled', 'disabled');
            $("#hdnReset").val("1");
            clearall();
            if ($("#hdnReset").val() == "1") {
                $("[id*=btnReset]").html("રદ કરો");
                $("[id*=btnReset]").removeAttr('disabled');
                $("#hdnReset").val(0);
            }
        });

        function SearchCircleWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchCircle]").val());
        };

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchDivision]").val());
        };

        function SearchSubDivisionWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchSubDivision]").val());
        };

        function SearchSectionTerm() {
            return jQuery.trim($("[id*=ddlSrchSection]").val());
        };

        function SearchBeatTerm() {
            return jQuery.trim($("[id*=ddlSrchBeat]").val());
        };

        $(function () {
            $("#btnSearch").bind("click", function () {
                $("[id*=btnSearch]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnSearch]").attr('disabled', 'disabled');
                $("#hdnSearch").val("1");

                $("#divGrid").css({ 'display': "block" });
                GetRecords(1);

                if ($("#hdnSearch").val() == "1") {
                    $("[id*=btnSearch]").html("માહિતી શોધો");
                    $("[id*=btnSearch]").removeAttr('disabled');
                    $("#hdnSearch").val(0);
                }
            })
        });

        function GetRecords(pageIndex) {
            
            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/GetBeatWiseCanalDetail",
                data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '",SearchBeatTerm: "' + SearchBeatTerm() + '",pageIndex:' + pageIndex + '}',
                //data:'{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnGridSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal(response.d);
                }
            });

        }
        var myrowl;
        function OnGridSuccess(response) {

           
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);


            var customers = xml.find("BeatWiseCanalDetail");

            if (myrowl == null) {
                myrowl = $("[id*=gvBeatCanalMapping] tr:last-child").clone(true);
            }
            $("[id*=gvBeatCanalMapping] tr").not($("[id*=gvBeatCanalMapping] tr:first-child")).remove();
            if (customers.length > 0) {

                //if ($("td", myrowl).length < 7) {
                //    $("td", myrowl).eq(0).removeAttr("colspan");
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //}

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrowl).eq(0).html($(this).find("RowNumber").text());


                    if ($(this).prev().find("CircleNameG").text() == $(this).find("CircleNameG").text()) {
                        $("td", myrowl).eq(1).html("");
                    }
                    else {
                        $("td", myrowl).eq(1).html($(this).find("CircleNameG").text());
                    }


                    if ($(this).prev().find("DivisionNameG").text() == $(this).find("DivisionNameG").text()) {
                        $("td", myrowl).eq(2).html("");
                    }
                    else {
                        $("td", myrowl).eq(2).html($(this).find("DivisionNameG").text());
                    }


                    if ($(this).prev().find("SubDivisionNameG").text() == $(this).find("SubDivisionNameG").text()) {
                        $("td", myrowl).eq(3).html("");
                    }
                    else {
                        $("td", myrowl).eq(3).html($(this).find("SubDivisionNameG").text());
                    }


                    if ($(this).prev().find("SectionNameG").text() == $(this).find("SectionNameG").text()) {
                        $("td", myrowl).eq(4).html("");
                    }
                    else {
                        $("td", myrowl).eq(4).html($(this).find("SectionNameG").text());
                    }


                    if ($(this).prev().find("BeatNameG").text() == $(this).find("BeatNameG").text()) {
                        $("td", myrowl).eq(5).html("");
                    }
                    else {
                        $("td", myrowl).eq(5).html($(this).find("BeatNameG").text());
                    }

                    $("td", myrowl).eq(6).html($(this).find("CanalTypeG").text());

                    $("td", myrowl).eq(7).html($(this).find("CanalNameG").text());

                    if ($(this).prev().find("BeatNameG").text() == $(this).find("BeatNameG").text()) {
                        $("td", myrowl).eq(8).html("");
                    }
                    else {
                        $("td", myrowl).eq(8).html($('<a class="btn btn-pencil btn-rounded btn-condensed btn-sm" onclick="return EditDetail(' + $(this).find("BeatID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    }

                    if ($(this).prev().find("BeatNameG").text() == $(this).find("BeatNameG").text()) {
                        $("td", myrowl).eq(9).html("");
                    }
                    else {
                        $("td", myrowl).eq(9).html($('<a class="btn btn-pencil btn-rounded btn-condensed btn-sm" onclick="return DeleteDetail(' + $(this).find("BeatID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    }

                    $("[id*=gvBeatCanalMapping]").append(myrowl);
                    myrowl = $("[id*=gvBeatCanalMapping] tr:last-child").clone(true);
                });

                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                //var pager = xml.find("Pager");
                //$(".Pager").ASPSnippets_Pager({
                //    ActiveCssClass: "current",
                //    PagerCssClass: "pager",
                //    PageIndex: parseInt(pager.find("PageIndex").text()),
                //    PageSize: parseInt(pager.find("PageSize").text()),
                //    RecordCount: parseInt(pager.find("RecordCount").text())
                //});

            }
            else {

                var empty_row = myrowl.clone(true);

                $("td:first-child", empty_row).attr("colspan", $("td", myrowl).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvBeatCanalMapping]").append(empty_row);

            }
        };

        function EditDetail(beatid) {
            $.ajax({
                type: "POST",
                url: "BeatCanalMapping.aspx/GetBeatCanalDetail",
                data: '{BeatID: "' + JSON.stringify(beatid) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnBeatCanalSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function OnBeatCanalSuccess(response) {


            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

            $("[id*=litab1]").attr('class', 'active');
            $("[id*=litab2]").removeAttr('class', 'active');

            $('input[name="rootCanals"]:checked').removeAttr('checked');
            $('input[name="SakhaCanals"]:checked').removeAttr('checked');
            $('input[name="DistryCanals"]:checked').removeAttr('checked');
            $('input[name="MinorCanals"]:checked').removeAttr('checked');
            $('input[name="SubMinorCanals"]:checked').removeAttr('checked');

            $('#divSakha').find('div').remove();
            $('#divDistry').find('div').remove();
            $('#divDistryBySakha').find('div').remove();
            $('#divMinor').find('div').remove();
            $('#divSubMinor').find('div').remove();

            var res = response.d;

            $("[id*=hdnBeatID]").val(res[0].BeatID);

            $("[id*=ContentPlaceHolder1_ddlCircle]").val(res[0].CircleID);
            ListDivison(res[0].CircleID, res[0].DivisionID);
            ListSubDivision(res[0].DivisionID, res[0].SubDivisionID);
            ListSection(res[0].SubDivisionID, res[0].SectionID);
            ListBeat(res[0].SectionID, res[0].BeatID);

            var dataStype = res[0].CanalID;
            var valSTArr = dataStype.split(",");

            $("[id*=checkedRootCanals]").val(valSTArr);
            var j = 0, sizeST = valSTArr.length;
            var selected = [];
            var strGroups = "";
            for (j; j < sizeST; j++) {
                
                $('input[name="rootCanals"]').each(function () {
                    if ($(this).val() == valSTArr[j]) {
                        $(this).prop("checked", true);

                        //var dataStyped = res[0].CanalID;
                        //var valSTArrd = dataStyped.split(",");
                        //$("[id*=checkedsakha]").val(valSTArrd);
                        //ListSakha(valSTArrd, valSTArr[j]);

                        $.ajax({
                            type: "POST",
                            url: "BeatCanalMapping.aspx/ListSakha",
                            data: '{ CanalID: "' + valSTArr[j] + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                var res1 = r.d;
                                var strGroups = "";
                                if (r.d.length > 0) {
                                    $.each(r.d, function () {
                                        var dataStype1 = res[0].CanalID;
                                        var valSTArr1 = dataStype1.split(",");

                                        if (jQuery.inArray(this['Value'], valSTArr1) != '-1') {

                                            strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' checked='true' onclick='ListDistry(this,this.value);'  name='SakhaCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";

                                            $.ajax({
                                                type: "POST",
                                                url: "BeatCanalMapping.aspx/ListDistry",
                                                data: '{ CanalID: "' + this['Value'] + '"}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (r) {
                                                    var res2 = r.d;
                                                    var strGroups = "";
                                                    if (r.d.length > 0) {
                                                        //$('#divDistry').find('div').attr("style", "display:none");
                                                        $.each(r.d, function () {
                                                            var dataStype2 = res[0].CanalID;
                                                            var valSTArr2 = dataStype2.split(",");
                                                            if (jQuery.inArray(this['Value'], valSTArr2) != '-1') {
                                                                strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' checked='true' onclick='ListMinor(this,this.value);'  name='DistryCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                                            }
                                                            else {
                                                                strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' onclick='ListMinor(this,this.value);'  name='DistryCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                                            }
                                                        });
                                                        //$("#divDistryBySakha").append(strGroups);
                                                        $("#divDistry").append(strGroups);
                                                    }
                                                }
                                            });

                                        }
                                        else {
                                            strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' onclick='ListDistry(this,this.value);'  name='SakhaCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                        }
                                    });
                                    $("#divSakha").append(strGroups);
                                }
                            }
                        });
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/ListMinor",
                    data: '{ CanalID: "' + valSTArr[j] + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var res11 = r.d;
                        var strGroups = "";
                        if (r.d.length > 0) {
                            $.each(r.d, function () {
                                var dataStype11 = res[0].CanalID;
                                var valSTArr11 = dataStype11.split(",");

                                //alert(this['Value']);
                                //alert(valSTArr11);
                                //alert(jQuery.inArray(this['Value'], valSTArr11));
                                if (jQuery.inArray(this['Value'], valSTArr11) != '-1') {
                                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' checked='true' onclick='ListSubMinor(this,this.value);'  name='MinorCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                }
                                else {
                                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' onclick='ListSubMinor(this,this.value);'  name='MinorCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                }
                            });
                            $("#divMinor").append(strGroups);
                        }
                    }
                });
                //START - Old ListSubMinor
                //$.ajax({
                //    type: "POST",
                //    url: "BeatCanalMapping.aspx/ListSubMinor",
                //    data: '{ CanalID: "' + valSTArr[j] + '"}',
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (r) {
                //        var res44 = r.d;
                //        var strGroups = "";
                //        if (r.d.length > 0) {
                //            $.each(r.d, function () {
                //                var dataStype44 = res[0].CanalID;
                //                var valSTArr44 = dataStype44.split(",");
                //                if (jQuery.inArray(this['Value'], valSTArr44) != '-1') {
                //                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' checked='true'  name='SubMinorCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                //                }
                //                else {
                //                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label> <input type='checkbox' name='SubMinorCanals' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                //                }
                //            });
                //            $("#divSubMinor").append(strGroups);
                //        }
                //    }
                //});
                //END - Old ListSubMinor
                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/ListSubMinor",
                    data: '{ CanalID: "' + valSTArr[j] + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var res44 = r.d;
                        var strGroups = "";
                        if (r.d.length > 0) {
                            $.each(r.d, function () {
                                var dataStype44 = res[0].CanalID;
                                var valSTArr44 = dataStype44.split(",");

                                if (this['CanalTypeID'] == 5) {

                                    if (jQuery.inArray('' + this['CanalIDD'] + '', valSTArr44) != '-1') {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['CanalIDD'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' checked='true' name='SubMinorCanals' text='" + this['CanalNameG'] + "' value='" + this['CanalIDD'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['CanalNameG'] + "</span></label></div></div>";
                                    }
                                    else {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['CanalIDD'] + "' ><div class='checkbox checkbox-styled' ><label> <input type='checkbox' name='SubMinorCanals' text='" + this['CanalNameG'] + "' value='" + this['CanalIDD'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['CanalNameG'] + "</span></label></div></div>";
                                    }

                                }
                            });
                            $("#divSubMinor").append(strGroups);
                        }
                    }
                });

            }

            //var dataStyped = res[0].CanalID;
            //var valSTArrd = dataStyped.split(",");
            //$("[id*=checkedsakha]").val(valSTArrd);
            //ListSakha(valSTArrd, valSTArr);
        }

        function DeleteDetail(beatid) {
            swal({
                title: "બીટ મુજબ નહેરની માહિતી રદ કરવા માંગો છો?",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ના",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "હા",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "BeatCanalMapping.aspx/DeleteBeatCanal",
                    data: '{BeatID: "' + JSON.stringify(beatid) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;

                        if (msg.indexOf("Error") > -1) {
                            swal(msg);
                        }
                        else {
                            swal("Deleted!", msg, "success");
                            GetRecords(1);
                        }
                    },
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert("error");
                    }
                });
            });
        }
        
        function clearall() {

            ListCircle();
            ListDivison(0, 0);
            ListSubDivision(0, 0);
            ListSection(0, 0);
            ListBeat(0, 0);

            $('input[name="rootCanals"]:checked').removeAttr('checked');
            $('input[name="SakhaCanals"]:checked').removeAttr('checked');
            $('input[name="DistryCanals"]:checked').removeAttr('checked');
            $('input[name="MinorCanals"]:checked').removeAttr('checked');
            $('input[name="SubMinorCanals"]:checked').removeAttr('checked');

            $('#divSakha').find('div').remove();
            $('#divDistry').find('div').remove();
            $('#divDistryBySakha').find('div').remove();
            $('#divMinor').find('div').remove();
            $('#divSubMinor').find('div').remove();

        }
    </script>
</asp:Content>

