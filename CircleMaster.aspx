<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CircleMaster.aspx.cs" Inherits="CircleMaster" %>

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
            <li class="active">વર્તુળની માહિતી</li>
        </ol>

    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">વર્તુળ ઉમેરો/સુધારો</a></li>
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
                                                    <asp:TextBox ID="txtCircleName" class="form-control" runat="server" onchange="CheckAlreadyExists()" MaxLength="300"></asp:TextBox>
                                                    <label>વર્તુળ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCircleNameG" class="form-control" runat="server" onchange="CheckAlreadyExistsCircleNameG()" MaxLength="300"></asp:TextBox>
                                                    <label>વર્તુળ (ગુજરાતી) </label>
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

                                        <div class="form-group">
                                            <asp:TextBox ID="txtEmailID" class="form-control" runat="server" type="email"></asp:TextBox>
                                            <label>ઈ-મેલ </label>
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
                                                    <asp:HiddenField ID="hdnCircleID" runat="server" />
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
                                            <asp:TextBox ID="txtSearch" class="form-control" runat="server" Style="text-transform: uppercase"></asp:TextBox>
                                            <label>વર્તુળ (ગુજરાતી)</label>
                                        </div>
                                    </div>

                                    <div class="col-sm-2">
                                        <button id="btnFindUser" type="button" class="btn ink-reaction btn-raised btn-primary" data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" style="padding: 2px 15px">
                                            માહિતી શોધો
                                        </button>
                                        <input type="hidden" id="hdnFindUser" value="0" />
                                    </div>
                                </div>

                                <div style="display: none" id="divGrid">
                                    <div class="row">


                                        <div class="col-lg-12">
                                            <div class="table-responsive">

                                                <asp:GridView ID="dgvCircleMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>

                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="CircleName" HeaderText="વર્તુળ" SortExpression="CircleName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="CircleNameG" HeaderText="વર્તુળ" SortExpression="CircleNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="ShortCode" HeaderText="શોર્ટ કોડ" SortExpression="ShortCode" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address1" HeaderText="સરનામું - ૧" SortExpression="Address1" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address1G" HeaderText="સરનામું - ૧ (ગુજરાતી)" SortExpression="Address1G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address2" HeaderText="સરનામું - ૨" SortExpression="Address2" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address2G" HeaderText="સરનામું - ૨ (ગુજરાતી)" SortExpression="Address2G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address3" HeaderText="સરનામું - ૩" SortExpression="Address3" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address3G" HeaderText="સરનામું - ૩ (ગુજરાતી)" SortExpression="Address3G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="EmailID" HeaderText="ઈ-મેલ" SortExpression="EmailID" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="PhoneNo" HeaderText="ફોન નંબર" SortExpression="PhoneNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="PhoneNoG" HeaderText="ફોન નંબર (ગુજરાતી)" SortExpression="PhoneNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="MobileNo" HeaderText="મોબાઈલ નંબર" SortExpression="MobileNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="MobileNoG" HeaderText="મોબાઈલ નંબર (ગુજરાતી)" SortExpression="MobileNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>

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
            SetMenu("liMaster", "ulMaster", "licirclemaster", "aCircleMaster", "", "");
            $("[id=ContentPlaceHolder1_txtCircleName]").focus();
            $("#divFirst").css({ 'display': "block" });
            $("[id=tab1]").attr("class", "active");

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aCircleMaster";
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

            $("[id=ContentPlaceHolder1_txtPakName]").focus();
            $("#divFirst").css({ 'display': "block" });

            $("[id*=litab1]").attr('class', 'active');
        });



        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_txtCircleName]").focus();
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            GetCustomers(1);
        }

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

        function ValidateEmail(emailID) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(emailID);
        };

        function CheckAlreadyExists() {
            var circletooltip = document.getElementById("ContentPlaceHolder1_txtCircleName").title;
            var circle = document.getElementById("ContentPlaceHolder1_txtCircleName");

            if (circletooltip != "") {
                if (circle.value != circletooltip) {
                    $.ajax({
                        type: "POST",
                        url: "CircleMaster.aspx/CheckCircleName",
                        data: '{CircleName: "' + circle.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                circle.focus();
                                swal("", "વર્તુળ પેહેલેથી ઉપયોગમાં છે..!", "warning");
                                $("[id=ContentPlaceHolder1_txtCircleName]").val('');
                                document.getElementById("#ContentPlaceHolder1_txtCircleName").value = "";
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
                $.ajax({
                    type: "POST",
                    url: "CircleMaster.aspx/CheckCircleName",
                    data: '{CircleName: "' + circle.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            circle.focus();
                            swal("", "વર્તુળ પેહેલેથી ઉપયોગમાં છે..!", "warning");
                            $("[id=ContentPlaceHolder1_txtCircleName]").val('');
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

        function CheckAlreadyExistsCircleNameG() {
            var circleGtooltip = document.getElementById("ContentPlaceHolder1_txtCircleNameG").title;
            var circleg = document.getElementById("ContentPlaceHolder1_txtCircleNameG");

            if (circleGtooltip != "") {
                if (circleg.value != circleGtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "CircleMaster.aspx/CheckCircleNameG",
                        data: '{CircleNameG: "' + circleg.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                circleg.focus();
                                swal("", "વર્તુળ પેહેલેથી ઉપયોગમાં છે..! (ગુજરાતી)", "warning");
                                $("[id=ContentPlaceHolder1_txtCircleNameG]").val('');
                                document.getElementById("#ContentPlaceHolder1_txtCircleNameG").value = "";
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
                $.ajax({
                    type: "POST",
                    url: "CircleMaster.aspx/CheckCircleNameG",
                    data: '{CircleNameG: "' + circleg.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            circleg.focus();
                            swal("", "વર્તુળ પેહેલેથી ઉપયોગમાં છે..! (ગુજરાતી)", "warning");
                            $("[id=ContentPlaceHolder1_txtCircleNameG]").val('');
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

        function CheckShortCodeAlreadyExists() {
            var shortcodetooltip = document.getElementById('<%= txtShortCode.ClientID %>').title;
            var shortcode = document.getElementById('<%= txtShortCode.ClientID %>');

            if (shortcodetooltip != "") {
                if (shortcode.value != shortcodetooltip) {
                    $.ajax({
                        type: "POST",
                        url: "CircleMaster.aspx/CheckShortCode",
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
                                $("[id*=ContentPlaceHolder1_txtShortCode]").val('');
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
                $.ajax({
                    type: "POST",
                    url: "CircleMaster.aspx/CheckShortCode",
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
                            $("[id*=ContentPlaceHolder1_txtShortCode]").val('');
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





        function ClearAll() {
            $("[id=ContentPlaceHolder1_txtCircleName]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtCircleNameG]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtShortCode]").attr('title', '');
            $("[id*=hdnCircleID]").val('');
            $("[id=ContentPlaceHolder1_txtCircleName]").val('');
            $("[id=ContentPlaceHolder1_txtCircleNameG]").val('');
            $("[id=ContentPlaceHolder1_txtShortCode]").val('');
            $("[id=ContentPlaceHolder1_txtAddress1]").val('');
            $("[id=ContentPlaceHolder1_txtAddress1G]").val('');
            $("[id=ContentPlaceHolder1_txtAddress2]").val('');
            $("[id=ContentPlaceHolder1_txtAddress2G]").val('');
            $("[id=ContentPlaceHolder1_txtAddress3]").val('');
            $("[id=ContentPlaceHolder1_txtAddress3G]").val('');
            $("[id=ContentPlaceHolder1_txtEmailID]").val('');
            $("[id=ContentPlaceHolder1_txtPhoneNo]").val('');
            $("[id=ContentPlaceHolder1_txtPhoneNoG]").val('');
            $("[id=ContentPlaceHolder1_txtMobileNo]").val('');
            $("[id=ContentPlaceHolder1_txtMobileNoG]").val('');
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
                var circleid = $("[id*=hdnCircleID]").val();
                var circleName = document.getElementById("ContentPlaceHolder1_txtCircleName");
                var circleNameG = document.getElementById("ContentPlaceHolder1_txtCircleNameG");
                var shortCode = document.getElementById("ContentPlaceHolder1_txtShortCode");
                var address1 = document.getElementById("ContentPlaceHolder1_txtAddress1");
                var address1G = document.getElementById("ContentPlaceHolder1_txtAddress1G");
                var address2 = document.getElementById("ContentPlaceHolder1_txtAddress2");
                var address2G = document.getElementById("ContentPlaceHolder1_txtAddress2G");
                var address3 = document.getElementById("ContentPlaceHolder1_txtAddress3");
                var address3G = document.getElementById("ContentPlaceHolder1_txtAddress3G");
                var emailID = document.getElementById("ContentPlaceHolder1_txtEmailID");
                var phoneNo = document.getElementById("ContentPlaceHolder1_txtPhoneNo");
                var phoneNoG = document.getElementById("ContentPlaceHolder1_txtPhoneNoG");
                var mobileNo = document.getElementById("ContentPlaceHolder1_txtMobileNo");
                var mobileNoG = document.getElementById("ContentPlaceHolder1_txtMobileNoG");
                var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

                if (circleName.value == "") {
                    circleName.focus();
                    swal("", "વર્તુળ દાખલ કરો", "warning");
                    return false;
                }

                else if (circleNameG.value == "") {
                    circleNameG.focus();
                    swal("", "વર્તુળ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (shortCode.value == "") {
                    shortCode.focus();
                    swal("", "શોટ ર્કોડ દાખલ કરો", "warning");
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
            
                else if (emailID.value != "" && expr.test(emailID.value) == false) {
                    emailID.focus();
                    swal("", "માન્ય ઈ-મેઈલ દાખલ કરો.", "warning");
                    return false;
                }
            
                else if (phoneNo.value != "" && phoneNo.value.length < 11) {
                    phoneNo.focus();
                    swal("", "માન્ય ફોન નંબર - ૧ દાખલ કરો", "warning");
                    return false;
                }
           
                else if (phoneNoG.value != "" && phoneNoG.value.length < 11) {
                    phoneNoG.focus();
                    swal("", "માન્ય ફોન નંબર - ૧ દાખલ કરો (ગુજરાતી)", "warning");
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
                    var circle = {};
                    circle.CircleName = $("[id=ContentPlaceHolder1_txtCircleName]").val();
                    circle.CircleNameG = $("[id=ContentPlaceHolder1_txtCircleNameG]").val();
                    circle.ShortCode = $("[id=ContentPlaceHolder1_txtShortCode]").val();
                    circle.Address1 = $("[id=ContentPlaceHolder1_txtAddress1]").val();
                    circle.Address1G = $("[id=ContentPlaceHolder1_txtAddress1G]").val();
                    circle.Address2 = $("[id=ContentPlaceHolder1_txtAddress2]").val();
                    circle.Address2G = $("[id=ContentPlaceHolder1_txtAddress2G]").val();
                    circle.Address3 = $("[id=ContentPlaceHolder1_txtAddress3]").val();
                    circle.Address3G = $("[id=ContentPlaceHolder1_txtAddress3G]").val();
                    circle.EmailID = $("[id=ContentPlaceHolder1_txtEmailID]").val();
                    circle.PhoneNo = $("[id=ContentPlaceHolder1_txtPhoneNo]").val();
                    circle.PhoneNoG = $("[id=ContentPlaceHolder1_txtPhoneNoG]").val();
                    circle.MobileNo = $("[id=ContentPlaceHolder1_txtMobileNo]").val();
                    circle.MobileNoG = $("[id=ContentPlaceHolder1_txtMobileNoG]").val();

                    if (circleid == "")
                        circle.CircleID = 0
                    else
                        circle.CircleID = circleid;

                    $.ajax({
                        type: "POST",
                        url: "CircleMaster.aspx/CircleManage",
                        data: '{circle: ' + JSON.stringify(circle) + '}',
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

        $("[id*=txtSearch]").on("keyup", function () {
            GetCustomers(parseInt(1));
        });

        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };

        function GetCustomers(pageIndex) {
            $.ajax({
                type: "POST",
                url: "CircleMaster.aspx/GetCircle",
                data: '{searchTerm: "' + SearchTerm() + '",pageIndex:' + pageIndex + '}',
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
            var customers = xml.find("Circle");
            if (row == null) {
                row = $("[id*=dgvCircleMaster] tr:last-child").clone(true);
            }
            $("[id*=dgvCircleMaster] tr").not($("[id*=dgvCircleMaster] tr:first-child")).remove();
            if (customers.length > 0) {
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("CircleName").text());
                    $("td", row).eq(2).html($(this).find("CircleNameG").text());
                    $("td", row).eq(3).html($(this).find("ShortCode").text());
                    $("td", row).eq(4).html($(this).find("Address1").text());
                    $("td", row).eq(5).html($(this).find("Address1G").text());
                    $("td", row).eq(6).html($(this).find("Address2").text());
                    $("td", row).eq(7).html($(this).find("Address2G").text());
                    $("td", row).eq(8).html($(this).find("Address3").text());
                    $("td", row).eq(9).html($(this).find("Address3G").text());
                    $("td", row).eq(10).html($(this).find("EmailID").text());
                    $("td", row).eq(11).html($(this).find("PhoneNo").text());
                    $("td", row).eq(12).html($(this).find("PhoneNoG").text());
                    $("td", row).eq(13).html($(this).find("MobileNo").text());
                    $("td", row).eq(14).html($(this).find("MobileNoG").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", row).eq(15).html($('<button  class="btn btn-flat ink-reaction btn-default" onclick="return EditCircle(' + $(this).find("CircleID").text() + ')";><i class="fa fa-edit"></i> </button>'));
                    }
                    else { $("td", row).eq(15).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", row).eq(16).html($('<button type="button"  class="btn btn-flat ink-reaction btn-default" onclick="return DeleteCircle(' + $(this).find("CircleID").text() + ')";><i class="fa fa-trash"></i> </button>'));
                    }
                    else { $("td", row).eq(16).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=dgvCircleMaster]").append(row);
                    row = $("[id*=dgvCircleMaster] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                $(".CircleNameG").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=dgvCircleMaster]").append(empty_row);
            }
        };

        function EditCircle(lnk) {
            $.ajax({
                type: "POST",
                url: "CircleMaster.aspx/GetCircleMaster",
                data: '{CircleID: "' + JSON.stringify(lnk) + '"}',
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
            $("[id=ContentPlaceHolder1_txtCircleName]").attr('title', res[0].CircleName);
            $("[id=ContentPlaceHolder1_txtCircleNameG]").attr('title', res[0].CircleNameG);
            $("[id=ContentPlaceHolder1_txtCircleName]").val(res[0].CircleName);
            $("[id*=txtCircleNameG]").val(res[0].CircleNameG);
            $("[id*=txtShortCode]").attr('title', res[0].ShortCode);
            $("[id*=txtShortCode]").val(res[0].ShortCode);
            $("[id*=txtAddress1]").val(res[0].Address1);
            $("[id*=txtAddress2]").val(res[0].Address2);
            $("[id*=txtAddress3]").val(res[0].Address3);
            $("[id*=txtAddress1G]").val(res[0].Address1G);
            $("[id*=txtAddress2G]").val(res[0].Address2G);
            $("[id*=txtAddress3G]").val(res[0].Address3G);
            $("[id*=txtEmailID]").val(res[0].EmailID);
            $("[id*=txtPhoneNo]").val(res[0].PhoneNo);
            $("[id*=txtPhoneNoG]").val(res[0].PhoneNoG);
            $("[id*=txtMobileNo]").val(res[0].MobileNo);
            $("[id*=txtMobileNoG]").val(res[0].MobileNoG);
            $("[id*=hdnCircleID]").val(res[0].CircleID);
            //$("#litab2").addClass("active");
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteCircle(lnk) {

            $.ajax({
                type: "POST",
                url: "CircleMaster.aspx/CheckCircleID",
                data: '{CircleID : ' + lnk + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "વર્તુળ પેહેલેથી ઉપયોગમાં છે.", "warning");
                        return false;
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
                                url: "CircleMaster.aspx/DeleteCircle",
                                data: '{CircleID : ' + JSON.stringify(lnk) + '}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {

                                    var msg = response.d;


                                    if (msg.indexOf("Error") > -1) {

                                        swal("Deleted!", msg, "success");
                                    }
                                    else {
                                        GetCustomers(1);
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

