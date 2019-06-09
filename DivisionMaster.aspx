<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DivisionMaster.aspx.cs" Inherits="DivisionMaster" %>

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
            <li class="active">વિભાગની માહિતી</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="#first1" onclick="ViewDiv1();">વિભાગ ઉમેરો/સુધારો</a></li>
                            <li id="tab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>

                        </ul>
                    </div>

                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">

                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlCircle" class="form-control" runat="server">
                                            </asp:DropDownList>
                                           
                                            <label id="lblCircle" runat="server">વર્તુળ </label>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtDivisionName" class="form-control" runat="server" onchange="CheckAlreadyExists()" MaxLength="300"></asp:TextBox>
                                                    <label>વિભાગ </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtDivisionNameG" class="form-control" runat="server" onchange="CheckAlreadyExistsDivisionNameG()" MaxLength="300"></asp:TextBox>
                                                    <label>વિભાગ (ગુજરાતી) </label>
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
                                                    <asp:TextBox ID="txtPincode" class="form-control" runat="server" MaxLength="7" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>પિનકોડ નંબર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPincodeG" class="form-control" runat="server" MaxLength="7" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>પિનકોડ નંબર (ગુજરાતી) </label>
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
                                                    <asp:TextBox ID="txtOPhoneNo1" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર (ઓ - ૧) </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtOPhoneNo1G" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર (ઓ - ૧) (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtOPhoneNo2" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર (ઓ - ૨) </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtOPhoneNo2G" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર (ઓ - ૨) (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPPhoneNo" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફોન નંબર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPPhoneNoG" class="form-control" runat="server" MaxLength="12" onkeypress="return isNumberKey(event);"></asp:TextBox>
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
                                                    <asp:HiddenField ID="hdnDivisionID" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtFaxNo" class="form-control" runat="server" MaxLength="15" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફેક્સ નંબર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtFaxNoG" class="form-control" runat="server" MaxLength="15" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                    <label>ફેક્સ નંબર (ગુજરાતી) </label>
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

                                        <%--</form>--%>
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
                                            <label>વિભાગ (ગુજરાતી)</label>
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


                                                <asp:GridView ID="dgvDivisionMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>

                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="CircleName" HeaderText="વર્તુળ" SortExpression="CircleName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="DivisionName" HeaderText="વિભાગ" SortExpression="DivisionName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="DivisionNameG" HeaderText="વિભાગ (ગુજરાતી)" SortExpression="DivisionNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="ShortCode" HeaderText="શોર્ટ કોડ" SortExpression="ShortCode" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address1" HeaderText="સરનામું - ૧" SortExpression="Address1" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address1G" HeaderText="સરનામું - ૧ (ગુજરાતી)" SortExpression="Address1G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address2" HeaderText="સરનામું - ૨" SortExpression="Address2" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address2G" HeaderText="સરનામું - ૨ (ગુજરાતી)" SortExpression="Address2G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Address3" HeaderText="સરનામું - ૩" SortExpression="Address3" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>                                                        
                                                        <asp:BoundField DataField="Address3G" HeaderText="સરનામું - ૩ (ગુજરાતી)" SortExpression="Address3G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Pincode" HeaderText="પિનકોડ નંબર" SortExpression="Pincode" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="PincodeG" HeaderText="પિનકોડ નંબર (ગુજરાતી)" SortExpression="PincodeG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="EmailID" HeaderText="ઈ-મેલ" SortExpression="EmailID" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="OPhoneNo1" HeaderText="ફોન નંબર (ઓ - ૧)" SortExpression="OPhoneNo1" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="OPhoneNo1G" HeaderText="ફોન નંબર (ઓ - ૧) (ગુજરાતી)" SortExpression="OPhoneNo1G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="OPhoneNo2" HeaderText="ફોન નંબર (ઓ - ૨)" SortExpression="OPhoneNo2" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="OPhoneNo2G" HeaderText="ફોન નંબર (ઓ - ૨) (ગુજરાતી)" SortExpression="OPhoneNo2G" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="PPhoneNo" HeaderText="ફોન નંબર" SortExpression="PPhoneNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="PPhoneNoG" HeaderText="ફોન નંબર (ગુજરાતી)" SortExpression="PPhoneNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="MobileNo" HeaderText="મોબાઈલ નંબર" SortExpression="MobileNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="MobileNoG" HeaderText="મોબાઈલ નંબર (ગુજરાતી)" SortExpression="MobileNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="FaxNo" HeaderText="ફેક્સ નંબર" SortExpression="FaxNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="FaxNoG" HeaderText="ફેક્સ નંબર (ગુજરાતી)" SortExpression="FaxNoG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>

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
           
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "lidivisionmaster", "aDivisionMaster", "", "");
            $("[id=ContentPlaceHolder1_ddlCircle]").focus();
            $("#divFirst").css({ 'display': "block" });
            $("[id=tab1]").attr("class", "active");

            ListCircle();

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aDivisionMaster";
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

        function ValidateEmail(emailID) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(emailID);
        };

        function CheckAlreadyExists() {

            var divisiontooltip = document.getElementById('<%= txtDivisionName.ClientID %>').title;
            var division = document.getElementById('<%= txtDivisionName.ClientID %>');
            var circleid = document.getElementById('<%= ddlCircle.ClientID %>');

            if (divisiontooltip != "") {
                if (division.value != divisiontooltip) {
                    $.ajax({
                        type: "POST",
                        url: "DivisionMaster.aspx/CheckDivisionName",
                        data: '{DivisionName: "' + division.value + '", CircleID: "' + circleid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                division.focus();
                                swal("", "વિભાગ પેહેલેથી ઉપયોગમાં છે..!", "warning");
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
                if (division.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "DivisionMaster.aspx/CheckDivisionName",
                        data: '{DivisionName: "' + division.value + '", CircleID: "' + circleid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                division.focus();
                                swal("", "વિભાગ પેહેલેથી ઉપયોગમાં છે..!", "warning");
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

        function CheckAlreadyExistsDivisionNameG() {

            var divisionGtooltip = document.getElementById('<%= txtDivisionNameG.ClientID %>').title;
            var divisiong = document.getElementById('<%= txtDivisionNameG.ClientID %>');
            var circleid = document.getElementById('<%= ddlCircle.ClientID %>');

            if (divisionGtooltip != "") {
                if (divisiong.value != divisionGtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "DivisionMaster.aspx/CheckDivisionNameG",
                        data: '{DivisionNameG: "' + divisiong.value + '", CircleID: "' + circleid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                divisiong.focus();
                                swal("", "વિભાગ પેહેલેથી ઉપયોગમાં છે..! (ગુજરાતી)", "warning");
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
                if (divisiong.value != "") {
                    $.ajax({
                        type: "POST",
                        url: "DivisionMaster.aspx/CheckDivisionNameG",
                        data: '{DivisionNameG: "' + divisiong.value + '", CircleID: "' + circleid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                divisiong.focus();
                                swal("", "વિભાગ પેહેલેથી ઉપયોગમાં છે..! (ગુજરાતી)", "warning");
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
            var did = $("[id*=hdnDivisionID]").val();

            if (shortcodetooltip != "") {
                if (shortcode.value != shortcodetooltip) {
                    $.ajax({
                        type: "POST",
                        url: "DivisionMaster.aspx/CheckShortCode",
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
                        url: "DivisionMaster.aspx/CheckShortCode",
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
            $("[id=ContentPlaceHolder1_txtDivisionName]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtDivisionNameG]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtShortCode]").attr('title', '');
            $("[id*=hdnDivisionID]").val('');
            $("[id=ContentPlaceHolder1_ddlCircle]").val('');
            $("[id=ContentPlaceHolder1_txtDivisionName]").val('');
            $("[id=ContentPlaceHolder1_txtDivisionNameG]").val('');
            $("[id=ContentPlaceHolder1_txtShortCode]").val('');
            $("[id=ContentPlaceHolder1_txtAddress1]").val('');
            $("[id=ContentPlaceHolder1_txtAddress1G]").val('');
            $("[id=ContentPlaceHolder1_txtAddress2]").val('');
            $("[id=ContentPlaceHolder1_txtAddress2G]").val('');
            $("[id=ContentPlaceHolder1_txtAddress3]").val('');
            $("[id=ContentPlaceHolder1_txtAddress3G]").val('');
            $("[id=ContentPlaceHolder1_txtPincode]").val('');
            $("[id=ContentPlaceHolder1_txtPincodeG]").val('');
            $("[id=ContentPlaceHolder1_txtEmailID]").val('');
            $("[id=ContentPlaceHolder1_txtOPhoneNo1]").val('');
            $("[id=ContentPlaceHolder1_txtOPhoneNo1G]").val('');
            $("[id=ContentPlaceHolder1_txtOPhoneNo2]").val('');
            $("[id=ContentPlaceHolder1_txtOPhoneNo2G]").val('');
            $("[id=ContentPlaceHolder1_txtPPhoneNo]").val('');
            $("[id=ContentPlaceHolder1_txtPPhoneNoG]").val('');
            $("[id=ContentPlaceHolder1_txtMobileNo]").val('');
            $("[id=ContentPlaceHolder1_txtMobileNoG]").val('');
            $("[id=ContentPlaceHolder1_txtFaxNo]").val('');
            $("[id=ContentPlaceHolder1_txtFaxNoG]").val('');
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

                var divisionid = $("[id*=hdnDivisionID]").val();
                var circleName = document.getElementById("ContentPlaceHolder1_ddlCircle");
                var divisionName = document.getElementById("ContentPlaceHolder1_txtDivisionName");
                var divisionNameG = document.getElementById("ContentPlaceHolder1_txtDivisionNameG");
                var shortCode = document.getElementById("ContentPlaceHolder1_txtShortCode");
                var address1 = document.getElementById("ContentPlaceHolder1_txtAddress1");
                var address1G = document.getElementById("ContentPlaceHolder1_txtAddress1G");
                var address2 = document.getElementById("ContentPlaceHolder1_txtAddress2");
                var address2G = document.getElementById("ContentPlaceHolder1_txtAddress2G");
                var address3 = document.getElementById("ContentPlaceHolder1_txtAddress3");
                var address3G = document.getElementById("ContentPlaceHolder1_txtAddress3G");
                var pincode = document.getElementById("ContentPlaceHolder1_txtPincode");
                var pincodeG = document.getElementById("ContentPlaceHolder1_txtPincodeG");
                var emailID = document.getElementById("ContentPlaceHolder1_txtEmailID");
                var oPhoneNo1 = document.getElementById("ContentPlaceHolder1_txtOPhoneNo1");
                var oPhoneNo1G = document.getElementById("ContentPlaceHolder1_txtOPhoneNo1G");
                var oPhoneNo2 = document.getElementById("ContentPlaceHolder1_txtOPhoneNo2");
                var oPhoneNo2G = document.getElementById("ContentPlaceHolder1_txtOPhoneNo2G");
                var pPhoneNo = document.getElementById("ContentPlaceHolder1_txtPPhoneNo");
                var pPhoneNoG = document.getElementById("ContentPlaceHolder1_txtPPhoneNoG");
                var mobileNo = document.getElementById("ContentPlaceHolder1_txtMobileNo");
                var mobileNoG = document.getElementById("ContentPlaceHolder1_txtMobileNoG");
                var faxNo = document.getElementById("ContentPlaceHolder1_txtFaxNo");
                var faxNoG = document.getElementById("ContentPlaceHolder1_txtFaxNoG");

                if (circleName.value == "0") {
                    circleName.focus();
                    swal("", "વર્તુળ પસંદ કરો", "warning");
                    return false;
                }

                else if (divisionName.value == "") {
                    divisionName.focus();
                    swal("", "વિભાગ દાખલ કરો", "warning");
                    return false;
                }

                else if (divisionNameG.value == "") {
                    divisionNameG.focus();
                    swal("", "વિભાગ દાખલ કરો (ગુજરાતી)", "warning");
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

                else if (pincode.value == "") {
                    pincode.focus();
                    swal("", "પિનકોડ નંબર દાખલ કરો", "warning");
                    return false;
                }

                else if (pincodeG.value == "") {
                    pincodeG.focus();
                    swal("", "પિનકોડ નંબર દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (emailID.value != "" && !ValidateEmail(emailID.value)) {
                    emailID.focus();
                    swal("", "માન્ય ઈ-મેલ દાખલ કરો", "warning");
                    return false;
                }

                else if (oPhoneNo1.value != "" && oPhoneNo1.value.length < 11) {
                    oPhoneNo1.focus();
                    swal("", "માન્ય ફોન નંબર - ૧ દાખલ કરો", "warning");
                    return false;
                }

                else if (oPhoneNo1G.value != "" && oPhoneNo1G.value.length < 11) {
                    oPhoneNo1G.focus();
                    swal("", "માન્ય ફોન નંબર - ૧ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (oPhoneNo2.value != "" && oPhoneNo2.value.length < 11) {
                    oPhoneNo2.focus();
                    swal("", "માન્ય ફોન નંબર - ૨ દાખલ કરો", "warning");
                    return false;
                }

                else if (oPhoneNo2G.value != "" && oPhoneNo2G.value.length < 11) {
                    oPhoneNo2G.focus();
                    swal("", "માન્ય ફોન નંબર - ૨ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (pPhoneNo.value != "" && pPhoneNo.value.length < 11) {
                    pPhoneNo.focus();
                    swal("", "માન્ય ફોન નંબર દાખલ કરો", "warning");
                    return false;
                }

                else if (pPhoneNoG.value != "" && pPhoneNoG.value.length < 11) {
                    pPhoneNoG.focus();
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

                else if (faxNo.value != "" && faxNo.value.length < 15) {
                    faxNo.focus();
                    swal("", "માન્ય ફેક્સ નંબર દાખલ કરો", "warning");
                    return false;
                }

                else if (faxNoG.value != "" && faxNoG.value.length < 15) {
                    faxNoG.focus();
                    swal("", "માન્ય ફેક્સ નંબર દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    //$(this).html('<i class="fa fa-spinner fa-spin fa-spin  bigger-125"></i>PLEASE WAIT');
                    var division = {};
                    division.CircleID = $("[id=ContentPlaceHolder1_ddlCircle]").val();
                    division.DivisionName = $("[id=ContentPlaceHolder1_txtDivisionName]").val();
                    division.DivisionNameG = $("[id=ContentPlaceHolder1_txtDivisionNameG]").val();
                    division.ShortCode = $("[id=ContentPlaceHolder1_txtShortCode]").val();
                    division.Address1 = $("[id=ContentPlaceHolder1_txtAddress1]").val();
                    division.Address1G = $("[id=ContentPlaceHolder1_txtAddress1G]").val();
                    division.Address2 = $("[id=ContentPlaceHolder1_txtAddress2]").val();
                    division.Address2G = $("[id=ContentPlaceHolder1_txtAddress2G]").val();
                    division.Address3 = $("[id=ContentPlaceHolder1_txtAddress3]").val();
                    division.Address3G = $("[id=ContentPlaceHolder1_txtAddress3G]").val();
                    division.Pincode = $("[id=ContentPlaceHolder1_txtPincode]").val();
                    division.PincodeG = $("[id=ContentPlaceHolder1_txtPincodeG]").val();
                    division.EmailID = $("[id=ContentPlaceHolder1_txtEmailID]").val();
                    division.OPhoneNo1 = $("[id=ContentPlaceHolder1_txtOPhoneNo1]").val();
                    division.OPhoneNo1G = $("[id=ContentPlaceHolder1_txtOPhoneNo1G]").val();
                    division.OPhoneNo2 = $("[id=ContentPlaceHolder1_txtOPhoneNo2]").val();
                    division.OPhoneNo2G = $("[id=ContentPlaceHolder1_txtOPhoneNo2G]").val();
                    division.PPhoneNo = $("[id=ContentPlaceHolder1_txtPPhoneNo]").val();
                    division.PPhoneNoG = $("[id=ContentPlaceHolder1_txtPPhoneNoG]").val();
                    division.MobileNo = $("[id=ContentPlaceHolder1_txtMobileNo]").val();
                    division.MobileNoG = $("[id=ContentPlaceHolder1_txtMobileNoG]").val();
                    division.FaxNo = $("[id=ContentPlaceHolder1_txtFaxNo]").val();
                    division.FaxNoG = $("[id=ContentPlaceHolder1_txtFaxNoG]").val();

                    if (divisionid == "")
                        division.DivisionID = 0
                    else
                        division.DivisionID = divisionid;

                    $.ajax({
                        type: "POST",
                        url: "DivisionMaster.aspx/DivisionManage",
                        data: '{division: ' + JSON.stringify(division) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                                return false;
                            }
                            else if ($("[id*=hdnDivisionID]").val() != "") {
                                swal("Updated", msg, "success");
                                GetCustomers(1);
                                ClearAll();
                            }
                            else {
                                swal("Inserted", msg, "success");
                                GetCustomers(1);
                                ClearAll();
                            }
                        }
                    });
                    if ($("#hdnSubmitVal").val() == "1") {
                        $("[id*=btnSave]").html("દાખલ કરો");
                        $("[id*=btnSave]").removeAttr('disabled');
                        $("#hdnSubmitVal").val(0);
                    }
                    return false;
                }
                
            });
        });

        //$("[id*=txtSearch]").on("keyup", function () {
        //    GetCustomers(parseInt(1));
        //});

        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };

        function GetCustomers(pageIndex) {
            
            $.ajax({
                type: "POST",
                url: "DivisionMaster.aspx/GetDivision",
                data: '{searchTerm: "' + SearchTerm() + '",pageIndex: ' + pageIndex + '}',
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
            var customers = xml.find("Division");
            if (row == null) {
                row = $("[id*=dgvDivisionMaster] tr:last-child").clone(true);
            }
            $("[id*=dgvDivisionMaster] tr").not($("[id*=dgvDivisionMaster] tr:first-child")).remove();
            if (customers.length > 0) {
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("CircleName").text());
                    $("td", row).eq(2).html($(this).find("DivisionName").text());
                    $("td", row).eq(3).html($(this).find("DivisionNameG").text());
                    $("td", row).eq(4).html($(this).find("ShortCode").text());
                    $("td", row).eq(5).html($(this).find("Address1").text());
                    $("td", row).eq(6).html($(this).find("Address1G").text());
                    $("td", row).eq(7).html($(this).find("Address2").text());
                    $("td", row).eq(8).html($(this).find("Address2G").text());
                    $("td", row).eq(9).html($(this).find("Address3").text());
                    $("td", row).eq(10).html($(this).find("Address3G").text());
                    $("td", row).eq(11).html($(this).find("Pincode").text());
                    $("td", row).eq(12).html($(this).find("PincodeG").text());
                    $("td", row).eq(13).html($(this).find("EmailID").text());
                    $("td", row).eq(14).html($(this).find("OPhoneNo1").text());
                    $("td", row).eq(15).html($(this).find("OPhoneNo1G").text());
                    $("td", row).eq(16).html($(this).find("OPhoneNo2").text());
                    $("td", row).eq(17).html($(this).find("OPhoneNo2G").text());
                    $("td", row).eq(18).html($(this).find("PPhoneNo").text());
                    $("td", row).eq(19).html($(this).find("PPhoneNoG").text());
                    $("td", row).eq(20).html($(this).find("MobileNo").text());
                    $("td", row).eq(21).html($(this).find("MobileNoG").text());
                    $("td", row).eq(22).html($(this).find("FaxNo").text());
                    $("td", row).eq(23).html($(this).find("FaxNoG").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", row).eq(24).html($('<button  class="btn btn-flat ink-reaction btn-default" onclick="return EditDivision(' + $(this).find("DivisionID").text() + ')";><i class="fa fa-edit"></i> </button>'));
                    }
                    else { $("td", row).eq(24).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", row).eq(25).html($('<button type="button"  class="btn btn-flat ink-reaction btn-default" onclick="return DeleteDivision(' + $(this).find("DivisionID").text() + ')";><i class="fa fa-trash"></i> </button>'));
                    }
                    else { $("td", row).eq(25).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }


                    $("[id*=dgvDivisionMaster]").append(row);
                    row = $("[id*=dgvDivisionMaster] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                

                $(".DivisionNameG").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
                } else {
                    var empty_row = row.clone(true);
                    $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                    $("td:first-child", empty_row).attr("align", "center");
                    $("td:first-child", empty_row).html("No records found for the search criteria.");
                    $("td", empty_row).not($("td:first-child", empty_row)).remove();
                    $("[id*=dgvDivisionMaster]").append(empty_row);
            }
        };

        function EditDivision(lnk) {
            $.ajax({
                type: "POST",
                url: "DivisionMaster.aspx/GetDivisionMaster",
                data: '{DivisionID: "' + JSON.stringify(lnk) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnDivisionSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function OnDivisionSuccess(response) {
            var res = response.d;
            $("[id=ContentPlaceHolder1_txtDivisionName]").attr('title', res[0].DivisionName);
            $("[id=ContentPlaceHolder1_txtDivisionNameG]").attr('title', res[0].DivisionNameG);
            $("[id=ContentPlaceHolder1_ddlCircle]").val(res[0].CircleID);
            $("[id=ContentPlaceHolder1_txtDivisionName]").val(res[0].DivisionName);
            $("[id=ContentPlaceHolder1_txtDivisionNameG]").val(res[0].DivisionNameG);
            $("[id=ContentPlaceHolder1_txtShortCode]").attr('title', res[0].ShortCode);
            $("[id=ContentPlaceHolder1_txtShortCode]").val(res[0].ShortCode);
            $("[id=ContentPlaceHolder1_txtAddress1]").val(res[0].Address1);
            $("[id=ContentPlaceHolder1_txtAddress2]").val(res[0].Address2);
            $("[id=ContentPlaceHolder1_txtAddress3]").val(res[0].Address3);
            $("[id=ContentPlaceHolder1_txtAddress1G]").val(res[0].Address1G);
            $("[id=ContentPlaceHolder1_txtAddress2G]").val(res[0].Address2G);
            $("[id=ContentPlaceHolder1_txtAddress3G]").val(res[0].Address3G);
            $("[id=ContentPlaceHolder1_txtPincode]").val(res[0].Pincode);
            $("[id=ContentPlaceHolder1_txtPincodeG]").val(res[0].PincodeG);
            $("[id=ContentPlaceHolder1_txtEmailID]").val(res[0].EmailID);
            $("[id=ContentPlaceHolder1_txtOPhoneNo1]").val(res[0].OPhoneNo1);
            $("[id=ContentPlaceHolder1_txtOPhoneNo1G]").val(res[0].OPhoneNo1G);
            $("[id=ContentPlaceHolder1_txtOPhoneNo2]").val(res[0].OPhoneNo2);
            $("[id=ContentPlaceHolder1_txtOPhoneNo2G]").val(res[0].OPhoneNo2G);
            $("[id=ContentPlaceHolder1_txtPPhoneNo]").val(res[0].PPhoneNo);
            $("[id=ContentPlaceHolder1_txtPPhoneNoG]").val(res[0].PPhoneNoG);
            $("[id=ContentPlaceHolder1_txtMobileNo]").val(res[0].MobileNo);
            $("[id=ContentPlaceHolder1_txtMobileNoG]").val(res[0].MobileNoG);
            $("[id=ContentPlaceHolder1_txtFaxNo]").val(res[0].FaxNo);
            $("[id=ContentPlaceHolder1_txtFaxNoG]").val(res[0].FaxNoG);
            $("[id*=hdnDivisionID]").val(res[0].DivisionID);
            //$("#litab2").addClass("active");
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function DeleteDivision(lnk) {

            $.ajax({
                type: "POST",
                url: "DivisionMaster.aspx/CheckDivisionID",
                data: '{DivisionID : ' + lnk + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "વિભાગ પેહેલેથી ઉપયોગમાં છે.", "warning");
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
                                url: "DivisionMaster.aspx/DeleteDivision",
                                data: '{DivisionID : ' + JSON.stringify(lnk) + '}',
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

