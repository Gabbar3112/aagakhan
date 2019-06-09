<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RptInstituteDetail.aspx.cs" Inherits="RptInstituteDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">મંડળી પ્રમાણે અહેવાલ</li>
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
                                                    <asp:DropDownList ID="ddlInstitute" class="form-control" runat="server"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnInstitute" runat="server" />
                                                    <label>મંડળી નું નામ</label>
                                                </div>
                                            </div>                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintPage();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
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
            GetInstitute();
            SetMenu("liReport", "ulReport", "lirptinstitutedetail", "aRptInstituteDetail", "", "");
        });

        function GetInstitute() {
            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListInstituteByUser",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlInstitute]");
                    $("[id*=ddlInstitute]").empty();
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

        function PrintPage() {
            window.open("Reports/PrintRptInstituteDetail.aspx?InstituteID=" + $("[id*=ddlInstitute]").val(), "_blank");
        }
    </script>
</asp:Content>

