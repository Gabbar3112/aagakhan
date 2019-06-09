<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SubDivisionMaster.aspx.cs" Inherits="SubDivisionMaster" %>

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
            <li class="active">પેટા વિભાગની માહિતી</li>
        </ol>

    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">પેટા વિભાગ ઉમેરો/સુધારો</a></li>
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
                                            <asp:DropDownList ID="ddlDivision" class="form-control" runat="server"></asp:DropDownList>
                                            <asp:HiddenField ID="hdnSubDivisionID" runat="server" />
                                            <label>વિભાગ </label>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtSubDivisionName" class="form-control" runat="server" onchange="CheckAlreadyExists()" MaxLength="300"></asp:TextBox>
                                                    <label>પેટા વિભાગ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtSubDivisionNameG" class="form-control" runat="server" onchange="CheckAlreadyExistsSubDivisionNameG()" MaxLength="300"></asp:TextBox>
                                                    <label>પેટા વિભાગ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:TextBox ID="txtShortCode" class="form-control" runat="server" onchange="CheckShortCodeAlreadyExists()" MaxLength="5"></asp:TextBox>
                                            <label>શોર્ટ કોડ </label>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress1" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                                    <label>સરનામું - ૧ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress1G" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                                                    <label>સરનામું - ૧ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress2" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                                    <label>સરનામું - ૨ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress2G" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                                                    <label>સરનામું - ૨ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress3" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                                                    <label>સરનામું - ૩ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress3G" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                                                    <label>સરનામું - ૩ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPhoneNo" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPhoneNoG" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtMobileNo" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>મોબાઈલ નંબર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtMobileNoG" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>મોબાઈલ નંબર (ગુજરાતી) </label>
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
                                            <%--<asp:SqlDataSource ID="dsSrchCircle" runat="server" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>'
                                                SelectCommand="ListCircleByUser" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter SessionField="UserID" Name="UserID" Type="Int64" DefaultValue="1"></asp:SessionParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>--%>
                                            <label id="lblSrchCircle" runat="server">વર્તુળ</label>
                                            <input type="hidden" id="checkedcircle" />
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlSrchDivision" class="form-control" runat="server"></asp:DropDownList>
                                            <label>વિભાગ</label>
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

                                                    <asp:GridView ID="dgvSubDivisionMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                        <Columns>

                                                            <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="CircleNameG" HeaderText="વર્તુળ" SortExpression="CircleNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ" SortExpression="DivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SubDivisionName" HeaderText="પેટા વિભાગ" SortExpression="SubDivisionName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="SubDivisionNameG" HeaderText="પેટા વિભાગ (ગુજરાતી)" SortExpression="SubDivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="ShortCode" HeaderText="શોર્ટ કોડ" SortExpression="ShortCode" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Address1" HeaderText="સરનામું - ૧" SortExpression="Address1" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Address1G" HeaderText="સરનામું - ૧ (ગુજરાતી)" SortExpression="Address1G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Address2" HeaderText="સરનામું - ૨" SortExpression="Address2" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Address2G" HeaderText="સરનામું - ૨ (ગુજરાતી)" SortExpression="Address2G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Address3" HeaderText="સરનામું - ૩" SortExpression="Address3" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="Address3G" HeaderText="સરનામું - ૩ (ગુજરાતી)" SortExpression="Address3G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="PhoneNo" HeaderText="ફોન નંબર" SortExpression="PhoneNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="PhoneNoG" HeaderText="ફોન નંબર (ગુજરાતી)" SortExpression="PhoneNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="MobileNo" HeaderText="મોબાઈલ નંબર" SortExpression="MobileNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                            <asp:BoundField DataField="MobileNoG" HeaderText="મોબાઈલ નંબર (ગુજરાતી)" SortExpression="MobileNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>

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

        $("#btnFindUser").bind("click", function () {
            $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnFindUser]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");
            $("#divGrid").css({ 'display': "block" });
            GetCustomers(1);
            if ($("#hdnFindUser").val() == "1") {
                $("[id*=btnFindUser]").html("માહિતી શોધો");
                $("[id*=btnFindUser]").removeAttr('disabled');
                $("#hdnFindUser").val(0);
            }
            //GetCustomers(1);
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "lisubdivisionmaster", "aSubDivisionMaster", "", "");
            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aSubDivisionMaster";
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

            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
            $("#divFirst").css({ 'display': "block" });
            $("[id=tab1]").attr("class", "active");

            ListCircle();
            ListCircleSrch();
            ListDivison(0, 0);
            ListDivisonSrch(0, 0);
        });

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
            ListDivison($("[id=ContentPlaceHolder1_ddlCircle]").val(), 0);
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

        //function ListCircle() {
        //   
        //    $.ajax({
        //        type: "POST",
        //        url: "SubDivisionMaster.aspx/ListCircle",
        //        data: '{}',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (r) {
        //            var ddlCircle = $("[id=ContentPlaceHolder1_ddlCircle]");
        //            $.each(r.d, function () {
        //                ddlCircle.append($("<option></option>").val(this['Value']).html(this['Text']));
        //            });
        //        }
        //    });
        //}

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

        //function BindDivision() {
        //    ListDivision($("[id=ContentPlaceHolder1_ddlCircle]").val(), 0);
        //}

        //function ListDivision(circleid, selectedDivID) {
           
        //    $.ajax({
        //        type: "POST",
        //        url: "SubDivisionMaster.aspx/ListDivision",
        //        data: '{CircleID: ' + circleid + '}',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (r) {
        //            var ddlDivision = $("#ContentPlaceHolder1_ddlDivision");

        //            $("#ContentPlaceHolder1_ddlDivision").empty();

        //            $.each(r.d, function () {
        //                if (selectedDivID == this['Value'])
        //                    ddlDivision.append($("<option selected></option>").val(this['Value']).html(this['Text']));
        //                else {
        //                    ddlDivision.append($("<option></option>").val(this['Value']).html(this['Text']));
        //                }

        //            });
        //        }
        //    });
        //}

        function BindDivisionSrch() {
            ListDivisonSrch($("[id=ContentPlaceHolder1_ddlSrchCircle]").val(), 0);
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

        function ValidateEmail(emailID) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(emailID);
        };

        function CheckAlreadyExists() {

            var subdivisiontooltip = document.getElementById('<%= txtSubDivisionName.ClientID %>').title;
            var subdivision = document.getElementById('<%= txtSubDivisionName.ClientID %>');
            var divisionid = document.getElementById('<%= ddlDivision.ClientID %>');

            if (subdivisiontooltip != "") {
                if (subdivision.value != subdivisiontooltip) {
                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/CheckSubDivisionName",
                        data: '{SubDivisionName: "' + subdivision.value + '", DivisionID: "' + divisionid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                subdivision.focus();
                                swal("", "પેટા વિભાગ પેહેલેથી ઉપયોગમાં છે..!", "warning");
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
                if (subdivision.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/CheckSubDivisionName",
                        data: '{SubDivisionName: "' + subdivision.value + '", DivisionID: "' + divisionid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                subdivision.focus();
                                swal("", "પેટા વિભાગ પેહેલેથી ઉપયોગમાં છે..!", "warning");
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

        function CheckAlreadyExistsSubDivisionNameG() {

            var subdivisionGtooltip = document.getElementById('<%= txtSubDivisionNameG.ClientID %>').title;
            var subdivisiong = document.getElementById('<%= txtSubDivisionNameG.ClientID %>');
            var divisionid = document.getElementById('<%= ddlDivision.ClientID %>');

            if (subdivisionGtooltip != "") {
                if (subdivisiong.value != subdivisionGtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/CheckSubDivisionNameG",
                        data: '{SubDivisionNameG: "' + subdivisiong.value + '", DivisionID: "' + divisionid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                subdivisiong.focus();
                                swal("", "પેટા વિભાગ પેહેલેથી ઉપયોગમાં છે..! (ગુજરાતી)", "warning");
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
                if (subdivisiong.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/CheckSubDivisionNameG",
                        data: '{SubDivisionNameG: "' + subdivisiong.value + '", DivisionID: "' + divisionid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                subdivisiong.focus();
                                swal("", "પેટા વિભાગ પેહેલેથી ઉપયોગમાં છે..! (ગુજરાતી)", "warning");
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

        function CheckShortCodeAlreadyExists() {

            var shortcodetooltip = document.getElementById('<%= txtShortCode.ClientID %>').title;
            var shortcode = document.getElementById('<%= txtShortCode.ClientID %>');
            var did = $("[id*=hdnSubDivisionID]").val();

            if (shortcodetooltip != "") {
                if (shortcode.value != shortcodetooltip) {
                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/CheckShortCode",
                        data: '{ShortCode: "' + shortcode.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                ('#btnSave').attr('disabled', true);
                                shortcode.focus();
                                swal("", "શોર્ટ કોડ પેહેલેથી ઉપયોગમાં છે..!", "warning");
                                $("[id=ContentPlaceHolder1_txtShortCode]").val('');
                                document.getElementById("#ContentPlaceHolder1_txtShortCode").value = "";
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
                if (shortcode.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/CheckShortCode",
                        data: '{ShortCode: "' + shortcode.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                shortcode.focus();
                                swal("", "શોર્ટ કોડ પેહેલેથી ઉપયોગમાં છે..!", "warning");
                                $("[id=ContentPlaceHolder1_txtShortCode]").val('');
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

      

        function ClearAll() {
            $("[id=ContentPlaceHolder1_txtSubDivisionName]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtSubDivisionNameG]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtShortCode]").attr('title', '');
            $("[id*=hdnSubDivisionID]").val('');
            $("[id=ContentPlaceHolder1_ddlCircle]").val('0');
            $("[id=ContentPlaceHolder1_ddlDivision]").val('');
            $("[id=ContentPlaceHolder1_txtSubDivisionName]").val('');
            $("[id=ContentPlaceHolder1_txtSubDivisionNameG]").val('');
            $("[id=ContentPlaceHolder1_txtShortCode]").val('');
            $("[id=ContentPlaceHolder1_txtAddress1]").val('');
            $("[id=ContentPlaceHolder1_txtAddress1G]").val('');
            $("[id=ContentPlaceHolder1_txtAddress2]").val('');
            $("[id=ContentPlaceHolder1_txtAddress2G]").val('');
            $("[id=ContentPlaceHolder1_txtAddress3]").val('');
            $("[id=ContentPlaceHolder1_txtAddress3G]").val('');
            $("[id=ContentPlaceHolder1_txtPhoneNo]").val('');
            $("[id=ContentPlaceHolder1_txtPhoneNoG]").val('');
            $("[id=ContentPlaceHolder1_txtMobileNo]").val('');
            $("[id=ContentPlaceHolder1_txtMobileNoG]").val('');
            ListDivison(0, 0);
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
                var subdivisionid = $("[id*=hdnSubDivisionID]").val();
                var circleName = document.getElementById("ContentPlaceHolder1_ddlCircle");
                var divisionName = document.getElementById("ContentPlaceHolder1_ddlDivision");
                var subDivisionName = document.getElementById("ContentPlaceHolder1_txtSubDivisionName");
                var subDivisionNameG = document.getElementById("ContentPlaceHolder1_txtSubDivisionNameG");
                var shortCode = document.getElementById("ContentPlaceHolder1_txtShortCode");
                var address1 = document.getElementById("ContentPlaceHolder1_txtAddress1");
                var address1G = document.getElementById("ContentPlaceHolder1_txtAddress1G");
                var address2 = document.getElementById("ContentPlaceHolder1_txtAddress2");
                var address2G = document.getElementById("ContentPlaceHolder1_txtAddress2G");
                var address3 = document.getElementById("ContentPlaceHolder1_txtAddress3");
                var address3G = document.getElementById("ContentPlaceHolder1_txtAddress3G");
                var phoneNo = document.getElementById("ContentPlaceHolder1_txtPhoneNo");
                var phoneNoG = document.getElementById("ContentPlaceHolder1_txtPhoneNoG");
                var mobileNo = document.getElementById("ContentPlaceHolder1_txtMobileNo");
                var mobileNoG = document.getElementById("ContentPlaceHolder1_txtMobileNoG");

                if (circleName.value == "0") {
                    circleName.focus();
                    swal("", "વર્તુળ પસંદ કરો", "warning");
                    return false;
                }

                else if (divisionName.value == "0") {
                    divisionName.focus();
                    swal("", "વિભાગ પસંદ કરો", "warning");
                    return false;
                }

                else if (subDivisionName.value == "") {
                    subDivisionName.focus();
                    swal("", "પેટા વિભાગ દાખલ કરો", "warning");
                    return false;
                }

                else if (subDivisionNameG.value == "") {
                    subDivisionNameG.focus();
                    swal("", "પેટા વિભાગ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (shortCode.value == "") {
                    shortCode.focus();
                    swal("", "કોડ દાખલ કરો", "warning");
                    return false;
                }

                else if (address1.value == "") {
                    address1.focus();
                    swal("", "સરનામું - ૧ દાખલ કરો", "warning");
                    return false;
                }

                else if (address1G.value == "") {
                    address1G.focus();
                    swal("", "સરનામું - ૧ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (address2.value == "") {
                    address2.focus();
                    swal("", "સરનામું - ૨ દાખલ કરો", "warning");
                    return false;
                }

                else if (address2G.value == "") {
                    address2G.focus();
                    swal("", "સરનામું - ૨ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (address3.value == "") {
                    address3.focus();
                    swal("", "સરનામું - ૩ દાખલ કરો", "warning");
                    return false;
                }

                else if (address3G.value == "") {
                    address3G.focus();
                    swal("", "સરનામું - ૩ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (phoneNo.value != "" && phoneNo.value.length < 11) {
                    phoneNo.focus();
                    swal("", "માન્ય ફોન નંબર દાખલ કરો", "warning");
                    return false;
                }

                else if (phoneNoG.value != "" && phoneNoG.value.length < 11) {
                    phoneNoG.focus();
                    swal("", "માન્ય ફોન નંબર દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (mobileNo.value != "" && mobileNo.value.length < 10) {
                    mobileNo.focus();
                    swal("", "માન્ય મોબાઈલ નંબર દાખલ કરો", "warning");
                    return false;
                }

                else if (mobileNoG.value != "" && mobileNoG.value.length < 10) {
                    mobileNoG.focus();
                    swal("", "માન્ય મોબાઈલ નંબર દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    //$(this).html('<i class="fa fa-spinner fa-spin fa-spin  bigger-125"></i>PLEASE WAIT');
                    var subdivision = {};
                    subdivision.CircleID = $("[id=ContentPlaceHolder1_ddlCircle]").val();
                    subdivision.DivisionID = $("[id=ContentPlaceHolder1_ddlDivision]").val();
                    subdivision.SubDivisionName = $("[id=ContentPlaceHolder1_txtSubDivisionName]").val();
                    subdivision.SubDivisionNameG = $("[id=ContentPlaceHolder1_txtSubDivisionNameG]").val();
                    subdivision.ShortCode = $("[id=ContentPlaceHolder1_txtShortCode]").val();
                    subdivision.Address1 = $("[id=ContentPlaceHolder1_txtAddress1]").val();
                    subdivision.Address1G = $("[id=ContentPlaceHolder1_txtAddress1G]").val();
                    subdivision.Address2 = $("[id=ContentPlaceHolder1_txtAddress2]").val();
                    subdivision.Address2G = $("[id=ContentPlaceHolder1_txtAddress2G]").val();
                    subdivision.Address3 = $("[id=ContentPlaceHolder1_txtAddress3]").val();
                    subdivision.Address3G = $("[id=ContentPlaceHolder1_txtAddress3G]").val();
                    subdivision.PhoneNo = $("[id=ContentPlaceHolder1_txtPhoneNo]").val();
                    subdivision.PhoneNoG = $("[id=ContentPlaceHolder1_txtPhoneNoG]").val();
                    subdivision.MobileNo = $("[id=ContentPlaceHolder1_txtMobileNo]").val();
                    subdivision.MobileNoG = $("[id=ContentPlaceHolder1_txtMobileNoG]").val();

                    if (subdivisionid == "")
                        subdivision.SubDivisionID = 0
                    else
                        subdivision.SubDivisionID = subdivisionid;

                    $.ajax({
                        type: "POST",
                        url: "SubDivisionMaster.aspx/SubDivisionManage",
                        data: '{subdivision: ' + JSON.stringify(subdivision) + '}',
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
                                GetCustomers(1);
                                ClearAll();
                                
                            }
                        }
                    });
                    //$(this).html('<i class="ace-icon fa fa-check bigger-110"></i>SUBMIT');
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
            return jQuery.trim($("[id*=ddlSrchCircle]").val());
        };

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchDivision]").val());
        };

        function GetCustomers(pageIndex) {
            $.ajax({
                type: "POST",
                url: "SubDivisionMaster.aspx/GetSubDivision",
                //data: '{searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
                data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '", pageIndex: ' + pageIndex + '}',
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
            var customers = xml.find("SubDivision");
            if (row == null) {
                row = $("[id*=dgvSubDivisionMaster] tr:last-child").clone(true);
            }
            $("[id*=dgvSubDivisionMaster] tr").not($("[id*=dgvSubDivisionMaster] tr:first-child")).remove();
            if (customers.length > 0) {
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("CircleNameG").text());
                    $("td", row).eq(2).html($(this).find("DivisionNameG").text());
                    $("td", row).eq(3).html($(this).find("SubDivisionName").text());
                    $("td", row).eq(4).html($(this).find("SubDivisionNameG").text());
                    $("td", row).eq(5).html($(this).find("ShortCode").text());
                    $("td", row).eq(6).html($(this).find("Address1").text());
                    $("td", row).eq(7).html($(this).find("Address1G").text());
                    $("td", row).eq(8).html($(this).find("Address2").text());
                    $("td", row).eq(9).html($(this).find("Address2G").text());
                    $("td", row).eq(10).html($(this).find("Address3").text());
                    $("td", row).eq(11).html($(this).find("Address3G").text());
                    $("td", row).eq(12).html($(this).find("PhoneNo").text());
                    $("td", row).eq(13).html($(this).find("PhoneNoG").text());
                    $("td", row).eq(14).html($(this).find("MobileNo").text());
                    $("td", row).eq(15).html($(this).find("MobileNoG").text());
                    
                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", row).eq(16).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return EditSubDivision(' + $(this).find("SubDivisionID").text() + ')";><i class="fa fa-edit"></i> </button>'));
                    }
                    else { $("td", row).eq(16).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", row).eq(17).html($('<button type="button" class="btn btn-flat ink-reaction btn-default" onclick="return DeleteSubDivision(' + $(this).find("SubDivisionID").text() + ')";><i class="fa fa-trash"></i> </button>'));
                    }
                    else { $("td", row).eq(17).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=dgvSubDivisionMaster]").append(row);
                    row = $("[id*=dgvSubDivisionMaster] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });
                
                } else {
                    var empty_row = row.clone(true);
                    $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                    $("td:first-child", empty_row).attr("align", "center");
                    $("td:first-child", empty_row).html("No records found for the search criteria.");
                    $("td", empty_row).not($("td:first-child", empty_row)).remove();
                    $("[id*=dgvSubDivisionMaster]").append(empty_row);
            }
        };

        function EditSubDivision(lnk) {
            $.ajax({
                type: "POST",
                url: "SubDivisionMaster.aspx/GetSubDivisionMaster",
                data: '{SubDivisionID: "' + JSON.stringify(lnk) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSubDivisionSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function OnSubDivisionSuccess(response) {
            var res = response.d;
            $("[id=ContentPlaceHolder1_txtSubDivisionName]").attr('title', res[0].SubDivisionName);
            $("[id=ContentPlaceHolder1_txtSubDivisionNameG]").attr('title', res[0].SubDivisionNameG);
            $("[id*=hdnSubDivisionID]").val(res[0].SubDivisionID);
            $("[id=ContentPlaceHolder1_ddlCircle]").val(res[0].CircleID);
            $("[id=ContentPlaceHolder1_ddlDivision]").val(res[0].DivisionID);
            $("[id=ContentPlaceHolder1_txtSubDivisionName]").val(res[0].SubDivisionName);
            $("[id=ContentPlaceHolder1_txtSubDivisionNameG]").val(res[0].SubDivisionNameG);
            $("[id=ContentPlaceHolder1_txtShortCode]").attr('title', res[0].ShortCode);
            $("[id=ContentPlaceHolder1_txtShortCode]").val(res[0].ShortCode);
            $("[id=ContentPlaceHolder1_txtAddress1]").val(res[0].Address1);
            $("[id=ContentPlaceHolder1_txtAddress2]").val(res[0].Address2);
            $("[id=ContentPlaceHolder1_txtAddress3]").val(res[0].Address3);
            $("[id=ContentPlaceHolder1_txtAddress1G]").val(res[0].Address1G);
            $("[id=ContentPlaceHolder1_txtAddress2G]").val(res[0].Address2G);
            $("[id=ContentPlaceHolder1_txtAddress3G]").val(res[0].Address3G);
            $("[id=ContentPlaceHolder1_txtPhoneNo]").val(res[0].PhoneNo);
            $("[id=ContentPlaceHolder1_txtPhoneNoG]").val(res[0].PhoneNoG);
            $("[id=ContentPlaceHolder1_txtMobileNo]").val(res[0].MobileNo);
            $("[id=ContentPlaceHolder1_txtMobileNoG]").val(res[0].MobileNoG);
            ListDivison(res[0].CircleID, res[0].DivisionID);
            //$("#litab2").addClass("active");
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteSubDivision(lnk) {

            //$.ajax({
            //    type: "POST",
            //    url: "SubDivisionMaster.aspx/CheckSubDivisionID",
            //    data: '{SubDivisionID : ' + lnk + '}',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (response) {
            //        var msg = response.d;
            //        if (msg == "1") {
            //            swal("", "પેટા વિભાગ પેહેલેથી ઉપયોગમાં છે.", "warning");
            //            return false;
            //        }
            //        else {
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
                    url: "SubDivisionMaster.aspx/DeleteSubDivision",
                    data: '{SubDivisionID : ' + JSON.stringify(lnk) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        var msg = response.d;


                        if (msg.indexOf("Error") > -1) {

                            swal("Deleted!", msg, "success");
                        }
                        else {
                            GetCustomers();
                            swal("Deleted!", msg, "success");
                            ClearAll();
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
            });
        }
        //        },
        //        failure: function (response) {
        //            swal(response.d);
        //        },
        //        error: function (err) {
        //            swal(err);
        //            swal(err.text);
        //        }
        //    });
        //}

    </script>
</asp:Content>

