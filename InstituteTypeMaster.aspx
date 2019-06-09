<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InstituteTypeMaster.aspx.cs" Inherits="InstituteTypeMaster" %>

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
            <li class="active">પિયત મંડળી નાં પ્રકાર ની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1" class="active"><a href="#first1" onclick="ViewDiv1();">પિયત મંડળી નાં પ્રકાર ઉમેરો/સુધારો </a></li>
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
                                                    <asp:TextBox ID="txtInstituteTypeName" class="form-control" onchange="CheckAlreadyExists()" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnInstituteTypeID" runat="server" />
                                                    <label>પિયત મંડળી નાં પ્રકાર નું નામ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtInstituteTypeNameG" class="form-control" onchange="CheckAlreadyExistsPakNameG()" runat="server"></asp:TextBox>
                                                    <label>પિયત મંડળી નાં પ્રકાર નું નામ (ગુજરાતી) </label>
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
                        <div id="divSecond" style="display: none">
                            <div class="tab-pane" id="second1">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table id="datatable1" class="table table-striped table-hover">
                                                <asp:GridView ID="gvInstituteType" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                        <asp:BoundField DataField="InstituteTypeName" HeaderText="પિયત મંડળી નાં પ્રકાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="InstituteTypeName"></asp:BoundField>
                                                        <asp:BoundField DataField="InstituteTypeNameG" HeaderText="પિયત મંડળી નાં પ્રકાર (ગુજરાતી)" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="InstituteTypeNameG"></asp:BoundField>
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
    </div>

    <script>

        $(".Pager").on("click", '.page', function () {
            GetCustomers(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "liinstitutetypemaster", "aInstituteTypeMaster", "", "");
            $("[id=ContentPlaceHolder1_txtInstituteTypeName]").focus();
            $("#divFirst").css({ 'display': "block" });
            $("[id*=litab1]").attr('class', 'active');

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aInstituteTypeMaster";
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


        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

        }
        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            GetCustomers(1);
        }
        function ClearAll() {
            document.getElementById("<%=this.hdnInstituteTypeID.ClientID %>").value = "";
            document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").title = "";

            document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").value = "";
            document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>").value = "";
        }

        function CheckAlreadyExists() {
            var institutetypename = document.getElementById("<%=this.txtInstituteTypeName.ClientID %>");
            var institutetypenametooltip = document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").title;

            if (institutetypenametooltip != "") {
                if (institutetypename.value != institutetypenametooltip) {
                    $.ajax({
                        type: "POST",
                        url: "InstituteTypeMaster.aspx/CheckInstituteTypeName",
                        data: '{InstituteTypeName: "' + institutetypename.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                institutetypename.focus();
                                swal("", "પિયત મંડળી પ્રકાર પહેલેથી દાખલ કરેલ છે.", "warning");
                                document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").value = "";
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
                    url: "InstituteTypeMaster.aspx/CheckInstituteTypeName",
                    data: '{InstituteTypeName: "' + institutetypename.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            institutetypename.focus();
                            swal("", "પિયત મંડળી પ્રકાર પહેલેથી દાખલ કરેલ છે.", "warning");
                            document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").value = "";
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

            var institutetypenameG = document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>");
            var institutetypenametooltipG = document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>").title;

            if (institutetypenametooltipG != "") {

                if (institutetypenameG.value != institutetypenametooltipG) {
                    $.ajax({
                        type: "POST",
                        url: "InstituteTypeMaster.aspx/CheckInstituteTypeNameG",
                        data: '{InstituteTypeNameG: "' + institutetypenameG.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                institutetypenameG.focus();
                                swal("", "પિયત મંડળી પ્રકાર પહેલેથી દાખલ કરેલ છે.", "warning");
                                document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>").value = "";
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
                    url: "InstituteTypeMaster.aspx/CheckInstituteTypeNameG",
                    data: '{InstituteTypeNameG: "' + institutetypenameG.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            institutetypenameG.focus();
                            swal("", "પિયત મંડળી પ્રકાર પહેલેથી દાખલ કરેલ છે.", "warning");
                            document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>").value = "";
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
                    ClearAll();
                    if ($("#hdnReset").val() == "1") {
                        $("[id*=btnReset]").html("રદ કરો");
                        $("[id*=btnReset]").removeAttr('disabled');
                        $("#hdnReset").val(0);
                    }
                });
                $("#btnSave").bind("click", function () {

                var institutetypeid = document.getElementById("<%=this.hdnInstituteTypeID.ClientID %>").value;
                var InstituteTypeName = document.getElementById("<%=this.txtInstituteTypeName.ClientID %>");
                var InstituteTypeNameG = document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>");

                if (InstituteTypeName.value == "") {
                    InstituteTypeName.focus();
                    swal("", "પિયત મંડળી પ્રકાર નું નામ દાખલ કરો", "warning");
                    return false;
                }
                else if (InstituteTypeNameG.value == "") {
                    InstituteTypeNameG.focus();
                    swal("", "પિયત મંડળી પ્રકાર નું નામ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else {
                        $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                        $("[id*=btnSave]").attr('disabled', 'disabled');
                        $("#hdnSubmitVal").val("1");
                    var institutetype = {};
                    institutetype.InstituteTypeName = document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").value;
                    institutetype.InstituteTypeNameG = document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>").value;
                    if (institutetypeid == "")
                        institutetype.InstituteTypeID = 0
                    else
                        institutetype.InstituteTypeID = institutetypeid;

                    $.ajax({
                        type: "POST",
                        url: "InstituteTypeMaster.aspx/InstituteTypeManage",
                        data: '{institutetype: ' + JSON.stringify(institutetype) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            msg = response.d;
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
                      
                        if ($("#hdnSubmitVal").val() == "1") {
                            $("[id*=btnSave]").html("દાખલ કરો");
                            $("[id*=btnSave]").removeAttr('disabled');
                            $("#hdnSubmitVal").val(0);
                        }
                        return false;
                }
                });
            });
      

        function GetCustomers(pageIndex) {

            $.ajax({
                type: "POST",
                url: "InstituteTypeMaster.aspx/GetAllInstituteType",
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
            var customers = xml.find("InstituteTypeDetail");
            if (row == null) {
                row = $("[id*=gvInstituteType] tr:last-child").clone(true);
            }
            $("[id*=gvInstituteType] tr").not($("[id*=gvInstituteType] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("InstituteTypeName").text());
                    $("td", row).eq(2).html($(this).find("InstituteTypeNameG").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", row).eq(3).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditInstituteType(' + $(this).find("InstituteTypeID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    }
                    else { $("td", row).eq(3).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", row).eq(4).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteInstituteType(' + $(this).find("InstituteTypeID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    }
                    else { $("td", row).eq(4).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=gvInstituteType]").append(row);
                    row = $("[id*=gvInstituteType] tr:last-child").clone(true);
  });
                var pager = xml.find("Pager");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                //var pager = xml.find("Pager");
                //$(".Pager").ASPSnippets_Pager({
                //    ActiveCssClass: "current",
                //    PagerCssClass: "pager",
                //    PageIndex: parseInt(pager.find("PageIndex").text()),
                //    PageSize: parseInt(pager.find("PageSize").text()),
                //    RecordCount: parseInt(pager.find("RecordCount").text())
                //});

                } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvInstituteType]").append(empty_row);
                }
            };
        

        function EditInstituteType(institutetypeid) {

            $.ajax({
                type: "POST",
                url: "InstituteTypeMaster.aspx/GetInstituteTypeDetail",
                data: '{InstituteTypeID: "' + JSON.stringify(institutetypeid) + '"}',
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

            document.getElementById("<%=this.hdnInstituteTypeID.ClientID %>").value = res[0].InstituteTypeID;

            document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").value = res[0].InstituteTypeName;
            document.getElementById("<%=this.txtInstituteTypeName.ClientID %>").title = res[0].InstituteTypeName;

            document.getElementById("<%=this.txtInstituteTypeNameG.ClientID %>").value = res[0].InstituteTypeNameG;

            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

            $("[id*=litab1]").attr('class', 'active');
            $("[id*=litab2]").removeAttr('class', 'active');
        }

        function DeleteInstituteType(institutetypeid) {
            $.ajax({
                type: "POST",
                url: "InstituteTypeMaster.aspx/CheckInstituteTypeID",
                data: '{InstituteTypeID : ' + institutetypeid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "પિયત મંડળી પ્રકાર ઉપયોગ માં છે.", "warning");
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
                                url: "InstituteTypeMaster.aspx/DeleteInstituteType",
                                data: '{InstituteTypeID: "' + JSON.stringify(institutetypeid) + '"}',
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
                        swal("", "પાક પહેલેથી ઉપયોગમાં છે.", "warning");
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

