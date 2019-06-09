<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InstituteVillageMapping.aspx.cs" Inherits="InstituteVillageMapping" %>

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
            <li class="active">પિયત મંડળી પ્રમાણે ગામની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">પિયત મંડળી પ્રમાણે ગામની માહિતી ઉમેરો/સુધારો</a></li>
                            <li id="tab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>

                        </ul>
                    </div>
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlInstitute" class="form-control" runat="server">
                                            </asp:DropDownList>
                                            <label>પિયત મંડળી</label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlDivision" class="form-control" runat="server" onchange="BindSubDivision()"></asp:DropDownList>
                                            <label>વિભાગ</label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSubDivision" class="form-control" runat="server" onchange="BindSection()"></asp:DropDownList>
                                            <label>પેટા વિભાગ</label>
                                        </div>

                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control" onchange="BindVillages(this.value);"></asp:DropDownList>
                                            <label>સેક્શન</label>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-sm-8">
                                                    <div id="divVillages" class="col-sm-10 col-md-10">
                                                        <label>--ગામ પસંદ કરો--</label>
                                                    </div>
                                                    <input type="hidden" id="hdnvillages" />
                                                    <input type="hidden" id="hdnvillagearea" />
                                                    <input type="hidden" id="hdnSectionID" />
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
                                            <asp:DropDownList ID="ddlSrchDivision" class="form-control" runat="server" onchange="BindSubDivisionSrch()"></asp:DropDownList>

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

                                                <asp:GridView ID="dgvInstituteVillageMapping" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>

                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="InstituteNameG" HeaderText="પિયત મંડળી" SortExpression="InstituteNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="SectionNameG" HeaderText="સેક્સન" SortExpression="SectionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Villages" HeaderText="ગામ" SortExpression="Villages" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="VillageAreas" HeaderText="વિસ્તાર" SortExpression="VillageAreas" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />

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

    <script type="text/javascript">

        $(".Pager").on("click", '.page', function () {
            InstituteVillageMappingGet(parseInt($(this).attr('page')));
        });


        $("#btnFindUser").bind("click", function () {
            $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnFindUser]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");

            $("#divGrid").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "block" });
            InstituteVillageMappingGet(1);

            if ($("#hdnFindUser").val() == "1") {
                $("[id*=btnFindUser]").html("માહિતી શોધો");
                $("[id*=btnFindUser]").removeAttr('disabled');
                $("#hdnFindUser").val(0);
            }
        });

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_ddlInstitute]").focus();
            //if ($("[id=ContentPlaceHolder1_ddlDivision] > option").length == 1) {
            //    BindSubDivision();
            //}
            //ClearAll();
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            ListDivisionByUserSrch();
            ListSubDivisionSrch(0, 0);
            ListSectionSrch(0, 0);
            InstituteVillageMappingGet(1);
        }

        var rights = "";
        $(function () {
            SetMenu("liTransaction", "ulTransaction", "liinstitutevillagemapping", "aInstituteVillageMapping", "", "");
            var userid = '<%= Session["UserID"].ToString() %>';
             var logintype = '<%= Session["LoginType"].ToString() %>';
             var formnameid = "aInstituteVillageMapping";
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


             $("[id=ContentPlaceHolder1_ddlInstitute]").focus();
             $("[id=tab1]").attr("class", "active");
             ListDivisionByUser();
             ListSubDivision(0, 0);
             ListSection(0, 0);
             ListInstitute();
         })

         function ListInstitute() {

             $.ajax({
                 type: "POST",
                 url: "CommonMethods.aspx/ListInstituteByUser",
                 data: '{}',
                 async: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (r) {

                     var ddlCategory = $("[id=ContentPlaceHolder1_ddlInstitute]");
                     $("[id=ContentPlaceHolder1_ddlInstitute]").empty();

                     

                    $.each(r.d, function () {
                        if ('<%= Session["LoginType"].ToString() %>' == "Institute" && this['Value'] == '<%= Session["UserID"].ToString() %>') {
                            
                            ddlCategory.append($("<option selected></option>").val('<%= Session["UserID"].ToString() %>').html(this['Text']));

                            document.getElementById("<%=this.ddlInstitute.ClientID %>").disabled = true;
                        }
                        else {
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                        }
                    });
                }
            });
            return false;
        }

        function ListDivisionByUserSrch() {

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
        function ListDivisionByUser() {

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
                    BindVillages($("[id=ContentPlaceHolder1_ddlSection]").val());

                }
            });

        }

        function BindSectionSrch() {
            ListSectionSrch($("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").val(), 0);
            if ($("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").val() == 0) {
                ListSectionSrch(0, 0);
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

        function BindVillages(SectionID) {

            $.ajax({
                type: "POST",
                url: "InstituteVillageMapping.aspx/CheckInstituteMappingFromSectionExist",
                data: '{SectionID : ' + SectionID + ',InstituteID : ' + $("[id=ContentPlaceHolder1_ddlInstitute]").val() + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var res = response.d;

                    if (res == true) {
                        $("[id*=hdnSectionID]").val(SectionID);
                        $.ajax({
                            type: "POST",
                            url: "InstituteVillageMapping.aspx/ListVillageBySection",
                            data: '{SectionID : "' + SectionID + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {

                                var strGroups = "";
                                var xmlDoc = $.parseXML(response.d);
                                var xml = $(xmlDoc);
                                var customers = xml.find("Institute");

                                if (customers.length > 0) {

                                    $.each(customers, function () {
                                        var customer = $(this);

                                        var villageid = $(this).find("VillageID").text();
                                        var villagearea = $(this).find("VillageArea").text();
                                        var villagename = $(this).find("VillageNameG").text();
                                        var flag = $(this).find("flag").text();

                                        if ($("[id*=hdnSectionID]").val() != "") {
                                            if (flag == "true") {

                                                strGroups += "<div class='col-md-8 col-xs-12 col-sm-12 inputwidth' id='chk" + villageid + "'><div class='col-md-4 col-xs-6'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'> <input class='ace input-lg'  type='checkbox' onchange='openinput(this," + villageid + ")' checked='true' name='villages' text='" + villagename + "' value='" + villageid + "' /><span class='lbl'>&nbsp;&nbsp;" + villagename + "</span></label></div></div><div class='col-md-5 col-xs-7 form-group'><input type='text' value=" + villagearea + "  onkeypress='return isDecimalKey(event);'  class='form-control' id='txtarea" + villageid + "'/></div></div>";
                                            }
                                            else
                                                strGroups += "<div class='col-md-8 col-xs-12 col-sm-12 inputwidth' id='chk" + villageid + "'><div class='col-md-4 col-xs-6'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'> <input class='ace input-lg'  type='checkbox' onchange='openinput(this," + villageid + ")'  name='villages' text='" + villagename + "' value='" + villageid + "' /><span class='lbl'>&nbsp;&nbsp;" + villagename + "</span></label></div></div><div class='col-md-5 col-xs-7 form-group'><input style='display:none' type='text'  onkeypress='return isDecimalKey(event);'  class='form-control' id='txtarea" + villageid + "'/></div></div>";
                                        }
                                        else {

                                            strGroups += "  <div class='col-md-8 col-xs-12 col-sm-12 inputwidth'> <div class='col-md-4 col-xs-6'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'><input id='chk" + villageid + "' type='checkbox' class='ace input-lg'  onchange='openinput(this," + villageid + ")' name='villages' text='" + villagename + "' value='" + villageid + "' /><span class='lbl'>&nbsp;&nbsp;" + villagename + "</span></label></div></div><div class='col-md-5 col-xs-7 form-group'><input style='display:none' type='text' onkeypress='return isDecimalKey(event);' class='form-control' id='txtarea" + villageid + "'/></div></div>";
                                        }
                                    });
                                    $("#divVillages").html(strGroups);
                                }
                                else {
                                    $('input[name="villages"]:checked').removeAttr('checked');
                                    $("[id*=hdnvillages]").val('');
                                    $("#divVillages").html('--ગામ પસંદ કરો--');
                                }
                            }
                        });
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: "InstituteVillageMapping.aspx/ListVillageBySection",
                            data: '{SectionID : "' + SectionID + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {

                                var strGroups = "";
                                var xmlDoc = $.parseXML(response.d);
                                var xml = $(xmlDoc);
                                var customers = xml.find("Institute");

                                if (customers.length > 0) {

                                    $.each(customers, function () {
                                        var customer = $(this);

                                        var villageid = $(this).find("VillageID").text();
                                        var villagearea = $(this).find("VillageArea").text();
                                        var villagename = $(this).find("VillageNameG").text();
                                        var flag = $(this).find("flag").text();

                                        if ($("[id*=hdnSectionID]").val() != "") {
                                            if (flag == "true") {

                                                strGroups += "<div class='col-md-8 col-xs-12 col-sm-12 inputwidth' id='chk" + villageid + "'><div class='col-md-4 col-xs-6'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'> <input class='ace input-lg'  type='checkbox'  checked='true' name='villages' text='" + villagename + "' value='" + villageid + "' /><span class='lbl'>&nbsp;&nbsp;" + villagename + "</span></label></div></div><div class='col-md-4 col-xs-7 form-group'><input type='text' value=" + villagearea + "  onkeypress='return isDecimalKey(event);'  class='form-control' id='txtarea" + villageid + "'/></div></div>";
                                            }
                                            else
                                                strGroups += "<div class='col-md-8 col-xs-12 col-sm-12 inputwidth' id='chk" + villageid + "'><div class='col-md-4 col-xs-6'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'> <input class='ace input-lg'  type='checkbox' onchange='openinput(this," + villageid + ")'  name='villages' text='" + villagename + "' value='" + villageid + "' /><span class='lbl'>&nbsp;&nbsp;" + villagename + "</span></label></div></div><div class='col-md-4 col-xs-7 form-group'><input style='display:none' type='text'  onkeypress='return isDecimalKey(event);'  class='form-control' id='txtarea" + villageid + "'/></div></div>";
                                        }
                                        else {

                                            strGroups += "  <div class='col-md-8 col-xs-12 col-sm-12 inputwidth'> <div class='col-md-4 col-xs-6'><div class='checkbox checkbox-inline checkbox-styled'><label class='block'><input id='chk" + villageid + "' type='checkbox' class='ace input-lg'  onchange='openinput(this," + villageid + ")' name='villages' text='" + villagename + "' value='" + villageid + "' /><span class='lbl'>&nbsp;&nbsp;" + villagename + "</span></label></div></div><div class='col-md-4 col-xs-7 form-group'><input style='display:none' type='text' onkeypress='return isDecimalKey(event);' class='form-control' id='txtarea" + villageid + "'/></div></div>";
                                        }
                                    });
                                    $("#divVillages").html(strGroups);
                                }
                                else {
                                    $('input[name="villages"]:checked').removeAttr('checked');
                                    $("[id*=hdnvillages]").val('');
                                    $("#divVillages").html('--ગામ પસંદ કરો--');
                                }
                            }
                        });
                    }
                }
            });
        }


        function openinput(village, villageid) {

            if ($(village).is(':checked') == true) {
                var vval = $('#divVillages').find('#txtarea' + villageid);
                vval.css("display", "block");
            }
            else {
                var vval = $('#divVillages').find('#txtarea' + villageid);
                vval.css("display", "none");
                vval.val('');
            }
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
                var listvillageschecked = [];
                var listvillagesarea = [];

                var Institute = document.getElementById("ContentPlaceHolder1_ddlInstitute");
                var Division = document.getElementById("ContentPlaceHolder1_ddlDivision");
                var SubDivision = document.getElementById("ContentPlaceHolder1_ddlSubDivision");
                var Section = document.getElementById("ContentPlaceHolder1_ddlSection");

                var reschk;
                if ($('input[name="villages"]:checked').length > 0) {

                    $('input[name="villages"]:checked').each(function () {

                        var vval = $('#divVillages').find('#txtarea' + this.value);

                        if (vval.val() == "") {
                            vval.focus();
                            swal("", "વિસ્તાર દાખલ કરો", "warning");
                            reschk = "0";
                        }
                        else {
                            listvillages.push(this.value + ":" + vval.val());
                            listvillagesarea.push(vval.val());
                            reschk = "1";
                        }

                    })

                }

                var selectedvillages = listvillages.join(',');

                if (Institute.value == "0") {
                    Institute.focus();
                    swal("", "પિયત મંડળી પસંદ કરો", "warning");
                    return false;
                }
                else if (Division.value == "0") {
                    Division.focus();
                    swal("", "વિભાગ પસંદ કરો", "warning");
                    return false;
                }
                else if (SubDivision.value == "0") {
                    SubDivision.focus();
                    swal("", "પેટા વિભાગ પસંદ કરો", "warning");
                    return false;
                }
                else if (Section.value == "0") {
                    Section.focus();
                    swal("", "સેક્સન પસંદ કરો", "warning");
                    return false;
                }
                else if ($("input[name='villages']:checked").length == 0) {
                    swal("", "ગામ પસંદ કરો", "warning");
                    return false;
                }
                else if (reschk == "0") {
                    swal("", "વિસ્તાર દાખલ કરો", "warning");
                    return false;
                }
                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    //$(this).html('<i class="ace-icon fa fa-spinner fa-spin bigger-125"></i>પ્રતિક્ષા કરો');

                    var institutevillagemapping = {};

                    if ($("[id=ContentPlaceHolder1_ddlInstitute]").val() != null)
                        institutevillagemapping.InstituteID = $("[id=ContentPlaceHolder1_ddlInstitute]").val();
                    else
                        institutevillagemapping.InstituteID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlDivision]").val() != null)
                        institutevillagemapping.DivisionID = $("[id=ContentPlaceHolder1_ddlDivision]").val();
                    else
                        institutevillagemapping.DivisionID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlSubDivision]").val() != null)
                        institutevillagemapping.SubDivisionID = $("[id=ContentPlaceHolder1_ddlSubDivision]").val();
                    else
                        institutevillagemapping.SubDivisionID = 0;

                    if ($("[id=ContentPlaceHolder1_ddlSection]").val() != null)
                        institutevillagemapping.SectionID = $("[id=ContentPlaceHolder1_ddlSection]").val();
                    else
                        institutevillagemapping.SectionID = 0;

                    institutevillagemapping.Villages = selectedvillages;

                    $.ajax({
                        type: "POST",
                        url: "InstituteVillageMapping.aspx/InstituteVillageMappingManage",
                        data: '{institutevillagemapping: ' + JSON.stringify(institutevillagemapping) + '}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            var msg = response.d;
                            swal("Done!", msg, "success");
                            InstituteVillageMappingGet(1);
                            $(["input[id='chk']:checked"]).prop("checked", true);
                            ClearAll();
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

        function InstituteVillageMappingGet(pageIndex) {

            $.ajax({
                type: "POST",
                url: "InstituteVillageMapping.aspx/GetInstituteVillageMapping",
                data: '{SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '",pageIndex:'+pageIndex+'}',
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
            var customers = xml.find("InstituteVillageMapping");
            if (myrowe == null) {
                myrowe = $("[id*=dgvInstituteVillageMapping] tr:last-child").clone(true);
            }
            $("[id*=dgvInstituteVillageMapping] tr").not($("[id*=dgvInstituteVillageMapping] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    $("td", myrowe).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowe).eq(1).html($(this).find("InstituteNameG").text());
                    $("td", myrowe).eq(2).html($(this).find("SectionNameG").text());
                    $("td", myrowe).eq(3).html($(this).find("Villages").text());
                    $("td", myrowe).eq(4).html($(this).find("VillageAreas").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", myrowe).eq(5).html($('<button type=button  class="btn btn-flat ink-reaction btn-default" onclick="return EditInstituteVillageMapping(' + $(this).find("ID").text() + ');"><i class="fa fa-edit"></i></button>'));
                    }
                    else { $("td", myrowe).eq(5).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", myrowe).eq(6).html($('<button  class="btn btn-flat ink-reaction btn-default" onclick="return DeleteInstituteVillageMapping(' + $(this).find("ID").text() + ')";><i class="fa fa-trash"></i></button>'));
                    }
                    else { $("td", myrowe).eq(6).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=dgvInstituteVillageMapping]").append(myrowe);
                    myrowe = $("[id*=dgvInstituteVillageMapping] tr:last-child").clone(true);
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
                $("[id*=dgvInstituteVillageMapping]").append(empty_myrowe);
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

        function EditInstituteVillageMapping(lnk) {

            $.ajax({
                type: "POST",
                url: "InstituteVillageMapping.aspx/GetInstituteVillageMappingDetailBySection",
                data: '{SectionID: "' + JSON.stringify(lnk) + '"}',
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
            $("[id=ContentPlaceHolder1_ddlInstitute]").val(res[0].InstituteID);
            $("[id*=hdnSectionID]").val(res[0].SectionID);
            $("[id=ContentPlaceHolder1_ddlDivision]").val(res[0].DivisionID);
            ListSubDivision(res[0].DivisionID, res[0].SubDivisionID)
            ListSection(res[0].SubDivisionID, res[0].SectionID);
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            var Village = res[0].Villages;
            var arr = Village.split(",");
            $("[id*=hdnvillages]").val(arr);
            $("#ContentPlaceHolder1_ddlInstitute").prop("disabled", true);
            $("#ContentPlaceHolder1_ddlDivision").prop("disabled", true);
            $("#ContentPlaceHolder1_ddlSubDivision").prop("disabled", true);
            $("#ContentPlaceHolder1_ddlSection").prop("disabled", true);
            BindVillages(res[0].SectionID);
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteInstituteVillageMapping(SectionID) {

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
                    url: "InstituteVillageMapping.aspx/InstituteVillageMappingDelete",
                    data: '{SectionID: ' + JSON.stringify(SectionID) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;
                        swal("Deleted!", msg, "success");

                        InstituteVillageMappingGet(1);

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

            $("[id=ContentPlaceHolder1_ddlInstitute]").val('0');
            //$("[id*=ddlDivision]").val('0');
            $('input[name="villages"]:checked').removeAttr('checked');
            $("#divVillages").html('--ગામ પસંદ કરો--');
            $('#divVillages').find('#txtarea').remove();

            //if ($("[id=ContentPlaceHolder1_ddlDivision] > option").length == 1) {
            //   ListSubDivison($("[id=ContentPlaceHolder1_ddlDivision]").val(), 0);
            //    $('input[name="Sections"]:checked').removeAttr('checked');
            //}
            //else {
            $("[id=ContentPlaceHolder1_ddlDivision]").val('0');
            // $('input[name="Sections"]:checked').removeAttr('checked');
            // $("#divCircles").html('--પેટા વિભાગ પસંદ કરો--');
            ListSubDivision(0, 0);
            // }
            //if ($("[id=ContentPlaceHolder1_ddlSrchDivision] > option").length == 1) {
            //   ListSrchSubDivision($("[id=ContentPlaceHolder1_ddlSrchDivision]").val(), 0);
            //}
            //else {
            //  ListSrchSubDivision(0, 0);
            //}

            $("#ContentPlaceHolder1_ddlInstitute").prop("disabled", false);
            $("#ContentPlaceHolder1_ddlDivision").prop("disabled", false);
            //ListSrchSubDivision(0, 0);
            //ListSrchSection(0, 0);
            //ListSubDivision(0, 0);
            ListSection(0, 0);
        }

    </script>

</asp:Content>

