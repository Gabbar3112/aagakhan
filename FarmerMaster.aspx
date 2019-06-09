<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FarmerMaster.aspx.cs" Inherits="FarmerMaster" %>

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
            <li class="active">ખેડૂત ની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="divFirst" onclick="ViewDiv1();">ખેડૂત ની માહિતી ઉમેરો/સુધારો </a></li>
                            <li id="tab2"><a href="divSecond" onclick="ViewDiv2();">યાદી</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="Div2">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" onchange="BindTaluka()">
                                            </asp:DropDownList>
                                            <label>જીલ્લો </label>
                                            <%--<asp:DropDownList ID="ddlDistrict1" onchange="BindTaluka()" runat="server" class="form-control" DataSourceID="dsDistrict" DataTextField="DistrictNameG" DataValueField="DistrictID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="dsDistrict" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>'
                                                    SelectCommand="ListAllDistrict" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlTaluka" runat="server" class="form-control" onchange="BindVillage()"></asp:DropDownList>
                                            <label>તાલુકો </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlVillage" runat="server" class="form-control"></asp:DropDownList>
                                            <label>ગામ </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtFName" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <asp:HiddenField ID="hdnFarmerID" runat="server" />
                                            <label>પ્રથમ નામ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtMName" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>પિતા/વાલી/પતિનું નામ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtLName" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>અટક </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtFNameG" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>પ્રથમ નામ(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtMNameG" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>પિતા/વાલી/પતિનું નામ(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtLNameG" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>અટક(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress1" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૧ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress2" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૨</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress3" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૩</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress1G" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૧(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress2G" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૨(ગુજરાતી)</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress3G" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૩(ગુજરાતી)</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtMobileNo" MaxLength="12" class="form-control" runat="server" onchange="CheckAlredyExistsMobileNo()" onkeypress="return isNumberKey(event);" ></asp:TextBox>
                                            <label>મોબાઇલ નંબર </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtMobileNoG" MaxLength="12" class="form-control" runat="server" onchange="CheckAlredyExistsMobileNoG()" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                            <label>મોબાઇલ નંબર(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                            દાખલ કરો</button>
                                         <input type="hidden" id="hdnSubmitVal" value="0" />
                                    </div>
                                    <div class="col-sm-1">
                                        <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" onclick="farmerclr()">
                                            રદ કરો</button>
                                        <input type="hidden" id="hdnReset" value="0" />
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div id="divSecond">
                            <div class="tab-pane active" id="Div1">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchDistrict" runat="server" CssClass="form-control" onchange="BindSrchTaluka()">
                                            </asp:DropDownList>
                                            <label>જીલ્લો</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchTaluka" runat="server" class="form-control" onchange="BindSrchVillage()"></asp:DropDownList>
                                            <label>તાલુકો</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchVillage" runat="server" class="form-control"></asp:DropDownList>
                                            <label>ગામ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFarmer" class="form-control" runat="server"></asp:TextBox>
                                            <label>ખેડૂત નું નામ</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <button id="btnSearch" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                            ખેડૂત શોધો</button>
                                        <input type="hidden" id="hdnFindUser" value="0" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divGrid">
                        <div id="widget-container-col-1" class="col-xs-12 widget-container-col ui-sortable">
                            <div class="widget-box widget-color-blue" id="widget-box-1">
                                <div class="widget-body">
                                    <div class="tab-pane" id="Div3">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="table-responsive">
                                                    <table id="datatable1" class="table table-striped table-hover">
                                                        <asp:GridView ID="gvFarmerInfoMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                            <PagerStyle CssClass="Pager" />
                                                            <Columns>
                                                                <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                                <asp:BoundField DataField="FullName" HeaderText="નામ" SortExpression="FullName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                                <asp:BoundField DataField="FullAddress" HeaderText=" સરનામુ" SortExpression="FullAddress" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                                <asp:BoundField DataField="MobileNo" HeaderText=" મોબાઇલ" SortExpression="MobileNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                                <asp:BoundField DataField="TalukaName" HeaderText="તાલુકો" SortExpression="TalukaName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                                <asp:BoundField DataField="VillageName" HeaderText="ગામ" SortExpression="VillageName" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>સુધારો</HeaderTemplate>
                                                                    <ItemTemplate></ItemTemplate>
                                                                    <ItemStyle Width="3%" />
                                                                    <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>રદ</HeaderTemplate>
                                                                    <ItemTemplate></ItemTemplate>
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
    </div>
    <script type="text/javascript">

        $(".Pager").on("click", '.page', function () {
            GetFarmers(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "lifarmermaster", "aFarmerMaster", "", "");
            $("#divGrid").css({ 'display': "none" });
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_ddlDistrict]").focus();
            $("[id=tab1]").attr("class", "active");
            ListDistrict();
            ListTaluka(0, 0);
            ListVillage(0, 0);

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aFarmerMaster";
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


        function CheckAlredyExistsMobileNo() {
            var mobiletooltip = document.getElementById('<%= txtMobileNo.ClientID %>').title;
            var mobile = document.getElementById('<%= txtMobileNo.ClientID %>');

            if (mobiletooltip != "") {
                if (mobile.value != mobiletooltip) {
                    $.ajax({
                        type: "POST",
                        url: "FarmerMaster.aspx/CheckMobileNo",
                        data: '{MobileNo: "' + mobile.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                mobile.focus();
                                swal("", "પેહેલેથી ઉપયોગમાં છે..!", "warning");
                                $("[id=ContentPlaceHolder1_txtMobileNo]").val('');
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
                    url: "FarmerMaster.aspx/CheckMobileNo",
                    data: '{MobileNo: "' + mobile.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            mobile.focus();
                            swal("", "ર્પેહેલેથી ઉપયોગમાં છે..!", "warning");
                            $("[id=ContentPlaceHolder1_txtMobileNo]").val('');
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

        function CheckAlredyExistsMobileNoG() {
            var mobilegtooltip = document.getElementById('<%= txtMobileNoG.ClientID %>').title;
            var mobileg = document.getElementById('<%= txtMobileNoG.ClientID %>');

            if (mobilegtooltip != "") {
                if (mobileg.value != mobilegtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "FarmerMaster.aspx/CheckMobileNoG",
                        data: '{MobileNoG: "' + mobileg.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                mobileg.focus();
                                swal("", "પેહેલેથી ઉપયોગમાં છે..!", "warning");
                                $("[id=ContentPlaceHolder1_txtMobileNoG]").val('');
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
                    url: "FarmerMaster.aspx/CheckMobileNoG",
                    data: '{MobileNoG: "' + mobile.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            mobileg.focus();
                            swal("", "ર્પેહેલેથી ઉપયોગમાં છે..!", "warning");
                            $("[id=ContentPlaceHolder1_txtMobileNoG]").val('');
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

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 37 && charCode != 39)
                return false;
            return true;
        }
       

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("#divGrid").css({ 'display': "none" });
            $("[id*=ddlDistrict]").focus();
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            ListSrchDistrict();
            ListSrchTaluka(0,0);
            ListSrchVillage(0,0);
            $("[id*=txtFarmer]").val('');
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

        function BindVillage() {
            ListVillage(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlTaluka.ClientID %>").value == 0) {                
                ListVillage(0, 0);
            }
            else {             
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

                    var ddlCategory = $("[id*=ddlVillage]");
                    $("[id*=ddlVillage]").empty();

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

        function ListSrchDistrict() {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListDistrict",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlSrchDistrict]");
                    $("[id*=ddlSrchDistrict]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindSrchTaluka() {
            ListSrchTaluka($("[id*=ddlSrchDistrict]").val(), 0);
            if (document.getElementById("<%=this.ddlSrchDistrict.ClientID %>").value == 0) {
                ListSrchTaluka(0, 0);
                ListSrchVillage(0, 0);
            }
            else {
                ListSrchVillage(0, 0);
            }
        }

        function ListSrchTaluka(DistrictID, selectedDistrictID) {

            var District = $("[id*=ddlSrchDistrict]").val();

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListTaluka",
                data: '{ DistrictID: ' + DistrictID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlSrchTaluka]");
                    $("[id*=ddlSrchTaluka]").empty();
                    $.each(r.d, function () {
                        if (selectedDistrictID == this['Value'])
                            ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }


        function BindSrchVillage() {
            ListSrchVillage($("[id*=ddlSrchTaluka]").val(), 0);
            if (document.getElementById("<%=this.ddlSrchTaluka.ClientID %>").value == 0) {
                ListSrchVillage(0, 0);              
            }
            else {                
            }
        }

        function ListSrchVillage(TalukaID, selectedVillageID) {
            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListVillage",
                data: '{TalukaID: ' + TalukaID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlSrchVillage]");
                    $("[id*=ddlSrchVillage]").empty();
                    $.each(r.d, function () {
                        if (selectedVillageID == this['Value'])
                            ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        $("#btnSave").click(function () {
            var ID = $("[id*=hdnFarmerID]").val();
            var DistrictID = document.getElementById('<%= ddlDistrict.ClientID %>');
            var TalukaID = document.getElementById('<%= ddlTaluka.ClientID %>');
            var VillageID = document.getElementById('<%= ddlVillage.ClientID %>');
            var FName = document.getElementById('<%= txtFName.ClientID %>');
            var MName = document.getElementById('<%= txtMName.ClientID %>');
            var LName = document.getElementById('<%= txtLName.ClientID %>');
            var FNameG = document.getElementById('<%= txtFNameG.ClientID %>');
            var MNameG = document.getElementById('<%= txtMNameG.ClientID %>');
            var LNameG = document.getElementById('<%= txtLNameG.ClientID %>');
            var Add1 = document.getElementById('<%= txtAddress1.ClientID %>');
            var Add2 = document.getElementById('<%= txtAddress2.ClientID %>');
            var Add3 = document.getElementById('<%= txtAddress3.ClientID %>');
            var Add1G = document.getElementById('<%= txtAddress1G.ClientID %>');
            var Add2G = document.getElementById('<%= txtAddress2G.ClientID %>');
            var Add3G = document.getElementById('<%= txtAddress3G.ClientID %>');
            var MobileNo = document.getElementById('<%= txtMobileNo.ClientID %>');
            var MobileNoG = document.getElementById('<%= txtMobileNoG.ClientID %>');

            if (DistrictID.value == "0") {
                DistrictID.focus();
                swal("", "જીલ્લો પસંદ કરો.", "warning");
                return false;
            }
            else 
            if (TalukaID.value == "0") {
                TalukaID.focus();
                swal("", "તાલુકો પસંદ કરો.", "warning");
                return false;
            }
            else if (VillageID.value == "0") {
                VillageID.focus();
                swal("", "ગામ પસંદ કરો.", "warning");
                return false;
            }
            else if (FName.value == "") {
                FName.focus();
                swal("", "પ્રથમ નામ દાખલ કરો.", "warning");
                return false;
            }
            else if (MName.value == "") {
                MName.focus();
                swal("", "પિતા/વાલી/પતિનું નામ દાખલ કરો.", "warning");
                return false;
            }
            else if (LName.value == "") {
                LName.focus();
                swal("", "અટક દાખલ કરો.", "warning");
                return false;
            }
            else if (FNameG.value == "") {
                FNameG.focus();
                swal("", "પ્રથમ નામ દાખલ કરો.", "warning");
                return false;
            }
            else if (MNameG.value == "") {
                MNameG.focus();
                swal("", "પિતા/વાલી/પતિનું નામ દાખલ કરો.", "warning");
                return false;
            }
            else if (LNameG.value == "") {
                LNameG.focus();
                swal("", "અટક દાખલ કરો.", "warning");
                return false;
            }
            else if (Add1.value == "") {
                Add1.focus();
                swal("", "સરનામું દાખલ કરો.", "warning");
                return false;
            }
            else if (Add1G.value == "") {
                Add1G.focus();
                swal("", "સરનામું દાખલ કરો.", "warning");
                return false;
            }
            //else if (MobileNo.value == "") {
            //    MobileNo.focus();
            //    swal("", "મોબાઇલ નંબર દાખલ કરો.", "warning");
            //    return false;
            //}
            //else if (MobileNoG.value == "") {
            //    MobileNoG.focus();
            //    swal("", "મોબાઇલ નંબર દાખલ કરો.", "warning");
            //    return false;
            //}
            else if (MobileNo.value!="" && MobileNo.value.length < 10) {
                MobileNo.focus();
                swal("", "માન્ય મોબાઇલ નંબર દાખલ કરો.", "warning");
                return false;
            }
            else if (MobileNoG.value != "" && MobileNoG.value.length < 10) {
                MobileNoG.focus();
                swal("", "માન્ય મોબાઇલ નંબર દાખલ કરો.", "warning");
                return false;
            }
            else {
                $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnSave]").attr('disabled', 'disabled');
                $("#hdnSubmitVal").val("1");
                var user = {};
                user.VillageID = VillageID.value;
                user.FName = FName.value;
                user.MName = MName.value;
                user.LName = LName.value;
                user.FNameG = FNameG.value;
                user.MNameG = MNameG.value;
                user.LNameG = LNameG.value;
                user.Add1 = Add1.value;
                user.Add2 = Add2.value;
                user.Add3 = Add3.value;
                user.Add1G = Add1G.value;
                user.Add2G = Add2G.value;
                user.Add3G = Add3G.value;
                user.MobileNo = MobileNo.value;
                user.MobileNoG = MobileNoG.value;

                if (ID == "")
                    user.FarmerID = 0
                else
                    user.FarmerID = ID;

                $.ajax({
                    type: "POST",
                    url: "FarmerMaster.aspx/FarmerManage",
                    data: '{user: ' + JSON.stringify(user) + '}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        var msg = response.d;
                        if (msg.indexOf("Error") > -1) {
                            swal(msg);
                            return false;
                        } else {
                            swal("Done!", msg, "success");
                            farmerclr();
                        }                        
                    },
                });
                if ($("#hdnSubmitVal").val() == "1") {
                    $("[id*=btnSave]").html("દાખલ કરો");
                    $("[id*=btnSave]").removeAttr('disabled');
                    $("#hdnSubmitVal").val(0);
                }
                return false;
            }


        });

        $("#btnSearch").click(function () {
            $("[id*=btnSearch]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSearch]").attr('disabled', 'disabled');
            $("#hdnFindUser").val("1");
            $("#divGrid").css({ 'display': "block" });

            GetFarmers(1);
            //setupResponsiveTables();
        });

        function SearchTerm() {
            return jQuery.trim($("[id*=txtFarmer]").val());
        };

        function GetFarmers(pageIndex) {
            $.ajax({
                type: "POST",
                url: "FarmerMaster.aspx/FarmerMasterGet",
                data: '{searchTerm: "' + SearchTerm() + '",DistrictID : ' + $("[id*=ddlSrchDistrict]").val() + ',TalukaID : ' + $("[id*=ddlSrchTaluka]").val() + ',VillageID:' + $("[id*=ddlSrchVillage]").val() + ', pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("Error");
                }
            });
        }

        var myrowe;
        function OnSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Farmer");
            if (myrowe == null) {
                myrowe = $("[id*=gvFarmerInfoMaster] tr:last-child").clone(true);
            }
            $("[id*=gvFarmerInfoMaster] tr").not($("[id*=gvFarmerInfoMaster] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    var FarmerID = $(this).find("FarmerID").text();

                    $("td", myrowe).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowe).eq(1).html($(this).find("FullName").text());
                    $("td", myrowe).eq(2).html($(this).find("FullAddress").text());
                    $("td", myrowe).eq(3).html($(this).find("MobileNo").text());
                    $("td", myrowe).eq(4).html($(this).find("TalukaName").text());
                    $("td", myrowe).eq(5).html($(this).find("VillageName").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", myrowe).eq(6).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return FarmerMasterUpdate(' + $(this).find("FarmerID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    }
                    else { $("td", myrowe).eq(6).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", myrowe).eq(7).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return FarmerMasterDelete(' + $(this).find("FarmerID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    }
                    else { $("td", myrowe).eq(7).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=gvFarmerInfoMaster]").append(myrowe);
                    myrowe = $("[id*=gvFarmerInfoMaster] tr:last-child").clone(true);
                });

                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                if ($("#hdnFindUser").val() == "1") {
                    $("[id*=btnSearch]").html("ખેડૂત શોધો");
                    $("[id*=btnSearch]").removeAttr('disabled');
                    $("#hdnFindUser").val(0);
                }

                //var pager = xml.find("Pager");
                //$(".Pager").ASPSnippets_Pager({
                //    ActiveCssClass: "current",
                //    PagerCssClass: "pager",
                //    PageIndex: parseInt(pager.find("PageIndex").text()),
                //    PageSize: parseInt(pager.find("PageSize").text()),
                //    RecordCount: parseInt(pager.find("RecordCount").text())
                //});

                //$(".FName").each(function () {
                //    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                //    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                //});

            }
            else {
                var empty_myrowe = myrowe.clone(true);
                $("td:first-child", empty_myrowe).attr("colspan", $("td", myrowe).length);
                $("td:first-child", empty_myrowe).attr("align", "center");
                $("td:first-child", empty_myrowe).html("No records found for the search criteria.");
                $("td", empty_myrowe).not($("td:first-child", empty_myrowe)).remove();
                $("[id*=gvFarmerInfoMaster]").append(empty_myrowe);
            }
        };

        function FarmerMasterUpdate(FID) {

            $.ajax({
                type: "POST",
                url: "FarmerMaster.aspx/FarmerMasterUpdate",
                data: '{FarmerID: "' + JSON.stringify(FID) + '"}',
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
            $("[id=ContentPlaceHolder1_txtMobileNo]").attr('title', res[0].MobileNo);
            $("[id=ContentPlaceHolder1_txtMobileNoG]").attr('title', res[0].MobileNoG);
            $("[id*=hdnFarmerID]").val(res[0].FarmerID);
            $("[id*=txtFName]").val(res[0].FName);
            $("[id*=txtMName]").val(res[0].MName);
            $("[id*=txtLName]").val(res[0].LName);
            $("[id*=txtFNameG]").val(res[0].FNameG);
            $("[id*=txtMNameG]").val(res[0].MNameG);
            $("[id*=txtLNameG]").val(res[0].LNameG);
            $("[id*=txtAddress1]").val(res[0].Add1);
            $("[id*=txtAddress2]").val(res[0].Add2);
            $("[id*=txtAddress3]").val(res[0].Add3);
            $("[id*=txtAddress1G]").val(res[0].Add1G);
            $("[id*=txtAddress2G]").val(res[0].Add2G);
            $("[id*=txtAddress3G]").val(res[0].Add3G);
            $("[id*=txtMobileNo]").val(res[0].MobileNo);
            $("[id*=txtMobileNoG]").val(res[0].MobileNoG);
            $("[id*=ContentPlaceHolder1_ddlTaluka]").val(res[0].TalukaID);
            $("[id*=ddlDistrict]").val(res[0].DistrictID);
            ListTaluka(res[0].DistrictID, res[0].TalukaID);
            ListVillage(res[0].TalukaID, res[0].VillageID);
            $("#divGrid").css({ 'display': "none" });
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function FarmerMasterDelete(FID) {

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
                    url: "FarmerMaster.aspx/FarmerMasterDelete",
                    data: '{FarmerID: "' + JSON.stringify(FID) + '"}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;
                        if (msg.indexOf("Error") > -1) {
                            swal("Deleted!", msg, "success");
                        }
                        else {
                            GetFarmers(1);
                            swal("Deleted!", msg, "success");
                            ClearAll();
                        }
                        GetFarmers(1);
                    },
                    failure: function (response) {
                        swal(response.d);
                    },
                    error: function (response) {
                        swal("Error");
                    },
                });
            });
            return false;
        }

        function farmerclr() {

            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset]").attr('disabled', 'disabled');
            $("#hdnReset").val("1");

            $("[id=ContentPlaceHolder1_txtMobileNo]").attr('title', '');
            $("[id=ContentPlaceHolder1_txtMobileNoG]").attr('title', '');
            $("[id*=hdnFarmerID]").val('');
            $("[id*=txtFName]").val('');
            $("[id*=txtMName]").val('');
            $("[id*=txtLName]").val('');
            $("[id*=txtFNameG]").val('');
            $("[id*=txtMNameG]").val('');
            $("[id*=txtLNameG]").val('');
            $("[id*=txtAddress1]").val('');
            $("[id*=txtAddress2]").val('');
            $("[id*=txtAddress3]").val('');
            $("[id*=txtAddress1G]").val('');
            $("[id*=txtAddress2G]").val('');
            $("[id*=txtAddress3G]").val('');
            $("[id*=txtMobileNo]").val('');
            $("[id*=txtMobileNoG]").val('');
            $("[id*=ddlDistrict]").val('0');
            ListTaluka(0, 0);
            ListVillage(0, 0);

            if ($("#hdnReset").val() == "1") {
                $("[id*=btnReset]").html("રદ કરો");
                $("[id*=btnReset]").removeAttr('disabled');
                $("#hdnReset").val(0);
            }
        }
    </script>
</asp:Content>
