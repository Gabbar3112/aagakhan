<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RptForm12.aspx.cs" Inherits="RptForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">ફોર્મ નંબર ૧૨</li>
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
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlVillage" class="form-control" runat="server"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnVillage" runat="server" />
                                                    <label>ગામ</label>
                                                </div>
                                            </div>    
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlSeason" class="form-control" runat="server"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnSeason" runat="server" />
                                                    <label>મોસમ</label>
                                                </div>
                                            </div>                                               
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary" onclick="return PrintPage();"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                    ફોર્મ-૧૨ જુઓ</button>
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
            GetVillage();
            GetSeason();
            SetMenu("liReport", "ulReport", "lirptform12", "aRptForm12", "", "");
        });


        function PrintPage() {

            var InstituteID = document.getElementById("<%=this.ddlInstitute.ClientID %>");
            var VillageID = document.getElementById("<%=this.ddlVillage.ClientID%>");
            var SeasonID = document.getElementById("<%=this.ddlSeason.ClientID%>");


            if (SeasonID.value == "0") {
                SeasonID.focus();
                swal("", "મોસમ પસંદ કરો", "warning");

                return false;
            }
            else {
                window.open("Reports/PrintFormNo12.aspx?InstituteID=" + $("[id*=ddlInstitute]").val() + "&VillageID=" + $("[id*=ddlVillage]").val() + "&SeasonID=" + $("[id*=ddlSeason]").val() + "");
             
                document.getElementById("<%=this.ddlInstitute.ClientID%>").value = 0;
                document.getElementById("<%=this.ddlVillage.ClientID%>").value = 0;
                document.getElementById("<%=this.ddlSeason.ClientID%>").value = 0;
             }
        }


        function GetInstitute() {
            $.ajax({
                type: "POST",
                url: "RptForm12.aspx/ListInstituteForForm17",
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

        function GetVillage() {
            $.ajax({
                type: "POST",
                url: "RptForm12.aspx/ListVillageForForm17",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlVillage]");
                    $("[id*=ddlVillage]").empty();
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

        function GetSeason() {
            $.ajax({
                type: "POST",
                url: "RptForm12.aspx/ListSeasonForForm17",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id*=ddlSeason]");
                    $("[id*=ddlSeason]").empty();
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

    </script>
</asp:Content>

