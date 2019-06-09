<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManganaPatrakList.aspx.cs" Inherits="ManganaPatrakList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">માંગણા પત્રકની વિગત</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txt1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <label>નામ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txt2" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <label>ખાતા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txt3" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <label>માંગણા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <button id="btnSearch" type="button" class="btn ink-reaction btn-raised btn-primary" data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                        શોધો</button>
                                                    <input type="hidden" id="hdnSearch" value="0" />
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>

                                 <div class="row" id="divGrid" style="display:none">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">                         
                                                <asp:GridView ID="gvMangnalist" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">                                                
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="AccountNo" SortExpression="AccountNo" HeaderText="ખાતા નં." HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="HouseholdNo" SortExpression="HouseholdNo" HeaderText="ઘરગથ્થું નં." HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="MangnaNo" SortExpression="MangnaNo" HeaderText="માંગણા નં." HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="MangnaDate" SortExpression="MangnaDate" HeaderText="માંગણા તારીખ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Name" SortExpression="Name" HeaderText="નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>રદ</HeaderTemplate>
                                                            <ItemTemplate>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="3%" />
                                                            <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>પ્રિન્ટ</HeaderTemplate>
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

    <script type="text/javascript">

        $(".Pager").on("click", '.page', function () {
            GridMangna(parseInt($(this).attr('page')));
        });

        $(function () {
            //    GridMangna(1);
            SetMenu("liTransaction", "ulTransaction", "limangnapatraklist", "aManganaPatrakList", "", "");
        });

        $("#btnSearch").bind("click", function () {
            $("[id*=btnSearch]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSearch]").attr('disabled', 'disabled');
            $("#hdnSearch").val("1");
            $("#divGrid").css({ 'display': "block" });
            GridMangna(1);
            if ($("#hdnSearch").val() == "1") {
                $("[id*=btnSearch]").html("શોધો");
                $("[id*=btnSearch]").removeAttr('disabled');
                $("#hdnSearch").val(0);
            }
        })

        function SearchTerm() {
            return jQuery.trim($("[id*=txt1]").val());
        };
        function GridMangna(pageIndex) {
            
            var name = document.getElementById("<%=this.txt1.ClientID%>").value;
            var AcctNo = document.getElementById("<%=this.txt2.ClientID%>").value;
            var MangnaNo = document.getElementById("<%=this.txt3.ClientID%>").value;

            $.ajax({
                type: "POST",
                url: "ManganaPatrakList.aspx/GetDetails",
                data: '{Name:' + JSON.stringify(name) + ',AcctNo:' + JSON.stringify(AcctNo) + ',MangnaNo:' + JSON.stringify(MangnaNo) + ',pageIndex:'+ pageIndex +'}',
                //data: '{Name:"' + name + '",AcctNo:' + AcctNo + ',MangnaNo:' + MangnaNo + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnMangna,
                failure: function (response) {
                    alert("Error");
                    swal(response.d);
                },
                error: function (response) {
                    alert("Error");
                    swal(response.d);
                }
            });

        }
      

        var myrowl;
        function OnMangna(response) {
            
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var customers = xml.find("MemberMaster");

            if (myrowl == null) {
                myrowl = $("[id*=gvMangnalist] tr:last-child").clone(true);
            }
            $("[id*=gvMangnalist] tr").not($("[id*=gvMangnalist] tr:first-child")).remove();

            if (customers.length > 0) {

                //if ($("td", myrowl).length < 6) {
                //    $("td", myrowl).eq(0).removeAttr("colspan");
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //    myrowl.append('<td></td>');
                //}

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrowl).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowl).eq(1).html($(this).find("AccountNo").text());
                    $("td", myrowl).eq(2).html($(this).find("HouseholdNo").text());
                    $("td", myrowl).eq(3).html($(this).find("MangnaNo").text());
                    $("td", myrowl).eq(4).html($(this).find("MangnaDate").text());
                    $("td", myrowl).eq(5).html($(this).find("Name").text());
                    // $("td", myrowl).eq(6).html($(this).find("Year").text());
                    $("td", myrowl).eq(6).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteMangna(' + $(this).find("MangnaPatrakID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    $("td", myrowl).eq(7).html($('<a class="btn btn-flat ink-reaction btn-default"  onclick="return HtmlReport(' + $(this).find("MangnaPatrakID").text() + ');"> ફોર્મ ૭ </a>'));
                  

                    $("[id*=gvMangnalist]").append(myrowl);
                    myrowl = $("[id*=gvMangnalist] tr:last-child").clone(true);
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
                var empty_row = myrowl.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", myrowl).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvMangnalist]").append(empty_row);
            }
        };

        function HtmlReport(MangnaPatrakID) {
            window.open("Reports/PrintMangnaForm7.aspx?MangnaPatrakID=" + MangnaPatrakID + "");
        }

        function DeleteMangna(MangnaPatrakID) {           

            $.ajax({
                type: "POST",
                url: "ManganaPatrakList.aspx/CheckID",
                data: '{MangnaPatrakID:' + JSON.stringify(MangnaPatrakID) + '}',                           
                async: false,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "પહેલા રસીદ રદ કરો", "warning");
                        return false;
                    }
                    else {
                        swal({
                            title: "રદ કરવા માંગો છો?",
                            type: "warning",
                            showCancelButton: true,
                            cancelButtonText: "ના",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "હા",
                            closeOnConfirm: false
                        }, function () {
                           
                            $.ajax({
                                type: "POST",
                                url: "ManganaPatrakList.aspx/DeleteMangna",
                                data: '{MangnaPatrakID:' + JSON.stringify(MangnaPatrakID) + '}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var msg = response.d;
                                    if (msg.indexOf("Error") > -1) {
                                        swal(msg);
                                    }
                                    else {
                                        swal("Done!", msg, "success");
                                        GridMangna(1);
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
                error: function (response) {
                    swal(response.d);
                },
                failure: function (response) {
                    swal(response.d);
                },
            });
            GridMangna(1);
        }

    </script>
</asp:Content>

