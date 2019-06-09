<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">પિયત મંડળી પ્રમાણે નકશો</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1" class="active"><a href="#first1">પિયત મંડળી પ્રમાણે નકશો</a></li>

                        </ul>
                    </div>
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">

                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table id="datatable1" class="table table-striped table-hover">
                                                <asp:GridView ID="gvInstitute" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                        <asp:BoundField DataField="InstituteNameG" HeaderText="પિયત મંડળી" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="InstituteNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="InstituteCodeG" HeaderText="પિયત મંડળી કોડ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="InstituteCodeG"></asp:BoundField>
                                                        <asp:BoundField DataField="RegNoG" HeaderText="નોંધણી નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RegNoG"></asp:BoundField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>નકશો</HeaderTemplate>
                                                            <ItemTemplate>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="3%" />
                                                            <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>Fit to Screen નકશો</HeaderTemplate>
                                                            <ItemTemplate>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="3%" />
                                                            <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>

                                            </table>
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
        var rights = "";
        $(function () {
            SetMenu("liMap", "ulMap", "liPiyatMandliMap", "aMap", "", "");

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aMap";
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
            GetCustomers();
        });

        function GetCustomers() {

            $.ajax({
                type: "POST",
                url: "Map.aspx/GetInstitute",
                data: '{}',
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
            var customers = xml.find("InstituteDetail");
            if (row == null) {
                row = $("[id*=gvInstitute] tr:last-child").clone(true);
            }
            $("[id*=gvInstitute] tr").not($("[id*=gvInstitute] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    var MapOrientation = $(this).find("MapOrientation").text();
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("InstituteNameG").text());
                    $("td", row).eq(2).html($(this).find("InstituteCodeG").text());
                    $("td", row).eq(3).html($(this).find("RegNoG").text());
                    $("td", row).eq(4).html($('<a class="btn btn-flat ink-reaction btn-default" title="View Map" onclick="return ViewMap(' + $(this).find("InstituteID").text() + ');"><i class="fa fa-globe"></i></a>'));
                    $("td", row).eq(5).html($('<a class="btn btn-flat ink-reaction btn-default" title="View Map" onclick="return ViewMapFitToScreen(' + $(this).find("InstituteID").text() + ',\'' + MapOrientation + '\');"><i class="fa fa-globe"></i></a>'));

                    $("[id*=gvInstitute]").append(row);
                    row = $("[id*=gvInstitute] tr:last-child").clone(true);
                });

            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvInstitute]").append(empty_row);
            }
        };

        function ViewMap(instituteid) {
            window.open('PiyatMandliMap.aspx?InstituteID=' + instituteid, '_blank');
        }

        function ViewMapFitToScreen(instituteid, orient) {
            window.open('PiyatMandliMapFitToScreen.aspx?InstituteID=' + instituteid + "&Ori=" + orient, '_blank');
        }
    </script>
</asp:Content>

