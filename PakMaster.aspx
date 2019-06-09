<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PakMaster.aspx.cs" Inherits="PakMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--<script src="pagejscss/ASPSnippets_Pager.min.js"></script>
    <link href="assets/css/jquery.dataTables.css" rel="stylesheet" />--%>
  <%--  <script type="text/javascript">
        function pageLoad() {
            SetMenu("liMaster", "ulMaster", "lipakmaster", "aPakMaster", "", "");
        };
    </script>--%>
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
            <li class="active">પાક ની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1" class="active"><a href="#first1" onclick="ViewDiv1();">પાક ઉમેરો/સુધારો </a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">


                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPakName" class="form-control" onchange="CheckAlreadyExists()" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnPakID" runat="server" />
                                                    <label>પાક નું નામ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPakNameG" class="form-control" onchange="CheckAlreadyExistsPakNameG()" runat="server"></asp:TextBox>
                                                    <label>પાક નું નામ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                દાખલ કરો</button>
                                            <input type="hidden" id="hdnSubmitVal" value="0" />
                                            &nbsp;
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary">રદ કરો</button>
                                            <input type="hidden" id="hdnReset" value="0" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divSecond" style="display: none">
                        <div class="tab-pane" id="second1">
                            <div class="row">

                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table id="datatable1" class="table table-striped table-hover">
                                            <asp:GridView ID="gvPak" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                <%--<PagerStyle CssClass="Pager" />--%>

                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                    <asp:BoundField DataField="PakName" HeaderText="પાક" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="PakName"></asp:BoundField>
                                                    <asp:BoundField DataField="PakNameG" HeaderText="પાક (ગુજરાતી)" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="PakName"></asp:BoundField>
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
   




    <script>

        $(".Pager").on("click", '.page', function () {
            GetCustomers(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "lipakmaster", "aPakMaster", "", "");
           
            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aPakMaster";
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

        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
         
            GetCustomers(1);
            //setupResponsiveTables();
        }


        function ClearAll() {
            
            $("[id=ContentPlaceHolder1_txtPakName]").val('');
            $("[id=ContentPlaceHolder1_txtPakNameG]").val('');
            $("[id=ContentPlaceHolder1_hdnPakID]").val('');
            
        }

        function CheckAlreadyExists() {
            var pakname = document.getElementById("ContentPlaceHolder1_txtPakName");
            var paknametooltip = document.getElementById("ContentPlaceHolder1_txtPakName").title;

            if (paknametooltip != "") {

                if (pakname.value != paknametooltip) {
                    $.ajax({
                        type: "POST",
                        url: "PakMaster.aspx/CheckPakName",
                        data: '{PakName: "' + pakname.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                pakname.focus();
                                swal("", "પાક પહેલેથી દાખલ કરેલ છે.", "warning");
                                $("[id=ContentPlaceHolder1_txtPakName]").val('');
                                document.getElementById("#ContentPlaceHolder1_txtPakName").value = "";
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
                    url: "PakMaster.aspx/CheckPakName",
                    data: '{PakName: "' + pakname.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            pakname.focus();
                            swal("", "પાક પહેલેથી દાખલ કરેલ છે.", "warning");
                            $("[id=ContentPlaceHolder1_txtPakName]").val('');
                            document.getElementById("#ContentPlaceHolder1_txtPakName").value = "";
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

        function CheckAlreadyExistsPakNameG() {

            var paknameG = document.getElementById("ContentPlaceHolder1_txtPakNameG");
            var paknametooltipG = document.getElementById("ContentPlaceHolder1_txtPakNameG").title;

            if (paknametooltipG != "") {
                if (paknameG.value != paknametooltipG) {
                    $.ajax({
                        type: "POST",
                        url: "PakMaster.aspx/CheckPakNameG",
                        data: '{PakNameG: "' + paknameG.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                paknameG.focus();

                                swal("", "પાક પહેલેથી દાખલ કરેલ છે. (ગુજરાતી)", "warning");
                                $("[id=ContentPlaceHolder1_txtPakNameG]").val('');
                                document.getElementById("#ContentPlaceHolder1_txtPakNameG").value = "";
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
                    url: "PakMaster.aspx/CheckPakNameG",
                    data: '{PakNameG: "' + paknameG.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            paknameG.focus();
                            swal("", "પાક પહેલેથી દાખલ કરેલ છે. (ગુજરાતી)", "warning");
                            $("[id=ContentPlaceHolder1_txtPakNameG]").val('');
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


        $(function () {
            $("#btnReset").bind("click", function () {
                $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnReset]").attr('disabled', 'disabled');
                $("#hdnReset").val("1");
                    // do whatever you want to do     
                    $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Wait");
                    ClearAll();
                    $("[id*=btnReset]").html("SUBMIT");
                    if ($("#hdnReset").val() == "1") {
                        $("[id*=btnReset]").html("રદ કરો");
                        $("[id*=btnReset]").removeAttr('disabled');
                        $("#hdnReset").val(0);
                    }
            });
            $("#btnSave").bind("click", function () {
                var pakid = $("[id*=hdnPakID]").val();
                var PakName = document.getElementById("ContentPlaceHolder1_txtPakName");
                var PakNameG = document.getElementById("ContentPlaceHolder1_txtPakNameG");

                if (PakName.value == "") {
                    PakName.focus();
                    swal("", "પાક નું નામ દાખલ કરો", "warning");
                    return false;
                }
                else if (PakNameG.value == "") {
                    PakNameG.focus();
                    swal("", "પાક નું નામ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else {

                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Wait");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    var pak = {};
                    pak.PakName = $("[id=ContentPlaceHolder1_txtPakName]").val();
                    pak.PakNameG = $("[id=ContentPlaceHolder1_txtPakNameG]").val();
                    if (pakid == "")
                        pak.PakID = 0
                    else
                        pak.PakID = pakid;

                    $.ajax({
                        type: "POST",
                        url: "PakMaster.aspx/PakManage",
                        data: '{pak: ' + JSON.stringify(pak) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;
                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                                return false;
                            }
                            else {
                                if ($("#hdnSubmitVal").val() == "1") {
                                    $("[id*=btnSave]").html("દાખલ કરો");
                                    $("[id*=btnSave]").removeAttr('disabled');
                                    $("#hdnSubmitVal").val(0);
                                }
                                swal("Done!", msg, "success");
                                GetCustomers(1);
                                ClearAll();
                            }
                        }
                    });
                    return false;
                }
            });
        });

        function GetCustomers(pageIndex) {

            $.ajax({
                type: "POST",
                url: "PakMaster.aspx/GetAllPak",
                data: '{pageIndex: ' + pageIndex + '}',
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
            var customers = xml.find("PakDetail");
            if (row == null) {
                row = $("[id*=gvPak] tr:last-child").clone(true);
            }
            $("[id*=gvPak] tr").not($("[id*=gvPak] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("PakName").text());
                    $("td", row).eq(2).html($(this).find("PakNameG").text());

                    if (jQuery.inArray("2", rights) != '-1') { $("td", row).eq(3).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditPak(' + $(this).find("PakID").text() + ');"><i class="fa fa-edit"></i></a>')); }
                    else { $("td", row).eq(3).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') { $("td", row).eq(4).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeletePak(' + $(this).find("PakID").text() + ');"><i class="fa fa-trash"></i></a>')); }
                    else { $("td", row).eq(4).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=gvPak]").append(row);
                    row = $("[id*=gvPak] tr:last-child").clone(true);
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
                $("td:first-child", empty_row).html("No records found.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvPak]").append(empty_row);
            }
        };


        function EditPak(pakid) {

            $.ajax({
                type: "POST",
                url: "PakMaster.aspx/GetPakDetail",
                data: '{PakID: "' + JSON.stringify(pakid) + '"}',
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
            $("[id*=hdnPakID]").val(res[0].PakID);
            //$("[id*=txtPakName]").attr('title', res[0].PakName);
            $("[id=ContentPlaceHolder1_txtPakName]").attr('title', res[0].PakName);
            $("[id*=txtPakName]").val(res[0].PakName);
            $("[id=ContentPlaceHolder1_txtPakNameG]").attr('title', res[0].PakNameG);
            $("[id*=txtPakNameG]").val(res[0].PakNameG);





            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

            $("[id*=litab1]").attr('class', 'active');
            $("[id*=litab2]").removeAttr('class', 'active');
        }

        function DeletePak(lnk) {
            $.ajax({
                type: "POST",
                url: "PakMaster.aspx/CheckPakID",
                data: '{PakID : ' + lnk + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "પાક ઉપયોગ માં છે.", "warning");
                        return false;
                    }
                    else {
                        swal({
                            title: "માહિતી રદ કરવા માંગો છો?",
                            type: "warning",
                            showCancelButton: true,
                            cancelButtonText: "ના",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "હા",
                            closeOnConfirm: false
                        }, function () {

                            $.ajax({
                                type: "POST",
                                url: "PakMaster.aspx/DeletePak",
                                data: '{PakID: "' + JSON.stringify(lnk) + '"}',
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
                                error: function (response) {
                                    swal("error");
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

