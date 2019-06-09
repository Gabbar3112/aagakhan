<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserRights.aspx.cs" Inherits="UserRights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">સર્વાધિકાર </li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">સર્વાધિકાર ઉમેરો/સુધારો</a></li>

                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" onchange="BindUser()" DataSourceID="dsUserType" DataTextField="UserType" DataValueField="UserTypeID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="dsUserType" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>' SelectCommand="ListUserTypeForRights" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    <label>વપરાશકર્તા નાં પ્રકાર</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlUsers" runat="server" CssClass="form-control" onchange="GetFormType()"></asp:DropDownList>
                                                    <label>વપરાશકર્તા</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" id="divInstitute">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlInstitute" runat="server" onchange="GetFormTypeInstitute()" CssClass="form-control"></asp:DropDownList>
                                                    <label>પિયત મંડળી</label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row" id="divGrid" style="display: none;">
                                            <div class="col-lg-12">
                                                <div class="table-responsive">

                                                    <asp:GridView ID="gvUserRights" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="Form Type">
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Form">
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            SetMenu("liUtility", "ulUtility", "liuserrights", "aUserRights", "", "");
            //BindUserDesignation();
            $("[id*=divGrid]").css({ 'display': 'none' });
            $("[id*=btnSave]").css({ 'display': 'none' });
            $("[id*=btnReset]").css({ 'display': 'none' });
            $("[id*=divInstitute]").css({ 'display': 'none' }); 
            BindUser(0);
            BindInstitute(0);

        });

        function BindUser(selectedusertypeid) {
            var usertypeid = $("[id*=ddlUserType]").val();

            if (usertypeid == "0") {
                $("[id*=divGrid]").css({ 'display': 'none' });
                $("[id*=btnSave]").css({ 'display': 'none' });
                $("[id*=btnReset]").css({ 'display': 'none' });
            }
            //else {
            //    $("[id*=divGrid]").css({ 'display': 'block' });
            //    $("[id*=btnSave]").css({ 'display': 'block' });
            //    $("[id*=btnReset]").css({ 'display': 'block' });
            //}

            if (usertypeid == "4") {
                $("[id*=divInstitute]").css({ 'display': 'block' });
            }
            else {
                $("[id*=divInstitute]").css({ 'display': 'none' });
            }

            $.ajax({
                method: "POST",
                url: "UserRights.aspx/BindUser",
                data: '{UserTypeID:' + JSON.stringify(usertypeid) + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlUser = $("[id*=ddlUsers]");
                    $("[id*=ddlUsers]").empty();
                    $.each(r.d, function () {

                        //ddlUser.append($("<option></option>").val(this['Value']).html(this['Text']));

                        if (selectedusertypeid == this['Value'])
                            ddlUser.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlUser.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                },
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                    swal(response.d);
                },
            });
        }

        function BindInstitute(selectedclusterid) {

            var clusterid = $("[id*=ddlUsers]").val();
            
            $.ajax({
                method: "POST",
                url: "UserRights.aspx/BindInstitute",
                data: '{ClusterID:' + JSON.stringify(clusterid) + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlInstitute = $("[id*=ddlInstitute]");
                    $("[id*=ddlInstitute]").empty();
                    $.each(r.d, function () {

                        //if (selectedclusterid == this['Value'])
                          //  ddlInstitute.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        //else
                            ddlInstitute.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                },
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                    swal(response.d);
                },
            });
        }


        function GetFormType() {
            var UserID = $("[id*=ddlUsers]").val();
            var UserTypeID = $("[id*=ddlUserType]").val();

            if (UserID == "0") {
                $("[id*=divGrid]").css({ 'display': 'none' });
                $("[id*=btnSave]").css({ 'display': 'none' });
                $("[id*=btnReset]").css({ 'display': 'none' });
            }
            else {
                $("[id*=divGrid]").css({ 'display': 'block' });
                $("[id*=btnSave]").css({ 'display': 'block' });
                $("[id*=btnReset]").css({ 'display': 'block' });
            }

            if (UserTypeID == "1" || UserTypeID == "2") {
                $.ajax({
                    method: "POST",
                    url: "UserRights.aspx/GetFormType",
                    data: '{UserID: "' + UserID + '",UserTypeID: ' + UserTypeID + '}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        swal(response.d);
                    },
                    error: function (response) {
                        swal("error");
                        swal(response.d);
                    },
                });
            }
            else if (UserTypeID == "4") {
                BindInstitute(UserID);
            }

        }

        function GetFormTypeInstitute() {
            var InstituteidAsUserID = $("[id*=ddlInstitute]").val();
            var UserTypeID = $("[id*=ddlUserType]").val();

            $.ajax({
                method: "POST",
                url: "UserRights.aspx/GetFormType",
                data: '{UserID: "' + InstituteidAsUserID + '",UserTypeID: ' + UserTypeID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                    swal(response.d);
                },
            });

        }

        var row;
        function OnSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Forms = xml.find("FormsType");

            if (row == null) {
                row = $("[id*=gvUserRights] tr:last-child").clone(true);
            }
            $("[id*=gvUserRights] tr").not($("[id*=gvUserRights] tr:first-child")).remove();
            var i = 1;

            if (Forms.length > 0) {
               
                $.each(Forms, function () {
                    var Forms = $(this);

                    $("td", row).eq(0).html($("<div><span id='frm'>" + $(this).find("FormType").text() + "</span><div>"));

                    if ($(this).find("TotalRights").text() > 0) {
                        $("td", row).eq(1).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkForm" + i + "' type='checkbox' checked='checked' /><span>&nbsp;&nbsp;" + $(this).find("FormDisplayName").text() + "</span><input id='hdnForm" + i + "' type='hidden' value='" + $(this).find("FormID").text() + "' /></div>"));
                    }
                    else {
                        $("td", row).eq(1).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkForm" + i + "' type='checkbox' /><span>&nbsp;&nbsp;" + $(this).find("FormDisplayName").text() + "</span><input id='hdnForm" + i + "' type='hidden' value='" + $(this).find("FormID").text() + "' /></div>"));
                    }

                    if ($(this).find("Insert").text() == "False") {
                        $("td", row).eq(2).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkInsert" + i + "' type='checkbox' onchange='chkInsert(" + i + ")' /><span class='lbl'>Insert</span></label></div>"));

                    }
                    else {
                        $("td", row).eq(2).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkInsert" + i + "' type='checkbox' checked='checked' onchange='chkInsert(" + i + ")' /><span class='lbl'>Insert</span></label></div>"));
                    }

                    if ($(this).find("Update").text() == "False") {
                        $("td", row).eq(3).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkUpdate" + i + "' type='checkbox' onchange='chkUpdate(" + i + ")' /><span class='lbl'>Update</span></label></div>"));
                    }
                    else {
                        $("td", row).eq(3).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkUpdate" + i + "' type='checkbox' checked='checked' onchange='chkUpdate(" + i + ")' /><span class='lbl'>Update</span></label></div>"));
                    }

                    if ($(this).find("Delete").text() == "False") {
                        $("td", row).eq(4).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkDelete" + i + "' type='checkbox' onchange='chkDelete(" + i + ")' /><span class='lbl'>Delete</span></label></div>"));
                    }
                    else {
                        $("td", row).eq(4).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkDelete" + i + "' type='checkbox' checked='checked' onchange='chkDelete(" + i + ")' /><span class='lbl'>Delete</span></label></div>"));
                    }

                    if ($(this).find("View").text() == "False") {
                        $("td", row).eq(5).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkView" + i + "' type='checkbox' onchange='chkView(" + i + ")' /><span class='lbl'>View</span></label></div>"));
                    }
                    else {
                        $("td", row).eq(5).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkView" + i + "' type='checkbox' checked='checked' onchange='chkView(" + i + ")' /><span class='lbl'>View</span></label></div>"));
                    }

                    if ($(this).find("SMS").text() == "False") {
                        $("td", row).eq(6).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkSMS" + i + "' type='checkbox' /><span class='lbl'>SMS</span></label></div>"));
                    }
                    else {
                        $("td", row).eq(6).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkSMS" + i + "' type='checkbox' checked='checked' /><span class='lbl'>SMS</span></label></div>"));
                    }

                    if ($(this).find("Mail").text() == "False") {
                        $("td", row).eq(7).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkMail" + i + "' type='checkbox' /><span class='lbl'>Mail</span></label></div>"));
                    }
                    else {
                        $("td", row).eq(7).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkMail" + i + "' type='checkbox' checked='checked' /><span class='lbl'>Mail</span></label></div>"));
                    }

                    if ($(this).find("Print").text() == "False") {
                        $("td", row).eq(8).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkPrint" + i + "' type='checkbox' /><span class='lbl'>Print</span></label></div>"));
                    }
                    else {
                        $("td", row).eq(8).html($("<div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chkPrint" + i + "' type='checkbox' checked='checked' /><span class='lbl'>Print</span></label></div>"));
                    }

                    $("[id*=gvUserRights]").append(row);

                    if ($("[id*=gvUserRights] tr").length >= 2) {
                        var CurrentForm = $("[id*=gvUserRights] tr:last-child").find("[id*=frm]");
                        var PreviousForm = $("[id*=gvUserRights] tr:last-child").prev().find("[id*=frm]");
                        var t = $("[id*=gvUserRights] tr:last-child ").prev();
                        if (CurrentForm.text() == PreviousForm.text()) {
                            //$("[id*=gvUserLevel] tr:last-child td:first-child").css({ 'border-color': 'orange' });
                            CurrentForm.hide();
                        }
                        else {
                            //$("[id*=gvUserLevel] tr:last-child td:first-child").css({ 'border-color': 'black' });
                        }
                    }
                    row = $("[id*=gvUserRights] tr:last-child").clone(true);
                    i++;
                });


            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvUserRights]").append(empty_row);
            }

           

        };

        function chkInsert(i) {
            if ($("[id=chkInsert" + i + "]").prop('checked')) {
                $("[id=chkView" + i + "]").prop('checked', true);
                $("[id=chkUpdate" + i + "]").prop('checked', true);
            }
            else {
                if ($("[id=chkUpdate" + i + "]").prop('checked') == true || $("[id=chkDelete" + i + "]").prop('checked') == true) {
                    $("[id=chkView" + i + "]").prop('checked', true);
                }
                else {
                    $("[id=chkView" + i + "]").prop('checked', false);
                    $("[id=chkUpdate" + i + "]").prop('checked', false);
                }
            }
        }

        function chkUpdate(i) {
            if ($("[id=chkUpdate" + i + "]").prop('checked')) {
                $("[id=chkView" + i + "]").prop('checked', true);
            }
            else {
                if ($("[id=chkInsert" + i + "]").prop('checked') == true || $("[id=chkDelete" + i + "]").prop('checked') == true) {
                    $("[id=chkView" + i + "]").prop('checked', true);
                }
                else {
                    $("[id=chkView" + i + "]").prop('checked', false);
                }
            }
        }

        function chkDelete(i) {
            if ($("[id=chkDelete" + i + "]").prop('checked')) {
                $("[id=chkView" + i + "]").prop('checked', true);
            }
            else {
                if ($("[id=chkInsert" + i + "]").prop('checked') == true || $("[id=chkUpdate" + i + "]").prop('checked') == true) {
                    $("[id=chkView" + i + "]").prop('checked', true);
                }
                else {
                    $("[id=chkView" + i + "]").prop('checked', false);
                }
            }
        }

        function chkView(i) {
            if (!($("[id=chkView" + i + "]").prop('checked'))) {
                if ($("[id=chkInsert" + i + "]").prop('checked') == true || $("[id=chkUpdate" + i + "]").prop('checked') == true || $("[id=chkDelete" + i + "]").prop('checked') == true) {
                    //swal("View Can not be removed.");
                    swal("", "View ને નહિ કાઢી શકો", "warning");
                    $("[id=chkView" + i + "]").prop('checked', true);
                }
            }
        }

        $(function () {
            $("#btnReset").bind("click", function () {

                $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnReset]").attr('disabled', 'disabled');
                $("#hdnReset").val("1");

                document.getElementById("<%=this.ddlUserType.ClientID %>").value = 0;
                document.getElementById("<%=this.ddlUsers.ClientID %>").value = 0;
                GetFormType();

                if ($("#hdnReset").val() == "1") {
                    $("[id*=btnReset]").html("રદ કરો");
                    $("[id*=btnReset]").removeAttr('disabled');
                    $("#hdnReset").val(0);
                }

            });
            $("#btnSave").bind("click", function () {

                var UserType = document.getElementById("<%=this.ddlUserType.ClientID %>");
                var UserID = document.getElementById("<%=this.ddlUsers.ClientID %>");
                var InstituteID = document.getElementById("<%=this.ddlInstitute.ClientID %>"); 

                var gv = document.getElementById("<%=this.gvUserRights.ClientID %>");

                if (UserType.value == 0) {
                    swal("", "વપરાશકર્તા પ્રકાર પસંદ કરો", "warning");
                    UserType.focus();
                    return false;
                }
                else if (UserID.value == 0) {
                    swal("", "વપરાશકર્તા પસંદ કરો", "warning");
                    UserID.focus();
                    return false;
                }
                else if (UserType.value == 4 && InstituteID.value == 0) {
                    swal("", "પિયત મંડળી પસંદ કરો", "warning");
                    InstituteID.focus();
                    return false;
                }
                else {

                    $("[id=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");


                    UserRightsDelete();

                    for (var i = 1; i <= gv.rows.length; i++) {
                        if ($("[id=chkForm" + i + "]").prop('checked')) {
                            var FormID = $("[id*=hdnForm" + i + "]").val();

                            if ($("[id=chkInsert" + i + "]").prop('checked') == false && $("[id=chkUpdate" + i + "]").prop('checked') == false && $("[id=chkDelete" + i + "]").prop('checked') == false && $("[id=chkView" + i + "]").prop('checked') == false && $("[id=chkSMS" + i + "]").prop('checked') == false && $("[id=chkMail" + i + "]").prop('checked') == false && $("[id=chkPrint" + i + "]").prop('checked') == false) {
                                swal("", "ફોર્મના અધિકાર પસંદ કરો.", "warning");
                                return false;
                            }

                            if ($("[id=chkInsert" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 1);
                            }
                            if ($("[id=chkUpdate" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 2);
                            }
                            if ($("[id=chkDelete" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 3);
                            }
                            if ($("[id=chkView" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 4);
                            }
                            if ($("[id=chkSMS" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 5);
                            }
                            if ($("[id=chkMail" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 6);
                            }
                            if ($("[id=chkPrint" + i + "]").prop('checked')) {
                                UserRightsManage(FormID, 7);
                            }
                        }
                    }
                    if ($("#hdnSubmitVal").val() == "1") {
                        $("[id=btnSave]").html("દાખલ કરો");
                        $("[id=btnSave]").removeAttr('disabled');
                        $("#hdnSubmitVal").val(0);
                    }
                    swal("Done!", "ફોર્મના અધિકાર ફાળવી દીધા છે.", "success");
                }
            });
        });

        function UserRightsManage(FormID, RightsID) {

            var UserRightsData = {};
            UserRightsData.FormID = FormID;
            UserRightsData.RightsID = RightsID;
            UserRightsData.UserTypeID = $("[id*=ddlUserType]").val();
            if ($("[id*=ddlUserType]").val() == "4") {
                UserRightsData.UserID = $("[id*=ddlInstitute]").val();
            }
            else {
                UserRightsData.UserID = $("[id*=ddlUsers]").val();
            }
            $.ajax({
                method: "POST",
                url: "UserRights.aspx/UserRightsManage",
                data: '{UserRights:' + JSON.stringify(UserRightsData) + '}',
                //async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //swal(response.d);
                },
                failure: function (response) {
                    swal(response.d);
                },
                error: function (err) {
                    swal(err);
                    swal(err.statusText)
                }
            });
        }

        function UserRightsDelete() {
            //var UserID = $("[id*=ddlUsers]").val();

            if ($("[id*=ddlUserType]").val() == "4") {
                var UserID = $("[id*=ddlInstitute]").val();
            }
            else {
                var UserID = $("[id*=ddlUsers]").val();
            }

            var UserTypeID = $("[id*=ddlUserType]").val();

            $.ajax({
                method: "POST",
                url: "UserRights.aspx/UserRightsDelete",
                data: '{UserID:' + JSON.stringify(UserID) + ',UserTypeID:' + JSON.stringify(UserTypeID) + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //swal(response.d);
                },
                failure: function (response) {
                    swal(response.d);
                },
                error: function (err) {
                    swal(err);
                    swal(err.statusText);
                }
            });
        }

    </script>
</asp:Content>

