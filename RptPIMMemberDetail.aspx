<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RptPIMMemberDetail.aspx.cs" Inherits="RptPIMMemberDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">મંડળીના પ્રકાર પ્રમાણે અહેવાલ</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">                    
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlInstituteType" class="form-control" runat="server"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnInstitute" runat="server" />
                                                    <label>મંડળીના પ્રકારનું નામ</label>
                                                </div>
                                            </div>                                            
                                        </div>
                                        <div class="row">
                                           <%-- <div class="col-sm-2">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary btn-loading-state"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                    અહેવાલ</button>
                                            </div>--%>
                                            <div class="col-sm-2">
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintPage();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    અહેવાલ જુઓ</button>
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
            ListInstitute(0, 0);
            SetMenu("liReport", "ulReport", "lirptPIMmemberdetail", "aRptPIMMemberDetail", "", "");
        });

        function ListInstitute() {

            $.ajax({
                type: "POST",
                url: "RptPIMMemberDetail.aspx/ListInstituteType",
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
        function PrintPage() {
           
            window.open("Reports/PrintRptPIMMemberDetail.aspx?InstituteTypeID=" + $("[id*=ddlInstituteType]").val() + "");
        }
    </script>
</asp:Content>

