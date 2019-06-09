<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RptMembershipData.aspx.cs" Inherits="RptMembershipData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">સભ્યપદ માહિતી</li>
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
                                    <div class="col-md-12 col-sm-12">
                                        <div class="row">
                                             <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlInstitute" onchange="CheckMandali()" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>પિયત મંડળી </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">                                           
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
          
            SetMenu("liReport", "ulReport", "limembershipdetail", "aMembershipDetail", "", "");

            var userid = '<%= Session["UserID"].ToString() %>';
             var logintype = '<%= Session["LoginType"].ToString() %>';
             var formnameid = "aMemberMaster";
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

             ListInstitute();
        });

        function PrintPage() {

            var AET = document.getElementById("<%=this.ddlInstitute.ClientID %>");

            //if (AET.value == "0") {
            //    AET.focus();
            //    swal("", "મંડળી પસંદ કરો", "warning");

            //    return false;
            //}
            //else {
                var selct = document.getElementById("<%=this.ddlInstitute.ClientID%>").value;
                
            window.open("Reports/PrintRptMembershipData.aspx?InstituteID=" + $("[id*=ddlInstitute]").val() + "");
                    ListInstitute(0, 0);
            //}
        }


        function ListInstitute() {

            $.ajax({
                type: "POST",
                url: "RptMembershipData.aspx/ListInstitute",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlInstitute]");
                    $("[id*=ddlInstitute]").empty();

                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

    </script>
</asp:Content>

