<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberBlockDetail.aspx.cs" Inherits="MemberBlockDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">બ્લોક ની માહિતી </li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">બ્લોક માહિતી ઉમેરો/સુધારો/રદ</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <div class="row" style="background-color: #ecf8f7">
                                            <asp:HiddenField ID="hdnBlockID" runat="server" />
                                         


                                             <div class="col-lg-1">
                                                <h4>ઘરગથ્થુ નંબર:</h4>
                                            </div>

                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label ID="lblHouseHold" runat="server"></asp:Label>
                                                </h5>
                                            </div>

                                            <div class="col-lg-1">
                                                <h4>નામ:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label ID="lblFullName" runat="server"></asp:Label>
                                                </h5>
                                            </div>

                                            <div class="col-lg-1">
                                                <h4>ગામ:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label ID="lblVillage" runat="server"></asp:Label>
                                                </h5>
                                            </div>

                                        </div>

                                        <div class="row" style="background-color: #ecf8f7">

                                            <div class="col-lg-1">
                                                <h4>સરનામુ:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                                </h5>
                                            </div>

                                            <div class="col-lg-1">
                                                <h4>મોબાઈલ નંબર ૧:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label ID="lblMobile1" runat="server"></asp:Label>
                                                </h5>
                                            </div>

                                              <div class="col-lg-1">
                                                <h4>ખાતા નંબર:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label ID="lblAccountNo" runat="server"></asp:Label>
                                                </h5>
                                            </div>

                                        </div>

                                        <br />
                                        
                                        <div class="row">
                                               <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlFamilyMembers" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>કુટુંબ ના સભ્ય<span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="divPerCode">
                                                    <asp:TextBox ID="txtBlockNo" class="form-control" runat="server"></asp:TextBox>
                                                    <label>બ્લોક નંબર <span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group" id="div1">
                                                    <asp:TextBox ID="txtArea" class="form-control" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>વિસ્તાર <span style="color: red">*</span></label>
                                                </div>
                                            </div>



                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control" onchange="BindBeat()"></asp:DropDownList>
                                                    <label>ગામ <span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlBeat" runat="server" CssClass="form-control" onchange="BindCanal();"></asp:DropDownList>
                                                    <label>બીટ <span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlCanal" runat="server" CssClass="form-control" onchange="BindOutlet();"></asp:DropDownList>
                                                    <label>નહેર <span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlOutlet" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>ફાટો <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">


                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <div class="checkbox checkbox-styled">
                                                        <label>
                                                            <asp:CheckBox ID="chkIsOut" runat="server" />
                                                            <span>આઉટ કમાન્ડ</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlHeadMiddleTail" CssClass="form-control" runat="server">
                                                        <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="હેડ" Value="H"></asp:ListItem>
                                                        <asp:ListItem Text="મિડલ" Value="M"></asp:ListItem>
                                                        <asp:ListItem Text="ટેલ" Value="T"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label>સ્થળ <span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-1">
                                                <div class="form-group " style="padding-top: 0;">
                                                    <span>પાણી કેટલા કલાક ચાલે છે?</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtWinterWaterHours" class="form-control" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>શિયાળા માં</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtSummerWaterHours" class="form-control" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ઉનાળા માં</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMonsoonWaterHours" class="form-control" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ચોમાસા માં</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" >
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFamilyHeadPerson" runat="server" CssClass="form-control" onchange="ShowHideDivRent();"></asp:TextBox>
                                                    <label>ઘરના વડાનું નામ<span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlFarmer" runat="server" CssClass="form-control" onchange="ShowHideDivRent();"></asp:DropDownList>
                                                    <label>ખેતર ખેડનાર <span style="color: red">*</span></label>
                                                </div>
                                            </div>

                                            <div style="display: none;" id="DivRent">
                                                <div class="col-sm-1">
                                                    <div class="form-group " style="padding-top: 0;">

                                                        <span>ખેતી પોતે ન કરતાં હોઈ તો:</span>

                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <label class="radio-inline radio-styled">
                                                        <asp:RadioButton ID="rbtRent" GroupName="Rent" Text="ભાડા માં" runat="server" />
                                                    </label>
                                                </div>
                                                <div class="col-sm-1">
                                                    <label class="radio-inline radio-styled">
                                                        <asp:RadioButton ID="rbtBhaag" GroupName="Rent" Text="ભાગ માં" runat="server" />
                                                    </label>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlRentType" CssClass="form-control" runat="server">
                                                            <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="ગણોત" Value="ગણોત"></asp:ListItem>
                                                            <asp:ListItem Text="૫૦-૫૦" Value="૫૦-૫૦"></asp:ListItem>
                                                            <asp:ListItem Text="૭૦-૩૦" Value="૭૦-૩૦"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label>પધ્ધતિ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtRemark" class="form-control" runat="server"></asp:TextBox>
                                                        <label>રિમાર્ક</label>
                                                    </div>
                                                </div>
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

                                    <br />

                                    <div class="row" id="divGrid">
                                        <div class="col-lg-12">
                                            <div class="table-responsive">

                                                <asp:GridView ID="gvMemberBlockDetail" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                        <asp:BoundField DataField="BlockNo" HeaderText="બ્લોક નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BlockNo"></asp:BoundField>
                                                        <asp:BoundField DataField="Area" HeaderText="વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="Area"></asp:BoundField>
                                                        <asp:BoundField DataField="FarmerName" HeaderText="ખેડૂત/ખેડનાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FarmerName"></asp:BoundField>
                                                        <asp:BoundField DataField="VillageNameG" HeaderText="ગામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="VillageNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="CanalNameG" HeaderText="નહેર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="CanalNameG"></asp:BoundField>
                                                        <asp:BoundField DataField="Outlet" HeaderText="ફાટો" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="Outlet"></asp:BoundField>

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

            $("[id=litab1]").attr("class", "active");

            var memberid = GetParameterValues('Mid');
            GetGridRecords(memberid);
            ListFamilyMember(memberid);

            ListFarmer();
            ListVillage();
            ListBeat(0, 0);
            ListCanal(0, 0);
            ListOutlet(0, 0);
            
           document.getElementById("<%=this.txtWinterWaterHours.ClientID %>").value = "8";
           document.getElementById("<%=this.txtSummerWaterHours.ClientID %>").value = "8";
            document.getElementById("<%=this.txtMonsoonWaterHours.ClientID %>").value = "8";
            document.getElementById("<%=this.txtFamilyHeadPerson.ClientID %>").value = "પોતે";
       });

       function ShowHideDivRent() {
           var Farmer = document.getElementById("<%=this.ddlFarmer.ClientID %>");

           if (Farmer.value == "1" || Farmer.value == "0") {
               $("#DivRent").css({ 'display': "none" });
           }
           else {
               $("#DivRent").css({ 'display': "block" });
           }

       }

       function ListFarmer() {

           $.ajax({
               type: "POST",
               url: "MemberBlockDetail.aspx/ListFarmer",
               data: '{}',
               async: false,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {
                   var ddlCategory = $("[id*=ddlFarmer]");
                   $("[id*=ddlFarmer]").empty();
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
               url: "MemberBlockDetail.aspx/ListVillage",
               data: '{}',
               async: false,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {
                   var ddlCategory = $("[id*=ddlVillage]");
                   $("[id*=ddlVillage]").empty();
                   $.each(r.d, function () {
                       ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                   });
               }
           });
           return false;
       }

       function ListFamilyMember(MemberID) {
           
           $.ajax({
               type: "POST",
               url: "MemberBlockDetail.aspx/ListFamilyMember",
               data: '{ MemberID: ' + MemberID + '}',
               async: false,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {
                   var ddlCategory = $("[id=ContentPlaceHolder1_ddlFamilyMembers]");
                   $("[id=ContentPlaceHolder1_ddlFamilyMembers]").empty();
                   $.each(r.d, function () {
                       ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                   });
               }
           });
           return false;
       }


       function BindBeat() {
           ListBeat($("[id*=ddlVillage]").val(), 0);
       }

       function ListBeat(VillageID, selectedVillageID) {

           $.ajax({
               type: "POST",
               url: "MemberBlockDetail.aspx/ListBeat",
               data: '{ VillageID: ' + VillageID + '}',
               async: false,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {

                   var ddlCategory = $("[id*=ddlBeat]");
                   $("[id*=ddlBeat]").empty();
                   $.each(r.d, function () {
                       if (selectedVillageID == this['Value'])
                           ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                       else
                           ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                   });

               }
           });
           return false;
       }

       function BindCanal() {
           ListCanal($("[id*=ddlBeat]").val(), 0);
       }

       function ListCanal(BeatID, selectedBeatID) {

           $.ajax({
               type: "POST",
               url: "MemberBlockDetail.aspx/ListCanal",
               data: '{ BeatID: ' + BeatID + '}',
               async: false,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {

                   var ddlCategory = $("[id*=ddlCanal]");
                   $("[id*=ddlCanal]").empty();
                   $.each(r.d, function () {
                       if (selectedBeatID == this['Value'])
                           ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                       else
                           ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                   });
               }
           });
           return false;
       }

       function BindOutlet() {
           ListOutlet($("[id*=ddlCanal]").val(), 0);
       }

       function ListOutlet(CanalID, selectedCanalID) {

           $.ajax({
               type: "POST",
               url: "MemberBlockDetail.aspx/ListOutlet",
               data: '{ CanalID: ' + CanalID + '}',
               async: false,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {

                   var ddlCategory = $("[id*=ddlOutlet]");
                   $("[id*=ddlOutlet]").empty();
                   $.each(r.d, function () {
                       if (selectedCanalID == this['Value'])
                           ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                       else
                           ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                   });
               }
           });
           return false;
       }

       function GetParameterValues(param) {
           var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
           for (var i = 0; i < url.length; i++) {
               var urlparam = url[i].split('=');
               if (urlparam[0] == param) {
                   return urlparam[1];
               }
           }
       }

       $(function () {
           $("#btnSave").bind("click", function () {
             

              
               var BlockNo = document.getElementById("ContentPlaceHolder1_txtBlockNo");
               var Area = document.getElementById("ContentPlaceHolder1_txtArea");
               var Village = document.getElementById("ContentPlaceHolder1_ddlVillage");
               var Beat = document.getElementById("ContentPlaceHolder1_ddlBeat");
               var Canal = document.getElementById("ContentPlaceHolder1_ddlCanal");
               var Outlet = document.getElementById("ContentPlaceHolder1_ddlOutlet");
               var HeadMiddleTail = document.getElementById("ContentPlaceHolder1_ddlHeadMiddleTail");
               var Farmer = document.getElementById("ContentPlaceHolder1_ddlFarmer");

               var rbtRent = document.getElementById("ContentPlaceHolder1_rbtRent");
               var rbtBhaag = document.getElementById("ContentPlaceHolder1_rbtBhaag");
               var RentType = document.getElementById("ContentPlaceHolder1_ddlRentType");

               var FamilyHeadPerson = document.getElementById("<%=this.txtFamilyHeadPerson.ClientID%>");

              

               if (BlockNo.value == "") {
                   BlockNo.focus();
                   swal("", "બ્લોક નંબર દાખલ કરો.", "warning");
                   return false;
               }
               else if (Area.value == "") {
                   Area.focus();
                   swal("", "વિસ્તાર દાખલ કરો.", "warning");
                   return false;
               }
               else if (Village.value == "0") {
                   Village.focus();
                   swal("", "ગામ પસંદ કરો.", "warning");
                   return false;
               }
               else if (Beat.value == "0") {
                   Beat.focus();
                   swal("", "બીટ પસંદ કરો.", "warning");
                   return false;
               }
               else if (Canal.value == "0") {
                   Canal.focus();
                   swal("", "નહેર પસંદ કરો.", "warning");
                   return false;
               }
               //else if (Outlet.value == "0") {
               //    Outlet.focus();
               //    swal("", "ફાટો પસંદ કરો.", "warning");
               //    return false;
               //}
               else if (HeadMiddleTail.value == "0") {
                   HeadMiddleTail.focus();
                   swal("", "સ્થળ પસંદ કરો.", "warning");
                   return false;
               }
               else if (Farmer.value == "0") {
                   Farmer.focus();
                   swal("", "ખેડૂત પસંદ કરો.", "warning");
                   return false;
               }

               else if (Farmer.value > "1" && rbtRent.checked == false && rbtBhaag.checked == false) {
                   swal("", "ભાડા માં / ભાગ માં પસંદ કરો.", "warning");
                   return false;
               }
               else if (Farmer.value > "1" && RentType.value == "0") {
                   RentType.focus();
                   swal("", "પધ્ધતિ પસંદ કરો.", "warning");
                   return false;
               }
               else {
                   $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Wait");
                   $("[id*=btnSave]").attr('disabled', 'disabled');
                   $("#hdnSubmitVal").val("1");

                   var memberid = GetParameterValues('Mid');

                   var memberblock = {};

                   memberblock.MemberID = memberid;
                   memberblock.BlockMemberID = document.getElementById("<%=this.ddlFamilyMembers.ClientID %>").value;
                   memberblock.FarmerID = document.getElementById("<%=this.ddlFarmer.ClientID %>").value;
                   memberblock.BlockNo = document.getElementById("<%=this.txtBlockNo.ClientID %>").value;
                   memberblock.Area = document.getElementById("<%=this.txtArea.ClientID %>").value;
                   memberblock.CanalID = document.getElementById("<%=this.ddlCanal.ClientID %>").value;
                   memberblock.VillageID = document.getElementById("<%=this.ddlVillage.ClientID %>").value;
                   memberblock.BeatID = document.getElementById("<%=this.ddlBeat.ClientID %>").value;
                   memberblock.OutletCanalID = document.getElementById("<%=this.ddlOutlet.ClientID %>").value;
                   memberblock.IsOut = document.getElementById("<%=this.chkIsOut.ClientID %>").checked;
                   memberblock.WinterWaterHours = document.getElementById("<%=this.txtWinterWaterHours.ClientID %>").value;
                   memberblock.SummerWaterHours = document.getElementById("<%=this.txtSummerWaterHours.ClientID %>").value;
                   memberblock.MonsoonWaterHours = document.getElementById("<%=this.txtMonsoonWaterHours.ClientID %>").value;
                   memberblock.HeadMiddleTail = document.getElementById("<%=this.ddlHeadMiddleTail.ClientID %>").value;
                   memberblock.rbtBhaag = document.getElementById("<%=this.rbtBhaag.ClientID %>").checked;
                   memberblock.rbtRent = document.getElementById("<%=this.rbtRent.ClientID %>").checked;
                   memberblock.RentType = document.getElementById("<%=this.ddlRentType.ClientID %>").value;
                   memberblock.RentRemark = document.getElementById("<%=this.txtRemark.ClientID %>").value;
                   memberblock.FamilyHeadPerson = document.getElementById("<%=this.txtFamilyHeadPerson.ClientID %>").value;
                   var bid = $("[id*=hdnBlockID]").val();

                   if (bid == "")
                       memberblock.BlockID = 0
                   else
                       memberblock.BlockID = bid;

                   $.ajax({
                       type: "POST",
                       url: "MemberBlockDetail.aspx/MemberBlockDetailManage",
                       data: '{memberblock: ' + JSON.stringify(memberblock) + '}',
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (response) {
                           var msg = response.d;

                           if (msg.indexOf("Error") > -1) {
                               swal(msg);
                           }
                           else {
                               swal("Done!", msg, "success");
                               GetGridRecords(memberid);
                               clearall();
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


        function GetGridRecords(memberid) {

            $.ajax({
                type: "POST",
                url: "MemberBlockDetail.aspx/GetMemberBlockDetail",
                data: '{MemberID: "' + memberid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnGridSuccess,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal(response.d);
                }
            });
        }

        var myrowl;
        function OnGridSuccess(response) {

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);


            var customers = xml.find("BlockDetail");

            if (myrowl == null) {
                myrowl = $("[id*=gvMemberBlockDetail] tr:last-child").clone(true);
            }
            $("[id*=gvMemberBlockDetail] tr").not($("[id*=gvMemberBlockDetail] tr:first-child")).remove();
            if (customers.length > 0) {

                if ($("td", myrowl).length < 7) {
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

                    $("td", myrowl).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowl).eq(1).html($(this).find("BlockNo").text());
                    $("td", myrowl).eq(2).html($(this).find("Area").text());
                    $("td", myrowl).eq(3).html($(this).find("FarmerName").text());
                    $("td", myrowl).eq(4).html($(this).find("VillageNameG").text());
                    $("td", myrowl).eq(5).html($(this).find("CanalNameG").text());
                    $("td", myrowl).eq(6).html($(this).find("Outlet").text());
                    $("td", myrowl).eq(7).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditBlockDetail(' + $(this).find("BlockID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    $("td", myrowl).eq(8).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteBlockDetail(' + $(this).find("BlockID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    $("[id*=gvMemberBlockDetail]").append(myrowl);
                    myrowl = $("[id*=gvMemberBlockDetail] tr:last-child").clone(true);

                });
            }
            else {

                var empty_row = myrowl.clone(true);

                $("td:first-child", empty_row).attr("colspan", $("td", myrowl).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvMemberBlockDetail]").append(empty_row);

            }
        };


        $("#btnReset").bind("click", function () {
            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset]").attr('disabled', 'disabled');
            $("#hdnReset").val("1");
            clearall();
            if ($("#hdnReset").val() == "1") {
                $("[id*=btnReset]").html("રદ કરો");
                $("[id*=btnReset]").removeAttr('disabled');
                $("#hdnReset").val(0);
            }
        });

        function clearall() {
          
            document.getElementById("<%=this.hdnBlockID.ClientID %>").value = "";
            document.getElementById("<%=this.txtBlockNo.ClientID %>").value = "";
            document.getElementById("<%=this.txtArea.ClientID %>").value = "";
            ListVillage();
            ListBeat(0, 0);
            ListCanal(0, 0);
            ListOutlet(0, 0);
            document.getElementById("<%=this.chkIsOut.ClientID %>").checked = false;
            document.getElementById("<%=this.ddlHeadMiddleTail.ClientID %>").value = 0;
            document.getElementById("<%=this.txtWinterWaterHours.ClientID %>").value = "8";
            document.getElementById("<%=this.txtSummerWaterHours.ClientID %>").value = "8";
            document.getElementById("<%=this.txtMonsoonWaterHours.ClientID %>").value = "8";
            document.getElementById("<%=this.txtFamilyHeadPerson.ClientID %>").value = "પોતે";
            ListFarmer();
            document.getElementById("<%=this.rbtRent.ClientID %>").value = 0;
            document.getElementById("<%=this.rbtBhaag.ClientID %>").value = 0;
            document.getElementById("<%=this.ddlRentType.ClientID %>").value = 0;
            document.getElementById("<%=this.txtRemark.ClientID %>").value = "";

            ShowHideDivRent();

            var memberid = GetParameterValues('Mid');

            ListFamilyMember(memberid);
            GetGridRecords(memberid);
        }

        function EditBlockDetail(blockid) {

            $.ajax({
                type: "POST",
                url: "MemberBlockDetail.aspx/GetBlockDetail",
                data: '{BlockID: ' + blockid + '}',
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

        function OnSuccess(response) {

            var res = response.d;


            $("[id=ContentPlaceHolder1_hdnBlockID]").val(res[0].BlockID);

            $("[id=ContentPlaceHolder1_ddlFamilyMembers]").val(res[0].BlockMemberID);

            $("[id=ContentPlaceHolder1_txtBlockNo]").val(res[0].BlockNo);
            $("[id=ContentPlaceHolder1_txtArea]").val(res[0].Area);
            $("[id=ContentPlaceHolder1_ddlVillage]").val(res[0].VillageID);

            ListBeat(res[0].VillageID, res[0].BeatID);
            ListCanal(res[0].BeatID, res[0].CanalID);
            ListOutlet(res[0].CanalID, res[0].OutletCanalID);

            if (res[0].IsOut == true) {
                $("[id*=chkIsOut]").prop('checked', true);
            }
            else {
                $("[id*=chkIsOut]").prop('checked', false);
            }
            
            $("[id=ContentPlaceHolder1_txtFamilyHeadPerson]").val(res[0].FamilyHeadPerson);
            $("[id=ContentPlaceHolder1_ddlHeadMiddleTail]").val(res[0].HeadMiddleTail);
            $("[id=ContentPlaceHolder1_txtWinterWaterHours]").val(res[0].WinterWaterHours);
            $("[id=ContentPlaceHolder1_txtSummerWaterHours]").val(res[0].SummerWaterHours);
            $("[id=ContentPlaceHolder1_txtMonsoonWaterHours]").val(res[0].MonsoonWaterHours);
            
            $("[id*=ddlFarmer]").val(res[0].FarmerID);

            ShowHideDivRent();

            if (res[0].IsPartner == true) {
                document.getElementById("<%=this.rbtBhaag.ClientID %>").checked = true;
            }
             else  {
                 document.getElementById("<%=this.rbtRent.ClientID %>").checked = true;
            }

            $("[id=ContentPlaceHolder1_ddlRentType]").val(res[0].RentType);
            $("[id=ContentPlaceHolder1_txtRemark]").val(res[0].RentRemark);
        }


        function DeleteBlockDetail(blockid) {
            var memberid = GetParameterValues('Mid');
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
                    url: "MemberBlockDetail.aspx/DeleteBlockDetail",
                    data: '{BlockID : ' + blockid + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;

                        if (msg.indexOf("Error") > -1) {
                            swal(msg);
                        }
                        else {

                            swal("Deleted!", msg, "success");
                            GetGridRecords(memberid);

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
    </script>
</asp:Content>

