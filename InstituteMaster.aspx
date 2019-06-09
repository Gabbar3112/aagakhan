<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InstituteMaster.aspx.cs" Inherits="InstituteMaster" %>

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
            <li class="active">પિયત મંડળી ની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="tab1"><a href="divFirst" onclick="ViewDiv1();">પિયત મંડળી ની માહિતી ઉમેરો/સુધારો </a></li>
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
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlTaluka" runat="server" class="form-control"></asp:DropDownList>
                                            <label>તાલુકો </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlInstituteType" runat="server" class="form-control"></asp:DropDownList>
                                            <label>પિયત મંડળી નાં પ્રકાર </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlCluster" runat="server" class="form-control"></asp:DropDownList>
                                            <label>ક્લસ્ટર </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtInstituteName" class="form-control" runat="server" MaxLength="300" onchange="CheckAlreadyExistsInstituteName()"></asp:TextBox>
                                            <asp:HiddenField ID="hdnInstituteID" runat="server" />
                                            <label>પિયત મંડળી નામ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtInstituteNameG" class="form-control" runat="server" MaxLength="300" onchange="CheckAlreadyExistsInstituteNameG()"></asp:TextBox>
                                            <label>પિયત મંડળી નામ(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtInstituteNumber" class="form-control" runat="server" MaxLength="20" onkeypress="return isNumberKey(event);" onchange="CheckAlreadyExistsInstituteNumber()"></asp:TextBox>
                                            <label>પિયત મંડળી નંબર </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtInstituteNumberG" class="form-control" runat="server" MaxLength="20" onkeypress="return isNumberKey(event);" onchaange="CheckAlreadyExistsInstituteNumberG()"></asp:TextBox>
                                            <label>પિયત મંડળી નંબર(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtUserName" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>વપરાશ કર્તા નું નામ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtPassword" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                            <label>પાસવર્ડ </label>
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
                                            <asp:TextBox ID="txtAddress1G" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૧(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress2" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૨</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress2G" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૨(ગુજરાતી)</label>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress3" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૩</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtAddress3G" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                            <label>સરનામું ૩(ગુજરાતી)</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtMobileNumber1" class="form-control" MaxLength="10" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                            <label>મોબાઈલ ૧</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtMobileNumber1G" class="form-control" MaxLength="10" runat="server"></asp:TextBox>
                                            <label>મોબાઈલ ૧(ગુજરાતી)</label>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtPhoneNo1" class="form-control" MaxLength="10" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                            <label>ફોન ૧</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtPhoneNo1G" class="form-control" MaxLength="10" runat="server"></asp:TextBox>
                                            <label>ફોન ૧(ગુજરાતી)</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtArea" class="form-control" runat="server" MaxLength="50"  onkeypress="return isNumberKey(event);"></asp:TextBox>
                                            <label>વિસ્તાર </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtEmailID" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                            <label>ઈ-મેઈલ </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtRegNo" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                            <label>નોંધણી નંબર </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtRegNoG" class="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                            <label>નોંધણી નંબર(ગુજરાતી) </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtRegDate" class="form-control cssdate" runat="server"></asp:TextBox>
                                            <label>નોંધણી ની તારીખ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="form-group">
                                            <label>નોંધણી કરેલ છે?! </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="radio-inline radio-styled">
                                            <input type="radio" name="RegStatus" id="rbtStatusY" />હા
                                        </label>
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="radio-inline radio-styled">
                                            <input type="radio" name="RegStatus" id="rbtStatusN" />ના
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <label>બેંક નું નામ </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <label>શાખા નું નામ </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                            <label>એકાઉન્ટ નંબર </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtFormationDate" class="form-control cssdate"  runat="server"></asp:TextBox>
                                            <label>ફોર્મેસન ની તારીખ </label>
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
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
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
                                            <asp:DropDownList ID="ddlSrchTaluka" runat="server" class="form-control"></asp:DropDownList>
                                            <label>તાલુકો</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchInstituteType" runat="server" class="form-control"></asp:DropDownList>
                                            <label>પિયત મંડળી પ્રકાર</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchCluster" runat="server" class="form-control"></asp:DropDownList>
                                            <label>ક્લસ્ટર</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtSearch" runat="server" class="form-control"></asp:TextBox>
                                            <label>પિયત મંડળી નામ</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <button id="btnSearch" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                            પિયત મંડળી શોધો</button>
                                         <input type="hidden" id="hdnSearch" value="0" />
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
                                                            <asp:GridView ID="gvInstituteMaster" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                                <PagerStyle CssClass="Pager" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="RowNumber" HeaderText="અનુ. નં." SortExpression="RowNumber" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="DistrictNameG" HeaderText="જિલ્લો" SortExpression="DistrictNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="TalukaNameG" HeaderText="તાલુકા" SortExpression="TalukaNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="InstituteNameG" HeaderText="પિયત મંડળી નામ" SortExpression="InstituteNameG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="InstituteCodeG" HeaderText="પિયત મંડળી નંબર" SortExpression="InstituteCodeG" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="Address" HeaderText="સરનામું" SortExpression="Address" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="RegNo" HeaderText="નોંધણી નંબર" SortExpression="RegNo" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="RegDate" HeaderText="નોંધણી તારીખ" SortExpression="RegDate" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="Area" HeaderText="વિસ્તાર" SortExpression="Area" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
                                                                    <asp:BoundField DataField="EmailID" HeaderText="ઈ-મેઈલ" SortExpression="EmailID" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" />
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
        </div>
    </div>
    <script type="text/javascript">

        $(".Pager").on("click", '.page', function () {
            GetInstitute(parseInt($(this).attr('page')));
        });

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 37 && charCode != 39)
                return false;
            return true;
        }
        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "liinstitutemaster", "aInstituteMaster", "", "");
            $("[id*=tab1]").addClass("active");
            $("#divGrid").css({ 'display': "none" });
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("[id=ContentPlaceHolder1_ddlDistrict]").focus();
            ListDistrict();
            ListTaluka(0, 0);
            ListInstituteType();
            ListCluster();

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aInstituteMaster";
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
       

        function CheckAlreadyExistsInstituteName() {
            var institutenametooltip = document.getElementById('<%= txtInstituteName.ClientID %>').title;
            var institutename = document.getElementById('<%= txtInstituteName.ClientID %>');

            if (institutenametooltip != "") {
                if (institutename != institutenametooltip) {
                    $.ajax({
                        type: "POST",
                        url: "InstituteMaster.aspx/CheckInsituteName",
                        data: '{InstituteName: "' + institutename.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                institutename.focus();
                                swal("", "પિયત મંડળી પેહેલેથી ઉપલબ્ધ છે.", "warning");
                                $("[id=ContentPlaceHolder1_txtInstituteName]").val('');
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
                    url: "InstituteMaster.aspx/CheckInsituteName",
                    data: '{InstituteName: "' + institutename.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            institutename.focus();
                            swal("", "પિયત મંડળી પેહેલેથી ઉપલબ્ધ છે.", "warning");
                            $("[id=ContentPlaceHolder1_txtInstituteName]").val('');
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

        function CheckAlreadyExistsInstituteNameG() {
            var institutenamegtooltip = document.getElementById('<%= txtInstituteNameG.ClientID %>').title;
            var institutenameg = document.getElementById('<%= txtInstituteNameG.ClientID %>');

            if (institutenamegtooltip != "") {
                if (institutenameg != institutenamegtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "InstituteMaster.aspx/CheckInsituteNameG",
                        data: '{InstituteNameG: "' + institutenameg.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                institutenameg.focus();
                                swal("", "પિયત મંડળી પેહેલેથી ઉપલબ્ધ છે.", "warning");
                                $("[id=ContentPlaceHolder1_txtInstituteNameG]").val('');
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
                    url: "InstituteMaster.aspx/CheckInsituteNameG",
                    data: '{InstituteNameG: "' + institutenameg.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            institutenameg.focus();
                            swal("", "પિયત મંડળી પેહેલેથી ઉપલબ્ધ છે.", "warning");
                            $("[id=ContentPlaceHolder1_txtInstituteNameG]").val('');
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

        function CheckAlreadyExistsInstituteNumber() {
            var institutenumbertooltip = document.getElementById('<%= txtInstituteNumber.ClientID %>').title;
             var institutenumber = document.getElementById('<%= txtInstituteNumber.ClientID %>');

            if (institutenumbertooltip != "") {
                if (institutenumber != institutenumbertooltip) {
                     $.ajax({
                         type: "POST",
                         url: "InstituteMaster.aspx/CheckInsituteNumber",
                         data: '{InstituteNumber: "' + institutenumber.value + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == false) {
                                 $('#btnSave').attr('disabled', false);
                                 return true;
                             }
                             else {
                                 $('#btnSave').attr('disabled', true);
                                 institutenumber.focus();
                                 swal("", "પિયત મંડળી નંબર પેહેલેથી ઉપલબ્ધ છે.", "warning");
                                 $("[id=ContentPlaceHolder1_txtInstituteNumber]").val('');
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
                    url: "InstituteMaster.aspx/CheckInsituteNumber",
                    data: '{InstituteNumber: "' + institutenumber.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            institutenumber.focus();
                            swal("", "પિયત મંડળી નંબર પેહેલેથી ઉપલબ્ધ છે.", "warning");
                            $("[id=ContentPlaceHolder1_txtInstituteNumber]").val('');
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

        function CheckAlreadyExistsInstituteNumberG() {
            var institutenumbergtooltip = document.getElementById('<%= txtInstituteNumberG.ClientID %>').title;
            var institutenumberg = document.getElementById('<%= txtInstituteNumberG.ClientID %>');

            if (institutenumbergtooltip != "") {
                if (institutenumberg != institutenumbergtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "InstituteMaster.aspx/CheckInsituteNumberG",
                        data: '{InstituteNumberG: "' + institutenumberg.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                $('#btnSave').attr('disabled', false);
                                return true;
                            }
                            else {
                                $('#btnSave').attr('disabled', true);
                                institutenumberg.focus();
                                swal("", "પિયત મંડળી નંબર પેહેલેથી ઉપલબ્ધ છે.", "warning");
                                $("[id=ContentPlaceHolder1_txtInstituteNumberG]").val('');
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
                    url: "InstituteMaster.aspx/CheckInsituteNumberG",
                    data: '{InstituteNumberG: "' + institutenumberg.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            $('#btnSave').attr('disabled', false);
                            return true;
                        }
                        else {
                            $('#btnSave').attr('disabled', true);
                            institutenumberg.focus();
                            swal("", "પિયત મંડળી નંબર પેહેલેથી ઉપલબ્ધ છે.", "warning");
                            $("[id=ContentPlaceHolder1_txtInstituteNumberG]").val('');
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

       

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("#divGrid").css({ 'display': "none" });
            $("[id*=ddlDistrict]").focus();
            ListDistrict();
            ListTaluka(0, 0);
            ListInstituteType();
            ListCluster();
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            ListSrchDistrict();
            ListSrchTaluka(0, 0);
            ListSrchInstituteType();
            ListSrchCluster();
            $("[id*=txtSearch]").val('');
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

        function ListInstituteType() {
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListInstituteType",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlInstituteType]");
                    $("[id*=ddlInstituteType]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindTaluka() {
            ListTaluka($("[id*=ddlDistrict]").val(), 0);
        }

        function ListTaluka(DistrictID, selectedTalukaID) {

            var District = $("[id*=ddlDistrict]").val();
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListTaluka",
                data: '{ DistrictID: ' + District + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlTaluka = $("[id*=ddlTaluka]");
                    $("[id*=ddlTaluka]").empty();
                    $.each(r.d, function () {
                        if (selectedTalukaID == this['Value'])
                            ddlTaluka.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlTaluka.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        function ListInstituteType() {
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListInstituteType",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlInstituteType = $("[id*=ddlInstituteType]");
                    $("[id*=ddlInstituteType]").empty();
                    $.each(r.d, function () {
                        ddlInstituteType.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function ListCluster() {
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListCluster",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCluster = $("[id*=ddlCluster]");
                    $("[id*=ddlCluster]").empty();
                    $.each(r.d, function () {
                        ddlCluster.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
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
        }

        function ListSrchTaluka(DistrictID, selectedTalukaID) {

            var District = $("[id*=ddlSrchDistrict]").val();
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListTaluka",
                data: '{ DistrictID: ' + District + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSrchTaluka = $("[id*=ddlSrchTaluka]");
                    $("[id*=ddlSrchTaluka]").empty();
                    $.each(r.d, function () {
                        if (selectedTalukaID == this['Value'])
                            ddlSrchTaluka.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlSrchTaluka.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        function ListSrchInstituteType() {
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListInstituteType",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSrchInstituteType = $("[id*=ddlSrchInstituteType]");
                    $("[id*=ddlSrchInstituteType]").empty();
                    $.each(r.d, function () {
                        ddlSrchInstituteType.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function ListSrchCluster() {
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/ListCluster",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSrchCluster = $("[id*=ddlSrchCluster]");
                    $("[id*=ddlSrchCluster]").empty();
                    $.each(r.d, function () {
                        ddlSrchCluster.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        $("#btnSearch").click(function () {
           
            $("[id*=btnSearch]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSearch]").attr('disabled', 'disabled');
            $("#hdnSearch").val("1");
            $("#divGrid").css({ 'display': "block" });

            GetInstitute(1);
            if ($("#hdnSearch").val() == "1") {
                $("[id*=btnSearch]").html("પિયત મંડળી શોધો");
                $("[id*=btnSearch]").removeAttr('disabled');
                $("#hdnSearch").val(0);
            }
        });

        $("#btnReset").click(function () {
            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset]").attr('disabled', 'disabled');
            $("#hdnReset").val("1");
            $("#divGrid").css({ 'display': "none" });

            InstituteClr();
            if ($("#hdnReset").val() == "1") {
                $("[id*=btnReset]").html("રદ કરો");
                $("[id*=btnReset]").removeAttr('disabled');
                $("#hdnReset").val(0);
            }
        });

        function GetInstitute(pageIndex) {
            
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/InstituteMasterGet",
                data: '{searchTerm : "' + SearchTerm() + '",DistrictID : ' + $("[id*=ddlSrchDistrict]").val() + ',TalukaID : ' + $("[id*=ddlSrchTaluka]").val() + ',InstituteTypeID :' + $("[id*=ddlSrchInstituteType]").val() + ',ClusterID : ' + $("[id*=ddlSrchCluster]").val() + ', pageIndex: ' + pageIndex + '}',
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

        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };

        var myrowe;
        function OnSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Institute");
            if (myrowe == null) {
                myrowe = $("[id*=gvInstituteMaster] tr:last-child").clone(true);
            }
            $("[id*=gvInstituteMaster] tr").not($("[id*=gvInstituteMaster] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    var InstituteID = $(this).find("InstituteID").text();

                    $("td", myrowe).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowe).eq(1).html($(this).find("DistrictNameG").text());
                    $("td", myrowe).eq(2).html($(this).find("TalukaNameG").text());
                    $("td", myrowe).eq(3).html($(this).find("InstituteNameG").text());
                    $("td", myrowe).eq(4).html($(this).find("InstituteCodeG").text());
                    $("td", myrowe).eq(5).html($(this).find("Address").text());
                    $("td", myrowe).eq(6).html($(this).find("RegNo").text());
                    $("td", myrowe).eq(7).html($(this).find("RegDate").text());
                    $("td", myrowe).eq(8).html($(this).find("Area").text());
                    $("td", myrowe).eq(9).html($(this).find("EmailID").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", myrowe).eq(10).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return InstituteMasterUpdate(' + $(this).find("InstituteID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    }
                    else { $("td", myrowe).eq(10).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", myrowe).eq(11).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return InstituteMasterDelete(' + $(this).find("InstituteID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    }
                    else { $("td", myrowe).eq(11).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=gvInstituteMaster]").append(myrowe);
                    myrowe = $("[id*=gvInstituteMaster] tr:last-child").clone(true);
                });

                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });
            }
            else {
                var empty_myrowe = myrowe.clone(true);
                $("td:first-child", empty_myrowe).attr("colspan", $("td", myrowe).length);
                $("td:first-child", empty_myrowe).attr("align", "center");
                $("td:first-child", empty_myrowe).html("No records found for the search criteria.");
                $("td", empty_myrowe).not($("td:first-child", empty_myrowe)).remove();
                $("[id*=gvInstituteMaster]").append(empty_myrowe);
            }
        };

        function InstituteMasterUpdate(InstituteID) {
            
            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/InstituteMasterUpdate",
                data: '{ID: "' + JSON.stringify(InstituteID) + '"}',
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
            $("[id=ContentPlaceHolder1_txtInstituteName]").attr('title', res[0].InstituteName);
            $("[id=ContentPlaceHolder1_txtInstituteNameG]").attr('title', res[0].InstituteNameG);
            $("[id=ContentPlaceHolder1_txtInstituteNumber]").attr('title', res[0].InstituteCode);
            $("[id=ContentPlaceHolder1_txtInstituteNumberG]").attr('title', res[0].InstituteCodeG);
            $("[id*=hdnInstituteID]").val(res[0].InstituteID);
            $("[id*=txtInstituteName]").val(res[0].InstituteName);
            $("[id*=txtInstituteNameG]").val(res[0].InstituteNameG);
            $("[id*=txtInstituteNumber]").val(res[0].InstituteCode);
            $("[id*=txtInstituteNumberG]").val(res[0].InstituteCodeG);
            $("[id*=txtUserName]").val(res[0].UserName);
            $("[id*=txtPassword]").val(res[0].Password);
            $("[id*=txtAddress1]").val(res[0].Add1);
            $("[id*=txtAddress2]").val(res[0].Add2);
            $("[id*=txtAddress3]").val(res[0].Add3);
            $("[id*=txtAddress1G]").val(res[0].Add1G);
            $("[id*=txtAddress2G]").val(res[0].Add2G);
            $("[id*=txtAddress3G]").val(res[0].Add3G);
            $("[id*=txtMobileNumber1]").val(res[0].MobileNo);
            $("[id*=txtMobileNumber1G]").val(res[0].MobileNoG);
            $("[id*=txtPhoneNo]").val(res[0].Phone);
            $("[id*=txtPhoneNoG]").val(res[0].PhoneG);

            $("[id*=txtRegDate]").val(res[0].RegDate);
            $("[id*=txtRegNo]").val(res[0].RegNo);
            $("[id*=txtRegNoG]").val(res[0].RegNoG);
            $("[id*=txtArea]").val(res[0].Area);
            $("[id*=txtEmailID]").val(res[0].EmailID);
            $("[id*=ddlDistrict]").val(res[0].DistrictID);
            ListInstituteType();
            $("[id*=ddlInstituteType]").val(res[0].InstituteTypeID);
            $("[id*=ddlCluster]").val(res[0].ClusterID);
            ListTaluka(res[0].DistrictID, res[0].TalukaID);
            $("[id*=ddlTaluka]").val(res[0].TalukaID);
            $("[id*=txtFormationDate]").val(res[0].FormationDate);
            $("[id*=txtBankName]").val(res[0].BankName);
            $("[id*=txtBranchName]").val(res[0].BranchName);
            $("[id*=txtAccountNumber]").val(res[0].AccountNumber);
            if (res[0].RegStatus == "Yes") {
                $("[id=rbtStatusY]").prop('checked',true);
            }
            else if (res[0].RegStatus == "No") {
                $("[id=rbtStatusN]").prop('checked',true);
            }

            $("#divGrid").css({ 'display': "none" });
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

            $("[id=tab1]").attr("class", "active");
            $("[id=tab2]").removeAttr("class", "active");
        }

        function InstituteMasterDelete(InstituteID) {
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
                    url: "InstituteMaster.aspx/InstituteMasterDelete",
                    data: '{ID: "' + JSON.stringify(InstituteID) + '"}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;
                        if (msg.indexOf("Error") > -1) {
                            swal("Deleted!", msg, "success");
                        }
                        else {
                            GetInstitute(1);
                            swal("Deleted!", msg, "success");
                            ClearAll();
                        }
                        GetInstitute(1);
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

        $("#btnSave").bind("click", function () {

        var ID = $("[id*=hdnInstituteID]").val();
        var DistrictID = document.getElementById('<%= ddlDistrict.ClientID %>');
        var TalukaID = document.getElementById('<%= ddlTaluka.ClientID %>');
        var InstituteTypeID = document.getElementById('<%= ddlInstituteType.ClientID %>');
        var ClusterID = document.getElementById('<%= ddlCluster.ClientID%>');
        var InstituteName = document.getElementById('<%= txtInstituteName.ClientID%>');
        var InstituteCode = document.getElementById('<%= txtInstituteNumber.ClientID%>');
        var InstituteNameG = document.getElementById('<%= txtInstituteNameG.ClientID%>');
        var InstituteCodeG = document.getElementById('<%= txtInstituteNumberG.ClientID%>');
        var UserName = document.getElementById('<%= txtUserName.ClientID%>');
        var Password = document.getElementById('<%= txtPassword.ClientID%>');
        var Add1 = document.getElementById('<%= txtAddress1.ClientID %>');
        var Add2 = document.getElementById('<%= txtAddress2.ClientID %>');
        var Add3 = document.getElementById('<%= txtAddress3.ClientID %>');
        var Add1G = document.getElementById('<%= txtAddress1G.ClientID %>');
        var Add2G = document.getElementById('<%= txtAddress2G.ClientID %>');
            var Add3G = document.getElementById('<%= txtAddress3G.ClientID %>');

            var MobileNo = document.getElementById('<%= txtMobileNumber1.ClientID %>');
            var MobileNoG = document.getElementById('<%= txtMobileNumber1G.ClientID %>');

            var Phone = document.getElementById('<%= txtPhoneNo1.ClientID %>');
            var PhoneG = document.getElementById('<%= txtPhoneNo1G.ClientID %>');

        var RegNo = document.getElementById('<%= txtRegNo.ClientID %>');
        var RegNoG = document.getElementById('<%= txtRegNoG.ClientID %>');
        var RegDate = document.getElementById('<%= txtRegDate.ClientID %>');
        var Area = document.getElementById('<%= txtArea.ClientID %>');
        var EmailID = document.getElementById('<%= txtEmailID.ClientID %>');
        var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        var FormationDate = document.getElementById('<%= txtFormationDate.ClientID %>');
        var BankName = document.getElementById('<%= txtBankName.ClientID %>');
        var BranchName = document.getElementById('<%= txtBranchName.ClientID %>');
        var AccountNumber = document.getElementById('<%= txtAccountNumber.ClientID %>');
        var rbtStatusY = $("[id=rbtStatusY]");
        var rbtStatusN = $("[id=rbtStatusN]");

        if (DistrictID.value == "0") {
            DistrictID.focus();
            swal("", "જીલ્લો પસંદ કરો.", "warning");
            return false;
        }
        else if (TalukaID.value == "0") {
            TalukaID.focus();
            swal("", "તાલુકો પસંદ કરો.", "warning");
            return false;
        }
        else if (InstituteTypeID.value == "0") {
            InstituteTypeID.focus();
            swal("", "પિયત મંડળી નો પ્રકાર પસંદ કરો.", "warning");
            return false;
        }
        else if (ClusterID.value == "0") {
            ClusterID.focus();
            swal("", "ક્લસ્ટર પસંદ કરો.", "warning");
            return false;
        }
        else if (InstituteName.value == "") {
            InstituteName.focus();
            swal("", "પિયત મંડળી નામ દાખલ કરો.", "warning");
            return false;
        }
        else if (InstituteCode.value == "") {
            InstituteCode.focus();
            swal("", "પિયત મંડળી નંબર દાખલ કરો.", "warning");
            return false;
        }
        else if (InstituteNameG.value == "") {
            InstituteNameG.focus();
            swal("", "પિયત મંડળી નામ દાખલ કરો.", "warning");
            return false;
        }
        else if (InstituteCodeG.value == "") {
            InstituteCodeG.focus();
            swal("", "પિયત મંડળી નો નંબર દાખલ કરો.", "warning");
            return false;
        }
        else if (UserName.value == "") {
            UserName.focus();
            swal("", "વપરાશ કર્તા નું નામ દાખલ કરો.", "warning");
            return false;
        }
        else if (Password.value == "") {
            Password.focus();
            swal("", "પાસવર્ડ દાખલ કરો.", "warning");
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
        else if (Area.value == "") {
            Area.focus();
            swal("", "વિસ્તાર દાખલ કરો.", "warning");
            return false;
        }
        
        else if (EmailID.value != "" && expr.test(EmailID.value) == false) {
            EmailID.focus();
            swal("", "માન્ય ઈ-મેઈલ દાખલ કરો.", "warning");
            return false;
        }
        else if (RegNo.value == "") {
            RegNo.focus();
            swal("", "નોંધણી નંબર દાખલ કરો.", "warning");
            return false;
        }
        else if (RegNoG.value == "") {
            RegNoG.focus();
            swal("", "નોંધણી નંબર દાખલ કરો.", "warning");
            return false;
        }
        else if (RegDate.value == "") {
            RegNoG.focus();
            swal("", "નોંધણી ની તારીખ દાખલ કરો.", "warning");
            return false;
        }
        else if (rbtStatusY.prop('checked') == false && rbtStatusN.prop('checked') == false) {
            rbtStatusY.focus();
            swal("", "નોંધણી સ્ટેટ્સ પસંદ કરો.", "warning");
            return false;
        }
        else if (BankName.value == "") {
            BankName.focus();
            swal("", "બેંક નું નામ દાખલ કરો.", "warning");
            return false;
        }
        else if (BranchName.value == "") {
            BranchName.focus();
            swal("", "શાખા દાખલ કરો.", "warning");
            return false;
        }
        else if (AccountNumber.value == "") {
            AccountNumber.focus();
            swal("", "એકાઉન્ટ નંબર દાખલ કરો.", "warning");
            return false;
        }
        else if (FormationDate.value == "") {
            FormationDate.focus();
            swal("", "ફોર્મેસન ની તારીખ દાખલ કરો.", "warning");
            return false;
        }
        else if (MobileNo.value != "" && MobileNo.value.length < 10) {
            Mobile1.focus();
            swal("", "માન્ય મોબઈલ નંબર ૧ દાખલ કરો", "warning");
            return false;
        }
        else if (MobileNo.value != "" && MobileNoG == "") {
            Mobile1G.focus();
            swal("", "મોબાઇલ ૧ દાખલ કરો (ગુજરાતી)", "warning");
            return false;
        }
            //else if (RegDate.value == "") {
            //    RegDate.focus();
            //    swal("", "નોંધણી ની તારીખ દાખલ કરો.", "warning");
            //    return false;
            //}
        else {
            $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSave]").attr('disabled', 'disabled');
            $("#hdnSubmitVal").val("1");
            var Institute = {};
            Institute.DistrictID = DistrictID.value;
            Institute.TalukaID = TalukaID.value;
            Institute.InstituteTypeID = InstituteTypeID.value;
            Institute.ClusterID = ClusterID.value;
            Institute.InstituteName = InstituteName.value;
            Institute.InstituteCode = InstituteCode.value;
            Institute.InstituteNameG = InstituteNameG.value;
            Institute.InstituteCodeG = InstituteCodeG.value;
            Institute.UserName = UserName.value;
            Institute.Password = Password.value;
            Institute.Add1 = Add1.value;
            Institute.Add2 = Add2.value;
            Institute.Add3 = Add3.value;
            Institute.Add1G = Add1G.value;
            Institute.Add2G = Add2G.value;
            Institute.Add3G = Add3G.value;
            Institute.RegNo = RegNo.value;
            Institute.RegNoG = RegNoG.value;
            Institute.RegDate = RegDate.value;
            Institute.Area = Area.value;
            Institute.EmailID = EmailID.value;
            Institute.FormationDate = FormationDate.value;
            Institute.BankName = BankName.value;
            Institute.BranchName = BranchName.value;
            Institute.AccountNumber = AccountNumber.value;
            Institute.rbtStatusY = rbtStatusY.prop('checked');
            Institute.rbtStatusN = rbtStatusN.prop('checked');
            Institute.MobileNo = MobileNo.value;
            Institute.MobileNoG = MobileNoG.value;
            Institute.Phone = Phone.value;
            Institute.PhoneG = PhoneG.value;

                if (ID == "") {
                    Institute.InstituteID = 0;
                }
                else {
                    Institute.InstituteID = ID;
                }

            $.ajax({
                type: "POST",
                url: "InstituteMaster.aspx/InstituteManage",
                data: '{institute: ' + JSON.stringify(Institute) + '}',
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
                        var msg = response.d;
                        swal("Done!", msg, "success");
                        InstituteClr();
                    }
                },
                error: function (response) {
                    var mag = response.d;
                    swal("", msg, "warning");
                },
                failure: function (response) {
                    var mag = response.d;
                    swal("", msg, "warning");
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

        function InstituteClr() {

        $("[id=ContentPlaceHolder1_txtInstituteName]").attr('title', '');
        $("[id=ContentPlaceHolder1_txtInstituteNameG]").attr('title', '');
        $("[id=ContentPlaceHolder1_txtInstituteNumber]").attr('title', '');
        $("[id=ContentPlaceHolder1_txtInstituteNumberG]").attr('title', '');
        $("[id*=hdnInstituteID]").val('');
        $("[id*=ddlDistrict]").val('0');
        $("[id*=ddlTaluka]").val('0');
        $("[id*=ddlInstituteType]").val('0');
        $("[id*=ddlCluster]").val('0');
        $("[id*=txtInstituteName]").val('');
        $("[id*=txtInstituteNumber]").val('');
        $("[id*=txtInstituteNameG]").val('');
        $("[id*=txtInstituteNumberG]").val('');
        $("[id*=txtUserName]").val('');
        $("[id*=txtPassword]").val('');
        $("[id*=txtAddress1]").val('');
        $("[id*=txtAddress2]").val('');
        $("[id*=txtAddress3]").val('');
        $("[id*=txtAddress1G]").val('');
        $("[id*=txtAddress2G]").val('');
        $("[id*=txtAddress3G]").val('');
        $("[id*=txtRegDate]").val('');
        $("[id*=txtRegNo]").val('');
        $("[id*=txtRegNoG]").val('');
        $("[id*=txtArea]").val('');
        $("[id*=txtEmailID]").val('');
        $("[id=rbtStatusY]").prop('checked', false);
        $("[id=rbtStatusN]").prop('checked', false);
        $("[id*=txtFormationDate]").val('');
        $("[id*=txtBankName]").val('');
        $("[id*=txtBranchName]").val('');
        $("[id*=txtAccountNumber]").val('');
        $("[id*=txtMobileNumber1]").val('');
        $("[id*=txtMobileNumber1G]").val('');
        $("[id*=txtPhoneNo1]").val('');
        $("[id*=txtPhoneNo1G]").val('');
        ListDistrict();
        ListTaluka(0, 0);
        ListInstituteType();
        ListCluster();
    }
    </script>
</asp:Content>
