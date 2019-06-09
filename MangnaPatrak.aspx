<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MangnaPatrak.aspx.cs" Inherits="MangnaPatrak" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">માંગણા ની માહિતી </li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">માંગણા ની માહિતી ઉમેરો</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">

                                    <div class="col-md-12 col-sm-12" style="border-radius: 10px 10px 10px 10px;">
                                        <br />
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlVillage" runat="server" onchange="BindMalik()" CssClass="form-control"></asp:DropDownList>
                                                    <label>ગામ</label>
                                                </div>
                                            </div>
                                             <div class="col-sm-2">
                                                <div class="form-group" id="divHH">
                                                    <asp:DropDownList ID="ddlHouseHoldNo" runat="server" onchange="SrchMember()" CssClass="form-control"></asp:DropDownList>
                                                    <label>ઘરગથ્થુ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlMalik" runat="server" onchange="GetMemberDetail()" CssClass="form-control"></asp:DropDownList>
                                                    <label>માલિક નુ નામ</label>
                                                </div>
                                            </div>
                                          

                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMangnaNo" placeholder="New" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                    <label>માંગણા નંબર</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMangnaDate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>માંગણા તારીખ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtHouseholdNo" ReadOnly="true" Style="color: #a6a6a6" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ઘરગથ્થું નંબર</label>
                                                </div>
                                            </div>
                                              <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAccountNo" ReadOnly="true" Style="color: #a6a6a6" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ખાતા નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPersonCode" ReadOnly="true" Style="color: #a6a6a6" class="form-control" runat="server"></asp:TextBox>
                                                    <label>વ્યક્તિ નો કોડ</label>
                                                </div>
                                            </div>
                                         
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12" style="border-radius: 10px 10px 10px 10px;">

                                        <div class="row">

                                            <div class="col-sm-3" style="background-color: #edf1fc; border-radius: 8px; text-align: center; padding-top: 8px;">
                                                <div class="checkbox checkbox-styled">
                                                    <label>
                                                        <asp:CheckBox ID="chkAdvanceMangnu" onchange="ListSeasonRabi();" runat="server" />
                                                        <span>એડવાન્સ માંગણું ?</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-3" style="padding-top: 4px;">
                                                <button type="button" id="btnCopyToAll" class="btn btn-default-bright btn-block">COPY TO ALL</button>
                                            </div>

                                          
                                        </div>
                                    </div>


                                    <div class="col-md-12 col-sm-12">
                                        <br />
                                    </div>

                                    <%--રબી--%>
                                    <div class="col-md-6 col-sm-6" style="background-color: #edf1fc; border-radius: 10px 10px 10px 10px;">
                                        <br />
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <label>1.</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlSeasonRabi" runat="server" CssClass="form-control" onchange="GetSeason()"></asp:DropDownList>
                                                    <label style="color: black; font-weight: 100">મૌસમ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlRabiBlockNo" runat="server" onchange="GetBlockDetailRabi()" CssClass="form-control"></asp:DropDownList>
                                                    <label>બ્લોક નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group" id="div4">
                                                    <asp:TextBox ID="txtMalikNameR" class="form-control" onchnage="ClearhdnFarmerIDRabi();" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnFarmerIDRabi" runat="server" />
                                                    <label>ખેડનાર </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFormNoR" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div20">
                                                    <asp:TextBox ID="txtFormDateR" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ તારીખ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBlockAreaR" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>બ્લોક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtKLPiyatR" class="form-control" onkeypress="return isDecimalKey(event);" onchange="return KLPiyatVistarChangeRabi();" runat="server"></asp:TextBox>
                                                    <label>ખેડવા લાયક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPiyatAreaR" class="form-control" onchange='return PiyatVistarChangeRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div24">
                                                    <asp:TextBox ID="txtBinPiyatAreaR" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>બિન પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlPakR" runat="server" onchange="GetPakRateAndWaterRabi()" CssClass="form-control"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnddlPakR" runat="server" />
                                                    <label>પાક</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>વહેતા પાણીથી</span>
                                                    <asp:HiddenField ID="hdnGovtRateRabi" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="divPerCode">
                                                    <asp:TextBox ID="txtvAreaR" class="form-control" runat="server" onchange='return VAreaChangeRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div1">
                                                    <asp:TextBox ID="txtvRateR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div2">
                                                    <asp:TextBox ID="txtvWaterR" class="form-control" runat="server" onchange='return VAreaChangeRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);"></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div3">
                                                    <asp:TextBox ID="txtvTotalAmtR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>ઉદવહનથી</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div25">
                                                    <asp:TextBox ID="txtuAreaR" class="form-control" runat="server" onchange='return UAreaChangeRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div26">
                                                    <asp:TextBox ID="txtuRateR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div27">
                                                    <asp:TextBox ID="txtuWaterR" class="form-control" runat="server" onchange='return UAreaChangeRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);"></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div28">
                                                    <asp:TextBox ID="txtuTotalAmtR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>કુલ પિયત</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div29">
                                                    <asp:TextBox ID="txtTotalPiyatAmtR" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>કુલ પિયત</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div30">
                                                    <asp:TextBox ID="txtLocalFundR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>૨૦%&nbsp;&nbsp;લોકલ ફંડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div31">
                                                    <asp:TextBox ID="txtAmtLocalFundR" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>ટોટલ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div33">
                                                    <asp:TextBox ID="txtRoundOffR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>રાઉન્ડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div32">
                                                    <asp:TextBox ID="txtNetAmountR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>નેટ ટોટલ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <span>Done</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <div class="checkbox checkbox-styled">
                                                        <label>
                                                            <asp:CheckBox ID="chkDoneRabi" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%--ઉનાળુ--%>
                                    <div class="col-md-6 col-sm-6" style="background-color: #ffe6e6; border-radius: 10px 10px 10px 10px;">
                                        <br />
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <label>2.</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtSeasonUnadu" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <asp:HiddenField runat="server" ID="hdnSeasonUnadu" />
                                                    <label>મૌસમ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlUnaduBlockNo" runat="server" onchange="GetBlockDetailUnadu();" CssClass="form-control"></asp:DropDownList>
                                                    <label>બ્લોક નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group" id="div5">
                                                    <asp:TextBox ID="txtMalikNameU" class="form-control" onchange="ClearhdnFarmerIDUnadu();" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnFarmerIDUnadu" runat="server" />
                                                    <label>ખેડનાર </label>
                                                </div>
                                            </div>

                                        </div>




                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFormNoU" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div8">
                                                    <asp:TextBox ID="txtFormDateU" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ તારીખ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBlockAreaU" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>બ્લોક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtKLPiyatU" class="form-control" onkeypress="return isDecimalKey(event);" onchange='return KLPiyatVistarChangeUnadu();' runat="server"></asp:TextBox>
                                                    <label>ખેડવા લાયક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPiyatAreaU" class="form-control" onchange='return PiyatVistarChangeUnadu();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div9">
                                                    <asp:TextBox ID="txtBinPiyatAreaU" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>બિન પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlPakU" runat="server" onchange="GetPakRateAndWaterUnadu()" CssClass="form-control"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnddlPakU" runat="server" />
                                                    <label>પાક</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>વહેતા પાણીથી</span>
                                                    <asp:HiddenField ID="hdnGovtRateUnadu" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div10">
                                                    <asp:TextBox ID="txtvAreaU" class="form-control" onchange='return VAreaChangeUnadu();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div11">
                                                    <asp:TextBox ID="txtvRateU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div21">
                                                    <asp:TextBox ID="txtvWaterU" class="form-control" onchange='return VAreaChangeUnadu();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div34">
                                                    <asp:TextBox ID="txtvTotalAmtU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>ઉદવહનથી</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div35">
                                                    <asp:TextBox ID="txtuAreaU" class="form-control" MaxLength="10" onkeypress="return isDecimalKey(event);" onchange='return UAreaChangeUnadu();' runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div36">
                                                    <asp:TextBox ID="txtuRateU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div37">
                                                    <asp:TextBox ID="txtuWaterU" class="form-control" MaxLength="10" onkeypress="return isDecimalKey(event);" onchange='return UAreaChangeUnadu();' runat="server"></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div38">
                                                    <asp:TextBox ID="txtuTotalAmtU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>કુલ પિયત</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div39">
                                                    <asp:TextBox ID="txtTotalPiyatAmtU" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>કુલ પિયત</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div40">
                                                    <asp:TextBox ID="txtLocalFundU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>૨૦%&nbsp;&nbsp;લોકલ ફંડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div41">
                                                    <asp:TextBox ID="txtAmtLocalFundU" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>ટોટલ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div42">
                                                    <asp:TextBox ID="txtRoundOffU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>રાઉન્ડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div43">
                                                    <asp:TextBox ID="txtNetAmountU" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>નેટ ટોટલ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <span>Done</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <div class="checkbox checkbox-styled">
                                                        <label>
                                                            <asp:CheckBox ID="chkDoneUnadu" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12">
                                        <br />
                                    </div>

                                    <%--ખરીફ--%>
                                    <div class="col-md-6 col-sm-6" style="background-color: #f3f7ed; border-radius: 10px 10px 10px 10px;">
                                        <br />
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <label>3.</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtSeasonKharif" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <asp:HiddenField runat="server" ID="hdnSeasonKharif" />
                                                    <label>મૌસમ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlKharifBlockNo" runat="server" onchange="GetBlockDetailKharif()" CssClass="form-control"></asp:DropDownList>
                                                    <label>બ્લોક નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group" id="div6">
                                                    <asp:TextBox ID="txtMalikNameK" class="form-control" onchange="ClearhdnFarmerIDKharif();" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnFarmerIDKharif" runat="server" />
                                                    <label>ખેડનાર </label>
                                                </div>
                                            </div>
                                        </div>




                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFormNoK" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div7">
                                                    <asp:TextBox ID="txtFormDateK" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ તારીખ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBlockAreaK" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>બ્લોક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtKLPiyatK" class="form-control" onkeypress="return isDecimalKey(event);" onchange='return KLPiyatVistarChangeKharif();' runat="server"></asp:TextBox>
                                                    <label>ખેડવા લાયક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPiyatAreaK" class="form-control" onchange="PiyatVistarChangeKharif();" MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div12">
                                                    <asp:TextBox ID="txtBinPiyatAreaK" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>બિન પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlPakK" runat="server" onchange="GetPakRateAndWaterKharif()" MaxLength="10" onkeypress="return isDecimalKey(event);" CssClass="form-control"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnddlPakK" runat="server" />
                                                    <label>પાક</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>વહેતા પાણીથી</span>
                                                    <asp:HiddenField ID="hdnGovtRateKharif" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div13">
                                                    <asp:TextBox ID="txtvAreaK" class="form-control" onchange='return VAreaChangeKharif();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div14">
                                                    <asp:TextBox ID="txtvRateK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div15">
                                                    <asp:TextBox ID="txtvWaterK" class="form-control" onchange='return VAreaChangeKharif();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div16">
                                                    <asp:TextBox ID="txtvTotalAmtK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>ઉદવહનથી</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div17">
                                                    <asp:TextBox ID="txtuAreaK" class="form-control" runat="server" MaxLength="10" onkeypress="return isDecimalKey(event);" onchange='return UAreaChangeKharif();'></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div18">
                                                    <asp:TextBox ID="txtuRateK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div19">
                                                    <asp:TextBox ID="txtuWaterK" class="form-control" runat="server" MaxLength="10" onkeypress="return isDecimalKey(event);" onchange='return UAreaChangeKharif();'></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div22">
                                                    <asp:TextBox ID="txtuTotalAmtK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>કુલ પિયત</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div23">
                                                    <asp:TextBox ID="txtTotalPiyatAmtK" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>કુલ પિયત</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div44">
                                                    <asp:TextBox ID="txtLocalFundK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>૨૦%&nbsp;&nbsp;લોકલ ફંડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div45">
                                                    <asp:TextBox ID="txtAmtLocalFundK" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>ટોટલ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div46">
                                                    <asp:TextBox ID="txtRoundOffK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>રાઉન્ડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div47">
                                                    <asp:TextBox ID="txtNetAmountK" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>નેટ ટોટલ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <span>Done</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <div class="checkbox checkbox-styled">
                                                        <label>
                                                            <asp:CheckBox ID="chkDoneKharif" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%--આગળ ના વર્ષ નું રબી--%>
                                    <div class="col-md-6 col-sm-6" style="background-color: #edf1fc; border-radius: 10px 10px 10px 10px;">
                                        <br />
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <label>4.</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtSeasonNextYearRabi" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <asp:HiddenField runat="server" ID="hdnSeasonNextYearRabi" />

                                                    <label>મૌસમ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlNextYearRabiBlockNo" runat="server" onchange="GetBlockDetailNextYearRabi();" CssClass="form-control"></asp:DropDownList>
                                                    <label>બ્લોક નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group" id="div48">
                                                    <asp:TextBox ID="txtMalikNameNYR" class="form-control" onchange="ClearhdnFarmerIDNextYearRabi();" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnFarmerIDNextYearRabi" runat="server" />
                                                    <label>ખેડનાર </label>
                                                </div>
                                            </div>
                                        </div>




                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFormNoNYR" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div49">
                                                    <asp:TextBox ID="txtFormDateNYR" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <label>ફોર્મ તારીખ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBlockAreaNYR" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                    <label>બ્લોક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtKLPiyatNYR" class="form-control" onkeypress="return isDecimalKey(event);" MaxLength="10" onchange='return KLPiyatVistarChangeNextYearRabi();' runat="server"></asp:TextBox>
                                                    <label>ખેડવા લાયક વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPiyatAreaNYR" class="form-control" onkeypress="return isDecimalKey(event);" MaxLength="10" onchange='return PiyatVistarChangeRabiNextYear();' runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div50">
                                                    <asp:TextBox ID="txtBinPiyatAreaNYR" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                    <label>બિન પિયત વિસ્તાર</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlPakNYR" runat="server" onchange="GetPakRateAndWaterNextYearRabi()" CssClass="form-control"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnddlPakNYR" runat="server" />
                                                    <label>પાક</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>વહેતા પાણીથી</span>
                                                    <asp:HiddenField ID="hdnGovtRateNextYearRabi" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div51">
                                                    <asp:TextBox ID="txtvAreaNYR" class="form-control" onchange='return VAreaChangeNextYearRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div52">
                                                    <asp:TextBox ID="txtvRateNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div53">
                                                    <asp:TextBox ID="txtvWaterNYR" class="form-control" onchange='return VAreaChangeNextYearRabi();' MaxLength="10" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div54">
                                                    <asp:TextBox ID="txtvTotalAmtNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>ઉદવહનથી</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div55">
                                                    <asp:TextBox ID="txtuAreaNYR" class="form-control" runat="server" MaxLength="10" onkeypress="return isDecimalKey(event);" onchange='return UAreaChangeNextYearRabi();'></asp:TextBox>
                                                    <label>પિયત વિસ્તાર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div56">
                                                    <asp:TextBox ID="txtuRateNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>ભાવ</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div57">
                                                    <asp:TextBox ID="txtuWaterNYR" class="form-control" runat="server" MaxLength="10" onkeypress="return isDecimalKey(event);" onchange='return UAreaChangeNextYearRabi();'></asp:TextBox>
                                                    <label>પાણી </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div58">
                                                    <asp:TextBox ID="txtuTotalAmtNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>કુલ </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <span>કુલ પિયત</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div59">
                                                    <asp:TextBox ID="txtTotalPiyatAmtNYR" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>કુલ પિયત</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group" id="div60">
                                                    <asp:TextBox ID="txtLocalFundNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>૨૦%&nbsp;&nbsp;લોકલ ફંડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div61">
                                                    <asp:TextBox ID="txtAmtLocalFundNYR" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                    <label>ટોટલ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div62">
                                                    <asp:TextBox ID="txtRoundOffNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>રાઉન્ડ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="div63">
                                                    <asp:TextBox ID="txtNetAmountNYR" class="form-control" ReadOnly="true" onkeypress="return isDecimalKey(event);" runat="server"></asp:TextBox>
                                                    <label>નેટ ટોટલ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <div class="form-group ">
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <span>Done</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <div class="checkbox checkbox-styled">
                                                        <label>
                                                            <asp:CheckBox ID="chkDoneNextYearRabi" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12">
                                        <br />
                                        <div class="col-sm-2">
                                            <div class="form-group" id="div64">
                                                <asp:TextBox ID="txtRemark" class="form-control" runat="server"></asp:TextBox>
                                                <label>રિમાર્ક</label>
                                            </div>
                                        </div>
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
                                              <input type="hidden" id="hdnSet" value="0" />
                                        </div>
                                    </div>

                                    <br />

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <style>
        .widthzero {
            width: 0px;
        }
    </style>
    <script>
        $(function () {
            SetMenu("liTransaction", "ulTransaction", "limangnapatrak", "aMangnaPatrak", "", "");
            $("[id=litab1]").attr("class", "active");
            ListVillage();
            ListMalik(0,0,0);
            ListBlockNo(0);
            ListSeasonRabi();

            BindHouseHoldNo();
        });

        $("#btnCopyToAll").bind("click", function () {
            CopyData();
        });

        function CopyData() {

            var blockno = $("[id*=ddlRabiBlockNo]").val();

            $("[id*=ddlUnaduBlockNo]").val(blockno);
            $("[id*=ddlKharifBlockNo]").val(blockno);
            $("[id*=ddlNextYearRabiBlockNo]").val(blockno);

            if ($("[id*=txtFormNoR]").val() != "") {
                var formno = $("[id*=txtFormNoR]").val();
                $("[id*=txtFormNoU]").val(formno);
                $("[id*=txtFormNoK]").val(formno);
                $("[id*=txtFormNoNYR]").val(formno);
            }
            if ($("[id*=txtFormDateR]").val() != "") {
                var formdate = $("[id*=txtFormDateR]").val();
                $("[id*=txtFormDateU]").val(formdate);
                $("[id*=txtFormDateK]").val(formdate);
                $("[id*=txtFormDateNYR]").val(formdate);
            }

            GetBlockDetailUnadu();
            GetBlockDetailKharif();
            GetBlockDetailNextYearRabi();

            return false;
        }

        function ListSeasonRabi() {

            var chkAdvanceMangnu = document.getElementById("<%=this.chkAdvanceMangnu.ClientID %>").checked;

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/ListSeasonRabi",
                data: '{ IsAdvance: ' + chkAdvanceMangnu + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id=ContentPlaceHolder1_ddlSeasonRabi]");
                    $("[id=ContentPlaceHolder1_ddlSeasonRabi]").empty();
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
                url: "MangnaPatrak.aspx/ListVillage",
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

        function BindHouseHoldNo() {
            var VillageID = document.getElementById("<%=this.ddlVillage.ClientID %>").value;
             $.ajax({
                 type: "POST",
                 url: "MangnaPatrak.aspx/ListHouseHoldNoFromVillage",
                 data: '{VillageID: ' + VillageID + '}',
                 async: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (r) {
                     var ddlCategory = $("[id=ContentPlaceHolder1_ddlHouseHoldNo]");
                     $("[id=ContentPlaceHolder1_ddlHouseHoldNo]").empty();
                     $.each(r.d, function () {
                         ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                     });
                 }
             });
             return false;
         }

        function BindMalik() {
            BindHouseHoldNo();
            ListMalik($("[id=ContentPlaceHolder1_ddlVillage]").val(), 0, 0);
        }

        function SrchMember() {
            var ddlHH = $("[id=ContentPlaceHolder1_ddlHouseHoldNo]");
            var ddlMalik = $("[id=ContentPlaceHolder1_ddlMalik]");

            ListMalik($("[id=ContentPlaceHolder1_ddlVillage]").val(), $("[id=ContentPlaceHolder1_ddlHouseHoldNo]").val(), 0);
        }

        function ListMalik(VillageID,MemberID,selectedVillageID) {

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/ListMalik",
                data: '{ VillageID: ' + VillageID + ',MemberID: ' + MemberID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlCategory = $("[id=ContentPlaceHolder1_ddlMalik]");
                    $("[id=ContentPlaceHolder1_ddlMalik]").empty();
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


        function GetMemberDetail() {
            var ddlMalik = document.getElementById("ContentPlaceHolder1_ddlMalik");

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/GetMemberDetail",
                data: '{MalikID: ' + ddlMalik.value + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var res = response.d;
                    if (ddlMalik.value == 0) {
                        $("[id=ContentPlaceHolder1_txtAccountNo]").val('');
                        $("[id=ContentPlaceHolder1_txtPersonCode]").val('');
                        $("[id=ContentPlaceHolder1_txtHouseholdNo]").val('');
                       
                    }
                    else {
                        $("[id=ContentPlaceHolder1_txtAccountNo]").val(res[0].AccountNo);
                        $("[id=ContentPlaceHolder1_txtPersonCode]").val(res[0].PersonCode);
                        $("[id=ContentPlaceHolder1_txtHouseholdNo]").val(res[0].HouseholdNo);
                       
                    }
                },
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal(response.d);
                }
            });
            ListBlockNo($("[id=ContentPlaceHolder1_ddlMalik]").val());
        }

        function ListBlockNo(memberid) {

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/ListBlockNo",
                data: '{ MemberID: ' + memberid + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlRabiBlockNo = $("[id*=ddlRabiBlockNo]");
                    $("[id*=ddlRabiBlockNo]").empty();

                    var ddlUnaduBlockNo = $("[id*=ddlUnaduBlockNo]");
                    $("[id*=ddlUnaduBlockNo]").empty();

                    var ddlKharifBlockNo = $("[id*=ddlKharifBlockNo]");
                    $("[id*=ddlKharifBlockNo]").empty();

                    var ddlNextYearRabiBlockNo = $("[id*=ddlNextYearRabiBlockNo]");
                    $("[id*=ddlNextYearRabiBlockNo]").empty();

                    $.each(r.d, function () {

                        ddlRabiBlockNo.append($("<option></option>").val(this['Value']).html(this['Text']));
                        ddlUnaduBlockNo.append($("<option></option>").val(this['Value']).html(this['Text']));
                        ddlKharifBlockNo.append($("<option></option>").val(this['Value']).html(this['Text']));
                        ddlNextYearRabiBlockNo.append($("<option></option>").val(this['Value']).html(this['Text']));

                    });
                }
            });
            return false;
        }



        //Start મોસમ Changed
        function GetSeason() {

            var SeasonIDYearID = document.getElementById("ContentPlaceHolder1_ddlSeasonRabi");

            if (SeasonIDYearID.selectedIndex == 0) {

                $("[id=ContentPlaceHolder1_txtSeasonUnadu]").val('');
                $("[id=ContentPlaceHolder1_hdnSeasonUnadu]").val('');

                $("[id=ContentPlaceHolder1_txtSeasonKharif]").val('');
                $("[id=ContentPlaceHolder1_hdnSeasonKharif]").val('');

                $("[id=ContentPlaceHolder1_txtSeasonNextYearRabi]").val('');
                $("[id=ContentPlaceHolder1_hdnSeasonNextYearRabi]").val('');

                //ClearAll();

            }
            else {
                $.ajax({
                    type: "POST",
                    url: "MangnaPatrak.aspx/GetSeason",
                    data: '{SeasonIDYearID: "' + SeasonIDYearID.value + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var res = response.d;

                        $("[id=ContentPlaceHolder1_txtSeasonUnadu]").val(res[0].SeasonUnadu);
                        $("[id=ContentPlaceHolder1_hdnSeasonUnadu]").val(res[0].SeasonUnaduToolTip);

                        $("[id=ContentPlaceHolder1_txtSeasonKharif]").val(res[0].SeasonKharif);
                        $("[id=ContentPlaceHolder1_hdnSeasonKharif]").val(res[0].SeasonKharifToolTip);

                        $("[id=ContentPlaceHolder1_txtSeasonNextYearRabi]").val(res[0].SeasonRabiNextYear);
                        $("[id=ContentPlaceHolder1_hdnSeasonNextYearRabi]").val(res[0].SeasonRabiNextYearToolTip);

                        ListPakRabi();
                        ListPakUnadu();
                        ListPakKharif();
                        ListPakNextYearRabi();
                    },
                    failure: function (response) {
                        swal(response.d);
                    },
                    error: function (response) {
                        swal(response.d);
                    }
                });
            }
        }
        //End મોસમ Changed



        //Start Farmer Changed
        function ClearhdnFarmerIDRabi() {
            $("[id*=hdnFarmerIDRabi]").val('');
        }
        function ClearhdnFarmerIDUnadu() {
            $("[id*=hdnFarmerIDUnadu]").val('');
        }
        function ClearhdnFarmerIDKharif() {
            $("[id*=hdnFarmerIDKharif]").val('');
        }
        function ClearhdnFarmerIDNextYearRabi() {
            $("[id*=hdnFarmerIDNextYearRabi]").val('');
        }
        //Start Farmer Changed




        // બ્લોક નંબર Changed
        function GetBlockDetailRabi() {

            var BlockNo = document.getElementById("<%=this.ddlRabiBlockNo.ClientID %>");
            var SeasonNdYear = document.getElementById('<%= this.ddlSeasonRabi.ClientID %>');
            var txtFormNo = document.getElementById('<%= this.txtFormNoR.ClientID %>');

            if (SeasonNdYear.selectedIndex == 0) {
                SeasonNdYear.focus();
                swal("", "મૌસમ પંસદ કરો", "warning");
                document.getElementById("<%=this.ddlRabiBlockNo.ClientID %>").value = 0;
                return false;
            }
            else {
                if (BlockNo.value == 0) {
                    $("[id*=txtMalikNameR]").val('');
                    $("[id*=txtFormNoR]").val('');
                    $("[id*=txtFormDateR]").val('');
                    $("[id*=txtBlockAreaR]").val('');
                    $("[id*=txtKLPiyatR]").val('');
                    $("[id*=txtPiyatAreaR]").val('');
                    $("[id*=txtBinPiyatAreaR]").val('');

                    $("[id*=ddlPakR]").val('0');
                    $("[id*=txtvAreaR]").val('');
                    $("[id*=txtvRateR]").val('');
                    $("[id*=txtvWaterR]").val('');
                    $("[id*=txtvTotalAmtR]").val('');
                    $("[id*=txtuAreaR]").val('');
                    $("[id*=txtuRateR]").val('');
                    $("[id*=txtuWaterR]").val('');
                    $("[id*=txtuTotalAmtR]").val('');
                    $("[id*=txtTotalPiyatAmtR]").val('');
                    $("[id*=txtLocalFundR]").val('');
                    $("[id*=txtAmtLocalFundR]").val('');
                    $("[id*=txtRoundOffR]").val('');
                    $("[id*=txtNetAmountR]").val('');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/GetBlockDetailByBlockID",
                        data: '{BlockID: "' + BlockNo.value + '", SeasonNdYearID: "' + SeasonNdYear.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var res = response.d;

                            $("[id=ContentPlaceHolder1_txtFormNoR]").val(res[0].FormNo);
                            $("[id=ContentPlaceHolder1_txtMalikNameR]").val(res[0].MalikName);
                            //$("[id*=txtMalikNameR]").attr("title", (res[0].FarmerID));
                            $("[id=ContentPlaceHolder1_hdnFarmerIDRabi]").val(res[0].FarmerID);
                            $("[id=ContentPlaceHolder1_txtBlockAreaR]").val(res[0].BlockArea.toFixed(2));
                            $("[id=ContentPlaceHolder1_txtKLPiyatR]").val(res[0].KLPiyat.toFixed(2));
                            $("[id=ContentPlaceHolder1_txtPiyatAreaR]").val(res[0].PiyatArea.toFixed(2));
                            $("[id=ContentPlaceHolder1_txtBinPiyatAreaR]").val(res[0].BinPiyatArea.toFixed(2));

                            if (res[0].KLPiyat < res[0].BlockArea) {
                                $("[id=ContentPlaceHolder1_txtKLPiyatR]").attr("disabled", "disabled")
                            }
                            txtFormNo.focus();
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
        }


        function GetBlockDetailUnadu() {

            var BlockNo = document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>");
            var SeasonNdYear = document.getElementById("<%=this.hdnSeasonUnadu.ClientID %>");
            var txtFormNo = document.getElementById("<%=this.txtFormNoU.ClientID %>");


            if (SeasonNdYear.value == "") {
                swal("", "મૌસમ પંસદ કરો", "warning");
                document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>").value = 0;
                return false;
            }
            else {
                if (BlockNo.value == 0) {
                    $("[id*=txtMalikNameU]").val('');
                    $("[id*=txtFormNoU]").val('');
                    $("[id*=txtFormDateU]").val('');
                    $("[id*=txtBlockAreaU]").val('');
                    $("[id*=txtKLPiyatU]").val('');
                    $("[id*=txtPiyatAreaU]").val('');
                    $("[id*=txtBinPiyatAreaU]").val('');

                    $("[id*=ddlPakU]").val('0');
                    $("[id*=txtvAreaU]").val('');
                    $("[id*=txtvRateU]").val('');
                    $("[id*=txtvWaterU]").val('');
                    $("[id*=txtvTotalAmtU]").val('');
                    $("[id*=txtuAreaU]").val('');
                    $("[id*=txtuRateU]").val('');
                    $("[id*=txtuWaterU]").val('');
                    $("[id*=txtuTotalAmtU]").val('');
                    $("[id*=txtTotalPiyatAmtU]").val('');
                    $("[id*=txtLocalFundU]").val('');
                    $("[id*=txtAmtLocalFundU]").val('');
                    $("[id*=txtRoundOffU]").val('');
                    $("[id*=txtNetAmountU]").val('');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/GetBlockDetailByBlockID",
                        data: '{BlockID: "' + BlockNo.value + '", SeasonNdYearID: "' + SeasonNdYear.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var res = response.d;
                            $("[id*=txtFormNoU]").val(res[0].FormNo);
                            $("[id*=txtMalikNameU]").val(res[0].MalikName);
                            $("[id*=hdnFarmerIDUnadu]").val(res[0].FarmerID);
                            $("[id*=txtBlockAreaU]").val(res[0].BlockArea.toFixed(2));
                            $("[id*=txtKLPiyatU]").val(res[0].KLPiyat.toFixed(2));
                            $("[id*=txtPiyatAreaU]").val(res[0].PiyatArea.toFixed(2));
                            $("[id*=txtBinPiyatAreaU]").val(res[0].BinPiyatArea.toFixed(2));

                            if (res[0].KLPiyat < res[0].BlockArea) {
                                $("[id*=txtKLPiyatU]").attr("disabled", "disabled")
                            }
                            txtFormNo.focus();
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
        }

        function GetBlockDetailKharif() {

            var BlockNo = document.getElementById("<%=this.ddlKharifBlockNo.ClientID %>");
            var SeasonNdYear = document.getElementById("<%=this.hdnSeasonKharif.ClientID %>");
            var txtFormNo = document.getElementById("<%=this.txtFormNoK.ClientID %>");

            if (SeasonNdYear.value == "") {
                swal("", "મૌસમ પંસદ કરો", "warning");
                document.getElementById("<%=this.ddlKharifBlockNo.ClientID %>").value = 0;
                return false;
            }
            else {

                if (BlockNo.value == 0) {
                    $("[id*=txtMalikNameK]").val('');
                    $("[id*=txtFormNoK]").val('');
                    $("[id*=txtFormDateK]").val('');
                    $("[id*=txtBlockAreaK]").val('');
                    $("[id*=txtKLPiyatK]").val('');
                    $("[id*=txtPiyatAreaK]").val('');
                    $("[id*=txtBinPiyatAreaK]").val('');

                    $("[id*=ddlPakK]").val('0');
                    $("[id*=txtvAreaK]").val('');
                    $("[id*=txtvRateK]").val('');
                    $("[id*=txtvWaterK]").val('');
                    $("[id*=txtvTotalAmtK]").val('');
                    $("[id*=txtuAreaK]").val('');
                    $("[id*=txtuRateK]").val('');
                    $("[id*=txtuWaterK]").val('');
                    $("[id*=txtuTotalAmtK]").val('');
                    $("[id*=txtTotalPiyatAmtK]").val('');
                    $("[id*=txtLocalFundK]").val('');
                    $("[id*=txtAmtLocalFundK]").val('');
                    $("[id*=txtRoundOffK]").val('');
                    $("[id*=txtNetAmountK]").val('');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/GetBlockDetailByBlockID",
                        data: '{BlockID: "' + BlockNo.value + '", SeasonNdYearID: "' + SeasonNdYear.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var res = response.d;
                            $("[id*=txtFormNoK]").val(res[0].FormNo);
                            $("[id*=txtMalikNameK]").val(res[0].MalikName);
                            $("[id*=hdnFarmerIDKharif]").val(res[0].FarmerID);
                            $("[id*=txtBlockAreaK]").val(res[0].BlockArea.toFixed(2));
                            $("[id*=txtKLPiyatK]").val(res[0].KLPiyat.toFixed(2));
                            $("[id*=txtPiyatAreaK]").val(res[0].PiyatArea.toFixed(2));
                            $("[id*=txtBinPiyatAreaK]").val(res[0].BinPiyatArea.toFixed(2));

                            if (res[0].KLPiyat < res[0].BlockArea) {
                                $("[id*=txtKLPiyatK]").attr("disabled", "disabled")
                            }
                            txtFormNo.focus();
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
        }

        function GetBlockDetailNextYearRabi() {

            var BlockNo = document.getElementById("<%=this.ddlNextYearRabiBlockNo.ClientID %>");
            var SeasonNdYear = document.getElementById("<%=this.hdnSeasonNextYearRabi.ClientID %>");
            var txtFormNo = document.getElementById("<%=this.txtFormNoNYR.ClientID %>");

            if (SeasonNdYear.value == "") {
                swal("", "મૌસમ પંસદ કરો", "warning");
                document.getElementById("<%=this.ddlNextYearRabiBlockNo.ClientID %>").value = 0;
                return false;
            }
            else {

                if (BlockNo.value == 0) {
                    $("[id*=txtMalikNameNYR]").val('');
                    $("[id*=txtFormNoNYR]").val('');
                    $("[id*=txtFormDateNYR]").val('');
                    $("[id*=txtBlockAreaNYR]").val('');
                    $("[id*=txtKLPiyatNYR]").val('');
                    $("[id*=txtPiyatAreaNYR]").val('');
                    $("[id*=txtBinPiyatAreaNYR]").val('');

                    $("[id*=ddlPakNYR]").val('0');
                    $("[id*=txtvAreaNYR]").val('');
                    $("[id*=txtvRateNYR]").val('');
                    $("[id*=txtvWaterNYR]").val('');
                    $("[id*=txtvTotalAmtNYR]").val('');
                    $("[id*=txtuAreaNYR]").val('');
                    $("[id*=txtuRateNYR]").val('');
                    $("[id*=txtuWaterNYR]").val('');
                    $("[id*=txtuTotalAmtNYR]").val('');
                    $("[id*=txtTotalPiyatAmtNYR]").val('');
                    $("[id*=txtLocalFundNYR]").val('');
                    $("[id*=txtAmtLocalFundNYR]").val('');
                    $("[id*=txtRoundOffNYR]").val('');
                    $("[id*=txtNetAmountNYR]").val('');
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/GetBlockDetailByBlockID",
                        data: '{BlockID: "' + BlockNo.value + '", SeasonNdYearID: "' + SeasonNdYear.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            var res = response.d;

                            $("[id*=txtFormNoNYR]").val(res[0].FormNo);
                            $("[id*=txtMalikNameNYR]").val(res[0].MalikName);
                            $("[id*=hdnFarmerIDNextYearRabi]").val(res[0].FarmerID);
                            $("[id*=txtBlockAreaNYR]").val(res[0].BlockArea.toFixed(2));
                            $("[id*=txtKLPiyatNYR]").val(res[0].KLPiyat.toFixed(2));
                            $("[id*=txtPiyatAreaNYR]").val(res[0].PiyatArea.toFixed(2));
                            $("[id*=txtBinPiyatAreaNYR]").val(res[0].BinPiyatArea.toFixed(2));

                            if (res[0].KLPiyat < res[0].BlockArea) {
                                $("[id*=txtKLPiyatNYR]").attr("disabled", "disabled")
                            }
                            txtFormNo.focus();

                          

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
        }


        function ListPakRabi() {

            var SeasonIDYearID = document.getElementById('<%= this.ddlSeasonRabi.ClientID %>');

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/ListPak",
                data: '{SeasonIDYearID: "' + SeasonIDYearID.value + '"}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlPakR]");
                    $("[id*=ddlPakR]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function ListPakUnadu() {

            var SeasonIDYearID = document.getElementById("<%=this.hdnSeasonUnadu.ClientID %>");

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/ListPak",
                data: '{SeasonIDYearID: "' + SeasonIDYearID.value + '"}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlPakU]");
                    $("[id*=ddlPakU]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }



        function ListPakKharif() {

            var SeasonIDYearID = document.getElementById("<%=this.hdnSeasonKharif.ClientID %>");

             $.ajax({
                 type: "POST",
                 url: "MangnaPatrak.aspx/ListPak",
                 data: '{SeasonIDYearID: "' + SeasonIDYearID.value + '"}',
                 async: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (r) {

                     var ddlCategory = $("[id*=ddlPakK]");
                     $("[id*=ddlPakK]").empty();
                     $.each(r.d, function () {
                         ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                     });
                 }
             });
             return false;
         }


         function ListPakNextYearRabi() {

             var SeasonIDYearID = document.getElementById("<%=this.hdnSeasonNextYearRabi.ClientID %>");

            $.ajax({
                type: "POST",
                url: "MangnaPatrak.aspx/ListPak",
                data: '{SeasonIDYearID: "' + SeasonIDYearID.value + '"}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlPakNYR]");
                    $("[id*=ddlPakNYR]").empty();
                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        //Start પાક Changed
        function GetPakRateAndWaterRabi() {

            var SeasonIDYearID = document.getElementById("ContentPlaceHolder1_ddlSeasonRabi");
            var ddlRabiBlockNo = document.getElementById("ContentPlaceHolder1_ddlRabiBlockNo");
            var txtPiyatAreaR = document.getElementById("ContentPlaceHolder1_txtPiyatAreaR");
            var txtBinPiyatAreaR = document.getElementById("ContentPlaceHolder1_txtBinPiyatAreaR");

            var PakR = document.getElementById("ContentPlaceHolder1_ddlPakR");
            var txtvAreaR = document.getElementById("ContentPlaceHolder1_txtvAreaR");
            var txtvRateR = document.getElementById("ContentPlaceHolder1_txtvRateR");
            var txtvWaterR = document.getElementById("ContentPlaceHolder1_txtvWaterR");
            var txtvTotalAmtR = document.getElementById("ContentPlaceHolder1_txtvTotalAmtR");

            var txtuAreaR = document.getElementById("ContentPlaceHolder1_txtuAreaR");
            var txtuRateR = document.getElementById("ContentPlaceHolder1_txtuRateR");
            var txtuWaterR = document.getElementById("ContentPlaceHolder1_txtuWaterR");
            var txtuTotalAmtR = document.getElementById("ContentPlaceHolder1_txtuTotalAmtR");

            var txtTotalPiyatAmtR = document.getElementById("ContentPlaceHolder1_txtTotalPiyatAmtR");
            var txtLocalFundR = document.getElementById("ContentPlaceHolder1_txtLocalFundR");
            var txtAmtLocalFundR = document.getElementById("ContentPlaceHolder1_txtAmtLocalFundR");
            var txtRoundOffR = document.getElementById("ContentPlaceHolder1_txtRoundOffR");
            var txtNetAmountR = document.getElementById("ContentPlaceHolder1_txtNetAmountR");

            if (SeasonIDYearID.selectedIndex == 0) {
                SeasonIDYearID.focus();
                swal("", "મૌસમ પંસદ કરો.", "warning");
                PakR.selectedIndex = 0;
                return false;
            }
            else {
                if (PakR.value == 0) {
                    txtvAreaR.value = "";
                    txtvRateR.value = "";
                    txtvWaterR.value = "";
                    txtvTotalAmtR.value = "";
                    txtuAreaR.value = "";
                    txtuRateR.value = "";
                    txtuWaterR.value = "";
                    txtuTotalAmtR.value = "";
                    txtTotalPiyatAmtR.value = "";
                    txtLocalFundR.value = "";
                    txtAmtLocalFundR.value = "";
                    txtRoundOffR.value = "";
                    txtNetAmountR.value = "";
                }
                else {

                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/GetPakRateAndWaterByPakID",
                        data: '{PakID: "' + PakR.value + '", SeasonIDYearID: "' + SeasonIDYearID.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var res = response.d;

                            $("[id*=txtvRateR]").val(res[0].Rate);
                            $("[id*=txtvWaterR]").val(res[0].TotalWater);
                            $("[id*=txtuWaterR]").val(res[0].TotalWater);
                            $("[id*=txtuRateR]").val((res[0].Rate) * 33 / 100);


                            if (parseFloat(txtPiyatAreaR.value) > parseFloat(txtvAreaR.value) || parseFloat(txtPiyatAreaR.value) == parseFloat(txtvAreaR.value)) {
                                txtuAreaR.value = (parseFloat(txtPiyatAreaR.value) - parseFloat(txtvAreaR.value)).toFixed(2);
                                txtvTotalAmtR.value = ((txtvAreaR.value * txtvRateR.value) * txtvWaterR.value).toFixed(2);
                                txtuTotalAmtR.value = ((txtuAreaR.value * txtuRateR.value) * txtuWaterR.value).toFixed(2);
                                var temp1 = parseFloat(txtvTotalAmtR.value) + parseFloat(txtuTotalAmtR.value);
                                txtTotalPiyatAmtR.value = Math.round(temp1).toFixed(2);
                                var temp = (parseFloat(txtTotalPiyatAmtR.value) + (txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                                txtAmtLocalFundR.value = temp;
                                var totalfundR = ((txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                                txtLocalFundR.value = totalfundR;
                                txtRoundOffR.value = (Math.round(temp) - temp).toFixed(2);
                                txtNetAmountR.value = Math.round(temp).toFixed(2);
                                txtuAreaR.focus();
                            }

                            txtvAreaR.focus();
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
        }
        //End પાક Changed


        // ખેડવા લાયક પિયત વિસ્તાર changed
        function KLPiyatVistarChangeRabi() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtBlockAreaR = document.getElementById("<%=this.txtBlockAreaR.ClientID %>");
            var txtKLPiyatR = document.getElementById("<%=this.txtKLPiyatR.ClientID %>");
            var txtPiyatAreaR = document.getElementById("<%=this.txtPiyatAreaR.ClientID %>");
            var txtBinPiyatAreaR = document.getElementById("<%=this.txtBinPiyatAreaR.ClientID %>");
            var ddlRabiBlockNo = document.getElementById("<%=this.ddlRabiBlockNo.ClientID %>");
            var ddlPakR = document.getElementById("<%=this.ddlPakR.ClientID %>");
            var txtvAreaR = document.getElementById("<%=this.txtvAreaR.ClientID %>");
            var txtvRateR = document.getElementById("<%=this.txtvRateR.ClientID %>");
            var txtvWaterR = document.getElementById("<%=this.txtvWaterR.ClientID %>");
            var txtuAreaR = document.getElementById("<%=this.txtuAreaR.ClientID %>");
            var txtuWaterR = document.getElementById("<%=this.txtuWaterR.ClientID %>");
            var txtvTotalAmtR = document.getElementById("<%=this.txtvTotalAmtR.ClientID %>");
            var txtuTotalAmtR = document.getElementById("<%=this.txtuTotalAmtR.ClientID %>");
            var txtuRateR = document.getElementById("<%=this.txtuRateR.ClientID %>");
            var txtTotalPiyatAmtR = document.getElementById("<%=this.txtTotalPiyatAmtR.ClientID %>");
            var txtLocalFundR = document.getElementById("<%=this.txtLocalFundR.ClientID %>");
            var txtAmtLocalFundR = document.getElementById("<%=this.txtAmtLocalFundR.ClientID %>");

            if (ddlSeasonRabi.selectedIndex == 0) {
                ddlSeasonRabi.focus();
                swal("મૌસમ પંસદ કરો.");
                txtKLPiyatR.value = "";
                return false;
            }
            else if (ddlRabiBlockNo.selectedIndex == 0) {
                ddlRabiBlockNo.focus();
                swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                txtKLPiyatR.value = "";
                return false;
            }
            else {
                if (parseFloat(txtBlockAreaR.value) > parseFloat(txtKLPiyatR.value) || parseFloat(txtKLPiyatR.value) == parseFloat(txtBlockAreaR.value)) {
                    txtPiyatAreaR.value = "";
                    ddlPakR.selectedIndex = 0;
                    txtvAreaR.value = "";
                    txtvRateR.value = "";
                    txtvWaterR.value = "";
                    txtvTotalAmtR.value = "";
                    txtuAreaR.value = "";
                    txtuRateR.value = "";
                    txtuWaterR.value = "";
                    txtuTotalAmtR.value = "";
                    txtTotalPiyatAmtR.value = "";
                    txtLocalFundR.value = "";
                    txtAmtLocalFundR.value = "";
                    txtPiyatAreaR.focus();
                }
                else {
                    txtKLPiyatR.focus();
                    swal("ખેડવા લાયક પિયત વિસ્તાર બરાબર દાખલ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                    txtKLPiyatR.value = txtPiyatAreaR.value;

                }
            }
        }

        function KLPiyatVistarChangeUnadu() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtSeasonUnadu = document.getElementById("<%=this.txtSeasonUnadu.ClientID %>");
            var txtBlockAreaU = document.getElementById("<%=this.txtBlockAreaU.ClientID %>");
            var txtKLPiyatU = document.getElementById("<%=this.txtKLPiyatU.ClientID %>");
            var txtPiyatAreaU = document.getElementById("<%=this.txtPiyatAreaU.ClientID %>");
            var txtBinPiyatAreaU = document.getElementById("<%=this.txtBinPiyatAreaU.ClientID %>");
            var ddlUnaduBlockNo = document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>");
            var ddlPakU = document.getElementById("<%=this.ddlPakU.ClientID %>");
            var txtvAreaU = document.getElementById("<%=this.txtvAreaU.ClientID %>");
            var txtvRateU = document.getElementById("<%=this.txtvRateU.ClientID %>");
            var txtvWaterU = document.getElementById("<%=this.txtvWaterU.ClientID %>");
            var txtuAreaU = document.getElementById("<%=this.txtuAreaU.ClientID %>");
            var txtuWaterU = document.getElementById("<%=this.txtuWaterU.ClientID %>");
            var txtvTotalAmtU = document.getElementById("<%=this.txtvTotalAmtU.ClientID %>");
            var txtuTotalAmtU = document.getElementById("<%=this.txtuTotalAmtU.ClientID %>");
            var txtuRateU = document.getElementById("<%=this.txtuRateU.ClientID %>");
            var txtTotalPiyatAmtU = document.getElementById("<%=this.txtTotalPiyatAmtU.ClientID %>");
            var txtLocalFundU = document.getElementById("<%=this.txtLocalFundU.ClientID %>");
            var txtAmtLocalFundU = document.getElementById("<%=this.txtAmtLocalFundU.ClientID %>");

            if (txtSeasonUnadu.value == "") {
                ddlSeasonRabi.focus();
                swal("મૌસમ પંસદ કરો.");
                txtKLPiyatU.value = "";
                return false;
            }
            else if (ddlUnaduBlockNo.selectedIndex == 0) {
                ddlUnaduBlockNo.focus();
                swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")");
                txtKLPiyatU.value = "";
                return false;
            }
            else {
                if (parseFloat(txtBlockAreaU.value) > parseFloat(txtKLPiyatU.value) || parseFloat(txtKLPiyatU.value) == parseFloat(txtBlockAreaU.value)) {
                    txtPiyatAreaU.value = "";
                    ddlPakU.selectedIndex = 0;
                    txtvAreaU.value = "";
                    txtvRateU.value = "";
                    txtvWaterU.value = "";
                    txtvTotalAmtU.value = "";
                    txtuAreaU.value = "";
                    txtuRateU.value = "";
                    txtuWaterU.value = "";
                    txtuTotalAmtU.value = "";
                    txtTotalPiyatAmtU.value = "";
                    txtLocalFundU.value = "";
                    txtAmtLocalFundU.value = "";
                    txtPiyatAreaU.focus();
                }
                else {
                    txtKLPiyatU.focus();
                    swal("ખેડવા લાયક પિયત વિસ્તાર બરાબર દાખલ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")");
                    txtKLPiyatU.value = txtPiyatAreaU.value;
                }
            }
        }

        function KLPiyatVistarChangeKharif() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtSeasonKharif = document.getElementById("<%=this.txtSeasonKharif.ClientID %>");
            var txtBlockAreaK = document.getElementById("<%=this.txtBlockAreaK.ClientID %>");
            var txtKLPiyatK = document.getElementById("<%=this.txtKLPiyatK.ClientID %>");
            var txtPiyatAreaK = document.getElementById("<%=this.txtPiyatAreaK.ClientID %>");
            var txtBinPiyatAreaK = document.getElementById("<%=this.txtBinPiyatAreaK.ClientID %>");
            var ddlKharifBlockNo = document.getElementById("<%=this.ddlKharifBlockNo.ClientID %>");
            var ddlPakK = document.getElementById("<%=this.ddlPakK.ClientID %>");
            var txtvAreaK = document.getElementById("<%=this.txtvAreaK.ClientID %>");
            var txtvRateK = document.getElementById("<%=this.txtvRateK.ClientID %>");
            var txtvWaterK = document.getElementById("<%=this.txtvWaterK.ClientID %>");
            var txtuAreaK = document.getElementById("<%=this.txtuAreaK.ClientID %>");
            var txtuWaterK = document.getElementById("<%=this.txtuWaterK.ClientID %>");
            var txtvTotalAmtK = document.getElementById("<%=this.txtvTotalAmtK.ClientID %>");
            var txtuTotalAmtK = document.getElementById("<%=this.txtuTotalAmtK.ClientID %>");
            var txtuRateK = document.getElementById("<%=this.txtuRateK.ClientID %>");
            var txtTotalPiyatAmtK = document.getElementById("<%=this.txtTotalPiyatAmtK.ClientID %>");
            var txtLocalFundK = document.getElementById("<%=this.txtLocalFundK.ClientID %>");
            var txtAmtLocalFundK = document.getElementById("<%=this.txtAmtLocalFundK.ClientID %>");

            if (txtSeasonKharif.value == "") {
                ddlSeasonRabi.focus();
                swal("મૌસમ પંસદ કરો.");
                txtKLPiyatK.value = "";
                return false;
            }
            else if (ddlKharifBlockNo.selectedIndex == 0) {
                ddlKharifBlockNo.focus();
                swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                txtKLPiyatK.value = "";
                return false;
            }
            else {
                if (parseFloat(txtBlockAreaK.value) > parseFloat(txtKLPiyatK.value) || parseFloat(txtKLPiyatK.value) == parseFloat(txtBlockAreaK.value)) {
                    txtPiyatAreaK.value = "";
                    ddlPakK.selectedIndex = 0;
                    txtvAreaK.value = "";
                    txtvRateK.value = "";
                    txtvWaterK.value = "";
                    txtvTotalAmtK.value = "";
                    txtuAreaK.value = "";
                    txtuRateK.value = "";
                    txtuWaterK.value = "";
                    txtuTotalAmtK.value = "";
                    txtTotalPiyatAmtK.value = "";
                    txtLocalFundK.value = "";
                    txtAmtLocalFundK.value = "";
                    txtPiyatAreaK.focus();
                }
                else {
                    txtKLPiyatK.focus();
                    swal("ખેડવા લાયક પિયત વિસ્તાર બરાબર દાખલ કરો.\n (મૌસમ: " + txtSeasonKharif.value + ")");
                    txtKLPiyatK.value = txtPiyatAreaK.value;
                }
            }
        }

        function KLPiyatVistarChangeNextYearRabi() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtSeasonNextYearRabi = document.getElementById("<%=this.txtSeasonNextYearRabi.ClientID %>");
            var txtBlockAreaNYR = document.getElementById("<%=this.txtBlockAreaNYR.ClientID %>");
            var txtKLPiyatNYR = document.getElementById("<%=this.txtKLPiyatNYR.ClientID %>");
            var txtPiyatAreaNYR = document.getElementById("<%=this.txtPiyatAreaNYR.ClientID %>");
            var txtBinPiyatAreaNYR = document.getElementById("<%=this.txtBinPiyatAreaNYR.ClientID %>");
            var ddlNextYearRabiBlockNo = document.getElementById("<%=this.ddlNextYearRabiBlockNo.ClientID %>");
            var ddlPakNYR = document.getElementById("<%=this.ddlPakNYR.ClientID %>");
            var txtvAreaNYR = document.getElementById("<%=this.txtvAreaNYR.ClientID %>");
            var txtvRateNYR = document.getElementById("<%=this.txtvRateNYR.ClientID %>");
            var txtvWaterNYR = document.getElementById("<%=this.txtvWaterNYR.ClientID %>");
            var txtuAreaNYR = document.getElementById("<%=this.txtuAreaNYR.ClientID %>");
            var txtuWaterNYR = document.getElementById("<%=this.txtuWaterNYR.ClientID %>");
            var txtvTotalAmtNYR = document.getElementById("<%=this.txtvTotalAmtNYR.ClientID %>");
            var txtuTotalAmtNYR = document.getElementById("<%=this.txtuTotalAmtNYR.ClientID %>");
            var txtuRateNYR = document.getElementById("<%=this.txtuRateNYR.ClientID %>");
            var txtTotalPiyatAmtNYR = document.getElementById("<%=this.txtTotalPiyatAmtNYR.ClientID %>");
            var txtLocalFundNYR = document.getElementById("<%=this.txtLocalFundNYR.ClientID %>");
            var txtAmtLocalFundNYR = document.getElementById("<%=this.txtAmtLocalFundNYR.ClientID %>");

            if (txtSeasonNextYearRabi.value == "") {
                ddlSeasonRabi.focus();
                swal("મૌસમ પંસદ કરો.");
                txtKLPiyatNYR.value = "";
                return false;
            }
            else if (ddlNextYearRabiBlockNo.selectedIndex == 0) {
                ddlNextYearRabiBlockNo.focus();
                swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                txtKLPiyatNYR.value = "";
                return false;
            }
            else {
                if (parseFloat(txtBlockAreaNYR.value) > parseFloat(txtKLPiyatNYR.value) || parseFloat(txtKLPiyatNYR.value) == parseFloat(txtBlockAreaNYR.value)) {
                    txtPiyatAreaNYR.value = "";
                    ddlPakNYR.selectedIndex = 0;
                    txtvAreaNYR.value = "";
                    txtvRateNYR.value = "";
                    txtvWaterNYR.value = "";
                    txtvTotalAmtNYR.value = "";
                    txtuAreaNYR.value = "";
                    txtuRateNYR.value = "";
                    txtuWaterNYR.value = "";
                    txtuTotalAmtNYR.value = "";
                    txtTotalPiyatAmtNYR.value = "";
                    txtLocalFundNYR.value = "";
                    txtAmtLocalFundNYR.value = "";
                    txtPiyatAreaNYR.focus();
                }
                else {
                    txtKLPiyatNYR.focus();
                    swal("ખેડવા લાયક પિયત વિસ્તાર બરાબર દાખલ કરો.\n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                    txtKLPiyatNYR.value = txtPiyatAreaNYR.value;
                }
            }
        }


        // પિયત વિસ્તાર Changed
        function PiyatVistarChangeRabi() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
                var txtKLPiyatR = document.getElementById("<%=this.txtKLPiyatR.ClientID %>");
                var txtPiyatAreaR = document.getElementById("<%=this.txtPiyatAreaR.ClientID %>");
                var ddlPakR = document.getElementById("<%=this.ddlPakR.ClientID %>");
                var txtvAreaR = document.getElementById("<%=this.txtvAreaR.ClientID %>");
                var txtvRateR = document.getElementById("<%=this.txtvRateR.ClientID %>");
                var txtvWaterR = document.getElementById("<%=this.txtvWaterR.ClientID %>");
                var txtuAreaR = document.getElementById("<%=this.txtuAreaR.ClientID %>");
                var txtuWaterR = document.getElementById("<%=this.txtuWaterR.ClientID %>");
                var txtBinPiyatAreaR = document.getElementById("<%=this.txtBinPiyatAreaR.ClientID %>");
                var ddlRabiBlockNo = document.getElementById("<%=this.ddlRabiBlockNo.ClientID %>");
                var txtvTotalAmtR = document.getElementById("<%=this.txtvTotalAmtR.ClientID %>");
                var txtuTotalAmtR = document.getElementById("<%=this.txtuTotalAmtR.ClientID %>");
                var txtuRateR = document.getElementById("<%=this.txtuRateR.ClientID %>");
                var txtTotalPiyatAmtR = document.getElementById("<%=this.txtTotalPiyatAmtR.ClientID %>");
                var txtLocalFundR = document.getElementById("<%=this.txtLocalFundR.ClientID %>");
                var txtAmtLocalFundR = document.getElementById("<%=this.txtAmtLocalFundR.ClientID %>");

                if (ddlSeasonRabi.selectedIndex == 0) {
                    ddlSeasonRabi.focus();
                    swal("મૌસમ પંસદ કરો.");
                    txtPiyatAreaR.value = "";
                    return false;
                }
                else if (ddlRabiBlockNo.selectedIndex == 0) {
                    ddlRabiBlockNo.focus();
                    swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                    txtPiyatAreaR.value = "";
                    return false;
                }
                else {
                    //if (parseFloat(txtKLPiyatR.value) > parseFloat(txtPiyatAreaR.value) || parseFloat(txtKLPiyatR.value) == parseFloat(txtPiyatAreaR.value))
                    //{
                        txtBinPiyatAreaR.value = (parseFloat(txtKLPiyatR.value) - parseFloat(txtPiyatAreaR.value)).toFixed(2);
                        ddlPakR.selectedIndex = 0;
                        txtvAreaR.value = "";
                        txtvRateR.value = "";
                        txtvWaterR.value = "";
                        txtvTotalAmtR.value = "";
                        txtuAreaR.value = "";
                        txtuRateR.value = "";
                        txtuWaterR.value = "";
                        txtuTotalAmtR.value = "";
                        txtTotalPiyatAmtR.value = "";
                        txtLocalFundR.value = "";
                        txtAmtLocalFundR.value = "";
                        ddlPakR.focus();
                    //}
                    //else {
                    //    txtPiyatAreaR.focus();
                    //    swal("પિયત વિસ્તાર બરાબર દાખલ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                    //    txtPiyatAreaR.value = txtKLPiyatR.value;
                    //}
                }
            }

            function PiyatVistarChangeUnadu() {
                var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
                var txtSeasonUnadu = document.getElementById("<%=this.txtSeasonUnadu.ClientID %>");
                var txtKLPiyatU = document.getElementById("<%=this.txtKLPiyatU.ClientID %>");
                var txtPiyatAreaU = document.getElementById("<%=this.txtPiyatAreaU.ClientID %>");
                var ddlPakU = document.getElementById("<%=this.ddlPakU.ClientID %>");
                var txtvAreaU = document.getElementById("<%=this.txtvAreaU.ClientID %>");
                var txtvRateU = document.getElementById("<%=this.txtvRateU.ClientID %>");
                var txtvWaterU = document.getElementById("<%=this.txtvWaterU.ClientID %>");
                var txtuAreaU = document.getElementById("<%=this.txtuAreaU.ClientID %>");
                var txtuWaterU = document.getElementById("<%=this.txtuWaterU.ClientID %>");
                var txtBinPiyatAreaU = document.getElementById("<%=this.txtBinPiyatAreaU.ClientID %>");
                var ddlUnaduBlockNo = document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>");
                var txtvTotalAmtU = document.getElementById("<%=this.txtvTotalAmtU.ClientID %>");
                var txtuTotalAmtU = document.getElementById("<%=this.txtuTotalAmtU.ClientID %>");
                var txtuRateU = document.getElementById("<%=this.txtuRateU.ClientID %>");
                var txtTotalPiyatAmtU = document.getElementById("<%=this.txtTotalPiyatAmtU.ClientID %>");
                var txtLocalFundU = document.getElementById("<%=this.txtLocalFundU.ClientID %>");
                var txtAmtLocalFundU = document.getElementById("<%=this.txtAmtLocalFundU.ClientID %>");

                if (txtSeasonUnadu.value == "") {
                    ddlSeasonRabi.focus();
                    swal("મૌસમ પંસદ કરો.");
                    txtPiyatAreaU.value = "";
                    return false;
                }
                else if (ddlUnaduBlockNo.selectedIndex == 0) {
                    ddlUnaduBlockNo.focus();
                    swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")");
                    txtPiyatAreaU.value = "";
                    return false;
                }
                else {
                    if (parseFloat(txtKLPiyatU.value) > parseFloat(txtPiyatAreaU.value) || parseFloat(txtKLPiyatU.value) == parseFloat(txtPiyatAreaU.value)) {
                        txtBinPiyatAreaU.value = (parseFloat(txtKLPiyatU.value) - parseFloat(txtPiyatAreaU.value)).toFixed(2);
                        ddlPakU.selectedIndex = 0;
                        txtvAreaU.value = "";
                        txtvRateU.value = "";
                        txtvWaterU.value = "";
                        txtvTotalAmtU.value = "";
                        txtuAreaU.value = "";
                        txtuRateU.value = "";
                        txtuWaterU.value = "";
                        txtuTotalAmtU.value = "";
                        txtTotalPiyatAmtU.value = "";
                        txtLocalFundU.value = "";
                        txtAmtLocalFundU.value = "";
                        ddlPakU.focus();
                    }
                    else {
                        txtPiyatAreaU.focus();
                        swal("પિયત વિસ્તાર બરાબર દાખલ કરો.\n (મૌસમ: " + txtSeasonUnadu.value + ")");
                        txtPiyatAreaU.value = txtKLPiyatU.value;

                    }
                }
            }

            function PiyatVistarChangeKharif() {
                var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
                var txtSeasonKharif = document.getElementById("<%=this.txtSeasonKharif.ClientID %>");
                var txtKLPiyatK = document.getElementById("<%=this.txtKLPiyatK.ClientID %>");
                var txtPiyatAreaK = document.getElementById("<%=this.txtPiyatAreaK.ClientID %>");
                var ddlPakK = document.getElementById("<%=this.ddlPakK.ClientID %>");
                var txtvAreaK = document.getElementById("<%=this.txtvAreaK.ClientID %>");
                var txtvRateK = document.getElementById("<%=this.txtvRateK.ClientID %>");
                var txtvWaterK = document.getElementById("<%=this.txtvWaterK.ClientID %>");
                var txtuAreaK = document.getElementById("<%=this.txtuAreaK.ClientID %>");
                var txtuWaterK = document.getElementById("<%=this.txtuWaterK.ClientID %>");
                var txtBinPiyatAreaK = document.getElementById("<%=this.txtBinPiyatAreaK.ClientID %>");
                var ddlKharifBlockNo = document.getElementById("<%=this.ddlKharifBlockNo.ClientID %>");
                var txtvTotalAmtK = document.getElementById("<%=this.txtvTotalAmtK.ClientID %>");
                var txtuTotalAmtK = document.getElementById("<%=this.txtuTotalAmtK.ClientID %>");
                var txtuRateK = document.getElementById("<%=this.txtuRateK.ClientID %>");
                var txtTotalPiyatAmtK = document.getElementById("<%=this.txtTotalPiyatAmtK.ClientID %>");
                var txtLocalFundK = document.getElementById("<%=this.txtLocalFundK.ClientID %>");
                var txtAmtLocalFundK = document.getElementById("<%=this.txtAmtLocalFundK.ClientID %>");

                if (txtSeasonKharif.value == "") {
                    ddlSeasonRabi.focus();
                    swal("મૌસમ પંસદ કરો.");
                    txtPiyatAreaK.value = "";
                    return false;
                }
                else if (ddlKharifBlockNo.selectedIndex == 0) {
                    ddlKharifBlockNo.focus();
                    swal("બ્લોક નંબર પંસદ કરો.\n (મૌસમ: " + txtSeasonKharif.value + ")");
                    txtPiyatAreaK.value = "";
                    return false;
                }
                else {
                    if (parseFloat(txtKLPiyatK.value) > parseFloat(txtPiyatAreaK.value) || parseFloat(txtKLPiyatK.value) == parseFloat(txtPiyatAreaK.value)) {
                        txtBinPiyatAreaK.value = (parseFloat(txtKLPiyatK.value) - parseFloat(txtPiyatAreaK.value)).toFixed(2);
                        ddlPakK.selectedIndex = 0;
                        txtvAreaK.value = "";
                        txtvRateK.value = "";
                        txtvWaterK.value = "";
                        txtvTotalAmtK.value = "";
                        txtuAreaK.value = "";
                        txtuRateK.value = "";
                        txtuWaterK.value = "";
                        txtuTotalAmtK.value = "";
                        txtTotalPiyatAmtK.value = "";
                        txtLocalFundK.value = "";
                        txtAmtLocalFundK.value = "";
                        ddlPakK.focus();
                    }
                    else {
                        txtPiyatAreaK.focus();
                        swal("પિયત વિસ્તાર બરાબર દાખલ કરો.\n (મૌસમ: " + txtSeasonKharif.value + ")");
                        txtPiyatAreaK.value = txtKLPiyatK.value;
                    }
                }
            }

            function PiyatVistarChangeRabiNextYear() {
                var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtSeasonNextYearRabi = document.getElementById("<%=this.txtSeasonNextYearRabi.ClientID %>");
            var txtKLPiyatNYR = document.getElementById("<%=this.txtKLPiyatNYR.ClientID %>");
            var txtPiyatAreaNYR = document.getElementById("<%=this.txtPiyatAreaNYR.ClientID %>");
            var ddlPakNYR = document.getElementById("<%=this.ddlPakNYR.ClientID %>");
            var txtvAreaNYR = document.getElementById("<%=this.txtvAreaNYR.ClientID %>");
            var txtvRateNYR = document.getElementById("<%=this.txtvRateNYR.ClientID %>");
            var txtvWaterNYR = document.getElementById("<%=this.txtvWaterNYR.ClientID %>");
            var txtuAreaNYR = document.getElementById("<%=this.txtuAreaNYR.ClientID %>");
            var txtuWaterNYR = document.getElementById("<%=this.txtuWaterNYR.ClientID %>");
            var txtBinPiyatAreaNYR = document.getElementById("<%=this.txtBinPiyatAreaNYR.ClientID %>");
            var ddlNextYearRabiBlockNo = document.getElementById("<%=this.ddlNextYearRabiBlockNo.ClientID %>");
            var txtvTotalAmtNYR = document.getElementById("<%=this.txtvTotalAmtNYR.ClientID %>");
            var txtuTotalAmtNYR = document.getElementById("<%=this.txtuTotalAmtNYR.ClientID %>");
            var txtuRateNYR = document.getElementById("<%=this.txtuRateNYR.ClientID %>");
            var txtTotalPiyatAmtNYR = document.getElementById("<%=this.txtTotalPiyatAmtNYR.ClientID %>");
            var txtLocalFundNYR = document.getElementById("<%=this.txtLocalFundNYR.ClientID %>");
            var txtAmtLocalFundNYR = document.getElementById("<%=this.txtAmtLocalFundNYR.ClientID %>");

            if (txtSeasonNextYearRabi.value == "") {
                swal("મૌસમ પંસદ કરો.");
                txtPiyatAreaNYR.value = "";
                ddlSeasonRabi.focus();
                return false;
            }
            else if (ddlNextYearRabiBlockNo.selectedIndex == 0) {
                ddlNextYearRabiBlockNo.focus();
                swal("બ્લોક નંબર પંસદ કરો.\n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                txtPiyatAreaNYR.value = "";
                return false;
            }
            else {
                if (parseFloat(txtKLPiyatNYR.value) > parseFloat(txtPiyatAreaNYR.value) || parseFloat(txtKLPiyatNYR.value) == parseFloat(txtPiyatAreaNYR.value)) {
                    txtBinPiyatAreaNYR.value = (parseFloat(txtKLPiyatNYR.value) - parseFloat(txtPiyatAreaNYR.value)).toFixed(2);
                    ddlPakNYR.selectedIndex = 0;
                    txtvAreaNYR.value = "";
                    txtvRateNYR.value = "";
                    txtvWaterNYR.value = "";
                    txtvTotalAmtNYR.value = "";
                    txtuAreaNYR.value = "";
                    txtuRateNYR.value = "";
                    txtuWaterNYR.value = "";
                    txtuTotalAmtNYR.value = "";
                    txtTotalPiyatAmtNYR.value = "";
                    txtLocalFundNYR.value = "";
                    txtAmtLocalFundNYR.value = "";
                    ddlPakNYR.focus();
                }
                else {
                    txtPiyatAreaNYR.focus();
                    swal("પિયત વિસ્તાર બરાબર દાખલ કરો.\n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                    txtPiyatAreaNYR.value = txtKLPiyatNYR.value;
                }
            }
        }


        // પાક Changed
        function GetPakRateAndWaterRabi() {

            var PakR = document.getElementById("<%=this.ddlPakR.ClientID %>");
                var txtKLPiyatR = document.getElementById("<%=this.txtKLPiyatR.ClientID %>");
                var txtPiyatAreaR = document.getElementById("<%=this.txtPiyatAreaR.ClientID %>");
                var txtvAreaR = document.getElementById("<%=this.txtvAreaR.ClientID %>");
                var txtvRateR = document.getElementById("<%=this.txtvRateR.ClientID %>");
                var txtvWaterR = document.getElementById("<%=this.txtvWaterR.ClientID %>");
                var txtuAreaR = document.getElementById("<%=this.txtuAreaR.ClientID %>");
                var txtuWaterR = document.getElementById("<%=this.txtuWaterR.ClientID %>");
                var txtBinPiyatAreaR = document.getElementById("<%=this.txtBinPiyatAreaR.ClientID %>");
                var ddlRabiBlockNo = document.getElementById("<%=this.ddlRabiBlockNo.ClientID %>");
                var txtvTotalAmtR = document.getElementById("<%=this.txtvTotalAmtR.ClientID %>");
                var txtuTotalAmtR = document.getElementById("<%=this.txtuTotalAmtR.ClientID %>");
                var txtuRateR = document.getElementById("<%=this.txtuRateR.ClientID %>");
                var txtTotalPiyatAmtR = document.getElementById("<%=this.txtTotalPiyatAmtR.ClientID %>");
                var txtLocalFundR = document.getElementById("<%=this.txtLocalFundR.ClientID %>");
                var txtAmtLocalFundR = document.getElementById("<%=this.txtAmtLocalFundR.ClientID %>");
                var txtRoundOffR = document.getElementById("<%=this.txtRoundOffR.ClientID %>");
                var txtNetAmountR = document.getElementById("<%=this.txtNetAmountR.ClientID %>");

                var SeasonIDYearIDR = document.getElementById('<%= this.ddlSeasonRabi.ClientID %>');

                if (SeasonIDYearIDR.selectedIndex == 0) {
                    SeasonIDYearIDR.focus();
                    swal("મૌસમ પંસદ કરો.");
                    PakR.selectedIndex = 0;
                    return false;
                }
                else {
                    if (PakR.value == 0) {
                        txtvAreaR.value = "";
                        txtvRateR.value = "";
                        txtvWaterR.value = "";
                        txtvTotalAmtR.value = "";
                        txtuAreaR.value = "";
                        txtuRateR.value = "";
                        txtuWaterR.value = "";
                        txtuTotalAmtR.value = "";
                        txtTotalPiyatAmtR.value = "";
                        txtLocalFundR.value = "";
                        txtAmtLocalFundR.value = "";
                        txtRoundOffR.value = "";
                        txtNetAmountR.value = "";
                    }
                    else {
                        $("[id*=hdnddlPakR]").val(PakR.value);

                        $.ajax({
                            type: "POST",
                            url: "MangnaPatrak.aspx/GetPakRateAndWaterByPakID",
                            data: '{PakID: "' + PakR.value + '", SeasonIDYearID: "' + SeasonIDYearIDR.value + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var res = response.d;

                                $("[id*=txtvRateR]").val(res[0].Rate);
                                $("[id*=txtvWaterR]").val(res[0].TotalWater);
                                $("[id*=txtuWaterR]").val(res[0].TotalWater);
                                $("[id*=txtuRateR]").val((res[0].Rate) * 33 / 100);
                                $("[id*=hdnGovtRateRabi]").val(res[0].GovtRate);

                                if (parseFloat(txtPiyatAreaR.value) > parseFloat(txtvAreaR.value) || parseFloat(txtPiyatAreaR.value) == parseFloat(txtvAreaR.value)) {
                                    txtuAreaR.value = (parseFloat(txtPiyatAreaR.value) - parseFloat(txtvAreaR.value)).toFixed(2);
                                    txtvTotalAmtR.value = ((txtvAreaR.value * txtvRateR.value) * txtvWaterR.value).toFixed(2);
                                    txtuTotalAmtR.value = ((txtuAreaR.value * txtuRateR.value) * txtuWaterR.value).toFixed(2);
                                    var temp1 = parseFloat(txtvTotalAmtR.value) + parseFloat(txtuTotalAmtR.value);
                                    txtTotalPiyatAmtR.value = Math.round(temp1).toFixed(2);
                                    var temp = (parseFloat(txtTotalPiyatAmtR.value) + (txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                                    txtAmtLocalFundR.value = temp;
                                    var totalfundR = ((txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                                    txtLocalFundR.value = totalfundR;
                                    txtRoundOffR.value = (Math.round(temp) - temp).toFixed(2);
                                    txtNetAmountR.value = Math.round(temp).toFixed(2);
                                    txtuAreaR.focus();
                                }
                                txtvAreaR.focus();
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
            }

            function GetPakRateAndWaterUnadu() {

                var PakU = document.getElementById("<%=this.ddlPakU.ClientID %>");
                var txtKLPiyatU = document.getElementById("<%=this.txtKLPiyatU.ClientID %>");
                var txtPiyatAreaU = document.getElementById("<%=this.txtPiyatAreaU.ClientID %>");
                var txtvAreaU = document.getElementById("<%=this.txtvAreaU.ClientID %>");
                var txtvRateU = document.getElementById("<%=this.txtvRateU.ClientID %>");
                var txtvWaterU = document.getElementById("<%=this.txtvWaterU.ClientID %>");
                var txtuAreaU = document.getElementById("<%=this.txtuAreaU.ClientID %>");
                var txtuWaterU = document.getElementById("<%=this.txtuWaterU.ClientID %>");
                var txtBinPiyatAreaU = document.getElementById("<%=this.txtBinPiyatAreaU.ClientID %>");
                var ddlUnaduBlockNo = document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>");
                var txtvTotalAmtU = document.getElementById("<%=this.txtvTotalAmtU.ClientID %>");
                var txtuTotalAmtU = document.getElementById("<%=this.txtuTotalAmtU.ClientID %>");
                var txtuRateU = document.getElementById("<%=this.txtuRateU.ClientID %>");
                var txtTotalPiyatAmtU = document.getElementById("<%=this.txtTotalPiyatAmtU.ClientID %>");
                var txtLocalFundU = document.getElementById("<%=this.txtLocalFundU.ClientID %>");
                var txtAmtLocalFundU = document.getElementById("<%=this.txtAmtLocalFundU.ClientID %>");
                var txtRoundOffU = document.getElementById("<%=this.txtRoundOffU.ClientID %>");
                var txtNetAmountU = document.getElementById("<%=this.txtNetAmountU.ClientID %>");
                //var SeasonIDYearIDU = document.getElementById("<%=this.txtSeasonUnadu.ClientID %>");
                var SeasonIDYearIDU = document.getElementById("<%=this.hdnSeasonUnadu.ClientID %>");

                if (SeasonIDYearIDU.value == "") {
                    swal("મૌસમ પંસદ કરો.");
                    PakU.selectedIndex = 0;
                    return false;
                }
                else {
                    if (PakU.value == 0) {
                        txtvAreaU.value = "";
                        txtvRateU.value = "";
                        txtvWaterU.value = "";
                        txtvTotalAmtU.value = "";
                        txtuAreaU.value = "";
                        txtuRateU.value = "";
                        txtuWaterU.value = "";
                        txtuTotalAmtU.value = "";
                        txtTotalPiyatAmtU.value = "";
                        txtLocalFundU.value = "";
                        txtAmtLocalFundU.value = "";
                        txtRoundOffU.value = "";
                        txtNetAmountU.value = "";
                    }
                    else {
                        $("[id*=hdnddlPakU]").val(PakU.value);

                        $.ajax({
                            type: "POST",
                            url: "MangnaPatrak.aspx/GetPakRateAndWaterByPakID",
                            data: '{PakID: "' + PakU.value + '", SeasonIDYearID: "' + SeasonIDYearIDU.value + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var res = response.d;

                                $("[id*=txtvRateU]").val(res[0].Rate);
                                $("[id*=txtvWaterU]").val(res[0].TotalWater);
                                $("[id*=txtuWaterU]").val(res[0].TotalWater);

                                $("[id*=txtuRateU]").val((res[0].Rate) * 33 / 100);

                                $("[id*=hdnGovtRateUnadu]").val(res[0].GovtRate);

                                if (parseFloat(txtPiyatAreaU.value) > parseFloat(txtvAreaU.value) || parseFloat(txtPiyatAreaU.value) == parseFloat(txtvAreaU.value)) {
                                    txtuAreaU.value = (parseFloat(txtPiyatAreaU.value) - parseFloat(txtvAreaU.value)).toFixed(2);
                                    txtvTotalAmtU.value = ((txtvAreaU.value * txtvRateU.value) * txtvWaterU.value).toFixed(2);
                                    txtuTotalAmtU.value = ((txtuAreaU.value * txtuRateU.value) * txtuWaterU.value).toFixed(2);
                                    var temp1 = parseFloat(txtvTotalAmtU.value) + parseFloat(txtuTotalAmtU.value);
                                    txtTotalPiyatAmtU.value = Math.round(temp1).toFixed(2);
                                    var temp = (parseFloat(txtTotalPiyatAmtU.value) + (txtTotalPiyatAmtU.value * 20) / 100).toFixed(2);
                                    txtAmtLocalFundU.value = temp;
                                    var totalfundU = ((txtTotalPiyatAmtU.value * 20) / 100).toFixed(2);
                                    txtLocalFundU.value = totalfundU;
                                    txtRoundOffU.value = (Math.round(temp) - temp).toFixed(2);
                                    txtNetAmountU.value = Math.round(temp).toFixed(2);
                                    txtuAreaU.focus();
                                }

                                txtvAreaU.focus();
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
            }


            function GetPakRateAndWaterKharif() {

                var PakK = document.getElementById("<%=this.ddlPakK.ClientID %>");
                var txtKLPiyatK = document.getElementById("<%=this.txtKLPiyatK.ClientID %>");
                var txtPiyatAreaK = document.getElementById("<%=this.txtPiyatAreaK.ClientID %>");
                var txtvAreaK = document.getElementById("<%=this.txtvAreaK.ClientID %>");
                var txtvRateK = document.getElementById("<%=this.txtvRateK.ClientID %>");
                var txtvWaterK = document.getElementById("<%=this.txtvWaterK.ClientID %>");
                var txtuAreaK = document.getElementById("<%=this.txtuAreaK.ClientID %>");
                var txtuWaterK = document.getElementById("<%=this.txtuWaterK.ClientID %>");
                var txtBinPiyatAreaK = document.getElementById("<%=this.txtBinPiyatAreaK.ClientID %>");
                var txtvTotalAmtK = document.getElementById("<%=this.txtvTotalAmtK.ClientID %>");
                var txtuTotalAmtK = document.getElementById("<%=this.txtuTotalAmtK.ClientID %>");
                var txtuRateK = document.getElementById("<%=this.txtuRateK.ClientID %>");
                var txtTotalPiyatAmtK = document.getElementById("<%=this.txtTotalPiyatAmtK.ClientID %>");
                var txtLocalFundK = document.getElementById("<%=this.txtLocalFundK.ClientID %>");
                var txtAmtLocalFundK = document.getElementById("<%=this.txtAmtLocalFundK.ClientID %>");
                var txtRoundOffK = document.getElementById("<%=this.txtRoundOffK.ClientID %>");
                var txtNetAmountK = document.getElementById("<%=this.txtNetAmountK.ClientID %>");
                //var SeasonIDYearIDK = document.getElementById("<%=this.txtSeasonKharif.ClientID %>");
                var SeasonIDYearIDK = document.getElementById("<%=this.hdnSeasonKharif.ClientID %>");
                if (SeasonIDYearIDK.value == "") {
                    swal("મૌસમ પંસદ કરો.");
                    PakK.selectedIndex = 0;
                    return false;
                }
                else {
                    if (PakK.value == 0) {
                        txtvAreaK.value = "";
                        txtvRateK.value = "";
                        txtvWaterK.value = "";
                        txtvTotalAmtK.value = "";
                        txtuAreaK.value = "";
                        txtuRateK.value = "";
                        txtuWaterK.value = "";
                        txtuTotalAmtK.value = "";
                        txtTotalPiyatAmtK.value = "";
                        txtLocalFundK.value = "";
                        txtAmtLocalFundK.value = "";
                        txtRoundOffK.value = "";
                        txtNetAmountK.value = "";
                        txtRoundOffK.value = "";
                        txtNetAmountK.value = "";
                    }
                    else {
                        $("[id*=hdnddlPakK]").val(PakK.value);

                        $.ajax({
                            type: "POST",
                            url: "MangnaPatrak.aspx/GetPakRateAndWaterByPakID",
                            data: '{PakID: "' + PakK.value + '", SeasonIDYearID: "' + SeasonIDYearIDK.value + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var res = response.d;

                                $("[id*=txtvRateK]").val(res[0].Rate);
                                $("[id*=txtvWaterK]").val(res[0].TotalWater);
                                $("[id*=txtuWaterK]").val(res[0].TotalWater);

                                $("[id*=txtuRateK]").val((res[0].Rate) * 33 / 100);

                                $("[id*=hdnGovtRateKharif]").val(res[0].GovtRate);

                                if (parseFloat(txtPiyatAreaK.value) > parseFloat(txtvAreaK.value) || parseFloat(txtPiyatAreaK.value) == parseFloat(txtvAreaK.value)) {
                                    txtuAreaK.value = (parseFloat(txtPiyatAreaK.value) - parseFloat(txtvAreaK.value)).toFixed(2);
                                    txtvTotalAmtK.value = ((txtvAreaK.value * txtvRateK.value) * txtvWaterK.value).toFixed(2);
                                    txtuTotalAmtK.value = ((txtuAreaK.value * txtuRateK.value) * txtuWaterK.value).toFixed(2);
                                    var temp1 = parseFloat(txtvTotalAmtK.value) + parseFloat(txtuTotalAmtK.value);
                                    txtTotalPiyatAmtK.value = Math.round(temp1).toFixed(2);
                                    var temp = (parseFloat(txtTotalPiyatAmtK.value) + (txtTotalPiyatAmtK.value * 20) / 100).toFixed(2);
                                    txtAmtLocalFundK.value = temp;
                                    var totalfundK = ((txtTotalPiyatAmtK.value * 20) / 100).toFixed(2);
                                    txtLocalFundK.value = totalfundK;
                                    txtRoundOffK.value = (Math.round(temp) - temp).toFixed(2);
                                    txtNetAmountK.value = Math.round(temp).toFixed(2);
                                    txtuAreaK.focus();
                                }

                                txtvAreaK.focus();
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
            }

            function GetPakRateAndWaterNextYearRabi() {
                var PakNYR = document.getElementById("<%=this.ddlPakNYR.ClientID %>");
            var txtKLPiyatNYR = document.getElementById("<%=this.txtKLPiyatNYR.ClientID %>");
            var txtPiyatAreaNYR = document.getElementById("<%=this.txtPiyatAreaNYR.ClientID %>");
            var txtvAreaNYR = document.getElementById("<%=this.txtvAreaNYR.ClientID %>");
            var txtvRateNYR = document.getElementById("<%=this.txtvRateNYR.ClientID %>");
            var txtvWaterNYR = document.getElementById("<%=this.txtvWaterNYR.ClientID %>");
            var txtuAreaNYR = document.getElementById("<%=this.txtuAreaNYR.ClientID %>");
            var txtuWaterNYR = document.getElementById("<%=this.txtuWaterNYR.ClientID %>");
            var txtBinPiyatAreaNYR = document.getElementById("<%=this.txtBinPiyatAreaNYR.ClientID %>");
            var txtvTotalAmtNYR = document.getElementById("<%=this.txtvTotalAmtNYR.ClientID %>");
            var txtuTotalAmtNYR = document.getElementById("<%=this.txtuTotalAmtNYR.ClientID %>");
            var txtuRateNYR = document.getElementById("<%=this.txtuRateNYR.ClientID %>");
            var txtTotalPiyatAmtNYR = document.getElementById("<%=txtTotalPiyatAmtNYR.ClientID %>");
            var txtLocalFundNYR = document.getElementById("<%=this.txtLocalFundNYR.ClientID %>");
            var txtAmtLocalFundNYR = document.getElementById("<%=this.txtAmtLocalFundNYR.ClientID %>");
            var txtRoundOffNYR = document.getElementById("<%=this.txtRoundOffNYR.ClientID %>");
            var txtNetAmountNYR = document.getElementById("<%=this.txtNetAmountNYR.ClientID %>");

            //var SeasonIDYearIDNYR = document.getElementById("<%=this.txtSeasonNextYearRabi.ClientID %>");
            var SeasonIDYearIDNYR = document.getElementById("<%=this.hdnSeasonNextYearRabi.ClientID %>");

            if (SeasonIDYearIDNYR.value == "") {
                swal("મૌસમ પંસદ કરો.");
                PakNYR.selectedIndex = 0;
                return false;
            }
            else {
                if (PakNYR.value == 0) {
                    txtvAreaNYR.value = "";
                    txtvRateNYR.value = "";
                    txtvWaterNYR.value = "";
                    txtvTotalAmtNYR.value = "";
                    txtuAreaNYR.value = "";
                    txtuRateNYR.value = "";
                    txtuWaterNYR.value = "";
                    txtuTotalAmtNYR.value = "";
                    txtTotalPiyatAmtNYR.value = "";
                    txtLocalFundNYR.value = "";
                    txtAmtLocalFundNYR.value = "";
                    txtRoundOffNYR.value = "";
                    txtNetAmountNYR.value = "";
                }
                else {
                    $("[id*=hdnddlPakNYR]").val(PakNYR.value);
                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/GetPakRateAndWaterByPakID",

                        data: '{PakID: "' + PakNYR.value + '", SeasonIDYearID: "' + SeasonIDYearIDNYR.value + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var res = response.d;

                            $("[id*=txtvRateNYR]").val(res[0].Rate);
                            $("[id*=txtvWaterNYR]").val(res[0].TotalWater);
                            $("[id*=txtuWaterNYR]").val(res[0].TotalWater);
                            $("[id*=txtuRateNYR]").val((res[0].Rate) * 33 / 100);

                            $("[id*=hdnGovtRateNextYearRabi]").val(res[0].GovtRate);

                            if (parseFloat(txtPiyatAreaNYR.value) > parseFloat(txtvAreaNYR.value) || parseFloat(txtPiyatAreaNYR.value) == parseFloat(txtvAreaNYR.value)) {
                                txtuAreaNYR.value = (parseFloat(txtPiyatAreaNYR.value) - parseFloat(txtvAreaNYR.value)).toFixed(2);
                                txtvTotalAmtNYR.value = ((txtvAreaNYR.value * txtvRateNYR.value) * txtvWaterNYR.value).toFixed(2);
                                txtuTotalAmtNYR.value = ((txtuAreaNYR.value * txtuRateNYR.value) * txtuWaterNYR.value).toFixed(2);
                                var temp1 = parseFloat(txtvTotalAmtNYR.value) + parseFloat(txtuTotalAmtNYR.value);
                                txtTotalPiyatAmtNYR.value = Math.round(temp1).toFixed(2);
                                var temp = (parseFloat(txtTotalPiyatAmtNYR.value) + (txtTotalPiyatAmtNYR.value * 20) / 100).toFixed(2);
                                txtAmtLocalFundNYR.value = temp;
                                var totalfundNYR = ((txtTotalPiyatAmtNYR.value * 20) / 100).toFixed(2);
                                txtLocalFundNYR.value = totalfundNYR;
                                txtRoundOffNYR.value = (Math.round(temp) - temp).toFixed(2);
                                txtNetAmountNYR.value = Math.round(temp).toFixed(2);
                                txtuAreaNYR.focus();
                            }

                            txtvAreaNYR.focus();
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
        }


        // વહેતા પાણીથી / ઉદવહનથી
        function VAreaChangeRabi() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtPiyatAreaR = document.getElementById("<%=this.txtPiyatAreaR.ClientID %>");
            var txtvAreaR = document.getElementById("<%=this.txtvAreaR.ClientID %>");
            var txtvRateR = document.getElementById("<%=this.txtvRateR.ClientID %>");
            var txtvWaterR = document.getElementById("<%=this.txtvWaterR.ClientID %>");
            var txtvTotalAmtR = document.getElementById("<%=this.txtvTotalAmtR.ClientID %>");
            var txtuAreaR = document.getElementById("<%=this.txtuAreaR.ClientID %>");
            var txtuRateR = document.getElementById("<%=this.txtuRateR.ClientID %>");
            var txtuWaterR = document.getElementById("<%=this.txtuWaterR.ClientID %>");
            var txtuTotalAmtR = document.getElementById("<%=this.txtuTotalAmtR.ClientID %>");
            var txtTotalPiyatAmtR = document.getElementById("<%=this.txtTotalPiyatAmtR.ClientID %>");
            var txtLocalFundR = document.getElementById("<%=this.txtLocalFundR.ClientID %>");
            var txtAmtLocalFundR = document.getElementById("<%=this.txtAmtLocalFundR.ClientID %>");
            var ddlPakR = document.getElementById("<%=this.ddlPakR.ClientID %>");
            var txtRoundOffR = document.getElementById("<%=this.txtRoundOffR.ClientID %>");
            var txtNetAmountR = document.getElementById("<%=this.txtNetAmountR.ClientID %>");

            if (ddlPakR.selectedIndex == 0) {
                txtvAreaR.value = "";
                txtvRateR.value = "";
                txtvWaterR.value = "";
                txtvTotalAmtR.value = "";
                ddlPakR.focus();
                swal("પાક પંસદ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                return false;
            }
            else if (txtvAreaR.value == "") {
                swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                txtvWaterR.value = txtuWaterR.value;
                txtvAreaR.focus();
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaR.value) > parseFloat(txtvAreaR.value) || parseFloat(txtPiyatAreaR.value) == parseFloat(txtvAreaR.value)) {
                    txtuAreaR.value = (parseFloat(txtPiyatAreaR.value) - parseFloat(txtvAreaR.value)).toFixed(2);
                    txtvTotalAmtR.value = ((txtvAreaR.value * txtvRateR.value) * txtvWaterR.value).toFixed(2);
                    txtuTotalAmtR.value = ((txtuAreaR.value * txtuRateR.value) * txtuWaterR.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtR.value) + parseFloat(txtuTotalAmtR.value);
                    txtTotalPiyatAmtR.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtR.value) + (txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundR.value = temp;
                    var totalfundR = ((txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                    txtLocalFundR.value = totalfundR;
                    txtRoundOffR.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountR.value = Math.round(temp).toFixed(2);
                    txtuAreaR.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (વહેતા પાણીથી) બરાબર દાખલ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                    txtvAreaR.value = "";
                    txtvAreaR.focus();

                }
            }
        }

        function VAreaChangeUnadu() {
            var txtSeasonUnadu = document.getElementById("<%=this.txtSeasonUnadu.ClientID %>");
            var txtPiyatAreaU = document.getElementById("<%=this.txtPiyatAreaU.ClientID %>");
            var txtvAreaU = document.getElementById("<%=this.txtvAreaU.ClientID %>");
            var txtvRateU = document.getElementById("<%=this.txtvRateU.ClientID %>");
            var txtvWaterU = document.getElementById("<%=this.txtvWaterU.ClientID %>");
            var txtvTotalAmtU = document.getElementById("<%=this.txtvTotalAmtU.ClientID %>");
            var txtuAreaU = document.getElementById("<%=this.txtuAreaU.ClientID %>");
            var txtuRateU = document.getElementById("<%=this.txtuRateU.ClientID %>");
            var txtuWaterU = document.getElementById("<%=this.txtuWaterU.ClientID %>");
            var txtuTotalAmtU = document.getElementById("<%=this.txtuTotalAmtU.ClientID %>");
            var txtTotalPiyatAmtU = document.getElementById("<%=this.txtTotalPiyatAmtU.ClientID %>");
            var txtLocalFundU = document.getElementById("<%=this.txtLocalFundU.ClientID %>");
            var txtAmtLocalFundU = document.getElementById("<%=this.txtAmtLocalFundU.ClientID %>");
            var txtRoundOffU = document.getElementById("<%=this.txtRoundOffU.ClientID %>");
            var txtNetAmountU = document.getElementById("<%=this.txtNetAmountU.ClientID %>");
            var ddlPakU = document.getElementById("<%=this.ddlPakU.ClientID %>");
            var txtRoundOffU = document.getElementById("<%=this.txtRoundOffU.ClientID %>");
            var txtNetAmountU = document.getElementById("<%=this.txtNetAmountU.ClientID %>");

            if (ddlPakU.selectedIndex == 0) {
                txtvAreaU.value = "";
                txtvWaterU.value = "";
                swal("પાક પંસદ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                return false;
            }
            else if (txtvAreaU.value == "") {
                txtvWaterU.value = txtuWaterU.value;
                txtvAreaU.focus();
                swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaU.value) > parseFloat(txtvAreaU.value) || parseFloat(txtPiyatAreaU.value) == parseFloat(txtvAreaU.value)) {
                    txtuAreaU.value = (parseFloat(txtPiyatAreaU.value) - parseFloat(txtvAreaU.value)).toFixed(2);
                    txtvTotalAmtU.value = ((txtvAreaU.value * txtvRateU.value) * txtvWaterU.value).toFixed(2);
                    txtuTotalAmtU.value = ((txtuAreaU.value * txtuRateU.value) * txtuWaterU.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtU.value) + parseFloat(txtuTotalAmtU.value);
                    txtTotalPiyatAmtU.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtU.value) + (txtTotalPiyatAmtU.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundU.value = temp;
                    var totalfundU = ((txtTotalPiyatAmtU.value * 20) / 100).toFixed(2);
                    txtLocalFundU.value = totalfundU;
                    txtRoundOffU.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountU.value = Math.round(temp).toFixed(2);
                    txtuAreaU.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (વહેતા પાણીથી) બરાબર દાખલ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                    txtvAreaU.value = "";
                    txtvAreaU.focus();
                }
            }
        }

        function VAreaChangeKharif() {
            var txtSeasonKharif = document.getElementById("<%=this.txtSeasonKharif.ClientID %>");
            var txtPiyatAreaK = document.getElementById("<%=this.txtPiyatAreaK.ClientID %>");
            var txtvAreaK = document.getElementById("<%=this.txtvAreaK.ClientID %>");
            var txtvRateK = document.getElementById("<%=this.txtvRateK.ClientID %>");
            var txtvWaterK = document.getElementById("<%=this.txtvWaterK.ClientID %>");
            var txtvTotalAmtK = document.getElementById("<%=this.txtvTotalAmtK.ClientID %>");
            var txtuAreaK = document.getElementById("<%=this.txtuAreaK.ClientID %>");
            var txtuRateK = document.getElementById("<%=this.txtuRateK.ClientID %>");
            var txtuWaterK = document.getElementById("<%=this.txtuWaterK.ClientID %>");
            var txtuTotalAmtK = document.getElementById("<%=this.txtuTotalAmtK.ClientID %>");
            var txtTotalPiyatAmtK = document.getElementById("<%=this.txtTotalPiyatAmtK.ClientID %>");
            var txtLocalFundK = document.getElementById("<%=this.txtLocalFundK.ClientID %>");
            var txtAmtLocalFundK = document.getElementById("<%=this.txtAmtLocalFundK.ClientID %>");
            var ddlPakK = document.getElementById("<%=this.ddlPakK.ClientID %>");
            var txtRoundOffK = document.getElementById("<%=this.txtRoundOffK.ClientID %>");
            var txtNetAmountK = document.getElementById("<%=this.txtNetAmountK.ClientID %>");
            if (ddlPakK.selectedIndex == 0) {
                swal("પાક પંસદ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                txtvAreaK.value = "";
                txtvAreaK.focus();
                txtvWaterK.value = "";
                txtvWaterK.focus();
                return false;
            }
            else if (txtvAreaK.value == "") {
                swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                txtvWaterK.value = txtuWaterK.value;
                txtvAreaK.focus();
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaK.value) > parseFloat(txtvAreaK.value) || parseFloat(txtPiyatAreaK.value) == parseFloat(txtvAreaK.value)) {
                    txtuAreaK.value = (parseFloat(txtPiyatAreaK.value) - parseFloat(txtvAreaK.value)).toFixed(2);
                    txtvTotalAmtK.value = ((txtvAreaK.value * txtvRateK.value) * txtvWaterK.value).toFixed(2);
                    txtuTotalAmtK.value = ((txtuAreaK.value * txtuRateK.value) * txtuWaterK.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtK.value) + parseFloat(txtuTotalAmtK.value);
                    txtTotalPiyatAmtK.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtK.value) + (txtTotalPiyatAmtK.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundK.value = temp;
                    var totalfundK = ((txtTotalPiyatAmtK.value * 20) / 100).toFixed(2);
                    txtLocalFundK.value = totalfundK;
                    txtRoundOffK.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountK.value = Math.round(temp).toFixed(2);
                    txtuAreaK.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (વહેતા પાણીથી) બરાબર દાખલ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                    txtvAreaK.value = "";
                    txtvAreaK.focus();
                }
            }
        }

        function VAreaChangeNextYearRabi() {
            var txtSeasonNextYearRabi = document.getElementById("<%=this.txtSeasonNextYearRabi.ClientID %>");
            var txtPiyatAreaNYR = document.getElementById("<%=this.txtPiyatAreaNYR.ClientID %>");
            var txtvAreaNYR = document.getElementById("<%=this.txtvAreaNYR.ClientID %>");
            var txtvRateNYR = document.getElementById("<%=this.txtvRateNYR.ClientID %>");
            var txtvWaterNYR = document.getElementById("<%=this.txtvWaterNYR.ClientID %>");
            var txtvTotalAmtNYR = document.getElementById("<%=this.txtvTotalAmtNYR.ClientID %>");
            var txtuAreaNYR = document.getElementById("<%=this.txtuAreaNYR.ClientID %>");
            var txtuRateNYR = document.getElementById("<%=this.txtuRateNYR.ClientID %>");
            var txtuWaterNYR = document.getElementById("<%=this.txtuWaterNYR.ClientID %>");
            var txtuTotalAmtNYR = document.getElementById("<%=this.txtuTotalAmtNYR.ClientID %>");
            var txtTotalPiyatAmtNYR = document.getElementById("<%=this.txtTotalPiyatAmtNYR.ClientID %>");
            var txtLocalFundNYR = document.getElementById("<%=this.txtLocalFundNYR.ClientID %>");
            var txtAmtLocalFundNYR = document.getElementById("<%=this.txtAmtLocalFundNYR.ClientID %>");
            var ddlPakNYR = document.getElementById("<%=this.ddlPakNYR.ClientID %>");
            var txtRoundOffNYR = document.getElementById("<%=this.txtRoundOffNYR.ClientID %>");
            var txtNetAmountNYR = document.getElementById("<%=this.txtNetAmountNYR.ClientID %>");

            if (ddlPakNYR.selectedIndex == 0) {
                swal("પાક પંસદ કરો. (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                txtvAreaNYR.value = "";
                txtvAreaNYR.focus();
                txtvWaterNYR.value = "";
                txtvWaterNYR.focus();
                return false;
            }
            else if (txtvAreaNYR.value == "") {
                swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                txtvWaterNYR.value = txtuWaterNYR.value;
                txtvAreaNYR.focus();
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaNYR.value) > parseFloat(txtvAreaNYR.value) || parseFloat(txtPiyatAreaNYR.value) == parseFloat(txtvAreaNYR.value)) {
                    txtuAreaNYR.value = (parseFloat(txtPiyatAreaNYR.value) - parseFloat(txtvAreaNYR.value)).toFixed(2);
                    txtvTotalAmtNYR.value = ((txtvAreaNYR.value * txtvRateNYR.value) * txtvWaterNYR.value).toFixed(2);
                    txtuTotalAmtNYR.value = ((txtuAreaNYR.value * txtuRateNYR.value) * txtuWaterNYR.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtNYR.value) + parseFloat(txtuTotalAmtNYR.value);
                    txtTotalPiyatAmtNYR.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtNYR.value) + (txtTotalPiyatAmtNYR.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundNYR.value = temp;
                    var totalfundNYR = ((txtTotalPiyatAmtNYR.value * 20) / 100).toFixed(2);
                    txtLocalFundNYR.value = totalfundNYR;
                    txtRoundOffNYR.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountNYR.value = Math.round(temp).toFixed(2);
                    txtuAreaNYR.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (વહેતા પાણીથી) બરાબર દાખલ કરો. (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                    txtvAreaNYR.value = "";
                    txtvAreaNYR.focus();
                }
            }
        }

        function UAreaChangeRabi() {
            var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
            var txtPiyatAreaR = document.getElementById("<%=this.txtPiyatAreaR.ClientID %>");
            var txtvAreaR = document.getElementById("<%=this.txtvAreaR.ClientID %>");
            var txtvRateR = document.getElementById("<%=this.txtvRateR.ClientID %>");
            var txtvWaterR = document.getElementById("<%=this.txtvWaterR.ClientID %>");
            var txtvTotalAmtR = document.getElementById("<%=this.txtvTotalAmtR.ClientID %>");
            var txtuAreaR = document.getElementById("<%=this.txtuAreaR.ClientID %>");
            var txtuRateR = document.getElementById("<%=this.txtuRateR.ClientID %>");
            var txtuWaterR = document.getElementById("<%=this.txtuWaterR.ClientID %>");
            var txtuTotalAmtR = document.getElementById("<%=this.txtuTotalAmtR.ClientID %>");
            var txtTotalPiyatAmtR = document.getElementById("<%=this.txtTotalPiyatAmtR.ClientID %>");
            var txtLocalFundR = document.getElementById("<%=this.txtLocalFundR.ClientID %>");
            var txtAmtLocalFundR = document.getElementById("<%=this.txtAmtLocalFundR.ClientID %>");
            var ddlPakR = document.getElementById("<%=this.ddlPakR.ClientID %>");
            var txtRoundOffR = document.getElementById("<%=this.txtRoundOffR.ClientID %>");
            var txtNetAmountR = document.getElementById("<%=this.txtNetAmountR.ClientID %>");
            var ddlUnaduBlockNo = document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>");

            if (ddlPakR.selectedIndex == 0) {
                txtvAreaR.value = "";
                txtuWaterR.value = "";
                swal("પાક પંસદ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                return false;
            }
            else if (txtuAreaR.value == "") {
                txtuWaterR.value = txtvWaterR.value;
                txtuAreaR.focus();
                swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaR.value) > parseFloat(txtuAreaR.value) || parseFloat(txtPiyatAreaR.value) == parseFloat(txtuAreaR.value)) {
                    txtvAreaR.value = (parseFloat(txtPiyatAreaR.value) - parseFloat(txtuAreaR.value)).toFixed(2);
                    txtvTotalAmtR.value = ((txtvAreaR.value * txtvRateR.value) * txtvWaterR.value).toFixed(2);
                    txtuTotalAmtR.value = ((txtuAreaR.value * txtuRateR.value) * txtuWaterR.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtR.value) + parseFloat(txtuTotalAmtR.value);
                    txtTotalPiyatAmtR.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtR.value) + (txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundR.value = temp;
                    var totalfundR = ((txtTotalPiyatAmtR.value * 20) / 100).toFixed(2);
                    txtLocalFundR.value = totalfundR;
                    txtRoundOffR.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountR.value = Math.round(temp).toFixed(2);
                    ddlUnaduBlockNo.focus();
                }
                else {
                    txtuAreaR.value = "";
                    txtuAreaR.focus();
                    swal("પિયત વિસ્તાર (ઉદવહનથી) બરાબર દાખલ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                }
            }
        }

        function UAreaChangeUnadu() {
            var txtSeasonUnadu = document.getElementById("<%=this.txtSeasonUnadu.ClientID %>");
            var txtPiyatAreaU = document.getElementById("<%=this.txtPiyatAreaU.ClientID %>");
            var txtvAreaU = document.getElementById("<%=this.txtvAreaU.ClientID %>");
            var txtvRateU = document.getElementById("<%=this.txtvRateU.ClientID %>");
            var txtvWaterU = document.getElementById("<%=this.txtvWaterU.ClientID %>");
            var txtvTotalAmtU = document.getElementById("<%=this.txtvTotalAmtU.ClientID %>");
            var txtuAreaU = document.getElementById("<%=this.txtuAreaU.ClientID %>");
            var txtuRateU = document.getElementById("<%=this.txtuRateU.ClientID %>");
            var txtuWaterU = document.getElementById("<%=this.txtuWaterU.ClientID %>");
            var txtuTotalAmtU = document.getElementById("<%=this.txtuTotalAmtU.ClientID %>");
            var txtTotalPiyatAmtU = document.getElementById("<%=this.txtTotalPiyatAmtU.ClientID %>");
            var txtLocalFundU = document.getElementById("<%=this.txtLocalFundU.ClientID %>");
            var txtAmtLocalFundU = document.getElementById("<%=this.txtAmtLocalFundU.ClientID %>");
            var ddlPakU = document.getElementById("<%=this.ddlPakU.ClientID %>");
            var txtRoundOffU = document.getElementById("<%=this.txtRoundOffU.ClientID %>");
            var txtNetAmountU = document.getElementById("<%=this.txtNetAmountU.ClientID %>");
            var ddlKharifBlockNo = document.getElementById("<%=this.ddlKharifBlockNo.ClientID %>");

            if (ddlPakU.selectedIndex == 0) {
                swal("પાક પંસદ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                txtvAreaU.value = "";
                txtvAreaU.focus();
                txtuWaterU.value = "";
                txtuWaterU.focus();
                return false;
            }
            else if (txtuAreaU.value == "") {
                swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                txtuWaterU.value = txtvWaterU.value;
                txtuAreaU.focus();
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaU.value) > parseFloat(txtuAreaU.value) || parseFloat(txtPiyatAreaU.value) == parseFloat(txtuAreaU.value)) {
                    txtvAreaU.value = (parseFloat(txtPiyatAreaU.value) - parseFloat(txtuAreaU.value)).toFixed(2);
                    txtvTotalAmtU.value = ((txtvAreaU.value * txtvRateU.value) * txtvWaterU.value).toFixed(2);
                    txtuTotalAmtU.value = ((txtuAreaU.value * txtuRateU.value) * txtuWaterU.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtU.value) + parseFloat(txtuTotalAmtU.value);
                    txtTotalPiyatAmtU.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtU.value) + (txtTotalPiyatAmtU.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundU.value = temp;
                    var totalfundU = ((txtTotalPiyatAmtU.value * 20) / 100).toFixed(2);
                    txtLocalFundU.value = totalfundU;
                    txtRoundOffU.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountU.value = Math.round(temp).toFixed(2);
                    ddlKharifBlockNo.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (ઉદવહનથી) બરાબર દાખલ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                    txtuAreaU.value = "";
                    txtuAreaU.focus();
                }
            }
        }

        function UAreaChangeKharif() {
            var txtSeasonKharif = document.getElementById("<%=this.txtSeasonKharif.ClientID %>");
            var txtPiyatAreaK = document.getElementById("<%=this.txtPiyatAreaK.ClientID %>");
            var txtvAreaK = document.getElementById("<%=this.txtvAreaK.ClientID %>");
            var txtvRateK = document.getElementById("<%=this.txtvRateK.ClientID %>");
            var txtvWaterK = document.getElementById("<%=this.txtvWaterK.ClientID %>");
            var txtvTotalAmtK = document.getElementById("<%=this.txtvTotalAmtK.ClientID %>");
            var txtuAreaK = document.getElementById("<%=this.txtuAreaK.ClientID %>");
            var txtuRateK = document.getElementById("<%=this.txtuRateK.ClientID %>");
            var txtuWaterK = document.getElementById("<%=this.txtuWaterK.ClientID %>");
            var txtuTotalAmtK = document.getElementById("<%=this.txtuTotalAmtK.ClientID %>");
            var txtTotalPiyatAmtK = document.getElementById("<%=this.txtTotalPiyatAmtK.ClientID %>");
            var txtLocalFundK = document.getElementById("<%=this.txtLocalFundK.ClientID %>");
            var txtAmtLocalFundK = document.getElementById("<%=this.txtAmtLocalFundK.ClientID %>");
            var ddlPakK = document.getElementById("<%=this.ddlPakK.ClientID %>");
            var txtRoundOffK = document.getElementById("<%=this.txtRoundOffK.ClientID %>");
            var txtNetAmountK = document.getElementById("<%=this.txtNetAmountK.ClientID %>");
            var ddlNextYearRabiBlockNo = document.getElementById("<%=this.ddlNextYearRabiBlockNo.ClientID %>");
            if (ddlPakK.selectedIndex == 0) {
                swal("પાક પંસદ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                txtvAreaK.value = "";
                txtvAreaK.focus();
                txtuWaterK.value = "";
                txtuWaterK.focus();
                return false;
            }
            else if (txtuAreaK.value == "") {
                swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                txtuWaterK.value = txtvWaterK.value;
                txtuAreaK.focus();
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaK.value) > parseFloat(txtuAreaK.value) || parseFloat(txtPiyatAreaK.value) == parseFloat(txtuAreaK.value)) {
                    txtvAreaK.value = (parseFloat(txtPiyatAreaK.value) - parseFloat(txtuAreaK.value)).toFixed(2);
                    txtvTotalAmtK.value = ((txtvAreaK.value * txtvRateK.value) * txtvWaterK.value).toFixed(2);
                    txtuTotalAmtK.value = ((txtuAreaK.value * txtuRateK.value) * txtuWaterK.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtK.value) + parseFloat(txtuTotalAmtK.value);
                    txtTotalPiyatAmtK.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtK.value) + (txtTotalPiyatAmtK.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundK.value = temp;
                    var totalfundK = ((txtTotalPiyatAmtK.value * 20) / 100).toFixed(2);
                    txtLocalFundK.value = totalfundK;
                    txtRoundOffK.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountK.value = Math.round(temp).toFixed(2);
                    ddlNextYearRabiBlockNo.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (ઉદવહનથી) બરાબર દાખલ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                    txtuAreaK.value = "";
                    txtuAreaK.focus();
                }
            }
        }

        function UAreaChangeNextYearRabi() {

            var txtSeasonNextYearRabi = document.getElementById("<%=this.txtSeasonNextYearRabi.ClientID %>");
            var txtPiyatAreaNYR = document.getElementById("<%=this.txtPiyatAreaNYR.ClientID %>");
            var txtvAreaNYR = document.getElementById("<%=this.txtvAreaNYR.ClientID %>");
            var txtvRateNYR = document.getElementById("<%=this.txtvRateNYR.ClientID %>");
            var txtvWaterNYR = document.getElementById("<%=this.txtvWaterNYR.ClientID %>");
            var txtvTotalAmtNYR = document.getElementById("<%=this.txtvTotalAmtNYR.ClientID %>");
            var txtuAreaNYR = document.getElementById("<%=this.txtuAreaNYR.ClientID %>");
            var txtuRateNYR = document.getElementById("<%=this.txtuRateNYR.ClientID %>");
            var txtuWaterNYR = document.getElementById("<%=this.txtuWaterNYR.ClientID %>");
            var txtuTotalAmtNYR = document.getElementById("<%=this.txtuTotalAmtNYR.ClientID %>");
            var txtTotalPiyatAmtNYR = document.getElementById("<%=this.txtTotalPiyatAmtNYR.ClientID %>");
            var txtLocalFundNYR = document.getElementById("<%=this.txtLocalFundNYR.ClientID %>");
            var txtAmtLocalFundNYR = document.getElementById("<%=this.txtAmtLocalFundNYR.ClientID %>");
            var ddlPakNYR = document.getElementById("<%=this.ddlPakNYR.ClientID %>");
            var txtRoundOffNYR = document.getElementById("<%=this.txtRoundOffNYR.ClientID %>");
            var txtNetAmountNYR = document.getElementById("<%=this.txtNetAmountNYR.ClientID %>");
            var chkDoneNextYearRabi = document.getElementById("<%=this.chkDoneNextYearRabi.ClientID %>");

            if (ddlPakNYR.selectedIndex == 0) {
                swal("પાક પંસદ કરો. (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                txtvAreaNYR.value = "";
                txtvAreaNYR.focus();
                txtuWaterNYR.value = "";
                txtuWaterNYR.focus();
                return false;
            }
            else if (txtuAreaNYR.value == "") {
                swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                txtuWaterNYR.value = txtvWaterNYR.value;
                txtuAreaNYR.focus();
                return false;
            }
            else {
                if (parseFloat(txtPiyatAreaNYR.value) > parseFloat(txtuAreaNYR.value) || parseFloat(txtPiyatAreaNYR.value) == parseFloat(txtuAreaNYR.value)) {
                    txtvAreaNYR.value = (parseFloat(txtPiyatAreaNYR.value) - parseFloat(txtuAreaNYR.value)).toFixed(2);
                    txtvTotalAmtNYR.value = ((txtvAreaNYR.value * txtvRateNYR.value) * txtvWaterNYR.value).toFixed(2);
                    txtuTotalAmtNYR.value = ((txtuAreaNYR.value * txtuRateNYR.value) * txtuWaterNYR.value).toFixed(2);
                    var temp1 = parseFloat(txtvTotalAmtNYR.value) + parseFloat(txtuTotalAmtNYR.value);
                    txtTotalPiyatAmtNYR.value = Math.round(temp1).toFixed(2);
                    var temp = (parseFloat(txtTotalPiyatAmtNYR.value) + (txtTotalPiyatAmtNYR.value * 20) / 100).toFixed(2);
                    txtAmtLocalFundNYR.value = temp;
                    var totalfundNYR = ((txtTotalPiyatAmtNYR.value * 20) / 100).toFixed(2);
                    txtLocalFundNYR.value = totalfundNYR;
                    txtRoundOffNYR.value = (Math.round(temp) - temp).toFixed(2);
                    txtNetAmountNYR.value = Math.round(temp).toFixed(2);
                    chkDoneNextYearRabi.focus();
                }
                else {
                    swal("પિયત વિસ્તાર (ઉદવહનથી) બરાબર દાખલ કરો. (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                    txtuAreaNYR.value = "";
                    txtuAreaNYR.focus();
                }
            }
        }


        $(function () {
            $("#btnSave").bind("click", function () {

                var ddlVillage = document.getElementById("<%=this.ddlVillage.ClientID %>");
                var ddlMalik = document.getElementById("<%=this.ddlMalik.ClientID %>");
                var txtMangnaDate = document.getElementById("<%=this.txtMangnaDate.ClientID %>");

                var chkDoneRabi = document.getElementById("<%=this.chkDoneRabi.ClientID %>");
                var ddlSeasonRabi = document.getElementById("<%=this.ddlSeasonRabi.ClientID %>");
                var ddlRabiBlockNo = document.getElementById("<%=this.ddlRabiBlockNo.ClientID %>");
                var txtFormNoR = document.getElementById("<%=this.txtFormNoR.ClientID %>");
                var txtFormDateR = document.getElementById("<%=this.txtFormDateR.ClientID %>");
                var txtPiyatAreaR = document.getElementById("<%=this.txtPiyatAreaR.ClientID %>");
                var ddlPakR = document.getElementById("<%=this.ddlPakR.ClientID %>");
                var txtvAreaR = document.getElementById("<%=this.txtvAreaR.ClientID %>");
                var txtvWaterR = document.getElementById("<%=this.txtvWaterR.ClientID %>");
                var txtuAreaR = document.getElementById("<%=this.txtuAreaR.ClientID %>");
                var txtuWaterR = document.getElementById("<%=this.txtuWaterR.ClientID %>");

                var chkDoneUnadu = document.getElementById("<%=this.chkDoneUnadu.ClientID %>");
                var txtSeasonUnadu = document.getElementById("<%=this.txtSeasonUnadu.ClientID %>");
                var ddlUnaduBlockNo = document.getElementById("<%=this.ddlUnaduBlockNo.ClientID %>");
                var txtFormNoU = document.getElementById("<%=this.txtFormNoU.ClientID %>");
                var txtFormDateU = document.getElementById("<%=this.txtFormDateU.ClientID %>");
                var txtPiyatAreaU = document.getElementById("<%=this.txtPiyatAreaU.ClientID %>");
                var ddlPakU = document.getElementById("<%=this.ddlPakU.ClientID %>");
                var txtvAreaU = document.getElementById("<%=this.txtvAreaU.ClientID %>");
                var txtvWaterU = document.getElementById("<%=this.txtvWaterU.ClientID %>");
                var txtuAreaU = document.getElementById("<%=this.txtuAreaU.ClientID %>");
                var txtuWaterU = document.getElementById("<%=this.txtuWaterU.ClientID %>");

                var chkDoneKharif = document.getElementById("<%=this.chkDoneKharif.ClientID %>");
                var txtSeasonKharif = document.getElementById("<%=this.txtSeasonKharif.ClientID %>");
                var ddlKharifBlockNo = document.getElementById("<%=this.ddlKharifBlockNo.ClientID %>");
                var txtFormNoK = document.getElementById("<%=this.txtFormNoK.ClientID %>");
                var txtFormDateK = document.getElementById("<%=this.txtFormDateK.ClientID %>");
                var txtPiyatAreaK = document.getElementById("<%=this.txtPiyatAreaK.ClientID %>");
                var ddlPakK = document.getElementById("<%=this.ddlPakK.ClientID %>");
                var txtvAreaK = document.getElementById("<%=this.txtvAreaK.ClientID %>");
                var txtvWaterK = document.getElementById("<%=this.txtvWaterK.ClientID %>");
                var txtuAreaK = document.getElementById("<%=this.txtuAreaK.ClientID %>");
                var txtuWaterK = document.getElementById("<%=this.txtuWaterK.ClientID %>");

                var chkDoneNextYearRabi = document.getElementById("<%=this.chkDoneNextYearRabi.ClientID %>");
                var txtSeasonNextYearRabi = document.getElementById("<%=this.txtSeasonNextYearRabi.ClientID %>");
                var ddlNextYearRabiBlockNo = document.getElementById("<%=this.ddlNextYearRabiBlockNo.ClientID %>");
                var txtFormNoNYR = document.getElementById("<%=this.txtFormNoNYR.ClientID %>");
                var txtFormDateNYR = document.getElementById("<%=this.txtFormDateNYR.ClientID %>");
                var txtPiyatAreaNYR = document.getElementById("<%=this.txtPiyatAreaNYR.ClientID %>");
                var ddlPakNYR = document.getElementById("<%=this.ddlPakNYR.ClientID %>");
                var txtvAreaNYR = document.getElementById("<%=this.txtvAreaNYR.ClientID %>");
                var txtvWaterNYR = document.getElementById("<%=this.txtvWaterNYR.ClientID %>");
                var txtuAreaNYR = document.getElementById("<%=this.txtuAreaNYR.ClientID %>");
                var txtuWaterNYR = document.getElementById("<%=this.txtuWaterNYR.ClientID %>");
               
                var cnt = 0;
                if (chkDoneRabi.checked == true || chkDoneUnadu.checked == true || chkDoneKharif.checked == true || chkDoneNextYearRabi.checked == true) {
                    cnt = 1;
                }

                var DoneRabi = 1;
                var DoneUnadu = 1;
                var DoneKharif = 1;
                var DoneNextYearRabi = 1;

                if (ddlVillage.value == "0") {
                    ddlVillage.focus();
                    swal("", "ગામ પંસદ કરો.", "warning");
                    return false;
                }
                else if (ddlMalik.value == "0") {
                    ddlMalik.focus();
                    swal("", "માલિક પસંદ કરો", "warning");
                    return false;
                }
                else if (txtMangnaDate.value == "") {
                    txtMangnaDate.focus();
                    swal("", "માંગણા તારીખ પસંદ કરો", "warning");
                    return false;
                }
                else if (cnt == 0) {
                    swal("", "કોઈ પણ એક મૌસમ માં માંગણા ની માહિતી નાખો અને Done ટીક કરો.", "warning");
                    return false;
                }
                if (chkDoneRabi.checked == true) {
                    if (ddlSeasonRabi.selectedIndex == "0") {
                        ddlSeasonRabi.focus();
                        swal("", "મૌસમ પંસદ કરો.", "warning");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (ddlRabiBlockNo.value == "0") {
                        ddlRabiBlockNo.focus();
                        swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (txtFormNoR.value == "") {
                        txtFormNoR.focus();
                        swal("", "ફોર્મ નંબર દાખલ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")", "warning");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (txtFormDateR.value == "") {
                        txtFormDateR.focus();
                        swal("", "ફોર્મ તારીખ પંસદ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")", "warning");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (ddlPakR.selectedIndex == "0") {
                        ddlPakR.focus();
                        swal("", "પાક પંસદ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")", "warning");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (txtvAreaR.value == "") {
                        txtvAreaR.focus();
                        swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (txtvWaterR.value == "") {
                        txtvWaterR.focus();
                        swal("", "પાણી (વહેતા પાણીથી) દાખલ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")", "warning");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (txtuAreaR.value == "") {
                        txtuAreaR.focus();
                        swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")");
                        DoneRabi = 0;
                        return false;
                    }
                    else if (txtuWaterR.value == "") {
                        txtuWaterR.focus();
                        swal("", "પાણી (ઉદવહનથી) દાખલ કરો. \n (મૌસમ: " + ddlSeasonRabi.options[ddlSeasonRabi.selectedIndex].text + ")", "warning");
                        DoneRabi = 0;
                        return false;
                    }
                }

                if (chkDoneUnadu.checked == true) {

                    if (ddlSeasonRabi.selectedIndex == "0") {
                        ddlSeasonRabi.focus();
                        swal("", "મૌસમ પંસદ કરો.", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (ddlUnaduBlockNo.selectedIndex == "0") {
                        ddlUnaduBlockNo.focus();
                        swal("", "બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (txtFormNoU.value == "") {
                        txtFormNoU.focus();
                        swal("", "ફોર્મ નંબર દાખલ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (txtFormDateU.value == "") {
                        txtFormDateU.focus();
                        swal("", "ફોર્મ તારીખ દાખલ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (ddlPakU.selectedIndex == "0") {
                        ddlPakU.focus();
                        swal("", "પાક પંસદ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (txtvAreaU.value == "") {
                        txtvAreaU.focus();
                        swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (txtvWaterU.value == "") {
                        txtvWaterU.focus();
                        swal("", "પાણી (વહેતા પાણીથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (txtuAreaU.value == "") {
                        txtuAreaU.focus();
                        swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. (મૌસમ: " + txtSeasonUnadu.value + ")");
                        DoneUnadu = 0;
                        return false;
                    }
                    else if (txtuWaterU.value == "") {
                        txtuWaterU.focus();
                        swal("", "પાણી (ઉદવહનથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonUnadu.value + ")", "warning");
                        DoneUnadu = 0;
                        return false;
                    }
                }
                if (chkDoneKharif.checked == true) {
                    if (ddlSeasonRabi.selectedIndex == 0) {
                        ddlSeasonRabi.focus();
                        swal("મૌસમ પંસદ કરો.");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (ddlKharifBlockNo.selectedIndex == 0) {
                        ddlKharifBlockNo.focus();
                        swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtFormNoK.value == "") {
                        txtFormNoK.focus();
                        swal("ફોર્મ નંબર દાખલ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtFormDateK.value == "") {
                        txtFormDateK.focus();
                        swal("ફોર્મ તારીખ દાખલ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtPiyatAreaK.value == "") {
                        txtPiyatAreaK.focus();
                        swal("પિયત વિસ્તાર દાખલ કરો. (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (ddlPakK.selectedIndex == 0) {
                        ddlPakK.focus();
                        swal("પાક પંસદ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtvAreaK.value == "") {
                        txtvAreaK.focus();
                        swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtvWaterK.value == "") {
                        txtvWaterK.focus();
                        swal("પાણી (વહેતા પાણીથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtuAreaK.value == "") {
                        txtuAreaK.focus();
                        swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો.\n  (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                    else if (txtuWaterK.value == "") {
                        txtuWaterK.focus();
                        swal("પાણી (ઉદવહનથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonKharif.value + ")");
                        DoneKharif = 0;
                        return false;
                    }
                }
                if (chkDoneNextYearRabi.checked == true) {
                    if (ddlSeasonRabi.selectedIndex == 0) {
                        ddlSeasonRabi.focus();
                        swal("મૌસમ પંસદ કરો.");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (ddlNextYearRabiBlockNo.selectedIndex == 0) {
                        ddlNextYearRabiBlockNo.focus();
                        swal("બ્લોક નંબર પંસદ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtFormNoNYR.value == "") {
                        txtFormNoNYR.focus();
                        swal("ફોર્મ નંબર દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtFormDateNYR.value == "") {
                        txtFormDateNYR.focus();
                        swal("ફોર્મ તારીખ દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtPiyatAreaNYR.value == "") {
                        txtPiyatAreaNYR.focus();
                        swal("પિયત વિસ્તાર દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (ddlPakNYR.selectedIndex == 0) {
                        ddlPakNYR.focus();
                        swal("પાક પંસદ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtvAreaNYR.value == "") {
                        txtvAreaNYR.focus();
                        swal("પિયત વિસ્તાર (વહેતા પાણીથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtvWaterNYR.value == "") {
                        txtvWaterNYR.focus();
                        swal("પાણી (વહેતા પાણીથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtuAreaNYR.value == "") {
                        txtuAreaNYR.focus();
                        swal("પિયત વિસ્તાર (ઉદવહનથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                    else if (txtuWaterNYR.value == "") {
                        txtuWaterNYR.focus();
                        swal("પાણી (ઉદવહનથી) દાખલ કરો. \n (મૌસમ: " + txtSeasonNextYearRabi.value + ")");
                        DoneNextYearRabi = 0;
                        return false;
                    }
                }


                if (DoneRabi == 1 || DoneUnadu == 1 || DoneKharif == 1 || DoneNextYearRabi == 1) {

                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    var mangna = {};

                    mangna.AccountNo = $("[id*=txtAccountNo]").val();
                    mangna.MangnaNo = $("[id*=txtMangnaNo]").val();
                    mangna.MangnaDate = $("[id*=txtMangnaDate]").val();
                    mangna.MemberID = $("[id*=ddlMalik]").val();
                    mangna.VillageID = $("[id*=ddlVillage]").val();
                    mangna.Remark = $("[id*=txtRemark]").val();
                    mangna.IsAdvance = $("[id=ContentPlaceHolder1_chkAdvanceMangnu]").prop('checked');

                    if (chkDoneRabi.checked == true) {

                        mangna.SeasonRabi = $("[id*=ddlSeasonRabi]").val();
                        mangna.BlockIDRabi = $("[id*=ddlRabiBlockNo]").val();
                        mangna.FarmerIDRabi = $("[id*=hdnFarmerIDRabi]").val();
                        mangna.FormNoR = $("[id*=txtFormNoR]").val();
                        mangna.FormDateR = $("[id*=txtFormDateR]").val();
                        mangna.BlockAreaR = $("[id*=txtBlockAreaR]").val();
                        mangna.KLPiyatR = $("[id*=txtKLPiyatR]").val();
                        mangna.PiyatAreaR = $("[id*=txtPiyatAreaR]").val();
                        mangna.BinPiyatAreaR = $("[id*=txtBinPiyatAreaR]").val();
                        mangna.PakIDR = $("[id*=ddlPakR]").val();
                        mangna.hdnGovtRateRabi = $("[id*=hdnGovtRateRabi]").val();
                        mangna.vAreaR = $("[id*=txtvAreaR]").val();
                        mangna.vRateR = $("[id*=txtvRateR]").val();
                        mangna.vWaterR = $("[id*=txtvWaterR]").val();
                        mangna.vTotalAmtR = $("[id*=txtvTotalAmtR]").val();
                        mangna.uAreaR = $("[id*=txtuAreaR]").val();
                        mangna.uRateR = $("[id*=txtuRateR]").val();
                        mangna.uWaterR = $("[id*=txtuWaterR]").val();
                        mangna.uTotalAmtR = $("[id*=txtuTotalAmtR]").val();
                        mangna.TotalPiyatAmtR = $("[id*=txtTotalPiyatAmtR]").val();
                        mangna.LocalFundR = $("[id*=txtLocalFundR]").val();
                        mangna.LocalFundAmtR = $("[id*=txtAmtLocalFundR]").val();
                        mangna.RoundOffR = $("[id*=txtRoundOffR]").val();
                        mangna.NetAmountR = $("[id*=txtNetAmountR]").val();
                        mangna.DoneRabi = $("[id=ContentPlaceHolder1_chkDoneRabi]").prop('checked');
                    }
                    if (chkDoneUnadu.checked == true) {
                        mangna.SeasonUnadu = $("[id*=hdnSeasonUnadu]").val();
                        mangna.BlockIDUnadu = $("[id*=ddlUnaduBlockNo]").val();
                        mangna.FarmerIDUnadu = $("[id*=hdnFarmerIDUnadu]").val();
                        mangna.FormNoU = $("[id*=txtFormNoU]").val();
                        mangna.FormDateU = $("[id*=txtFormDateU]").val();
                        mangna.BlockAreaU = $("[id*=txtBlockAreaU]").val();
                        mangna.KLPiyatU = $("[id*=txtKLPiyatU]").val();
                        mangna.PiyatAreaU = $("[id*=txtPiyatAreaU]").val();
                        mangna.BinPiyatAreaU = $("[id*=txtBinPiyatAreaU]").val();
                        mangna.PakIDU = $("[id*=ddlPakU]").val();
                        mangna.hdnGovtRateUnadu = $("[id*=hdnGovtRateUnadu]").val();
                        mangna.vAreaU = $("[id*=txtvAreaU]").val();
                        mangna.vRateU = $("[id*=txtvRateU]").val();
                        mangna.vWaterU = $("[id*=txtvWaterU]").val();
                        mangna.vTotalAmtU = $("[id*=txtvTotalAmtU]").val();
                        mangna.uAreaU = $("[id*=txtuAreaU]").val();
                        mangna.uRateU = $("[id*=txtuRateU]").val();
                        mangna.uWaterU = $("[id*=txtuWaterU]").val();
                        mangna.uTotalAmtU = $("[id*=txtuTotalAmtU]").val();
                        mangna.TotalPiyatAmtU = $("[id*=txtTotalPiyatAmtU]").val();
                        mangna.LocalFundU = $("[id*=txtLocalFundU]").val();
                        mangna.LocalFundAmtU = $("[id*=txtAmtLocalFundU]").val();
                        mangna.RoundOffU = $("[id*=txtRoundOffU]").val();
                        mangna.NetAmountU = $("[id*=txtNetAmountU]").val();
                        mangna.DoneUnadu = $("[id=ContentPlaceHolder1_chkDoneUnadu]").prop('checked');
                    }
                    if (chkDoneKharif.checked == true) {
                        mangna.SeasonKharif = $("[id*=hdnSeasonKharif]").val();
                        mangna.BlockIDKharif = $("[id*=ddlKharifBlockNo]").val();
                        mangna.FarmerIDKharif = $("[id*=hdnFarmerIDKharif]").val();
                        mangna.FormNoK = $("[id*=txtFormNoK]").val();
                        mangna.FormDateK = $("[id*=txtFormDateK]").val();
                        mangna.BlockAreaK = $("[id*=txtBlockAreaK]").val();
                        mangna.KLPiyatK = $("[id*=txtKLPiyatK]").val();
                        mangna.PiyatAreaK = $("[id*=txtPiyatAreaK]").val();
                        mangna.BinPiyatAreaK = $("[id*=txtBinPiyatAreaK]").val();
                        mangna.PakIDK = $("[id*=ddlPakK]").val();
                        mangna.hdnGovtRateKharif = $("[id*=hdnGovtRateKharif]").val();
                        mangna.vAreaK = $("[id*=txtvAreaK]").val();
                        mangna.vRateK = $("[id*=txtvRateK]").val();
                        mangna.vWaterK = $("[id*=txtvWaterK]").val();
                        mangna.vTotalAmtK = $("[id*=txtvTotalAmtK]").val();
                        mangna.uAreaK = $("[id*=txtuAreaK]").val();
                        mangna.uRateK = $("[id*=txtuRateK]").val();
                        mangna.uWaterK = $("[id*=txtuWaterK]").val();
                        mangna.uTotalAmtK = $("[id*=txtuTotalAmtK]").val();
                        mangna.TotalPiyatAmtK = $("[id*=txtTotalPiyatAmtK]").val();
                        mangna.LocalFundK = $("[id*=txtLocalFundK]").val();
                        mangna.LocalFundAmtK = $("[id*=txtAmtLocalFundK]").val();
                        mangna.RoundOffK = $("[id*=txtRoundOffK]").val();
                        mangna.NetAmountK = $("[id*=txtNetAmountK]").val();
                        mangna.DoneKharif = $("[id=ContentPlaceHolder1_chkDoneKharif]").prop('checked');
                    }
                    if (chkDoneNextYearRabi.checked == true) {
                      
                        mangna.SeasonNextYearRabi = $("[id*=hdnSeasonNextYearRabi]").val();
                        mangna.BlockIDNextYearRabi = $("[id*=ddlNextYearRabiBlockNo]").val();
                        mangna.FarmerIDNextYearRabi = $("[id*=hdnFarmerIDNextYearRabi]").val();
                        mangna.FormNoNYR = $("[id*=txtFormNoNYR]").val();
                        mangna.FormDateNYR = $("[id*=txtFormDateNYR]").val();
                        mangna.BlockAreaNYR = $("[id*=txtBlockAreaNYR]").val();
                        mangna.KLPiyatNYR = $("[id*=txtKLPiyatNYR]").val();
                        mangna.PiyatAreaNYR = $("[id*=txtPiyatAreaNYR]").val();
                        mangna.BinPiyatAreaNYR = $("[id*=txtBinPiyatAreaNYR]").val();
                        mangna.PakIDNYR = $("[id*=ddlPakNYR]").val();
                        mangna.hdnGovtRateNextYearRabi = $("[id*=hdnGovtRateNextYearRabi]").val();
                        mangna.vAreaNYR = $("[id*=txtvAreaNYR]").val();
                        mangna.vRateNYR = $("[id*=txtvRateNYR]").val();
                        mangna.vWaterNYR = $("[id*=txtvWaterNYR]").val();
                        mangna.vTotalAmtNYR = $("[id*=txtvTotalAmtNYR]").val();
                        mangna.uAreaNYR = $("[id*=txtuAreaNYR]").val();
                        mangna.uRateNYR = $("[id*=txtuRateNYR]").val();
                        mangna.uWaterNYR = $("[id*=txtuWaterNYR]").val();
                        mangna.uTotalAmtNYR = $("[id*=txtuTotalAmtNYR]").val();
                        mangna.TotalPiyatAmtNYR = $("[id*=txtTotalPiyatAmtNYR]").val();
                        mangna.LocalFundNYR = $("[id*=txtLocalFundNYR]").val();
                        mangna.LocalFundAmtNYR = $("[id*=txtAmtLocalFundNYR]").val();
                        mangna.RoundOffNYR = $("[id*=txtRoundOffNYR]").val();
                        mangna.NetAmountNYR = $("[id*=txtNetAmountNYR]").val();
                        mangna.DoneNextYearRabi = $("[id=ContentPlaceHolder1_chkDoneNextYearRabi]").prop('checked');
                    }

                    $.ajax({
                        type: "POST",
                        url: "MangnaPatrak.aspx/MangnaPatrakManage",
                        data: '{Mangna: ' + JSON.stringify(mangna) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                            }
                            else {
                               
                                swal({
                                    title: "માગંણા ની માહિતી જોવા માંગો છો ?",
                                    text: "",
                                    type: "warning",
                                    showCancelButton: true,
                                    confirmButtonClass: "btn-danger",
                                    confirmButtonText: "હા",
                                    cancelButtonText: "ના",
                                    closeOnConfirm: false,
                                    closeOnCancel: false
                                },
                                     function (isConfirm) {
                                         if (isConfirm) {
                                             $('#btnSave').attr('disabled', true);
                                             window.open("Reports/PrintMangnaForm7.aspx?MangnaPatrakID=" + msg + "");
                                             swal("Done!", "માગંણા ની માહિતી સફળતાથી દાખલ થઈ ગઇ છે.", "success");
                                             cnt = 0;
                                             DoneRabi = 1;
                                             DoneUnadu = 1;
                                             DoneKharif = 1;
                                             DoneNextYearRabi = 1;
                                           

                                         } else {
                                             $('#btnSave').attr('disabled', true);
                                             swal("Done!", "માગંણા ની માહિતી સફળતાથી દાખલ થઈ ગઇ છે.", "success");
                                             cnt = 0;
                                             DoneRabi = 1;
                                             DoneUnadu = 1;
                                             DoneKharif = 1;
                                             DoneNextYearRabi = 1;
                                            
                                         }
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

        $("#btnReset").bind("click", function () {
            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset]").attr('disabled', 'disabled');
            $("#hdnReset").val("1");
            ClearAll();
            //if ($("#hdnReset").val() == "1") {
            //    $("[id*=btnReset]").html("રદ કરો");
            //    $("[id*=btnReset]").removeAttr('disabled');
            //    $("#hdnReset").val(0);
            //}
        });

        function ClearAll() {

            ListBlockNo(0);
            GetBlockDetailRabi();
            GetBlockDetailUnadu();
            GetBlockDetailKharif();
            GetBlockDetailNextYearRabi();

            var ddlSeasonRabi = document.getElementById("ContentPlaceHolder1_ddlSeasonRabi");
            ddlSeasonRabi.selectedIndex = 0;
            GetSeason();
            ListPakRabi();
            ListPakUnadu();
            ListPakKharif();
            ListPakNextYearRabi();

            $("[id=ContentPlaceHolder1_chkAdvanceMangnu]").prop('checked', false);
            ListSeasonRabi();
            ListMalik(0, 0);
            GetMemberDetail();
            $("[id=ContentPlaceHolder1_txtMangnaDate]").val('');
            ListVillage();

            $("[id=ContentPlaceHolder1_chkDoneRabi]").prop('checked', false);
            $("[id=ContentPlaceHolder1_chkDoneUnadu]").prop('checked', false);
            $("[id=ContentPlaceHolder1_chkDoneKharif]").prop('checked', false);
            $("[id=ContentPlaceHolder1_chkDoneNextYearRabi]").prop('checked', false);
            $("[id=ContentPlaceHolder1_txtRemark]").val('');

            $('#btnSave').removeAttr('disabled');

            //$("[id*=txtMalikNameR]").val('');
            //$("[id*=txtFormNoR]").val('');
            //$("[id*=txtFormDateR]").val('');
            //$("[id*=txtBlockAreaR]").val('');
            //$("[id*=txtPiyatAreaR]").val('');
            //$("[id*=txtBinPiyatAreaR]").val('');
            //ListPakRabi();
            //$("[id*=txtvAreaR]").val('');
            //$("[id*=txtvRateR]").val('');
            //$("[id*=txtvWaterR]").val('');
            //$("[id*=txtvTotalAmtR]").val('');
            //$("[id*=txtuAreaR]").val('');
            //$("[id*=txtuRateR]").val('');
            //$("[id*=txtuWaterR]").val('');
            //$("[id*=txtuTotalAmtR]").val('');
            //$("[id*=txtTotalPiyatAmtR]").val('');
            //$("[id*=txtLocalFundR]").val('');
            //$("[id*=txtAmtLocalFundR]").val('');
            //$("[id*=txtRoundOffR]").val('');
            //$("[id*=txtNetAmountR]").val('');

            //$("[id*=txtSeasonUnadu]").val('');
            //$("[id*=hdnSeasonUnadu]").val('');
            //$("[id*=txtMalikNameU]").val('');
            //$("[id*=txtFormNoU]").val('');
            //$("[id*=txtFormDateU]").val('');
            //$("[id*=txtBlockAreaU]").val('');
            //$("[id*=txtPiyatAreaU]").val('');
            //$("[id*=txtBinPiyatAreaU]").val('');
            ////ListPakUnadu();
            //$("[id*=ddlPakU]").val('0');
            //$("[id*=txtvAreaU]").val('');
            //$("[id*=txtvRateU]").val('');
            //$("[id*=txtvWaterU]").val('');
            //$("[id*=txtvTotalAmtU]").val('');
            //$("[id*=txtuAreaU]").val('');
            //$("[id*=txtuRateU]").val('');
            //$("[id*=txtuWaterU]").val('');
            //$("[id*=txtuTotalAmtU]").val('');
            //$("[id*=txtTotalPiyatAmtU]").val('');
            //$("[id*=txtLocalFundU]").val('');
            //$("[id*=txtAmtLocalFundU]").val('');
            //$("[id*=txtRoundOffU]").val('');
            //$("[id*=txtNetAmountU]").val('');

            //$("[id*=txtSeasonKharif]").val('');
            //$("[id*=hdnSeasonKharif]").val('');
            //$("[id*=txtMalikNameK]").val('');
            //$("[id*=txtFormNoK]").val('');
            //$("[id*=txtFormDateK]").val('');
            //$("[id*=txtBlockAreaK]").val('');
            //$("[id*=tsxtPiyatAreaK]").val('');
            //$("[id*=txtBinPiyatAreaK]").val('');
            ////ListPakKharif();
            //$("[id*=ddlPakK]").val('0');
            //$("[id*=txtvAreaK]").val('');
            //$("[id*=txtvRateK]").val('');
            //$("[id*=txtvWaterK]").val('');
            //$("[id*=txtvTotalAmtK]").val('');
            //$("[id*=txtuAreaK]").val('');
            //$("[id*=txtuRateK]").val('');
            //$("[id*=txtuWaterK]").val('');
            //$("[id*=txtuTotalAmtK]").val('');
            //$("[id*=txtTotalPiyatAmtK]").val('');
            //$("[id*=txtLocalFundK]").val('');
            //$("[id*=txtAmtLocalFundK]").val('');
            //$("[id*=txtRoundOffK]").val('');
            //$("[id*=txtNetAmountK]").val('');


            //$("[id*=txtSeasonNextYearRabi]").val('');
            //$("[id*=hdnSeasonNextYearRabi]").val('');
            //$("[id*=txtMalikNameNYR]").val('');
            //$("[id*=txtFormNoNYR]").val('');
            //$("[id*=txtFormDateNYR]").val('');
            //$("[id*=txtBlockAreaNYR]").val('');
            //$("[id*=txtKLPiyatNYR]").val('');
            //$("[id*=txtPiyatAreaNYR]").val('');
            //$("[id*=txtBinPiyatAreaNYR]").val('');
            ////ListPakKharif();
            //$("[id*=ddlPakNYR]").val('0');
            //$("[id*=txtvAreaNYR]").val('');
            //$("[id*=txtvRateNYR]").val('');
            //$("[id*=txtvWaterNYR]").val('');
            //$("[id*=txtvTotalAmtNYR]").val('');
            //$("[id*=txtuAreaNYR]").val('');
            //$("[id*=txtuRateNYR]").val('');
            //$("[id*=txtuWaterNYR]").val('');
            //$("[id*=txtuTotalAmtNYR]").val('');
            //$("[id*=txtTotalPiyatAmtNYR]").val('');
            //$("[id*=txtLocalFundNYR]").val('');
            //$("[id*=txtAmtLocalFundNYR]").val('');
            //$("[id*=txtRoundOffNYR]").val('');
            //$("[id*=txtNetAmountNYR]").val('');
        }
    </script>
</asp:Content>




