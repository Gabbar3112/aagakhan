<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BeatMaster.aspx.cs" Inherits="BeatMaster" %>

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
            <li class="active">બીટની માહિતી</li>
        </ol>

    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">બીટ ઉમેરો/સુધારો</a></li>
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
                                            <asp:HiddenField ID="hdnBeatID" runat="server" />
                                            <label>વિભાગ </label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSubDivision" class="form-control" runat="server" onchange="return DisableData();"></asp:DropDownList>
                                            <label>પેટા વિભાગ </label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSection" class="form-control" runat="server"></asp:DropDownList>
                                            <label>સેક્શન </label>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtBeatName" class="form-control" runat="server" onblur="CheckAlreadyExists()" MaxLength="300" Style="text-transform: uppercase"></asp:TextBox>
                                                    <label>બીટ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtBeatNameG" class="form-control" runat="server" onchange="CheckAlreadyExistsBeatNameG()" MaxLength="300"></asp:TextBox>
                                                    <label>બીટ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtBeatCode" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                                    <label>બીટ કોડ </label>
                                                </div>
                                            </div>


                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtBeatCodeG" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                                    <label>બીટ કોડ (ગુજરાતી) </label>
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
                                            <asp:DropDownList ID="ddlSrchSubDivision" class="form-control" runat="server" onchange="BindSectionSrch()"></asp:DropDownList>
                                            <label>પેટા વિભાગ (ગુજરાતી)</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchSection" class="form-control" runat="server"></asp:DropDownList>
                                            <label>સેક્સન (ગુજરાતી)</label>
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

                                                    <asp:GridView ID="dgvBeatMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                        <Columns>

                                                            <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="CircleNameG" HeaderText="વર્તુળ" SortExpression="CircleNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ" SortExpression="DivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SubDivisionNameG" HeaderText="પેટા વિભાગ" SortExpression="SubDivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SectionNameG" HeaderText="સેક્સન" SortExpression="SectionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="BeatName" HeaderText="બીટ" SortExpression="BeatName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="BeatNameG" HeaderText="બીટ (ગુજરાતી)" SortExpression="BeatNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="BeatCode" HeaderText="બીટ કોડ" SortExpression="BeatCode" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="BeatCodeG" HeaderText="બીટ કોડ (ગુજરાતી)" SortExpression="BeatCodeG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
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
                                               <%-- </table>--%>
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
             GetCustomers(parseInt($(this).attr('page')));
         });

         var rights = "";
         $(function () {
             SetMenu("liMaster", "ulMaster", "libeatmaster", "aBeatMaster", "", "");
             var userid = '<%= Session["UserID"].ToString() %>';
             var logintype = '<%= Session["LoginType"].ToString() %>';
             var formnameid = "aBeatMaster";
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
             $("[id=ContentPlaceHolder1_ddlCircle]").focus();
             var cir = $("[id*=ddlCircle]").val();

             ListCircle();
             ListDivison(0, 0);

             ListSubDivision(0, 0);

             ListSection(0, 0);


         });


         $("#btnFindUser").bind("click", function () {
             $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
             $("[id*=btnFindUser]").attr('disabled', 'disabled');
             $("#hdnFindUser").val("1");
             $("#divGrid").css({ 'display': "block" });
             //$("#Div1").css({ 'display': "block" });
            // GetCustomers(1);
             GetCustomers(1);
             if ($("#hdnFindUser").val() == "1") {
                 $("[id*=btnFindUser]").html("માહિતી શોધો");
                 $("[id*=btnFindUser]").removeAttr('disabled');
                 $("#hdnFindUser").val(0);
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

             ListCircleSrch();

             ListDivisonSrch(0, 0);

             ListSubDivisionSrch(0, 0);

             ListSectionSrch(0, 0);
             GetCustomers(1);
         }

         function DisableData() {

             if ($("[id*=ddlSubDivision] > option").length == 1) {
                 ListSection($("[id*=ContentPlaceHolder1_ddlSubDivision]").val(), 0);

             } else {
                 BindSection();
             }
         };

         function CheckAlreadyExists() {

            var beatnametooltip = document.getElementById('<%= txtBeatName.ClientID %>').title;
            var beatName = document.getElementById('<%= txtBeatName.ClientID %>');
            var sectionid = document.getElementById('<%= ddlSection.ClientID %>');

             if (beatnametooltip != "") {
                 if (beatNameG.value != beatnametooltip) {
                     $.ajax({
                         type: "POST",
                         url: "BeatMaster.aspx/CheckBeatName",
                         data: '{BeatName: "' + beatName.value + '", SectionID: "' + sectionid.value + '"}',
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
                                 beatName.focus();
                                 swal("", "બીટ પહેલેથી દાખલ કરેલ છે.", "warning");
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
                 if (beatName.value != "") {
                     $.ajax({
                         type: "POST",
                         url: "BeatMaster.aspx/CheckBeatName",
                         data: '{BeatName: "' + beatName.value + '", SectionID: "' + sectionid.value + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == false) {
                                 $('#btnSave').attr('disabled', false);
                                 return true;
                             }
                             else {
                                 $('#btnSave').attr('disabled', true);
                                 beatName.focus();
                                 swal("", "બીટ પહેલેથી દાખલ કરેલ છે.", "warning");
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

         function CheckAlreadyExistsBeatNameG() {

             var beatnameGtooltip = document.getElementById('<%= txtBeatNameG.ClientID %>').title;
             var beatNameG = document.getElementById('<%= txtBeatNameG.ClientID %>');
             var sectionid = document.getElementById('<%= ddlSection.ClientID %>');

             if (beatnameGtooltip != "") {
                 if (beatNameG.value != beatnameGtooltip) {
                     $.ajax({
                         type: "POST",
                         url: "BeatMaster.aspx/CheckBeatNameG",
                         data: '{BeatNameG: "' + beatNameG.value + '", SectionID: "' + sectionid.value + '"}',
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
                                 beatNameG.focus();
                                 swal("", "બીટ પહેલેથી દાખલ કરેલ છે. (ગુજરાતી)", "warning");
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
                 if (beatNameG.value != "") {
                     $.ajax({
                         type: "POST",
                         url: "BeatMaster.aspx/CheckBeatNameG",
                         data: '{BeatNameG: "' + beatNameG.value + '", SectionID: "' + sectionid.value + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == false) {
                                 $('#btnSave').attr('disabled', false);
                                 return true;
                             }
                             else {
                                 $('#btnSave').attr('disabled', true);
                                 beatNameG.focus();
                                 swal("", "બીટ પહેલેથી દાખલ કરેલ છે. (ગુજરાતી)", "warning");
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

         function ClearAll() {
             
            $("[id=ContentPlaceHolder1_txtBeatName]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtBeatNameG]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtBeatName]").val('');
            $("[id=ContentPlaceHolder1_txtBeatNameG]").val('');
            $("[id=ContentPlaceHolder1_txtBeatCode]").val('');
            $("[id=ContentPlaceHolder1_txtBeatCodeG]").val('');
            $("[id*=hdnBeatID]").val('');

             ListCircle();
             ListDivison(0, 0);
             ListDivisonSrch(0, 0);
             ListSubDivision(0, 0);
             ListSubDivisionSrch(0, 0);
             ListSection(0, 0);
             ListSectionSrch(0, 0);
             $("[id=ContentPlaceHolder1_ddlCircle]").val('0');

            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
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

         function BindDivisionSrch() {
             ListDivisonSrch($("[id*=ContentPlaceHolder1_ddlSrchCircle]").val(), 0);
             if ($("[id*=ContentPlaceHolder1_ddlSrchCircle]").val() == 0) {
                 ListDivisonSrch(0, 0);
                 ListSubDivisionSrch(0, 0);
                 ListSectionSrch(0, 0);
             }
             else {
                 ListSubDivisionSrch(0, 0);
                 ListSectionSrch(0, 0);
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



        $(function () {

            $("[id=tab1]").attr("class", "active");

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
                var beatid = $("[id*=hdnBeatID]").val();
                var ddlCircle = document.getElementById("ContentPlaceHolder1_ddlCircle");
                var ddlDivision = document.getElementById("ContentPlaceHolder1_ddlDivision");
                var ddlSubDivision = document.getElementById("ContentPlaceHolder1_ddlSubDivision");
                var ddlSection = document.getElementById("ContentPlaceHolder1_ddlSection");
                var beatname = document.getElementById("ContentPlaceHolder1_txtBeatName");
                var beatnameg = document.getElementById("ContentPlaceHolder1_txtBeatNameG");
                var beatcode = document.getElementById("ContentPlaceHolder1_txtBeatCode");
                var beatcodeg = document.getElementById("ContentPlaceHolder1_txtBeatCodeG");


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
                else if (ddlSection.value == "0") {
                    ddlSection.focus();
                    swal("", "સેક્શન પસંદ કરો", "warning");
                    return false;
                }
                else if (beatname.value == "") {
                    beatname.focus();
                    swal("", "બીટ નામ દાખલ કરો", "warning");
                    return false;
                }
                else if (beatnameg.value == "") {
                    beatnameg.focus();
                    swal("", "બીટ નામ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (beatcode.value == "") {
                    beatcode.focus();
                    swal("", "બીટ કોડ દાખલ કરો", "warning");
                    return false;
                }
                else if (beatcodeg.value == "") {
                    beatcodeg.focus();
                    swal("", "બીટ કોડ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    //$(this).html('<i class="ace-icon fa fa-spinner fa-spin  bigger-125"></i>પ્રતિક્ષા કરો');
                    var beat = {};

                    beat.SectionID = $("[id*=ContentPlaceHolder1_ddlSection]").val();
                    beat.BeatName = $("[id*=ContentPlaceHolder1_txtBeatName]").val();
                    beat.BeatNameG = $("[id*=ContentPlaceHolder1_txtBeatNameG]").val();
                    beat.BeatCode = $("[id*=ContentPlaceHolder1_txtBeatCode]").val();
                    beat.BeatCodeG = $("[id*=ContentPlaceHolder1_txtBeatCodeG]").val();

                    if (beatid == "")
                        beat.BeatID = 0
                    else
                        beat.BeatID = beatid;

                    $.ajax({
                        type: "POST",
                        url: "BeatMaster.aspx/BeatManage",
                        data: '{beat: ' + JSON.stringify(beat) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg=response.d;
                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                                return false;
                            }
                            else if ($("[id*=hdnBeatID]").val() != "") {
                                swal("Updated", "બીટની માહિતી સુધારાઈ ગઈ છે.", "success");
                                GetCustomers(1);
                                ClearAll();
                            }
                            else {
                                swal("Inserted", "બીટની માહિતી દાખલ થઇ ગઈ છે.", "success");
                                GetCustomers(1);
                                //clearall();
                                $("[id=ContentPlaceHolder1_txtBeatName]").val('');
                                $("[id=ContentPlaceHolder1_txtBeatNameG]").val('');
                                $("[id=ContentPlaceHolder1_txtBeatCode]").val('');
                                $("[id=ContentPlaceHolder1_txtBeatCodeG]").val('');

                                $("#ContentPlaceHolder1_ddlDivision").prop("disabled", true);
                                $("#ContentPlaceHolder1_ddlSubDivision").prop("disabled", true);
                                $("#ContentPlaceHolder1_ddlCircle").prop("disabled", true);
                                $("#ContentPlaceHolder1_ddlSection").prop("disabled", true);

                            }
                            if ($("#hdnSubmitVal").val() == "1") {
                                $("[id*=btnSave]").html("દાખલ કરો");
                                $("[id*=btnSave]").removeAttr('disabled');
                                $("#hdnSubmitVal").val(0);
                            }
                        }
                    });
                    //$(this).html('<i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
                    return false;
                }
            });

        });

        function EditBeat(lnk) {
            $.ajax({
                type: "POST",
                url: "BeatMaster.aspx/GetBeatDetail",
                data: '{BeatID: "' + JSON.stringify(lnk) + '"}',
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
            $("[id=ContentPlaceHolder1_txtBeatName]").attr('title', res[0].BeatName);
            $("[id=ContentPlaceHolder1_txtBeatNameG]").attr('title', res[0].BeatNameG);
            $("[id=ContentPlaceHolder1_ddlCircle]").val(res[0].CircleID);
            $("[id=ContentPlaceHolder1_ddlCircle]").removeAttr("disabled");
            //$("[id*=ContentPlaceHolder1_ddlDivision]").val(res[0].DivisionID);
            $("[id=ContentPlaceHolder1_ddlDivision]").removeAttr("disabled");
            //$("[id*=ContentPlaceHolder1_ddlSubDivision]").val(res[0].SubDivisionID);
            $("[id=ContentPlaceHolder1_ddlSubDivision]").removeAttr("disabled");
            //$("[id*=ContentPlaceHolder1_ddlSection]").val(res[0].SectionID);
            $("[id=ContentPlaceHolder1_ddlSection]").removeAttr("disabled");
            $("[id=ContentPlaceHolder1_txtBeatName]").val(res[0].BeatName);
            $("[id=ContentPlaceHolder1_txtBeatNameG]").val(res[0].BeatNameG);
            $("[id=ContentPlaceHolder1_txtBeatCode]").val(res[0].BeatCode);
            $("[id=ContentPlaceHolder1_txtBeatCodeG]").val(res[0].BeatCodeG);
            $("[id*=hdnBeatID]").val(res[0].BeatID);
            ListDivison(res[0].CircleID, res[0].DivisionID);
             ListSubDivision(res[0].DivisionID, res[0].SubDivisionID);
            ListSection(res[0].SubDivisionID, res[0].SectionID);
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");

        }
       
        $("[id*=txtSearch]").on("keyup", function () {
            GetCustomers(parseInt(1));
        });
        //$(".Pager").on("click", '.page', function () {
        //    GetCustomers(parseInt($(this).attr('page')));
        //});

        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };

        function GetCustomers(pageIndex) {
           
            $.ajax({
                type: "POST",
                url: "BeatMaster.aspx/GetBeatMaster",
                //data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '", pageIndex: ' + pageIndex + '}',
                data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '", pageIndex: ' + pageIndex + '}',
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
            var customers = xml.find("BeatDetail");
            if (row == null) {
                row = $("[id*=dgvBeatMaster] tr:last-child").clone(true);
            }
            $("[id*=dgvBeatMaster] tr").not($("[id*=dgvBeatMaster] tr:first-child")).remove();
            if (customers.length > 0) {
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("CircleNameG").text());
                    $("td", row).eq(2).html($(this).find("DivisionNameG").text());
                    $("td", row).eq(3).html($(this).find("SubDivisionNameG").text());
                    $("td", row).eq(4).html($(this).find("SectionNameG").text());
                    $("td", row).eq(5).html($(this).find("BeatName").text());
                    $("td", row).eq(6).html($(this).find("BeatNameG").text());
                    $("td", row).eq(7).html($(this).find("BeatCode").text());
                    $("td", row).eq(8).html($(this).find("BeatCodeG").text());


                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", row).eq(9).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return EditBeat(' + $(this).find("BeatID").text() + ')";><i class="fa fa-edit"></i> </button>'));
                    }
                    else { $("td", row).eq(9).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", row).eq(10).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return DeleteBeat(' + $(this).find("BeatID").text() + ')";><i class="fa fa-trash"></i> </button>'));
                    }
                    else { $("td", row).eq(10).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=dgvBeatMaster]").append(row);
                    row = $("[id*=dgvBeatMaster] tr:last-child").clone(true);
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

            //    $(".BeatName").each(function () {
            //        var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
            //        $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
            //    });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=dgvBeatMaster]").append(empty_row);
            }
        };

        function SearchCircleWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchCircle]").val());
        };

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id*=ContentPlaceHolder1_ddlSrchDivision]").val());
        };

        function SearchSubDivisionWiseTerm() {
            return jQuery.trim($("[id*=ContentPlaceHolder1_ddlSrchSubDivision]").val());
        };

        function SearchSectionTerm() {
            return jQuery.trim($("[id*=ContentPlaceHolder1_ddlSrchSubSection]").val());
        };

        function DeleteBeat(lnk) {
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
                    url: "BeatMaster.aspx/DeleteBeat",
                    data: '{BeatID : ' + JSON.stringify(lnk) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        swal("Deleted!", "બીટની માહિતી રદ થઇ ગઈ છે.", "success");
                        GetCustomers();
                    },
                    error: function (err) {
                        swal(err);
                        swal(err.text);
                    }
                });
            });
        }

        function DisableData() {

            if ($("[id*=ddlSubDivision] > option").length == 1) {
                ListSection($("[id*=ContentPlaceHolder1_ddlSubDivision]").val(), 0);

            } else {
                BindSection();
            }
        };

        $("#btnSet").bind("click", function () {
            $("[id*=btnSet]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSet]").attr('disabled', 'disabled');
            $("#hdnSet").val("1");
            if ($("[id=ContentPlaceHolder1_ddlCircle] > option").length == 1) {
                ListDivison($("[id=ContentPlaceHolder1_ddlCircle]").val(), 0);
                 ListSubDivision($("[id=ContentPlaceHolder1_ddlDivision]").val(), 0);
                ListSection($("#ContentPlaceHolder1_ddlSubDivision").value, 0);
            }
            else {
                $("[id=ContentPlaceHolder1_ddlCircle]").val('0');
                ListDivison(0, 0);
                 ListSubDivision(0, 0);
                ListSection(0, 0);
            }
            //ListDivison($("#ContentPlaceHolder1_ddlCircle").value, 0);
            //ListSubDivison($("#ContentPlaceHolder1_ddlDivision").value, 0);

            $("#ContentPlaceHolder1_ddlCircle").prop("disabled", false);
            $("#ContentPlaceHolder1_ddlDivision").prop("disabled", false);
            $("#ContentPlaceHolder1_ddlSubDivision").prop("disabled", false);
            $("#ContentPlaceHolder1_ddlSection").prop("disabled", false);

            if ($("#hdnSet").val() == "1") {
                $("[id*=btnSet]").html("ફરી સેટ કરો");
                $("[id*=btnSet]").removeAttr('disabled');
                $("#hdnSet").val(0);
            }
        });

    </script>

</asp:Content>

