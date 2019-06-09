<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BhavPatrakMaster.aspx.cs" Inherits="BhavPatrakMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">ભાવ પત્રક</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li class="active"><a href="#first1" onclick="ViewDiv1();">ભાવ ઉમેરો/સુધારો</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">

                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table id="datatable1" class="table table-striped table-hover">
                                                <asp:Repeater ID="repPak" runat="server" DataSourceID="dsrepPak"  OnItemDataBound="repPak_ItemDataBound">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="background-color:#ecf8f7">
                                                                <asp:HiddenField ID="hdnPakID" Value='<%# Eval("PakID") %>' runat="server" />
                                                                &nbsp;&nbsp;
                                                                <%# Eval("PakNameG") %>
                                                                &nbsp;&nbsp;
                                                                 <button id="btnUpdate" type="button" onclick='<%# "Update(" + Eval("PakID") +"," + Convert.ToString(Container.ItemIndex) + ");" %>'
                                                                         class="btn ink-reaction btn-raised btn-primary"
                                                                         data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                                         દાખલ કરો</button>
                                                                <input type="hidden" id="hdnSubmitVal" value="0" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="gvSeason" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" DataKeyNames="SeasonID">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="મોસમ" SortExpression="Season" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSeason" runat="server" Text='<%# Eval("Season") %>' ToolTip='<%# Bind("SeasonID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="તારીખ" SortExpression="FromDate" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtFromDate" ReadOnly="true" runat="server" Text='<%# Eval("FromDate") %>' Style="width: 100px; text-align: center"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="થી તારીખ" SortExpression="ToDate" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtToDate" ReadOnly="true" runat="server" Text='<%# Eval("ToDate") %>' Style="width: 100px; text-align: center"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ભાવ" SortExpression="Rate" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("Rate") %>' onkeypress="return isDecimalKey(event);" MaxLength="10" Style="width: 100px; text-align: right; font-weight: bold"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="સરકાર ભાવ" SortExpression="GovtRate" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtGovtPrice" runat="server" Text='<%# Eval("GovtRate") %>' onkeypress="return isDecimalKey(event);" MaxLength="10" Style="width: 100px; text-align: right; font-weight: bold"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="પાણી" SortExpression="TotalWater" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtTotalWater" runat="server" Text='<%# Bind("TotalWater") %>' onkeypress="return isDecimalKey(event);" MaxLength="10" Style="width: 100px; text-align: right; font-weight: bold"></asp:TextBox>
                                                                                <asp:HiddenField ID="hdnYearID" Value='<%# Bind("YearID") %>' runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="dsrepPak" runat="server" ConnectionString="<%$ ConnectionStrings:AagakhanConnectionString %>"
                                                    SelectCommand="PakMasterGetAllPak" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
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

    <script type="text/javascript">
       
        $(function () {
            SetMenu("liMaster", "ulMaster", "libhavpatrakmaster", "aBhavPatrakMaster", "", "");

        
             });
       

        function Update(pakid, index) {
            $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnSave]").attr('disabled', 'disabled');
            $("#hdnSubmitVal").val("1");

            var GridViewSeason = document.getElementById("ContentPlaceHolder1_repPak_gvSeason_" + index);

            var success = "";

            for (i = 0; i < GridViewSeason.rows.length - 1; i++) {
                var seasonid = document.getElementById("ContentPlaceHolder1_repPak_gvSeason_" + index + "_lblSeason_" + i);
                var price = document.getElementById("ContentPlaceHolder1_repPak_gvSeason_" + index + "_txtPrice_" + i);
                var govtprice = document.getElementById("ContentPlaceHolder1_repPak_gvSeason_" + index + "_txtGovtPrice_" + i);
                var totalwater = document.getElementById("ContentPlaceHolder1_repPak_gvSeason_" + index + "_txtTotalWater_" + i);
                var yearid = document.getElementById("ContentPlaceHolder1_repPak_gvSeason_" + index + "_hdnYearID_" + i);

                if (price.value == "") {
                    swal("", "ભાવ દાખલ કરો", "warning");
                    return false;
                }
                else if (totalwater.value == "") {
                    swal("", "પાણી દાખલ કરો", "warning");
                    return false;
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "BhavPatrakMaster.aspx/UpdateRate",
                        data: '{PakID: "' + pakid + '", SeasonID: "' + seasonid.title + '",GovtPrice: "' + govtprice.value + '" ,Price: "' + price.value + '", TotalWater: "' + totalwater.value + '", YearID: "' + yearid.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;
                            if (msg.indexOf("Error") > -1) {
                                //success = "fail";
                                swal(msg);
                                return false;
                            }
                            else {
                                //success = "success";
                                swal("Done!", msg, "success");
                            }
                        }
                    });
                }
            }

           
            if ($("#hdnSubmitVal").val() == "1") {
                $("[id*=btnSave]").html("દાખલ કરો");
                $("[id*=btnSave]").removeAttr('disabled');
                $("#hdnSubmitVal").val(0);
            }
            return false;
        }






    </script>
</asp:Content>

