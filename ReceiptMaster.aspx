<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReceiptMaster.aspx.cs" Inherits="ReceiptMaster" %>

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
            <li class="active">રસીદ પત્રક ની માહિતી</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1" class="active"><a href="#first1" onclick="ViewDiv1();">રસીદ પત્રક ઉમેરો/સુધારો </a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">


                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <div class="row" style="background-color: #ecf8f7; border-radius: 8px 8px 0px 0px;">



                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:HiddenField ID="hdnMangnaPatrakID" runat="server" />
                                                    <asp:TextBox ID="txtPersonName" class="form-control" runat="server"></asp:TextBox>
                                                    <label>માલિક</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtReceiptNo" placeholder="New" class="form-control" runat="server"></asp:TextBox>
                                                    <label>રસીદ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAccountNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ખાતા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtHouseholdNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ઘરગથ્થું નંબર</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" style="background-color: #ecf8f7; border-radius: 0px 0px 8px 8px;">

                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFormNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMagnaNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>માંગણા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBlockNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>બ્લોક નંબર</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlReceiptType" CssClass="form-control" runat="server">
                                                        <asp:ListItem Text="નિયમિત રસીદ" Value="false"></asp:ListItem>
                                                        <asp:ListItem Text="એડવાન્સ રસીદ" Value="true"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label>રસીદ નો પ્રકાર<span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtKulPiyavo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>કુલ પિયાવો</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtDisPer" onchange="CalcDiscount();" onkeypress="return isDecimalKey(event);" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ડિસ્કાઉન્ટ (%)</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtTotalDiscount" class="form-control" runat="server"></asp:TextBox>
                                                    <label>કુલ વળતર</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtTotalFund" class="form-control" runat="server"></asp:TextBox>
                                                    <label>કુલ લોકલ ફંડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtIntPer" class="form-control" onchange="CalcDiscount();" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>વ્યાજ (%)</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtTotalInt" class="form-control" runat="server"></asp:TextBox>
                                                    <label>કુલ વ્યાજ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtKulRakam" class="form-control" runat="server"></asp:TextBox>
                                                    <label>કુલ રકમ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtReceiveAmt" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ભરેલ રકમ	</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPendingAmount" class="form-control" runat="server"></asp:TextBox>
                                                    <label>બાકી રકમ</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtReceiveDate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>પ્રાપ્ત તારીખ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtReceiveAmount" class="form-control" onchange='return ValidateRecieveAmt();' runat="server"></asp:TextBox>
                                                    <label>પ્રાપ્ત રકમ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBakiRakam" class="form-control" runat="server"></asp:TextBox>
                                                    <label>જમા રકમ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlIsCash" onchange="ShowHideChequeControls();" CssClass="form-control" runat="server">
                                                        <asp:ListItem Text="રોકડ" Value="true"></asp:ListItem>
                                                        <asp:ListItem Text="ચેક" Value="false"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label>રોકડ/ચેક<span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group " id="DivBank">
                                                    <asp:DropDownList ID="ddlMemberBank" runat="server" CssClass="form-control select2-list"></asp:DropDownList>
                                                    <label>સંચાલક બેંક <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group " id="DivBankName">
                                                    <asp:TextBox ID="txtBank" class="form-control" runat="server"></asp:TextBox>
                                                    <label>બેંક </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group " id="DivChequeNo">
                                                    <asp:TextBox ID="txtChkNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ચેક નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group " id="DivChequeAmt">
                                                    <asp:TextBox ID="txtChkAmt" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ચેક રકમ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group " id="DivChequeDate">
                                                    <asp:TextBox ID="txtChkDate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>ચેક તારીખ</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-1">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    દાખલ કરો</button>
                                                  <input type="hidden" id="hdnSubmitVal" value="0" />
                                            </div>
                                            <div class="col-sm-1">
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

                                    <div class="col-md-12 col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlVillageSrch" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>ગામ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAccountNoSrch" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ખાતા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMemberNameSrch" class="form-control" runat="server"></asp:TextBox>
                                                    <label>વ્યક્તિ નુ નામ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMangnaNoSrch" class="form-control" runat="server"></asp:TextBox>
                                                    <label>માંગણા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtReceiptNoSrch" class="form-control" runat="server"></asp:TextBox>
                                                    <label>રસીદ નંબર</label>
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
                                                <table id="datatable1" class="table table-striped table-hover">
                                                    <asp:GridView ID="gvReceipt" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">

                                                        <Columns>
                                                            <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                            <asp:BoundField DataField="ReceiptNumber" HeaderText="રસીદ નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="ReceiptNumber"></asp:BoundField>
                                                            <asp:BoundField DataField="MangnaNo" HeaderText="માંગણા નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="MangnaNo"></asp:BoundField>
                                                            <asp:BoundField DataField="AccountNo" HeaderText="ખાતા નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="AccountNo"></asp:BoundField>
                                                            <asp:BoundField DataField="MemberName" HeaderText="	ખાતેદાર નું નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="MemberName"></asp:BoundField>
                                                            <asp:BoundField DataField="VillageNameG" HeaderText="ગામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="VillageNameG"></asp:BoundField>
                                                            <asp:BoundField DataField="ReceiveDate" HeaderText="રસીદ તારીખ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="ReceiveDate"></asp:BoundField>
                                                            <asp:BoundField DataField="ReceiveAmount" HeaderText="પ્રાપ્ત રકમ	" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="ReceiveAmount"></asp:BoundField>
                                                            <asp:BoundField DataField="DiscountPer" HeaderText="ડિસ્કાઉન્ટ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="DiscountPer"></asp:BoundField>
                                                            <asp:BoundField DataField="DiscountAmt" HeaderText="ડિસ્કાઉન્ટ રકમ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="DiscountAmt"></asp:BoundField>
                                                            <asp:BoundField DataField="InterestPer" HeaderText="વ્યાજ (%)" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="InterestPer"></asp:BoundField>
                                                            <asp:BoundField DataField="InterestAmt" HeaderText="વ્યાજ રકમ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="InterestAmt"></asp:BoundField>

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
    </div>

    <script>

        $(".Pager").on("click", '.page', function () {
            GetReceiptData(parseInt($(this).attr('page')));
        });

        var rights = "";
        $(function () {
            $("#divFirst").css({ 'display': "block" });
            $("[id*=litab1]").attr('class', 'active');

            $("#DivBank").css({ 'display': "none" });
            $("#DivBankName").css({ 'display': "none" });
            $("#DivChequeNo").css({ 'display': "none" });
            $("#DivChequeAmt").css({ 'display': "none" });
            $("#DivChequeDate").css({ 'display': "none" });

            $("[id=ContentPlaceHolder1_txtPersonName]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtReceiptNo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtAccountNo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtHouseholdNo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtFormNo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtMagnaNo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtBlockNo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtKulPiyavo]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtTotalDiscount]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtTotalFund]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtTotalInt]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtKulRakam]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtReceiveAmt]").prop('disabled', true);
            $("[id=ContentPlaceHolder1_txtPendingAmount]").prop('disabled', true);

            $("[id=ContentPlaceHolder1_txtDisPer]").val('0');
            $("[id=ContentPlaceHolder1_txtTotalDiscount]").val('0');
            $("[id=ContentPlaceHolder1_txtIntPer]").val('0');
            $("[id=ContentPlaceHolder1_txtTotalInt]").val('0');

            ListMemberBank();
            ListVillage();
        });


        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });

        }

        function ListMemberBank() {

            $.ajax({
                type: "POST",
                url: "ReceiptMaster.aspx/ListMemberbank",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlMemberBank]");
                    $("[id*=ddlMemberBank]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function ListVillage() {

            $.ajax({
                type: "POST",
                url: "ReceiptMaster.aspx/ListVillage",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id=ContentPlaceHolder1_ddlVillageSrch]");
                    $("[id=ContentPlaceHolder1_ddlVillageSrch]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function ShowHideChequeControls() {
            var ReceiptType = document.getElementById("ContentPlaceHolder1_ddlIsCash");

            if (ReceiptType.value == "false") {
                $("#DivBank").css({ 'display': "block" });
                $("#DivBankName").css({ 'display': "block" });
                $("#DivChequeNo").css({ 'display': "block" });
                $("#DivChequeAmt").css({ 'display': "block" });
                $("#DivChequeDate").css({ 'display': "block" });

            }
            else if (ReceiptType.value == "true") {
                $("#DivBank").css({ 'display': "none" });
                $("#DivBankName").css({ 'display': "none" });
                $("#DivChequeNo").css({ 'display': "none" });
                $("#DivChequeAmt").css({ 'display': "none" });
                $("#DivChequeDate").css({ 'display': "none" });
            }
        }

        function CalcDiscount() {
          
            var txtKulPiyavo = document.getElementById("ContentPlaceHolder1_txtKulPiyavo");
            var txtDisPer = document.getElementById("ContentPlaceHolder1_txtDisPer");
            var txtTotalDiscount = document.getElementById("ContentPlaceHolder1_txtTotalDiscount");
            var txtTotalFund = document.getElementById("ContentPlaceHolder1_txtTotalFund");
            var txtKulRakam = document.getElementById("ContentPlaceHolder1_txtKulRakam");

            var totaldiscount = ((txtKulPiyavo.value * txtDisPer.value) / 100).toFixed(2);
            //txtTotalDiscount.value = Math.round(totaldiscount).toFixed(2);
            txtTotalDiscount.value = totaldiscount;

            var amt = (txtKulPiyavo.value - txtTotalDiscount.value).toFixed(2);

            var txtIntPer = document.getElementById("ContentPlaceHolder1_txtIntPer");
            var txtTotalInt = document.getElementById("ContentPlaceHolder1_txtTotalInt");

            var totalinterest = ((txtKulRakam.value * txtIntPer.value) / 100).toFixed(2);
            //txtTotalInt.value = Math.round(totalinterest).toFixed(2);
            txtTotalInt.value = totalinterest;

            //txtKulRakam.value = Math.round((txtKulPiyavo.value - txtTotalDiscount.value) + parseFloat(txtTotalFund.value) + parseFloat(txtTotalInt.value)).toFixed(2);
            txtKulRakam.value = (txtKulPiyavo.value - txtTotalDiscount.value) + parseFloat(txtTotalFund.value) + parseFloat(txtTotalInt.value);
        }

        function ValidateRecieveAmt() {

            var txtPendingAmount = document.getElementById("ContentPlaceHolder1_txtPendingAmount");
            var txtReceiveAmount = document.getElementById("ContentPlaceHolder1_txtReceiveAmount");
            var txtChkAmt = document.getElementById("ContentPlaceHolder1_txtChkAmt");

             if (parseFloat(txtReceiveAmount.value) > parseFloat(txtPendingAmount.value) || parseFloat(txtReceiveAmount.value) == 0) {
                 txtReceiveAmount.value = "";
                 txtChkAmt.value = "";
                 txtReceiveAmount.focus();
                 swal("", "માન્ય પ્રાપ્ત રકમ દાખલ કરો.", "warning");
             }
             else {
                 txtChkAmt.value = txtReceiveAmount.value;
             }
        }

        $(function () {
            $("#btnSave").bind("click", function () {
                var txtRcDate = document.getElementById("ContentPlaceHolder1_txtReceiveDate");
                var txtDisPer = document.getElementById("ContentPlaceHolder1_txtDisPer");
                var txtIntPer = document.getElementById("ContentPlaceHolder1_txtIntPer");
                var txtReceiveAmount = document.getElementById("ContentPlaceHolder1_txtReceiveAmount");
                var ddlIsCash = document.getElementById("ContentPlaceHolder1_ddlIsCash");
                var ddlMemberBank = document.getElementById("ContentPlaceHolder1_ddlMemberBank");
                var txtBank = document.getElementById("ContentPlaceHolder1_txtBank");
                var txtChkNo = document.getElementById("ContentPlaceHolder1_txtChkNo");
                var txtChkAmt = document.getElementById("ContentPlaceHolder1_txtChkAmt");
                var txtChkDate = document.getElementById("ContentPlaceHolder1_txtChkDate");

                if (txtRcDate.value == "") {
                    txtRcDate.focus();
                    swal("", "પ્રાપ્ત તારીખ દાખલ કરો.", "warning");
                    return false;
                }
                else if (txtDisPer.value == "") {
                    txtDisPer.focus();
                    swal("", "ડિસ્કાઉન્ટ (%) દાખલ કરો.", "warning");
                    return false;
                }
                else if (txtIntPer.value == "") {
                    txtIntPer.focus();
                    swal("", "વ્યાજ (%) દાખલ કરો.", "warning");
                    return false;
                }
                else if (txtReceiveAmount.value == "") {
                    txtReceiveAmount.focus();
                    swal("", "પ્રાપ્ત રકમ દાખલ કરો.", "warning");
                    return false;
                }
                else if (ddlIsCash.value == "false" && ddlMemberBank.value == 0) {
                    ddlMemberBank.focus();
                    swal("", "સંચાલક બેંક પસંદ કરો.", "warning");
                    return false;
                }
                else if (ddlIsCash.value == "false" && txtBank.value == "") {
                    txtBank.focus();
                    swal("", "બેંક દાખલ કરો.", "warning");
                    return false;
                }
                else if (ddlIsCash.value == "false" && txtChkNo.value == "") {
                    txtChkNo.focus();
                    swal("", "ચેક નંબર દાખલ કરો.", "warning");
                    return false;
                }
                else if (ddlIsCash.value == "false" && txtChkAmt.value == "") {
                    txtChkAmt.focus();
                    swal("", "ચેક રકમ દાખલ કરો.", "warning");
                    return false;
                }
                else if (ddlIsCash.value == "false" && txtChkDate.value == "") {
                    txtChkDate.focus();
                    swal("", "ચેક તારીખ દાખલ કરો.", "warning");
                    return false;
                }
                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Wait");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    var Receipt = {};
                    Receipt.mangnapatrakid = $("[id=ContentPlaceHolder1_hdnMangnaPatrakID]").val();
                    Receipt.ReceiveAmount = $("[id=ContentPlaceHolder1_txtReceiveAmount]").val();
                    Receipt.DisPer = $("[id=ContentPlaceHolder1_txtDisPer]").val();
                    Receipt.TotalDiscount = $("[id=ContentPlaceHolder1_txtTotalDiscount]").val();
                    Receipt.IntPer = $("[id=ContentPlaceHolder1_txtIntPer]").val();
                    Receipt.TotalInt = $("[id=ContentPlaceHolder1_txtTotalInt]").val();
                    Receipt.ReceiveDate = $("[id=ContentPlaceHolder1_txtReceiveDate]").val();
                    if ($("[id=ContentPlaceHolder1_txtBakiRakam]").val() == "") {
                        Receipt.BakiRakam = "0";
                    }
                    else {
                        Receipt.BakiRakam = $("[id=ContentPlaceHolder1_txtBakiRakam]").val();
                    }
                    Receipt.ddlIsCash = $("[id=ContentPlaceHolder1_ddlIsCash]").val();
                    Receipt.ddlReceiptType = $("[id=ContentPlaceHolder1_ddlReceiptType]").val();
                    Receipt.ddlMemberBank = $("[id=ContentPlaceHolder1_ddlMemberBank]").val();
                    Receipt.Bank = $("[id=ContentPlaceHolder1_txtBank]").val();
                    Receipt.ChkNo = $("[id=ContentPlaceHolder1_txtChkNo]").val();
                    Receipt.ChkDate = $("[id=ContentPlaceHolder1_txtChkDate]").val();
                    if ($("[id=ContentPlaceHolder1_txtChkAmt]").val() == "") {
                        Receipt.ChkAmt = 0;
                    }
                    else {
                        Receipt.ChkAmt = $("[id=ContentPlaceHolder1_txtChkAmt]").val();
                    }
                    $.ajax({
                        type: "POST",
                        url: "ReceiptMaster.aspx/ReceiptManage",
                        data: '{Receipt: ' + JSON.stringify(Receipt) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;
                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                                return false;
                            }
                            else {
                                swal({
                                    title: msg,
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonClass: "btn-danger",
                                    confirmButtonText: "OK",
                                    closeOnConfirm: false
                                },
                              function () {
                                  window.opener.location.reload();
                                  close();
                              });
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
            GetReceiptData(1);
        }

        function GetReceiptData(pageIndex) {

            $.ajax({
                type: "POST",
                url: "ReceiptMaster.aspx/GetAllReceipt",
                data: '{AccountNo: ' + JSON.stringify($("[id=ContentPlaceHolder1_txtAccountNoSrch]").val()) + ',MemberName: ' + JSON.stringify($("[id=ContentPlaceHolder1_txtMemberNameSrch]").val()) + ',MangnaNo: ' + JSON.stringify($("[id=ContentPlaceHolder1_txtMangnaNoSrch]").val()) + ',ReceiptNo: ' + JSON.stringify($("[id=ContentPlaceHolder1_txtReceiptNoSrch]").val()) + ',VillageID: ' + JSON.stringify($("[id=ContentPlaceHolder1_ddlVillageSrch]").val()) + ',pageIndex:' + pageIndex + '}',
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
            var customers = xml.find("ReceiptDetail");
            if (row == null) {
                row = $("[id*=gvReceipt] tr:last-child").clone(true);
            }
            $("[id*=gvReceipt] tr").not($("[id*=gvReceipt] tr:first-child")).remove();
            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($(this).find("ReceiptNumber").text());
                    $("td", row).eq(2).html($(this).find("MangnaNo").text());
                    $("td", row).eq(3).html($(this).find("AccountNo").text());
                    $("td", row).eq(4).html($(this).find("MemberName").text());
                    $("td", row).eq(5).html($(this).find("VillageNameG").text());
                    $("td", row).eq(6).html($(this).find("ReceiveDate").text());
                    $("td", row).eq(7).html($(this).find("ReceiveAmount").text());
                    $("td", row).eq(8).html($(this).find("DiscountPer").text());
                    $("td", row).eq(9).html($(this).find("DiscountAmt").text());
                    $("td", row).eq(10).html($(this).find("InterestPer").text());
                    $("td", row).eq(11).html($(this).find("InterestAmt").text());

                    $("td", row).eq(12).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteReceipt(' + $(this).find("ReceiptID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    $("td", row).eq(13).html($('<a class="btn btn-flat ink-reaction btn-default"  onclick="return RedirectToPrintReceipt(' + $(this).find("ReceiptID").text() + ');">રશીદ</a>'));

                    $("[id*=gvReceipt]").append(row);
                    row = $("[id*=gvReceipt] tr:last-child").clone(true);
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
                $("[id*=gvReceipt]").append(empty_row);
            }
        }

        function RedirectToPrintReceipt(ReceiptID) {
            window.open('Reports/PrintReceipt.aspx?Rid=' + ReceiptID, '_blank');
        }

        function DeleteReceipt(ReceiptID) {

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
                    url: "ReceiptMaster.aspx/DeleteReceipt",
                    data: '{ReceiptID : ' + ReceiptID + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;

                        if (msg.indexOf("Error") > -1) {
                            swal(msg);
                        }
                        else {
                            swal("Deleted!", msg, "success");
                            BindGrid();
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

        function ClearAll() {
            $("[id=ContentPlaceHolder1_ddlReceiptType]").val('false');
            $("[id=ContentPlaceHolder1_txtDisPer]").val('0');
            $("[id=ContentPlaceHolder1_txtIntPer]").val('0');
            $("[id=ContentPlaceHolder1_txtReceiveDate]").val('');
            $("[id=ContentPlaceHolder1_txtReceiveAmount]").val('');
            $("[id=ContentPlaceHolder1_txtBakiRakam]").val('');
            $("[id=ContentPlaceHolder1_ddlIsCash]").val('true');
            $("[id=ContentPlaceHolder1_ddlMemberBank]").val('0');
            $("[id=ContentPlaceHolder1_txtBank]").val('');
            $("[id=ContentPlaceHolder1_txtChkNo]").val('');
            $("[id=ContentPlaceHolder1_txtChkAmt]").val('');
            $("[id=ContentPlaceHolder1_txtChkDate]").val('');
            
            CalcDiscount();
            ShowHideChequeControls();
        }


    </script>
</asp:Content>

