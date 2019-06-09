<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SectionVillageMapping.aspx.cs" Inherits="SectionVillageMapping" %>

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
            <li class="active">ગામ પ્રમાણે સેક્સનની માહિતી</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">ગામ પ્રમાણે સેક્સનની માહિતી ઉમેરો/સુધારો</a></li>
                            <li id="tab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>
                        </ul>
                    </div>

                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">

                                        
                                        
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" onchange="BindTaluka()"></asp:DropDownList>
                                            <asp:HiddenField ID="hdnSectionVillageMappingID" runat="server" />
                                            <label>જિલ્લો</label>
                                        </div>
                                        
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlTaluka" runat="server" CssClass="form-control" onchange="BindVillage()"></asp:DropDownList>
                                            <label>તાલુકો</label>
                                        </div>
                                        
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <label>ગામ</label>
                                        </div>
                                        

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlDivision" class="form-control" runat="server" onchange="BindSubDivision()"></asp:DropDownList>
                                            <label>વિભાગ</label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSubDivision" class="form-control" runat="server" onchange="BindSection()"></asp:DropDownList>
                                            <label>પેટા વિભાગ</label>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-8">
                                                    <div id="divCircles" class="col-sm-10 col-md-10">
                                                        <label>-- સેક્શન પસંદ કરો --</label>
                                                    </div>
                                                    <input type="hidden" id="hdnsections" />
                                                </div>
                                                <label>સેક્શન</label>
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
                                            <asp:DropDownList ID="ddlDistrictSrch" class="form-control" runat="server" onchange="BindTalukaSrch()">
                                            </asp:DropDownList>
                                            <label id="lblSrchDistrict" runat="server">જિલ્લો</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlTalukaSrch" class="form-control" runat="server">
                                            </asp:DropDownList>
                                            <label id="lblSrchTaluka" runat="server">તાલુકો</label>
                                        </div>
                                    </div>

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
                                            <asp:DropDownList ID="ddlSrchSection" class="form-control" runat="server"></asp:DropDownList>
                                            <label>સેક્સન</label>
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
                                        

                                        <div class="col-lg-12">
                                            <div class="table-responsive">
                                        

                                                    <asp:GridView ID="dgvSectionVillageMapping" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                        <Columns>

                                                            <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="DistrictNameG" HeaderText="જિલ્લો" SortExpression="DistrictNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="TalukaNameG" HeaderText="તાલુકો" SortExpression="TalukaNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="VillageNameG" HeaderText="ગામ" SortExpression="VillageNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ" SortExpression="DivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SubDivisionNameG" HeaderText="પેટા વિભાગ" SortExpression="SubDivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SectionNames" HeaderText="સેક્સન" SortExpression="SectionNames" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>

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

    <script type="text/javascript">
        $(".Pager").on("click", '.page', function () {
            SectionVillageMappingGet(parseInt($(this).attr('page')));
        });

        $("#btnFindUser").bind("click", function () {
            $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnFindUser]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");
            $("#divGrid").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "block" });
            SectionVillageMappingGet(1);
            if ($("#hdnFindUser").val() == "1") {
                $("[id*=btnFindUser]").html("માહિતી શોધો");
                $("[id*=btnFindUser]").removeAttr('disabled');
                $("#hdnFindUser").val(0);
            }
        });

        var rights = "";
        $(function () {
            SetMenu("liTransaction", "ulTransaction", "lisectionvillagemapping", "aSectionVillageMapping", "", "");
            $("#divFirst").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            ListDivision();
            ListDistrict();
            ListTaluka(0, 0);
            ListVillage(0, 0);
            ListSubDivision(0, 0);
        
            $("[id=ContentPlaceHolder1_ddlDivision]").val('0');

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aSectionVillageMapping";
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

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_ddlDistrict]").focus();
            if ($("[id=ContentPlaceHolder1_ddlDivision]").length == 1) {
                BindSubDivision();
            }
            else
                ListSubDivision(0, 0);
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            ListDistrictSrch();
            ListTalukaSrch(0,0);
            ListDivisionSrch();
            ListSubDivisionSrch(0, 0);
            ListSectionSrch(0, 0);
            
        }

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

        function ListDistrictSrch() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDistrict",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlDistrictSrch]");
                    $("[id*=ddlDistrictSrch]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function ListDistrict() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDistrict",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlDistrict]");
                    $("[id*=ddlDistrict]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindTaluka() {
            ListTaluka(document.getElementById("<%=this.ddlDistrict.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlDistrict.ClientID %>").value == 0) {
                ListTaluka(0, 0);
                ListVillage(0, 0);
            }
            else {
                ListVillage(0, 0);
            }
        }

        function ListTaluka(DistrictID, selectedDistrictID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListTaluka",
                data: '{ DistrictID: ' + DistrictID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlTaluka]");
                    $("[id*=ddlTaluka]").empty();
                    $.each(r.d, function () {
                        if (selectedDistrictID == this['Value'])
                            ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindTalukaSrch() {
            ListTalukaSrch($("[id=ContentPlaceHolder1_ddlDistrictSrch]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlDistrictSrch]").val() == 0) {
                ListTalukaSrch(0, 0);                
            }            
        }

        function ListTalukaSrch(DistrictID, selectedDistrictID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListTaluka",
                data: '{ DistrictID: ' + DistrictID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategorys = $("#ContentPlaceHolder1_ddlTalukaSrch");
                    $("#ContentPlaceHolder1_ddlTalukaSrch").empty();

                    if (r.d.length > 0) {
                        $.each(r.d, function () {
                            ddlCategorys.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                    else { $("#ContentPlaceHolder1_ddlTalukaSrch").val(''); }
                }
            });
            return false;
        }

        function BindVillage() {
            ListVillage(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlTaluka.ClientID %>").value == 0) {
                ListVillage(0, 0);               
            }            
        }

        function ListVillage(TalukaID, selectedVillageID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListVillage",
                data: '{TalukaID: ' + TalukaID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id=ContentPlaceHolder1_ddlVillage]");
                    $("[id=ContentPlaceHolder1_ddlVillage]").empty();
                    $.each(r.d, function () {
                        if (selectedVillageID == this['Value'])
                            ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindSubDivision() {
            ListSubDivision($("[id*=ContentPlaceHolder1_ddlDivision]").val(), 0);
            
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
            }
            else {
                ListSectionSrch(0, 0);
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
            FillSection($("[id=ContentPlaceHolder1_ddlSubDivision]").val());
        }

        function BindSectionSrch() {
            ListSectionSrch($("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").val(), 0);
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

        function FillSection(SubDivisionID) {
            $.ajax({
                type: "POST",
                url: "SectionVillageMapping.aspx/ListSections",
                data: '{SubDivisionID :' + SubDivisionID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";

                    if (r.d.length > 0) {

                        $.each(r.d, function () {

                            var AllCheckedSections = $("[id*=hdnsections]").val();
                            var SectionSeparate = AllCheckedSections.split(', ');

                            if (jQuery.inArray(this['Value'], SectionSeparate) != '-1') {

                                strGroups += "<div class='col-md-6 col-xs-12 col-sm-12 inputwidth' id='chk" + this['Value'] + "'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'>  <input class='ace input-lg'   type='checkbox' checked='true'  name='Sections' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                            }
                            else {
                                strGroups += "<div class='col-md-6 col-xs-12 col-sm-12 inputwidth' id='chk" + this['Value'] + "'> <div class='checkbox checkbox-inline checkbox-styled'><label class='block'> <input class='ace input-lg'  type='checkbox'   name='Sections' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                            }


                        });
                        $("#divCircles").html(strGroups);
                    }
                    else {
                        $('input[name="Sections"]:checked').removeAttr('checked');
                        $("#divCircles").html('-- સેક્શન પસંદ કરો --');
                        $("[id*=hdnsections]").val('');
                    }
                }
            });
        }

        function ClearAll() {
            $("[id*=SectionVillageMappingID]").val('');
            ListVillage('0', '0');
            $("[id=ContentPlaceHolder1_ddlDistrict]").val('0');
            BindTaluka();
            $("[id=ContentPlaceHolder1_ddlVillage]").val('0');
            $('input[name="Sections"]:checked').removeAttr('checked');
            if ($("[id=ContentPlaceHolder1_ddlDivision] > option").length == 1) {
                ListSubDivision($("[id=ContentPlaceHolder1_ddlDivision]").val(), 0);
                $('input[name="Sections"]:checked').removeAttr('checked');
            }
            else {
                $("[id=ContentPlaceHolder1_ddlDivision]").val('0');
                $('input[name="Sections"]:checked').removeAttr('checked');
                $("#divCircles").html('-- સેક્સન પસંદ કરો --');
                ListSubDivision(0, 0);
            }
            if ($("[id=ContentPlaceHolder1_ddlSrchDivision] > option").length == 1) {
                ListSubDivisionSrch($("[id=ContentPlaceHolder1_ddlSrchDivision]").val(), 0);
            }
            else { ListSubDivisionSrch(0, 0); }

            ListTaluka(0, 0);
            ListTalukaSrch(0, 0);
            ListVillage(0, 0);

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

                var listsections = [];

                var District = document.getElementById("ContentPlaceHolder1_ddlDistrict");
                var Taluka = document.getElementById("ContentPlaceHolder1_ddlTaluka");
                var Village = document.getElementById("ContentPlaceHolder1_ddlVillage");
                var Division = document.getElementById("ContentPlaceHolder1_ddlDivision");
                var SubDivision = document.getElementById("ContentPlaceHolder1_ddlSubDivision");

                if ($('input[name="Sections"]:checked').length > 0) {
                    $('input[name="Sections"]:checked').each(function () {
                        listsections.push(this.value);
                    })

                }
                var selectedsections = listsections.join(',');

                if (District.value == "0") {
                    District.focus();
                    swal("", "જીલ્લો પસંદ કરો.", "warning");
                    return false;
                }
                else if (Taluka.value == "0") {
                    Taluka.focus();
                    swal("", "તાલુકો પસંદ કરો.", "warning");
                    return false;
                }
                else if (Village.value == "0") {
                    Village.focus();
                    swal("", "ગામ પસંદ કરો.", "warning");
                    return false;
                }
                else if (Division.value == "0") {
                    Division.focus();
                    swal("", "વિભાગ પસંદ કરો.", "warning");
                    return false;
                }
                else if (SubDivision.value == "0") {
                    SubDivision.focus();
                    swal("", "પેટા વિભાગ પસંદ કરો.", "warning");
                    return false;
                }

                else if ($("input[name='Sections']:checked").length == 0) {
                    swal("", "પેટા વિભાગ પસંદ કરો.", "warning");
                    return false;
                }

                else {

                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    var sectionvillagemapping = {};

                    if ($("[id=ContentPlaceHolder1_ddlDistrict]").val() != null)
                        sectionvillagemapping.DistrictID = $("[id=ContentPlaceHolder1_ddlDistrict]").val();

                    else
                        sectionvillagemapping.DistrictID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlTaluka]").val() != null)
                        sectionvillagemapping.TalukaID = $("[id=ContentPlaceHolder1_ddlTaluka]").val();

                    else
                        sectionvillagemapping.TalukaID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlVillage]").val() != null)
                        sectionvillagemapping.VillageID = $("[id=ContentPlaceHolder1_ddlVillage]").val();

                    else
                        sectionvillagemapping.VillageID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlDivision]").val() != null)
                        sectionvillagemapping.DivisionID = $("[id=ContentPlaceHolder1_ddlDivision]").val();

                    else
                        sectionvillagemapping.DivisionID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlSubDivision]").val() != null)
                        sectionvillagemapping.SubDivisionID = $("[id=ContentPlaceHolder1_ddlSubDivision]").val();

                    else
                        sectionvillagemapping.SubDivisionID = 0;

                    sectionvillagemapping.Sections = selectedsections;

                    sectionvillagemapping.SectionVillageMappingID = 0

                    $.ajax({
                        type: "POST",
                        url: "SectionVillageMapping.aspx/SectionVillageMappingManage",
                        data: '{sectionvillagemapping: ' + JSON.stringify(sectionvillagemapping) + '}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            var msg = response.d;
                            swal("Done!", msg, "success");
                            SectionVillageMappingGet(1);
                            $(["input[id='chk']:checked"]).prop("checked", true);
                            ClearAll();
                        },
                    });

                    //$(this).html(' <i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
                    ClearAll();
                    
                }
                if ($("#hdnSubmitVal").val() == "1") {
                    $("[id*=btnSave]").html("દાખલ કરો");
                    $("[id*=btnSave]").removeAttr('disabled');
                    $("#hdnSubmitVal").val(0);
                }
                return false;
            });
        });


        $(function () {
            $("[id=tab1]").attr("class", "active");
            $("#divFirst").css({ 'display': "block" });
            $("[id=ContentPlaceHolder1_ddlDistrict]").focus();

            if ($("[id=ContentPlaceHolder1_ddlDivision]").length == 1) {
                ListSubDivision($("[id=ContentPlaceHolder1_ddlDivision]").val(), 0);
            }
            else {
                ListSubDivision(0, 0);
            }
            if ($("[id=ContentPlaceHolder1_ddlSrchDivision]").length == 1) {
                ListSubDivisionSrch($("[id=ContentPlaceHolder1_ddlSrchDivision]").val(), 0);
            }
            else { ListSubDivisionSrch(0, 0); }

            ListTaluka(0, 0);
            ListTalukaSrch(0, 0);
            ListVillage(0, 0);
            ViewDiv1();
        });

        function SectionVillageMappingGet(pageIndex) {
            $.ajax({
                type: "POST",
                url: "SectionVillageMapping.aspx/GetSectionVillageMapping",
                data: '{SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '",SearchDistrictTerm: "' + SearchDistrictTerm() + '",SearchTalukaTerm: "' + SearchTalukaTerm() + '",pageIndex:'+pageIndex+'}',
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

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchDivision]").val());
        };

        function SearchSubDivisionWiseTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchSubDivision]").val());
        };

        function SearchSectionTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlSrchSection]").val());
        };

        function SearchDistrictTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlDistrictSrch]").val());
        };

        function SearchTalukaTerm() {
            return jQuery.trim($("[id=ContentPlaceHolder1_ddlTalukaSrch]").val());
        };

        var myrowe;
        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("SectionVillageMapping");
            if (myrowe == null) {
                myrowe = $("[id*=dgvSectionVillageMapping] tr:last-child").clone(true);
            }
            $("[id*=dgvSectionVillageMapping] tr").not($("[id*=dgvSectionVillageMapping] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    var SectionVillageMappingID = $(this).find("SectionVillageMappingID").text();
                    $("td", myrowe).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowe).eq(1).html($(this).find("DistrictNameG").text());
                    $("td", myrowe).eq(2).html($(this).find("TalukaNameG").text());
                    $("td", myrowe).eq(3).html($(this).find("VillageNameG").text());
                    $("td", myrowe).eq(4).html($(this).find("DivisionNameG").text());
                    $("td", myrowe).eq(5).html($(this).find("SubDivisionNameG").text());
                    $("td", myrowe).eq(6).html($(this).find("SectionNames").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", myrowe).eq(7).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return EditSectionVillageMapping(' + $(this).find("VillageID").text() + ');"><i class="fa fa-edit"></i></button>'));
                    }
                    else { $("td", myrowe).eq(7).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", myrowe).eq(8).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return DeleteSectionVillageMapping(' + $(this).find("VillageID").text() + ')";><i class="fa fa-trash"></i></button>'));
                    }
                    else { $("td", myrowe).eq(8).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=dgvSectionVillageMapping]").append(myrowe);
                    myrowe = $("[id*=dgvSectionVillageMapping] tr:last-child").clone(true);
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
                $("[id*=dgvSectionVillageMapping]").append(empty_myrowe);
            }
        };

        //$(".Pager").on("click", '.page', function () {
        //    SectionVillageMappingGet(parseInt($(this).attr('page')));
        //});

        function EditSectionVillageMapping(lnk) {

            $.ajax({
                type: "POST",
                url: "SectionVillageMapping.aspx/GetSectionVillageMappingDetail",
                data: '{VillageID: "' + JSON.stringify(lnk) + '"}',
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

            $("[id*=hdnSectionVillageMappingID]").val(res[0].SectionVillageMappingID);
            $("[id=ContentPlaceHolder1_ddlDistrict]").val(res[0].DistrictID);
            ListTaluka(res[0].DistrictID, res[0].TalukaID);
            ListVillage(res[0].TalukaID, res[0].VillageID);

            $("[id=ContentPlaceHolder1_ddlDivision]").val(res[0].DivisionID);
            ListSubDivision(res[0].DivisionID, res[0].SubDivisionID);

            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

            var Section = res[0].Sections;
            var arr = Section.split(",");
            $("[id*=hdnsections]").val(arr);
            FillSection(res[0].SubDivisionID);

            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteSectionVillageMapping(VillageID) {

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
                    url: "SectionVillageMapping.aspx/SectionVillageMappingDelete",
                    data: '{VillageID: ' + VillageID + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;
                        swal("Deleted!", msg, "success");
                        SectionVillageMappingGet(1);
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

    </script>
</asp:Content>

