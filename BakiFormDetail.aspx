<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BakiFormDetail.aspx.cs" Inherits="BakiFormDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
            <li class="active">બાકી ફોર્મ માહિતી</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1" class="active"><a href="#first1" onclick="ViewDiv1();">બાકી ફોર્મ માહિતી</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">

                                    <div class="col-md-12 col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>નાણાકીય વર્ષ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMemberName" class="form-control" runat="server"></asp:TextBox>
                                                    <label>વ્યક્તિ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMangnaNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>માંગણા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <button id="btnSearch" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    શોધો</button>
                                                <input type="hidden" id="hdnSearch" value="0" />
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row" id="divGrid" style="display: none;">
                                        <div class="col-lg-12">
                                            <div class="table-responsive">

                                                <asp:GridView ID="gvFormDetail" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                        <asp:BoundField DataField="MemberName" HeaderText="વ્યક્તિ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="MemberName"></asp:BoundField>
                                                        <asp:BoundField DataField="MangnaNo" HeaderText="માંગણા નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="MangnaNo"></asp:BoundField>
                                                        <asp:BoundField DataField="MangnaDate" HeaderText="માંગણા તારીખ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="MangnaDate"></asp:BoundField>
                                                        <asp:BoundField DataField="FinancialYear" HeaderText="નાણાકીય વર્ષ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FinancialYear"></asp:BoundField>

                                                        <asp:TemplateField>
                                                            <HeaderTemplate>રસીદ</HeaderTemplate>
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

    <div class="modal" id="modalfollowup" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h5 class="modal-title">
                        <h4 style="color: black; text-align: center;"><b>
                            <asp:Label runat="server" ID="lblpersonname"></asp:Label></b></h4>
                    </h5>
                </div>
                <div class="modal-body" id="followupdetail">
                    <div class="widget-box widget-color-blue" id="Div3">
                        <div class="widget-body">
                            <div class="widget-header" style="background-color: #0aa89e; color: white; height: 35px; border-radius: 6px">
                                <h4 class="widget-title bigger lighter ui-sortable-handle" style="font-weight: bold; padding-top: 10px; text-align: center">
                                    <i class="ace-icon fa fa-star"></i>
                                    માંગણા ની માહિતી
                                             <i class="ace-icon fa fa-star"></i>
                                </h4>
                            </div>

                            <asp:GridView ID="gvBlockDetail" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="SeasonNameG" HeaderText="મૌસમ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="SeasonNameG"></asp:BoundField>
                                    <asp:BoundField DataField="FinancialYear" HeaderText="નાણાકીય વર્ષ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FinancialYear"></asp:BoundField>
                                    <asp:BoundField DataField="BlockNo" HeaderText="બ્લોક નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BlockNo"></asp:BoundField>
                                    <asp:BoundField DataField="BlockArea" HeaderText="બ્લોક વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BlockArea"></asp:BoundField>
                                    <asp:BoundField DataField="PiyatArea" HeaderText="પિયત વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="PiyatArea"></asp:BoundField>
                                    <asp:BoundField DataField="KLPiyatArea" HeaderText="ખેડવા લાયક વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="KLPiyatArea"></asp:BoundField>
                                    <asp:BoundField DataField="BinPiyatArea" HeaderText="બિન પિયત વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BinPiyatArea"></asp:BoundField>
                                    <asp:BoundField DataField="VPiyatArea" HeaderText="વહેતા પાણી થી વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="VPiyatArea"></asp:BoundField>
                                    <asp:BoundField DataField="UPiyatArea" HeaderText="ઉદવહન થી વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="UPiyatArea"></asp:BoundField>
                                    <asp:BoundField DataField="Total" HeaderText="કુલ રકમ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="Total"></asp:BoundField>

                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>

                </div>
            </div>
        </div>
                                     
    <script>

        $(".Pager").on("click", '.page', function () {
            GetFormDetail(parseInt($(this).attr('page')));
        });


        $(function () {
            ListFinYear();
            SetMenu("liReport", "ulReport", "libakiformdetail", "aBakiFormDetail", "", "");
        });

        function ListFinYear() {

            $.ajax({
                type: "POST",
                url: "BakiFormDetail.aspx/ListFinYear",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlFinYear]");
                    $("[id*=ddlFinYear]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        $(function () {
            $("#btnSearch").bind("click", function () {
                $("[id*=btnSearch]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnSearch]").attr('disabled', 'disabled');
                $("#hdnSearch").val("1");
                $("#divGrid").css({ 'display': "block" });
                BindGrid();

                if ($("#hdnSearch").val() == "1") {
                    $("[id*=btnSearch]").html("શોધો");
                    $("[id*=btnSearch]").removeAttr('disabled');
                    $("#hdnSearch").val(0);
                }
            })
        });

        function BindGrid() {

            GetFormDetail(1);

        }

        function GetFormDetail(pageIndex) {

            $.ajax({
                type: "POST",
                url: "BakiFormDetail.aspx/GetFromDetail",
                data: '{FinYearID: ' + JSON.stringify($("[id=ContentPlaceHolder1_ddlFinYear]").val()) + ',MemberName: ' + JSON.stringify($("[id=ContentPlaceHolder1_txtMemberName]").val()) + ',MangnaNo: ' + JSON.stringify($("[id=ContentPlaceHolder1_txtMangnaNo]").val()) + ',pageIndex:' + pageIndex + '}',
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
            var customers = xml.find("FormDetail");
            if (row == null) {
                row = $("[id*=gvFormDetail] tr:last-child").clone(true);
            }
            $("[id*=gvFormDetail] tr").not($("[id*=gvFormDetail] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($('<a href="#" onclick="return GetBlockDetail(' + $(this).find("MangnaPatrakID").text() + ',\'' + $(this).find("MemberName").text() + '\');">' + $(this).find("MemberName").text() + '</a>'));
                   //$("td", row).eq(1).html($('<a href="#" onclick="return GetBlockDetail(' + $(this).find("MangnaPatrakID").text() + ',\'' + $(this).find("MemberName").text() + ',\'' + $(this).find("MangnaNo").text() + ',\'' + $(this).find("MangnaDate").text() + '\');">' + $(this).find("MemberName").text() + '</a>'));
                   //$("td", row).eq(1).html($(this).find("MemberName").text());
                    $("td", row).eq(2).html($(this).find("MangnaNo").text());
                    $("td", row).eq(3).html($(this).find("MangnaDate").text());
                    $("td", row).eq(4).html($(this).find("FinancialYear").text());
                    $("td", row).eq(5).html($('<a class="btn btn-flat ink-reaction btn-default"  onclick="return RedirectToReceiptMaster(' + $(this).find("MangnaPatrakID").text() + ');">રશીદ</a>'));
                    $("td", row).eq(6).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeletePiyatDetail(' + $(this).find("MangnaPatrakID").text() + ');"><i class="fa fa-trash"></i></a>'));

                    $("[id*=gvFormDetail]").append(row);
                    row = $("[id*=gvFormDetail] tr:last-child").clone(true);
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
                $("[id*=gvFormDetail]").append(empty_row);
            }
        };

        function GetBlockDetail(personinfoid, personname, MangnaNo, MangnaDate) {
            
            document.getElementById('ContentPlaceHolder1_lblpersonname').innerHTML = personname;
            $.ajax({
                type: "POST",
                url: "BakiFormDetail.aspx/GetPersonBlockDetail",
                data: '{PersonInfoID: "' + personinfoid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnGridSuccessPopUpGrid,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal(response.d);
                }
            });
        }
        function OnGridSuccessPopUpGrid(response) {
            
            $('#modalfollowup').modal('toggle');

            var myrowl;
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);


            var customers = xml.find("BlockDetail");

            if (myrowl == null) {
                myrowl = $("[id*=gvBlockDetail] tr:last-child").clone(true);
            }
            $("[id*=gvBlockDetail] tr").not($("[id*=gvBlockDetail] tr:first-child")).remove();
            if (customers.length > 0) {

                if ($("td", myrowl).length < 6) {
                    $("td", myrowl).eq(0).removeAttr("colspan");

                    myrowl.append('<td></td>');
                    myrowl.append('<td></td>');
                    myrowl.append('<td></td>');
                    myrowl.append('<td></td>');
                    myrowl.append('<td></td>');
                    myrowl.append('<td></td>');

                }

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrowl).eq(0).html($(this).find("SeasonNameG").text());
                    $("td", myrowl).eq(1).html($(this).find("FinancialYear").text());
                    $("td", myrowl).eq(2).html($(this).find("BlockNo").text());
                    $("td", myrowl).eq(3).html($(this).find("BlockArea").text());
                    $("td", myrowl).eq(4).html($(this).find("PiyatArea").text());
                    $("td", myrowl).eq(5).html($(this).find("KLPiyatArea").text());
                    $("td", myrowl).eq(6).html($(this).find("BinPiyatArea").text());
                    $("td", myrowl).eq(7).html($(this).find("VPiyatArea").text());
                    $("td", myrowl).eq(8).html($(this).find("UPiyatArea").text());
                    $("td", myrowl).eq(9).html($(this).find("Total").text());

                    $("[id*=gvBlockDetail]").append(myrowl);
                    myrowl = $("[id*=gvBlockDetail] tr:last-child").clone(true);
                });
            }
            else {

                var empty_row = myrowl.clone(true);

                $("td:first-child", empty_row).attr("colspan", $("td", myrowl).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvBlockDetail]").append(empty_row);

            }

        };

        function RedirectToReceiptMaster(MangnaPatrakID) {
            window.open('ReceiptMaster.aspx?MPid=' + MangnaPatrakID, '_blank');
        }

        function DeletePiyatDetail(MangnaPatrakID) {
            $.ajax({
                type: "POST",
                url: "BakiFormDetail.aspx/CheckMangnaPatrakID",
                data: '{MangnaPatrakID : ' + JSON.stringify(MangnaPatrakID) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "પહેલા રસીદ રદ કરો.", "warning");
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
                                url: "BakiFormDetail.aspx/DeletePiyatDetail",
                                data: '{MangnaPatrakID: "' + JSON.stringify(MangnaPatrakID) + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var msg = response.d;


                                    if (msg.indexOf("Error") > -1) {

                                        swal("Deleted!", msg, "success");
                                    }
                                    else {

                                        $("[id=ContentPlaceHolder1_txtMemberName]").val('');
                                        $("[id=ContentPlaceHolder1_txtMangnaNo]").val('');

                                        BindGrid();

                                        swal("Deleted!", msg, "success");
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



        //function clearall() {

        //    ListFinYear();
        //    $("[id=ContentPlaceHolder1_txtPakName]").val('');
        //    $("[id=ContentPlaceHolder1_txtPakNameG]").val('');

        //    BindGrid();

        //   }









    </script>

    <%--<script>
        $(function () {
            $(".ContactName").click(function () {
                $("#orders").show();
                $.ajax({
                    type: "POST",
                    url: "BakiFormDetail.aspx/GetBlockDetail",
                    data: '{mId: "' + $(this).html() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert(response.d);
                    },
                    success: function (response) {
                        var xmlDoc = $.parseXML(response.d);

                        var xml = $(xmlDoc);
                        var customers = xml.find("Table");
                        var row = $("[id*=gvOrders] tr:last-child").clone(true);
                        $("[id*=gvOrders] tr").not($("[id*=gvOrders] tr:first-child")).remove();
                        $.each(customers, function () {
                            var customer = $(this);
                            $("td", row).eq(0).html($(this).find("BlockNo").text());
                            $("td", row).eq(1).html($(this).find("BlockArea").text());
                            $("td", row).eq(2).html($(this).find("PiyatArea").text());
                            $("[id*=gvOrders]").append(row);
                            row = $("[id*=gvOrders] tr:last-child").clone(true);
                        });
                    }
                });
                return false;
            });
        });

    </script>--%>
</asp:Content>

