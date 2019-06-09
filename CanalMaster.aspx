<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CanalMaster.aspx.cs" Inherits="CanalMaster" %>

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
            <li class="active">નહેરની માહિતી</li>
        </ol>

    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">નહેર ઉમેરો/સુધારો</a></li>
                            <li id="tab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>

                        </ul>
                    </div>

                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCanalName" class="form-control" runat="server" Style="text-transform: uppercase" MaxLength="250"></asp:TextBox>
                                                    <label>નહેર </label>
                                                </div>
                                            </div>


                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCanalNameG" class="form-control" runat="server" Style="text-transform: uppercase" MaxLength="250"></asp:TextBox>
                                                    <label>નહેર (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlCanalType" class="form-control" runat="server" DataSourceID="dsCanalType"
                                                DataTextField="CanalTypeG" DataValueField="CanalTypeID">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="dsCanalType" runat="server" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>'
                                                SelectCommand="ListAllCanalType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            <label>નહેર પ્રકાર </label>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-6 text-left">
                                                <div class="checkbox checkbox-inline checkbox-styled">
                                                    <label>
                                                        <input type="checkbox" id="cbHasParent" onclick="checkboxValidation()" onchange="checkData()" />
                                                        <span>રુટ છે?</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlParentType" class="form-control" runat="server" DataSourceID="dsParentType"
                                                DataTextField="CanalTypeG" DataValueField="CanalTypeID" onchange="BindParentType()">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="dsParentType" runat="server" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>'
                                                SelectCommand="ListAllCanalType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            <label>રુટ પ્રકાર </label>
                                        </div>

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlParent" class="form-control" runat="server" disabled="true"></asp:DropDownList>
                                            <label>રુટ નામ </label>
                                        </div>


                                        <div class="form-group">
                                            <asp:TextBox ID="txtLength" class="form-control" runat="server" onkeypress="return isDecimalKey(event);" Style="text-transform: uppercase" MaxLength="10"></asp:TextBox>
                                            <label>લંબાઈ</label>
                                        </div>

                                        <div class="form-group">
                                            <asp:TextBox ID="txtPerimeter" class="form-control" runat="server" onkeypress="return isDecimalKey(event);" Style="text-transform: uppercase" MaxLength="10"></asp:TextBox>
                                            <label>સી સી એ</label>
                                            <asp:HiddenField ID="hdnCanalID" runat="server" />
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
                                            <asp:TextBox ID="txtSearch" runat="server" class="form-control" Style="text-transform: uppercase" />
                                            <label id="lblCanal" runat="server">નહેર</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchCanalType" class="form-control" runat="server" DataSourceID="dsddlCanalTypeSrch"
                                                DataTextField="CanalTypeG" DataValueField="CanalTypeID">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="dsddlCanalTypeSrch" runat="server" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>' SelectCommand="ListAllCanalType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            <label>નહેર પ્રકાર</label>
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

                                                    <asp:GridView ID="dgvCanalMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                        <Columns>

                                                            <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="CanalName" HeaderText="નહેર" SortExpression="CanalName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="CanalNameG" HeaderText="નહેર (ગુજરાતી)" SortExpression="CanalNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="CanalTypeG" HeaderText="નહેર પ્રકાર" SortExpression="CanalTypeID" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="HasParent" HeaderText="રુટ છે?" SortExpression="HasParent" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="ParentType" HeaderText="રુટ પ્રકાર" SortExpression="ParentTypeID" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="ParentName" HeaderText="રુટ નામ" SortExpression="ParentID" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Length" HeaderText="લંબાઈ" SortExpression="Length" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Perimeter" HeaderText="સી સી એ" SortExpression="Perimeter" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
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

    <script type="text/javascript">

        $(".Pager").on("click", '.page', function () {
            GetCustomers(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "licanalmaster", "aCanalMaster", "", "");
            $("#divFirst").css({ 'display': "block" });
            $("[id=ContentPlaceHolder1_txtCanalName]").focus();
            $("#ContentPlaceHolder1_ddlParentType").prop("disabled", true);
            $("#ContentPlaceHolder1_ddlParent").prop("disabled", true);
            ListParentType(0, 0);

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aCanalMaster";
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


        function pageLoad() {
            $("input:checkbox").addClass("ace input-lg");
        }

        $("#btnFindUser").bind("click", function () {
            $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnFindUser]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");

            $("#divSecond").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "block" });
            GetCustomers(1);
            if ($("#hdnFindUser").val() == "1") {
                $("[id*=btnFindUser]").html("માહિતી શોધો");
                $("[id*=btnFindUser]").removeAttr('disabled');
                $("#hdnFindUser").val(0);
            }
        });

        function isDecimalKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 37 && charCode != 39)
                return false;

            return true;
        }

        function checkboxValidation() {

            var chkHasParent = document.getElementById("cbHasParent");
            if (chkHasParent.checked == true) {
                $("#ContentPlaceHolder1_ddlParentType").prop("disabled", false);
                $("#ContentPlaceHolder1_ddlParent").prop("disabled", false);
            }
            else {
                $("#ContentPlaceHolder1_ddlParentType").prop("disabled", true);
                $("#ContentPlaceHolder1_ddlParent").prop("disabled", true);
            }
        }

        function checkData() {

            var cbchk = document.getElementById("cbHasParent");

            if ($(cbchk).is(':checked') == false) {

                $("#ContentPlaceHolder1_ddlParentType").val('0');
                $("#ContentPlaceHolder1_ddlParent").val('0');

            }
            else {
                $("#ContentPlaceHolder1_ddlParentType").prop("disabled", false);
                $("#ContentPlaceHolder1_ddlParent").prop("disabled", false);
            }
        }

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id*=txtCanalName]").focus();
        }

        function ViewDiv2() {

            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            GetCustomers(1);
        }

        function ClearAll() {
            $("[id=cbHasParent]").prop('checked', false);
            $("[id*=txtLength]").val('0');
            $("[id*=txtPerimeter]").val('0');
            $("[id=txtCanalName]").val('');
            $("[id=ContentPlaceHolder1_txtCanalNameG]").val('');
            //$("[id*=txtBeatCodeG]").val('');
            $("[id*=hdnCanalID]").val('');
            $("[id=txtCanalName]").focus();
        }

        function BindParentType() {
            ListParentType($("[id=ContentPlaceHolder1_ddlParentType]").val(), 0);
        }

        function ListParentType(canaltypeid, selectedcanaltypeID) {
            $.ajax({
                type: "POST",
                url: "CanalMaster.aspx/ListParentNameByParent",
                data: '{CanalTypeID : ' + canaltypeid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlParent = $("[id=ContentPlaceHolder1_ddlParent]");
                    $("[id=ContentPlaceHolder1_ddlParent]").empty();
                    $.each(r.d, function () {

                        if (selectedcanaltypeID == this['Value']) {
                            ddlParent.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                            //$("#ContentPlaceHolder1_ddlParent").prop("disabled", false);
                        }
                        else {
                            ddlParent.append($("<option></option>").val(this['Value']).html(this['Text']));
                            //$("#ContentPlaceHolder1_ddlParent").prop("disabled", false);
                        }
                    });
                }
            });
        }

        function Validation() {

            var canalname = document.getElementById("ContentPlaceHolder1_txtCanalName");
            var canalnameg = document.getElementById("ContentPlaceHolder1_txtCanalNameG");
            var ddlCanalType = document.getElementById("ContentPlaceHolder1_ddlCanalType");
            var cbHasParent = document.getElementById("cbHasParent");
            var ddlParentType = document.getElementById("ContentPlaceHolder1_ddlParentType");
            var ddlParent = document.getElementById("ContentPlaceHolder1_ddlParent");

            if (canalname.value == "") {
                canalname.focus();
                swal("", "નહેર દાખલ કરો", "warning");
                return false;
            }
            else if (canalnameg.value == "") {
                canalnameg.focus();
                swal("", "નહેર (ગુજરાતી) દાખલ કરો", "warning");
                return false;
            }
            else if (ddlCanalType.value == "0") {
                ddlCanalType.focus();
                swal("", "નહેરનો પ્રકાર પસંદ કરો", "warning");
                return false;
            }
            else if (cbHasParent.checked == true) {
                if (ddlParentType.value == 0) {
                    ddlParentType.focus();
                    swal("", "રુટનો પ્રકાર પસંદ કરો", "warning");
                    return false;
                }
                else if (ddlParent.value == 0) {
                    ddlParent.focus();
                    swal("", "રુટનું નામ પસંદ કરો", "warning");
                    return false;
                }
            }
            return true;
        }

        $(function () {

            $("[id=tab1]").attr("class", "active");
            
            $("#btnReset").bind("click", function () {
                $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnReset]").attr('disabled', 'disabled');
                $("#hdnReset").val("1");

                $("[id*=ContentPlaceHolder1_ddlCanalType]").val('0');
                $("[id=ContentPlaceHolder1_ddlParentType]").val('0');
                $("[id=ContentPlaceHolder1_ddlParent]").val('0');
                $("[id=ContentPlaceHolder1_txtCanalName]").val('');
                $("[id=ContentPlaceHolder1_txtCanalNameG]").val('');
                $("[id*=ContentPlaceHolder1_txtLength]").val('');
                $("[id*=ContentPlaceHolder1_txtPerimeter]").val('');
                $("[id=cbHasParent]").prop('checked', false);

                if ($("#hdnReset").val() == "1") {
                    $("[id*=btnReset]").html("રદ કરો");
                    $("[id*=btnReset]").removeAttr('disabled');
                    $("#hdnReset").val(0);
                }
            });

            $("#btnSave").bind("click", function () {
                var canalid = $("[id*=hdnCanalID]").val();

                if (Validation()) {

                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    //$(this).html('<i class="ace-icon fa fa-spinner fa-spin  bigger-125"></i>પ્રતિક્ષા કરો');
                    var canal = {};
                    canal.CanalName = $("[id*=ContentPlaceHolder1_txtCanalName]").val();
                    canal.CanalNameG = $("[id*=ContentPlaceHolder1_txtCanalNameG]").val();
                    canal.CanalTypeID = $("[id*=ContentPlaceHolder1_ddlCanalType]").val();
                    canal.HasParent = $("[id=cbHasParent]").prop('checked');
                    canal.ParentTypeID = $("[id=ContentPlaceHolder1_ddlParentType]").val();
                    canal.ParentID = $("[id=ContentPlaceHolder1_ddlParent]").val();
                    canal.Length = $("[id*=ContentPlaceHolder1_txtLength]").val();
                    canal.Perimeter = $("[id*=ContentPlaceHolder1_txtPerimeter]").val();

                    if (canal.ParentID == null)
                        canal.ParentID = "0";

                    if (canal.Length == "")
                        canal.Length = "";

                    if (canal.Perimeter == "")
                        canal.Perimeter = "";

                    if (canalid == "")
                        canal.CanalID = 0
                    else
                        canal.CanalID = canalid;

                    $.ajax({
                        type: "POST",
                        url: "CanalMaster.aspx/CanalManage",
                        data: '{canal: ' + JSON.stringify(canal) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
						 msg = response.d;
						 if (msg.indexOf("Error") > -1) {
						     swal(msg);
						     return false;
						 }
						     //if ($("[id*=hdnCanalID]").val() != "") {
						     //   swal("Updated", "નહેરની માહિતી સુધારાઈ ગઈ છે.", "success");
						     //   GetCustomers();
						     //  //clearall();
						     //$("[id*=hdnCanalID]").val('');
						     //$("[id*=ContentPlaceHolder1_ddlCanalType]").val('0');
						     //$("[id=ContentPlaceHolder1_ddlParentType]").val('0');
						     //$("[id=ContentPlaceHolder1_ddlParent]").val('0');
						     // $("[id=ContentPlaceHolder1_txtCanalName]").val('');
						     // $("[id=ContentPlaceHolder1_txtCanalNameG]").val('');
						     // $("[id*=ContentPlaceHolder1_txtLength]").val('');
						     // $("[id*=ContentPlaceHolder1_txtPerimeter]").val('');
						     // $("[id=cbHasParent]").prop('checked', false);
						     //}
						 else {
						     //                                swal("Inserted", "નહેરની માહિતી દાખલ થઇ ગઈ છે.", "success");
						     swal("Done!", msg, "success");
						     GetCustomers(1);
						     //clearall();
						     $("[id*=hdnCanalID]").val('');
						     $("[id*=ContentPlaceHolder1_ddlCanalType]").val('0');
						     $("[id=ContentPlaceHolder1_ddlParentType]").val('0');
						     $("[id=ContentPlaceHolder1_ddlParent]").val('0');
						     $("[id=ContentPlaceHolder1_txtCanalName]").val('');
						     $("[id=ContentPlaceHolder1_txtCanalNameG]").val('');
						     $("[id*=ContentPlaceHolder1_txtLength]").val('');
						     $("[id*=ContentPlaceHolder1_txtPerimeter]").val('');
						     $("[id=cbHasParent]").prop('checked', false);

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

        function EditCanal(lnk) {
            $.ajax({
                type: "POST",
                url: "CanalMaster.aspx/GetCanalDetail",
                data: '{CanalID: "' + JSON.stringify(lnk) + '"}',
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
            //$("[id*=txtCanalNameG]").attr('title', res[0].CanalNameG);
            $("[id=ContentPlaceHolder1_txtCanalName]").val(res[0].CanalName);
            $("[id=ContentPlaceHolder1_txtCanalNameG]").val(res[0].CanalNameG);
            $("[id*=ContentPlaceHolder1_ddlCanalType]").val(res[0].CanalTypeID);
            if (res[0].HasParent == true) {
                $("[id=cbHasParent]").prop('checked', true);
            }
            else {
                $("[id=cbHasParent]").prop('checked', false);
            }

            $("[id=ContentPlaceHolder1_ddlParentType]").val(res[0].ParentTypeID);
            $("[id=ContentPlaceHolder1_ddlParentType]").removeAttr("disabled");
            $("[id=ContentPlaceHolder1_ddlParent]").val(res[0].ParentID);
            $("[id=ContentPlaceHolder1_ddlParent]").removeAttr("disabled");
            $("[id*=txtLength]").val(res[0].Length);
            $("[id*=txtPerimeter]").val(res[0].Perimeter);
            $("[id*=hdnCanalID]").val(res[0].CanalID);
            ListParentType(res[0].ParentTypeID, res[0].ParentID);
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
                url: "CanalMaster.aspx/GetCanalMaster",
                //data: '{SearchCanalWiseTerm: "' + SearchCanalWiseTerm() + '",SearchCanalTypeWiseTerm: "' + SearchCanalTypeWiseTerm() + '",searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
                data: '{SearchCanalWiseTerm: "' + SearchCanalWiseTerm() + '",SearchCanalTypeWiseTerm: "' + SearchCanalTypeWiseTerm() + '",searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
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
            var cbHasParent = document.getElementById("cbHasParent");
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("CanalDetail");
            if (row == null) {
                row = $("[id*=dgvCanalMaster] tr:last-child").clone(true);
            }
            $("[id*=dgvCanalMaster] tr").not($("[id*=dgvCanalMaster] tr:first-child")).remove();
            if (customers.length > 0) {
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("CanalName").text());
                    $("td", row).eq(2).html($(this).find("CanalNameG").text());
                    $("td", row).eq(3).html($(this).find("CanalTypeG").text());
                    $("td", row).eq(4).html($(this).find("HasParent").text());
                    $("td", row).eq(5).html($(this).find("ParentType").text());
                    $("td", row).eq(6).html($(this).find("ParentName").text());
                    $("td", row).eq(7).html($(this).find("Length").text());
                    $("td", row).eq(8).html($(this).find("Perimeter").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                    $("td", row).eq(9).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return EditCanal(' + $(this).find("CanalID").text() + ')";><i class="fa fa-edit"></i> </button>'));
                    }
                    else { $("td", row).eq(9).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", row).eq(10).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return DeleteCanal(' + $(this).find("CanalID").text() + ')";><i class="fa fa-trash"></i> </button>'));
                    }
                    else { $("td", row).eq(10).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }


                    $("[id*=dgvCanalMaster]").append(row);
                    row = $("[id*=dgvCanalMaster] tr:last-child").clone(true);
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

                $(".CanalNameG").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
                $(".CanalTypeID").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=dgvCanalMaster]").append(empty_row);
            }
        };

        function SearchCanalWiseTerm() {
            return jQuery.trim($("#ContentPlaceHolder1_ddlSrchCanal").val());
        };

        function SearchCanalTypeWiseTerm() {
            return jQuery.trim($("#ContentPlaceHolder1_ddlSrchCanalType").val());
        };

        function DeleteCanal(lnk) {

            $.ajax({
                type: "POST",
                url: "CanalMaster.aspx/CheckDataInCanal",
                data: '{CanalID : ' + lnk + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var msg = response.d;

                    if (msg == "1") {
                        swal("", "રુટ પહેલેથી ઉપયોગમાં છે.", "warning");
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
                                url: "CanalMaster.aspx/DeleteCanal",
                                data: '{CanalID : ' + JSON.stringify(lnk) + '}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var msg = response.d;
                                    // swal(msg);
                                    swal("Deleted!", "રુટની માહિતી રદ થઇ ગઈ છે.", "success");

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

