<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VillageBeatMapping.aspx.cs" Inherits="VillageBeatMapping" %>

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
            <li class="active">ગામ પ્રમાણે બીટની માહિતી</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">ગામ પ્રમાણે બીટની માહિતી ઉમેરો/સુધારો</a></li>
                            <li id="tab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>

                        </ul>
                    </div>

                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlDivision" class="form-control" runat="server" onchange="BindSubDivision()"></asp:DropDownList>
                                        
                                            <label>વિભાગ</label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSubDivision" class="form-control" runat="server" onchange="BindSection()"></asp:DropDownList>
                                            <label>પેટા વિભાગ</label>
                                        </div>

                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control" onchange="BindBeat()"></asp:DropDownList>
                                            <label>સેક્શન</label>
                                        </div>

                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlBeat" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <label>બીટ</label>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-8">
                                                    <div id="divVillages" class="col-sm-10 col-md-10">
                                                    </div>
                                                    <input type="hidden" id="hdnvillages" />
                                                </div>
                                                <label>ગામ</label>
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
                                            <asp:DropDownList ID="ddlSrchDivision" class="form-control" runat="server" onchange="BindSubDivisionSrch()" ></asp:DropDownList>
                                          
                                            <label>વિભાગ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchSubDivision" class="form-control" runat="server" onchange="BindSectionSrch()"></asp:DropDownList>
                                            <label>પેટા વિભાગ</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchSection" class="form-control" runat="server" onchange="BindBeatSrch()"></asp:DropDownList>
                                            <label>સેક્સન</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchBeat" class="form-control" runat="server"></asp:DropDownList>
                                            <label>બીટ</label>
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
                                                <%-- <table id="datatable1" class="table table-striped table-hover">--%>

                                                <asp:GridView ID="dgvVillageBeatMapping" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>

                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ" SortExpression="DivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="SubDivisionNameG" HeaderText="પેટા વિભાગ" SortExpression="SubDivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="SectionNames" HeaderText="સેક્સન" SortExpression="SectionNames" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="BeatNames" HeaderText="બીટ" SortExpression="BeatNames" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                        <asp:BoundField DataField="VillageNames" HeaderText="ગામ" SortExpression="VillageNames" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>

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
                                                <%--<div class="Pager">
                                        </div>--%>
                                               <%-- </table>--%>
                                            </div>
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

    <script>
        $(".Pager").on("click", '.page', function () {
            VillageBeatMappingGet(parseInt($(this).attr('page')));
        });

        $("#btnFindUser").bind("click", function () {
            $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnFindUser]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");

            $("#divGrid").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "block" });
            VillageBeatMappingGet(1);

            if ($("#hdnFindUser").val() == "1") {
                $("[id*=btnFindUser]").html("માહિતી શોધો");
                $("[id*=btnFindUser]").removeAttr('disabled');
                $("#hdnFindUser").val(0);
            }
        });

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_ddlDivision]").focus();
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });

            ListSubDivisionSrch(0, 0);
            ListSectionSrch(0, 0);
            ListBeatSrch(0, 0);

            VillageBeatMappingGet(1);
        }
        var rights = "";
        $(function () {
            SetMenu("liTransaction", "ulTransaction", "livillagebeatmapping", "aVillageBeatMapping", "", "");
            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aVillageBeatMapping";
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

            $("[id=tab1]").attr("class", "active");
            $("#divFirst").css({ 'display': "block" });
            $("[id=ContentPlaceHolder1_ddlDivision]").focus();

            ListDivision();
            ListSubDivision(0, 0);
            ListSection(0, 0);
            ListBeat(0, 0);
            ListDivisionSrch();
            ListSubDivisionSrch(0, 0);
            ListSectionSrch(0, 0);
            ListBeatSrch(0, 0);
        });

        function ListDivision() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDivisionByUser",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlDivision]");
                    $("[id*=ddlDivision]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }
        function ListDivisionSrch() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDivisionByUser",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlSrchDivision]");
                    $("[id*=ddlSrchDivision]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
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
            return false;
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
            return false;
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

        function ListSection(SubDivisionID, selectedSectionID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListSection",
                data: '{SubDivisionID: ' + SubDivisionID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSection = $("[id*=ddlSection]");

                    $("[id*=ddlSection]").empty();

                    $.each(r.d, function () {
                        if (selectedSectionID == this['Value']) {

                            ddlSection.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        }
                        else {
                            ddlSection.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }

                    });

                }
            });


            return false;
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
            return false;
        }

        function BindBeat() {
            ListBeat($("[id*=ContentPlaceHolder1_ddlSection]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSection]").val() == 0) {
                ListBeat(0, 0);              
            }
            
        }
        function ListBeat(SectionID, selectedBeatID) {

            BindVillages(SectionID);

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

        function BindVillages(SectionID) {

            $.ajax({
                type: "POST",
                url: "VillageBeatMapping.aspx/ListVillageBySection",
                data: '{SectionID : ' + SectionID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if (r.d.length > 0) {
                        $.each(r.d, function () {


                            var AllCheckedSections = $("[id*=hdnvillages]").val();
                            var SectionSeparate = AllCheckedSections.split(', ');

                            if (jQuery.inArray(this['Value'], SectionSeparate) != '-1') {

                                strGroups += "<div class='col-md-6 col-xs-12 col-sm-12 inputwidth' id='chk" + this['Value'] + "'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'> <input class='ace input-lg' type='checkbox' checked='true'  name='villages' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                            }
                            else {

                                strGroups += "  <div class='col-md-3 col-xs-12 col-sm-12 inputwidth'> <div class='checkbox checkbox-inline checkbox-styled'><label class='block'><input id='chk" + this['Value'] + "' class='ace input-lg' type='checkbox'  name='villages' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                            }
                        });
                        $("#divVillages").html(strGroups);
                    }
                    else {
                        $('input[name="villages"]:checked').removeAttr('checked');
                        $("[id*=hdnvillages]").val('');
                        $("#divVillages").html('-- ગામ પસંદ કરો --');
                    }
                }
            });


        }

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

                var listvillages = [];

                var Division = document.getElementById("ContentPlaceHolder1_ddlDivision");
                var SubDivision = document.getElementById("ContentPlaceHolder1_ddlSubDivision");
                var Section = document.getElementById("ContentPlaceHolder1_ddlSection");
                var Beat = document.getElementById("ContentPlaceHolder1_ddlBeat");

                if ($('input[name="villages"]:checked').length > 0) {
                    $('input[name="villages"]:checked').each(function () {
                        listvillages.push(this.value);
                    })

                }
                var selectedvillages = listvillages.join(',');


                if (Division.value == "0") {
                    Division.focus();
                    swal("", "વિભાગ પસંદ કરો.", "warning");
                    return false;
                }
                else if (SubDivision.value == "0") {
                    SubDivision.focus();
                    swal("", "પેટા વિભાગ પસંદ કરો.", "warning");
                    return false;
                }
                else if (Section.value == "0") {
                    Section.focus();
                    swal("", "સેક્સન પસંદ કરો.", "warning");
                    return false;
                }
                else if (Beat.value == "0") {
                    Beat.focus();
                    swal("", "બીટ પસંદ કરો.", "warning");
                    return false;
                }
                else if ($("input[name='villages']:checked").length == 0) {
                    swal("", "ગામ પસંદ કરો.", "warning");
                    return false;
                }

                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    //$(this).html('<i class="ace-icon fa fa-spinner fa-spin bigger-125"></i>પ્રતિક્ષા કરો');

                    var villagebeatmapping = {};

                    if ($("[id=ContentPlaceHolder1_ddlDivision]").val() != null)
                        villagebeatmapping.DivisionID = $("[id=ContentPlaceHolder1_ddlDivision]").val();
                    else
                        villagebeatmapping.DivisionID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlSubDivision]").val() != null)
                        villagebeatmapping.SubDivisionID = $("[id=ContentPlaceHolder1_ddlSubDivision]").val();
                    else
                        villagebeatmapping.SubDivisionID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlSection]").val() != null)
                        villagebeatmapping.SectionID = $("[id=ContentPlaceHolder1_ddlSection]").val();
                    else
                        villagebeatmapping.SectionID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlBeat]").val() != null)
                        villagebeatmapping.BeatID = $("[id=ContentPlaceHolder1_ddlBeat]").val();
                    else
                        villagebeatmapping.BeatID = 0;

                    villagebeatmapping.Villages = selectedvillages;

                    $.ajax({
                        type: "POST",
                        url: "VillageBeatMapping.aspx/VillageBeatMappingManage",
                        data: '{villagebeatmapping: ' + JSON.stringify(villagebeatmapping) + '}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                                return false;
                            }
                            else {
                                swal("Done!", msg, "success");
                                VillageBeatMappingGet(1);
                                $(["input[id='chk']:checked"]).prop("checked", true);
                                ClearAll();
                            }
                        },
                    });

                    //$(this).html(' <i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
                    ClearAll();
                    if ($("#hdnSubmitVal").val() == "1") {
                        $("[id*=btnSave]").html("દાખલ કરો");
                        $("[id*=btnSave]").removeAttr('disabled');
                        $("#hdnSubmitVal").val(0);
                    }
                }
                return false;
            });
        });

        function VillageBeatMappingGet(pageIndex) {

            $.ajax({
                type: "POST",
                url: "VillageBeatMapping.aspx/GetVillageBeatMapping",
                data: '{SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '",SearchBeatTerm: "' + SearchBeatTerm() + '",pageIndex:'+pageIndex+'}',
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

        var myrowe;
        function OnSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("VillageBeatMapping");
            if (myrowe == null) {
                myrowe = $("[id*=dgvVillageBeatMapping] tr:last-child").clone(true);
            }
            $("[id*=dgvVillageBeatMapping] tr").not($("[id*=dgvVillageBeatMapping] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrowe).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowe).eq(1).html($(this).find("DivisionNameG").text());
                    $("td", myrowe).eq(2).html($(this).find("SubDivisionNameG").text());
                    $("td", myrowe).eq(3).html($(this).find("SectionNames").text());
                    $("td", myrowe).eq(4).html($(this).find("BeatNames").text());
                    $("td", myrowe).eq(5).html($(this).find("VillageNames").text());
                    
                    
                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", myrowe).eq(6).html($('<button  class="btn btn-flat ink-reaction btn-default" onclick="return EditVillageBeatMapping(' + $(this).find("ID").text() + ');"><i class="fa fa-edit"></i></button>'));
                    } else { $("td", myrowe).eq(6).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }
                    
                    
                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", myrowe).eq(7).html($('<button  class="btn btn-flat ink-reaction btn-default" onclick="return DeleteVillageBeatMapping(' + $(this).find("ID").text() + ')";><i class="fa fa-trash"></i></button>'));
                    }
                    else { $("td", myrowe).eq(7).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }


                    $("[id*=dgvVillageBeatMapping]").append(myrowe);
                    myrowe = $("[id*=dgvVillageBeatMapping] tr:last-child").clone(true);
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
                var empty_myrowe = myrowe.clone(true);
                $("td:first-child", empty_myrowe).attr("colspan", $("td", myrowe).length);
                $("td:first-child", empty_myrowe).attr("align", "center");
                $("td:first-child", empty_myrowe).html("No records found for the search criteria.");
                $("td", empty_myrowe).not($("td:first-child", empty_myrowe)).remove();
                $("[id*=dgvVillageBeatMapping]").append(empty_myrowe);
            }
        };

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchDivision]").val());
        };

        function SearchSubDivisionWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchSubDivision]").val());
        };

        function SearchSectionTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchSection]").val());
        };

        function SearchBeatTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchBeat]").val());
        };

        function EditVillageBeatMapping(lnk) {

            $.ajax({
                type: "POST",
                url: "VillageBeatMapping.aspx/GetVillageBeatMappingDetailByVillage",
                data: '{BeatID: "' + JSON.stringify(lnk) + '"}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnUpdateSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function OnUpdateSuccess(response) {
            var res = response.d;
            $("[id=ContentPlaceHolder1_ddlDivision]").val(res[0].DivisionID);
            ListSubDivision(res[0].DivisionID, res[0].SubDivisionID);
            ListSection(res[0].SubDivisionID, res[0].SectionID);
            ListBeat(res[0].SectionID, res[0].BeatID);
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            var Village = res[0].Villages;
            var arr = Village.split(",");
            $("[id*=hdnvillages]").val(arr);
            BindVillages(res[0].SectionID);
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteVillageBeatMapping(BeatID) {

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
                    url: "VillageBeatMapping.aspx/VillageBeatMappingDelete",
                    data: '{BeatID: ' + JSON.stringify(BeatID) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;
                        swal("Deleted!", msg, "success");

                        VillageBeatMappingGet(1);

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

            return false;
        }

        function ClearAll() {
            $("[id=ContentPlaceHolder1_ddlDivision]").val('0');
            ListSubDivision(0, 0);
            ListSection(0, 0);
            ListBeat(0, 0);
            $('input[name="villages"]:checked').removeAttr('checked');
            $("#divVillages").html('-- ગામ પસંદ કરો --');
        }
    </script>

</asp:Content>

