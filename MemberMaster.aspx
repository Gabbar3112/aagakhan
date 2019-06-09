<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberMaster.aspx.cs" Inherits="MemberMaster" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <script src="pagejscss/ASPSnippets_Pager.min.js"></script>
    <link href="assets/css/jquery.dataTables.css" rel="stylesheet" />--%>
    <style>
        .Pager span {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 25px;
            margin-right: 5px;
            margin-bottom: 5px;
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
            margin-bottom: 5px;
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
            <li class="active">કુટુંબની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">કુટુંબની માહિતી ઉમેરો/સુધારો </a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">મુખ્ય સભ્ય ની યાદી</a></li>
                            <li id="litab3"><a href="#third1" id="aTab3" onclick="ViewDiv3();">કુટુંબ ના સભ્ય ની યાદી</a></li>
                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <div class="row" style="background-color: #ecf8f7; padding-top: 20px; border-radius: 8px;">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlMemberType" onchange="ShowHideMemSrch();" CssClass="form-control" runat="server">
                                                        <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="મુખ્ય સભ્ય" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="કુટંબનો સભ્ય" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label>સભ્ય પ્રકાર </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="divVillage">
                                                    <asp:DropDownList ID="ddlVillageForSrchMem" runat="server" onchange="BindHouseHoldNo()" CssClass="form-control"></asp:DropDownList>
                                                    <label>ગામ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group" id="divHH">
                                                    <asp:DropDownList ID="ddlHouseHoldNo" runat="server" onchange="SrchMember()" CssClass="form-control"></asp:DropDownList>
                                                    <label>ઘરગથ્થુ નંબર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group" id="divMemName">
                                                    <asp:TextBox ID="txtMemName" class="form-control" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnMemberIDForFamily" runat="server" />
                                                    <label>નામ</label>
                                                </div>
                                            </div>
                                         <%--   <div class="col-sm-1" id="divMemSrch">
                                                <button id="btnMemSrch" type="button" class="btn ink-reaction btn-raised btn-primary btn-loading-state"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    શોધો</button>
                                            </div>--%>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>

                                        <div class="row" id="divDisTalVilInst">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control select2-list" onchange="BindTaluka()"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnMemberID" runat="server" />
                                                    <label>જિલ્લો </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlTaluka" runat="server" CssClass="form-control" onchange="BindVillage()"></asp:DropDownList>
                                                    <label>તાલુકો </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>ગામ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlInstitute" onchange="CheckMandali()" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <label>પિયત મંડળી </label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPersonCode" placeholder="New" class="form-control" runat="server"></asp:TextBox>
                                                    <label>વ્યક્તિ નો કોડ</label>
                                                </div>
                                            </div>
                                            <div id="divAcNo">
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtHouseholdNo" class="form-control" onchange="CheckHouseHolNodAlreadyExists()" runat="server"></asp:TextBox>
                                                        <label>ઘરગથ્થુ નંબર</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtAccountNo" placeholder="New" class="form-control" runat="server"></asp:TextBox>
                                                        <label>ખાતા નંબર</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtCurrentAccountNo" onkeypress="return isNumberKey(event);" onchange="CheckCurrAccNoAlreadyExists()" MaxLength="50" class="form-control" runat="server"></asp:TextBox>
                                                        <label>હાલનો ખાતા નંબર</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3" id="divFromdate">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtMembershipDate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                        <label>સભ્યસ્પદની તારીખ</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFName" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>પ્રથમ નામ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMName" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>પિતા/વાલી/પતિનું નામ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtLName" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>અટક </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFNameG" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>પ્રથમ નામ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMNameG" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>પિતા/વાલી/પતિનું નામ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtLNameG" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>અટક (ગુજરાતી) </label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAdd1" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>સરનામું ૧ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAdd2" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>સરનામું ૨ </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAdd3" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>સરનામું ૩ </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAdd1G" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>સરનામું ૧ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAdd2G" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>સરનામું ૨ (ગુજરાતી) </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAdd3G" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>સરનામું ૩ (ગુજરાતી) </label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMobile1" class="form-control" MaxLength="10" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                                    <label>મોબઈલ ૧ </label>
                                                    <%--onchange="CheckPhoneNo1AlreadyExists()"--%>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMobile1G" class="form-control" MaxLength="10" runat="server"></asp:TextBox>
                                                    <label>મોબઈલ ૧ (ગુજરાતી) </label>
                                                    <%--onchange="CheckPhoneNo1GAlreadyExists()"--%>
                                                </div>
                                            </div>

                                            <div class="col-sm-1">
                                                <label class="radio-inline radio-styled">
                                                    <asp:RadioButton ID="rbtBusiness" GroupName="Occupation" onclick="EnableDisableBusinessJob();" Text="ધંધો" runat="server" />
                                                </label>
                                            </div>

                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBusiness" class="form-control" runat="server"></asp:TextBox>
                                                    <label>ધંધો</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-1">
                                                <label class="radio-inline radio-styled">
                                                    <asp:RadioButton ID="rbtJob" GroupName="Occupation" onclick="EnableDisableBusinessJob();" Text="નોકરી" runat="server" />
                                                </label>
                                            </div>

                                            <div class="col-sm-1">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtJob" class="form-control" runat="server"></asp:TextBox>
                                                    <label>નોકરી</label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMobile2" class="form-control" MaxLength="10" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                                    <label>મોબઈલ ૨ </label>
                                                    <%--onchange="CheckPhoneNo2AlreadyExists()"--%>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMobile2G" class="form-control" MaxLength="10" runat="server"></asp:TextBox>
                                                    <label>મોબઈલ ૨ (ગુજરાતી) </label>
                                                    <%--onchange="CheckPhoneNo2GAlreadyExists()"--%>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <label class="radio-inline radio-styled">
                                                    <asp:RadioButton ID="rbtMale" GroupName="Gender" Text="પુરૂષ" runat="server" />
                                                </label>
                                            </div>
                                            <div class="col-sm-1">
                                                <label class="radio-inline radio-styled">
                                                    <asp:RadioButton ID="rbtFeMale" GroupName="Gender" Text="સ્ત્રી" runat="server" />
                                                </label>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtBirthDate" class="form-control cssdate" runat="server"></asp:TextBox>
                                                    <%--<input type="text" class="form-control cssdate" name="BirthDate" id="txtBirthDate"/>--%>
                                                    <label>જન્મ તારીખ</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAadhaarNo" class="form-control" MaxLength="12" onchange="CheckAadhaarNoAlreadyExists()" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                                    <label>આધાર નંબર </label>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtEmail" class="form-control" onchange="CheckEmailAlreadyExists()" runat="server"></asp:TextBox>
                                                    <label>ઈ-મેઈલ</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtVoterID" class="form-control" onchange="CheckVoterIDAlreadyExists()" runat="server"></asp:TextBox>
                                                    <label>ચુંટણી કાર્ડ નંબર</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="divLast">

                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtMonthlySaving" onkeypress="return isDecimalKey(event);" class="form-control" runat="server"></asp:TextBox>
                                                        <label>માસિક બચત</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtSourceOfIncome" class="form-control" runat="server"></asp:TextBox>
                                                        <label>શા માંથી આવક?</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtBalanceAmount" onkeypress="return isDecimalKey(event);" class="form-control" runat="server"></asp:TextBox>
                                                        <label>કેટલા રૂપિયા છે?</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlSubCaste" runat="server" CssClass="form-control" onchange="NewCast()"></asp:DropDownList>
                                                        <label>જાતી </label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtNewSubCast" class="form-control" runat="server" onchange="CheckCastAlreadyExixt()"></asp:TextBox>
                                                        <label>જાતી</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtNewSubCastG" class="form-control" runat="server" onchange="CheckCastGAlreadyExixt()"></asp:TextBox>
                                                        <asp:HiddenField ID="hdnNewSubCast" runat="server" />
                                                        <label>જાતી(ગુજરાતી)</label>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlHouseType" CssClass="form-control" runat="server">
                                                            <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="કાચું" Value="કાચું"></asp:ListItem>
                                                            <asp:ListItem Text="પાકું" Value="પાકું"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label>મકાન </label>
                                                    </div>
                                                </div>

                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <span>આરોગ્યલક્ષી</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <div class="checkbox checkbox-styled">
                                                            <label>
                                                                <asp:CheckBox ID="chkToilet" runat="server" />
                                                                <span>શૌચાલય</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <div class="checkbox checkbox-styled">
                                                            <label>
                                                                <asp:CheckBox ID="chkBathroom" runat="server" />
                                                                <span>બાથરૂમ</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">

                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtPiyatYears" class="form-control" runat="server"></asp:TextBox>
                                                        <label>પિયત કેટલા વર્ષ થી કરો છો?</label>
                                                    </div>
                                                </div>

                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <span>પિયત હોય તો સાધનો</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <div class="checkbox checkbox-styled">
                                                            <label>
                                                                <asp:CheckBox ID="chkElectricMotor" runat="server" />
                                                                <span>ઇલેક્ટ્રીક મોટર</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <div class="checkbox checkbox-styled">
                                                            <label>
                                                                <asp:CheckBox ID="chkBorvel" runat="server" />
                                                                <span>બોરવેલ</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <div class="checkbox checkbox-styled">
                                                            <label>
                                                                <asp:CheckBox ID="chkKuvo" runat="server" />
                                                                <span>કુવો</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divBPL">
                                                    <div class="col-sm-1">
                                                        <div class="form-group ">
                                                            <div class="checkbox checkbox-styled">
                                                                <label>
                                                                    <asp:CheckBox ID="chkBPL" onchange="EnableDisableBPLNo();" runat="server" />
                                                                    <span>બી.પી.એલ ?</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="form-group ">
                                                            <asp:TextBox ID="txtBPLNo" class="form-control" runat="server"></asp:TextBox>
                                                            <label>બી.પી.એલ નંબર</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <div class="form-group ">
                                                            <asp:TextBox ID="txtTransferPlace" class="form-control" runat="server"></asp:TextBox>
                                                            <label>સ્થળાંતર</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="row">
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <span>પશુપાલન ની સંખ્યા</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtCow" class="form-control" runat="server"></asp:TextBox>
                                                        <label>ગાય</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtOxe" class="form-control" runat="server"></asp:TextBox>
                                                        <label>ભેંસ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtBuffelo" class="form-control" runat="server"></asp:TextBox>
                                                        <label>બળદ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtOther" class="form-control" runat="server"></asp:TextBox>
                                                        <label>અન્ય</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtRemarkOther" class="form-control" runat="server"></asp:TextBox>
                                                        <label>Remark</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <span>સાધન ની સંખ્યા</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtTwoWheeler" class="form-control" runat="server"></asp:TextBox>
                                                        <label>મોટર સાયકલ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtCarJeep" class="form-control" runat="server"></asp:TextBox>
                                                        <label>કાર/જીપ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtTruck" class="form-control" runat="server"></asp:TextBox>
                                                        <label>ટ્રક</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtTractor" class="form-control" runat="server"></asp:TextBox>
                                                        <label>ટ્રેકટર</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtVehicalOther" class="form-control" runat="server"></asp:TextBox>
                                                        <label>અન્ય</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtVehicalRemarkOther" class="form-control" runat="server"></asp:TextBox>
                                                        <label>Remark</label>
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
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="divSecond" style="display: none;">
                            <div class="tab-pane" id="second1">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtMemberNameSrch" class="form-control" runat="server"></asp:TextBox>
                                            <label>સભ્ય નામ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtHouseHoldNoSrch" class="form-control" runat="server"></asp:TextBox>
                                            <label>ઘરગથ્થું નંબર</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlVillageSrch" runat="server" CssClass="form-control select2-list"></asp:DropDownList>
                                            <label>ગામ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <button id="btnSearch" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                            સભ્ય શોધો</button>
                                        <input type="hidden" id="hdnFindMember" value="0" />
                                    </div>
                                </div>

                                <div class="row" id="divGrid" style="display: none;">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">

                                            <asp:GridView ID="gvMember" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                    <asp:BoundField DataField="HouseholdNo" HeaderText="ઘરગથ્થું નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="HouseholdNo"></asp:BoundField>
                                                    <asp:BoundField DataField="PersonCode" HeaderText="વ્યક્તિ કોડ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="PersonCode"></asp:BoundField>
                                                    <asp:BoundField DataField="AccountNo" HeaderText="ખાતા નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="AccountNo"></asp:BoundField>

                                                    <asp:BoundField DataField="FullNameG" HeaderText="નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FullNameG"></asp:BoundField>
                                                    <asp:BoundField DataField="FullAddressG" HeaderText="સરનામું" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FullAddressG"></asp:BoundField>

                                                    <asp:BoundField DataField="VillageNameG" HeaderText="ગામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="VillageNameG"></asp:BoundField>
                                                    <asp:BoundField DataField="AadharNo" HeaderText="આધાર નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="AadharNo"></asp:BoundField>


                                                    <asp:TemplateField>
                                                        <HeaderTemplate>કુટુંબ ની માહિતી</HeaderTemplate>
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="3%" />
                                                        <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>બ્લોક ની માહિતી</HeaderTemplate>
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="3%" />
                                                        <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                    </asp:TemplateField>
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
                                            <div class="Pager">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div id="divThird" style="display: none;">
                            <div class="tab-pane" id="third1">
                                <div class="row" id="divGrid2" style="display: none;">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">

                                            <asp:GridView ID="GVXYZ" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                    <asp:BoundField DataField="FullNameG" HeaderText="નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FullNameG"></asp:BoundField>
                                                    <asp:BoundField DataField="FullAddressG" HeaderText="સરનામું" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FullAddressG"></asp:BoundField>
                                                    <asp:BoundField DataField="PersonCode" HeaderText="વ્યક્તિ કોડ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="PersonCode"></asp:BoundField>
                                                    <asp:BoundField DataField="MobileNo1G" HeaderText="મોબઈલ ૧" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="MobileNo1G"></asp:BoundField>
                                                    <asp:BoundField DataField="AadharNo" HeaderText="આધાર નંબર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="AadharNo"></asp:BoundField>
                                                    <asp:BoundField DataField="EmailID" HeaderText="ઈ-મેલ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="EmailID"></asp:BoundField>

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

    <div class="modal" id="modalfollowup" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="border-radius: 8px; border-style: none;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>

                    <table style="width: 100%; font-size: 15px;">
                        <tr style="text-align: -webkit-center">
                            <td>
                                <table>
                                    <tr>
                                        <td style="font-weight: bold;">ઘરગથ્થુ નંબર:&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:Label runat="server" ID="lblHouseHoldNo"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold;">ખાતેદાર:&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:Label runat="server" ID="lblpersonname"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-body" id="followupdetail">
                    <div class="widget-box widget-color-blue" id="Div3">
                        <div class="widget-body">
                            <div class="widget-header" style="background-color: #0aa89e; color: white; height: 35px; border-radius: 6px">
                                <h4 class="widget-title bigger lighter ui-sortable-handle" style="font-weight: bold; padding-top: 10px; text-align: center">
                                    <i class="ace-icon fa fa-star"></i>
                                    બ્લોકની માહિતી
                                             <i class="ace-icon fa fa-star"></i>
                                </h4>
                            </div>
                            <div class="table-responsive">
                                <asp:GridView ID="gvBlockDetail" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું.નં." HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                        <asp:BoundField DataField="BlockNo" HeaderText="બ્લોક નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BlockNo"></asp:BoundField>
                                        <asp:BoundField DataField="Area" HeaderText="બ્લોક વિસ્તાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="Area"></asp:BoundField>
                                        <asp:BoundField DataField="FarmerName" HeaderText="ખેડૂતનું નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FarmerName"></asp:BoundField>
                                        <asp:BoundField DataField="VillageNameG" HeaderText="ગામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="VillageNameG"></asp:BoundField>
                                        <asp:BoundField DataField="CanalNameG" HeaderText="નહેર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="CanalNameG"></asp:BoundField>
                                        <asp:BoundField DataField="Outlet" HeaderText="ફાટો" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="Outlet"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>
        $(".Pager").on("click", '.page', function () {
            GridMemberMaster(parseInt($(this).attr('page')));
        });
        var rights = "";
        $(function () {
            SetMenu("liMaster", "ulMaster", "limembermaster", "aMemberMaster", "", "");

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aMemberMaster";
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

            $("#divFirst").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            $("#divGrid2").css({ 'display': "none" });

            $("[id*=litab1]").attr('class', 'active');

            document.getElementById("<%=this.ddlMemberType.ClientID %>").focus();

            document.getElementById("aTab3").style.pointerEvents = "none";
            $("#divFromdate").css({ 'display': "none" });
            $("#divVillage").css({ 'display': "none" });
            $("#divHH").css({ 'display': "none" });
            $("#divMemName").css({ 'display': "none" });
            $("#divMemSrch").css({ 'display': "none" });

            document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value = "";

            ListDistrict();
            ListTaluka(0, 0);
            ListVillage(0, 0);
            ListInstitute(0, 0);
            ListSubCaste();
            ListVillageForSrchMem();
            BindHouseHoldNo();

            document.getElementById("<%=this.txtAccountNo.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtBPLNo.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtBusiness.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtJob.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtMemName.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtPersonCode.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtNewSubCast.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtNewSubCastG.ClientID %>").disabled = true;
        });



        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("#divThird").css({ 'display': "none" });
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divThird").css({ 'display': "none" });
            ListVillageSearch();
        }

        function ViewDiv3() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "none" });
            $("#divThird").css({ 'display': "block" });
            $("#divGrid2").css({ 'display': "block" });
        }

        function ShowHideMemSrch() {
            var MemberType = document.getElementById("<%=this.ddlMemberType.ClientID %>");

            if (MemberType.value == "0") {
                $("#divVillage").css({ 'display': "none" });
                $("#divHH").css({ 'display': "none" });
                $("#divMemName").css({ 'display': "none" });
                //$("#divMemSrch").css({ 'display': "none" });
                $("#divFromdate").css({ 'display': "none" });
                ShowControls();
            }
            else if (MemberType.value == "1") {
                $("#divVillage").css({ 'display': "none" });
                $("#divHH").css({ 'display': "none" });
                $("#divMemName").css({ 'display': "none" });
                //$("#divMemSrch").css({ 'display': "none" });
                $("#divFromdate").css({ 'display': "block" });
                ShowControls();
            }
            else if (MemberType.value == "2") {
                $("#divVillage").css({ 'display': "block" });
                $("#divHH").css({ 'display': "block" });
                $("#divMemName").css({ 'display': "block" });
                //$("#divMemSrch").css({ 'display': "block" });
                $("#divFromdate").css({ 'display': "none" });
                HideControls();
            }

        }

        function HideControls() {
            $("#divDisTalVilInst").css({ 'display': "none" });
            $("#divAcNo").css({ 'display': "none" });
            $("#divBPL").css({ 'display': "none" });
            $("#divLast").css({ 'display': "none" });


        }
        function ShowControls() {
            $("#divDisTalVilInst").css({ 'display': "block" });
            $("#divAcNo").css({ 'display': "block" });
            $("#divBPL").css({ 'display': "block" });
            $("#divLast").css({ 'display': "block" });
        }

        function ListVillageSearch() {

            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/ListVillageSearch",
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




        

    function ListDistrict() {

        $.ajax({
            type: "POST",
            url: "CommonMethods.aspx/ListDistrict",
            data: '{}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var ddlCategory = $("[id*=ddlDistrict]");
                $("[id*=ddlDistrict]").empty();
                $.each(r.d, function () {
                    ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
        });
        return false;
    }


    function BindTaluka() {
        ListTaluka(document.getElementById("<%=this.ddlDistrict.ClientID %>").value, 0);
        if (document.getElementById("<%=this.ddlDistrict.ClientID %>").value == 0) {
            ListTaluka(0, 0);
            ListVillage(0, 0);
        }
        else {
            ListVillage(0, 0);
        }
    }

    function ListTaluka(DistrictID, selectedDistrictID) {

        $.ajax({
            type: "POST",
            url: "CommonMethods.aspx/ListTaluka",
            data: '{ DistrictID: ' + DistrictID + '}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var ddlCategory = $("[id*=ddlTaluka]");
                $("[id*=ddlTaluka]").empty();
                $.each(r.d, function () {
                    if (selectedDistrictID == this['Value'])
                        ddlCategory.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                    else
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
        });
        return false;
    }

    function ListVillageForSrchMem() {
        $.ajax({
            type: "POST",
            url: "MemberMaster.aspx/ListVillageForSrchMem",
            data: '{}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var ddlCategory = $("[id=ContentPlaceHolder1_ddlVillageForSrchMem]");
                $("[id=ContentPlaceHolder1_ddlVillageForSrchMem]").empty();
                $.each(r.d, function () {
                    ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
        });
        return false;
    }

    function BindHouseHoldNo() {
        var VillageID = document.getElementById("<%=this.ddlVillageForSrchMem.ClientID %>").value;
       

        $.ajax({
            type: "POST",
            url: "MemberMaster.aspx/ListHouseHoldNoFromVillage",
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

    function SrchMember() {

        var MemberID = document.getElementById("<%=this.ddlHouseHoldNo.ClientID %>").value;
        var ddlHouseHold = document.getElementById("<%=this.ddlHouseHoldNo.ClientID %>").value;

        if (MemberID == "0") {
            document.getElementById("<%=this.txtMemName.ClientID %>").value = "";
            document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value = "";
        }
        else
        {
            $.ajax({
                type: "POST",
                url: "Membermaster.aspx/GetMember",
                data: '{MemberID: "' + MemberID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var res = response.d;

                    if (res.length > 0) {

                        document.getElementById("<%=this.txtMemName.ClientID %>").value = res[0].FullName;
                        document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value = res[0].hdnMemberIDForFamily;
                        return true;
                    }
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

    function BindVillage() {
        ListVillage(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlTaluka.ClientID %>").value == 0) {
                ListVillage(0, 0);
            }
        }

        function ListVillage(TalukaID, selectedVillageID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListVillage",
                data: '{TalukaID: ' + TalukaID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlVillage]");
                    $("[id*=ddlVillage]").empty();
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

        function ListInstitute() {

            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/ListInstitute",
                data: '{}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlCategory = $("[id*=ddlInstitute]");
                    $("[id*=ddlInstitute]").empty();

                    $.each(r.d, function () {
                        ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }


        function EnableDisableBPLNo() {

            var chkValue = document.getElementById("<%=this.chkBPL.ClientID %>");

            if (chkValue.checked == true) {
                document.getElementById("<%=this.txtBPLNo.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtBPLNo.ClientID %>").focus();
        }
        else {
            document.getElementById("<%=this.txtBPLNo.ClientID %>").disabled = true;
        }
    }

    function EnableDisableBusinessJob() {

        var rbtBusiness = document.getElementById("<%=this.rbtBusiness.ClientID %>");

        if (rbtBusiness.checked == true) {
            document.getElementById("<%=this.txtBusiness.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtJob.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtBusiness.ClientID %>").focus();
        }
        else {
            document.getElementById("<%=this.txtBusiness.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtJob.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtJob.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtJob.ClientID %>").focus();
        }
    }

    function CheckMandali() {

        var ddlMandali = document.getElementById("<%=this.ddlInstitute.ClientID %>");

        var strUser = ddlMandali.options[ddlMandali.selectedIndex].text;

        if (strUser == "મંડળીનો સભ્ય નથી") {
            $("#divFromdate").css({ 'display': "none" });
        }
        else {
            $("#divFromdate").css({ 'display': "block" });
        }
    }

    function NewCast() {

        var ddlSubCaste = document.getElementById("<%=this.ddlSubCaste.ClientID %>");

        var strUser = ddlSubCaste.options[ddlSubCaste.selectedIndex].text;

        if (strUser == "અન્ય") {
            document.getElementById("<%=this.txtNewSubCast.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtNewSubCastG.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtNewSubCast.ClientID %>").focus();

        }
        else {
            document.getElementById("<%=this.txtNewSubCast.ClientID %>").value = "";
            document.getElementById("<%=this.txtNewSubCastG.ClientID %>").value = "";
            document.getElementById("<%=this.txtNewSubCast.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtNewSubCastG.ClientID %>").disabled = true;
        }
    }
    function ListSubCaste() {

        $.ajax({
            type: "POST",
            url: "CommonMethods.aspx/ListSubCaste",
            data: '{}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                var ddlCategory = $("[id*=ddlSubCaste]");
                $("[id*=ddlSubCaste]").empty();
                $.each(r.d, function () {
                    ddlCategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
        });
        return false;
    }


    $(function () {

        $("#btnReset").bind("click", function () {
            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading...");
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

            var MemberType = document.getElementById("<%=this.ddlMemberType.ClientID %>");
                var MemberID = document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>");
            
                var MemName = document.getElementById("<%=this.txtMemName.ClientID %>");

                var District = document.getElementById("<%=this.ddlDistrict.ClientID %>");
                var Taluka = document.getElementById("<%=this.ddlTaluka.ClientID %>");
                var Village = document.getElementById("<%=this.ddlVillage.ClientID %>");
                var Institute = document.getElementById("<%=this.ddlInstitute.ClientID %>");
                var AccountNo = document.getElementById("<%=this.txtAccountNo.ClientID %>");
                var CurrentAccountNo = document.getElementById("<%=this.txtCurrentAccountNo.ClientID %>");
                var PersonCode = document.getElementById("<%=this.txtPersonCode.ClientID %>");
                var FName = document.getElementById("<%=this.txtFName.ClientID %>");
                var MName = document.getElementById("<%=this.txtMName.ClientID %>");
                var LName = document.getElementById("<%=this.txtLName.ClientID %>");
                var FNameG = document.getElementById("<%=this.txtFNameG.ClientID %>");
                var MNameG = document.getElementById("<%=this.txtMNameG.ClientID %>");
                var LNameG = document.getElementById("<%=this.txtLNameG.ClientID %>");
                var Add1 = document.getElementById("<%=this.txtAdd1.ClientID %>");
                var Add2 = document.getElementById("<%=this.txtAdd2.ClientID %>");
                var Add3 = document.getElementById("<%=this.txtAdd3.ClientID %>");
                var Add1G = document.getElementById("<%=this.txtAdd1G.ClientID %>");
                var Add2G = document.getElementById("<%=this.txtAdd2G.ClientID %>");
                var Add3G = document.getElementById("<%=this.txtAdd3G.ClientID %>");
                var Mobile1 = document.getElementById("<%=this.txtMobile1.ClientID %>");
                var Mobile1G = document.getElementById("<%=this.txtMobile1G.ClientID %>");
                var Mobile2 = document.getElementById("<%=this.txtMobile2.ClientID %>");
                var Mobile2G = document.getElementById("<%=this.txtMobile2G.ClientID %>");
                var rbtMale = document.getElementById("<%=this.rbtMale.ClientID %>");
                var rbtFeMale = document.getElementById("<%=this.rbtFeMale.ClientID %>");
                var rbtBusiness = document.getElementById("<%=this.rbtBusiness.ClientID %>");
                var Business = document.getElementById("<%=this.txtBusiness.ClientID %>");
                var rbtJob = document.getElementById("<%=this.rbtJob.ClientID %>");
                var Job = document.getElementById("<%=this.txtJob.ClientID %>");
                var chkBPL = document.getElementById("<%=this.chkBPL.ClientID %>");
                var BPLNo = document.getElementById("<%=this.txtBPLNo.ClientID %>");
                var AadhaarNo = document.getElementById("<%=this.txtAadhaarNo.ClientID %>");
                var Email = document.getElementById("<%=this.txtEmail.ClientID %>");
                var SubCaste = document.getElementById("<%=this.ddlSubCaste.ClientID %>");
                var HouseType = document.getElementById("<%=this.ddlHouseType.ClientID %>");
                var NewSubCast = document.getElementById("<%=this.txtNewSubCast.ClientID %>").value;
                var NewSubCastG = document.getElementById("<%=this.txtNewSubCastG.ClientID %>").value;
                var VehicaleOther = document.getElementById("<%=this.txtVehicalOther.ClientID %>").value;
                var VehicalRemarkOther = document.getElementById("<%=this.txtVehicalRemarkOther.ClientID %>").value;
            var MemDat = document.getElementById("<%=this.txtMembershipDate.ClientID %>");

            var Village = document.getElementById("<%=this.ddlVillageForSrchMem.ClientID %>");
            var HouseHold = document.getElementById("<%=this.ddlHouseHoldNo.ClientID %>");
            

                var Emailfilter = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var abcd = document.getElementById("<%=this.ddlInstitute.ClientID %>");
                var strUser = abcd.options[abcd.selectedIndex].text;

                if (MemberType.value == "0") {
                    MemberType.focus();
                    swal("", "સભ્ય પ્રકાર પસંદ કરો", "warning");
                    return false;
                }
                else if (MemberType.value == "2" && Village.value == "0") {
                    Village.focus();
                    swal("", "ગામ પસંદ કરો", "warning");
                    return false;
                }
                else if (MemberType.value == "2" && HouseHold.value == "0") {
                    HouseHold.focus();
                    swal("", "ઘરગથ્થુ પસંદ કરો", "warning");
                    return false;
                }
                else if (District.value == "0" && MemberType.value == "1") {
                    District.focus();
                    swal("", "જિલ્લો પસંદ કરો", "warning");
                    return false;
                }
                else if (Taluka.value == "0" && MemberType.value == "1") {
                    Taluka.focus();
                    swal("", "તાલુંકો પસંદ કરો", "warning");
                    return false;
                }
                else if (Village.value == "0" && MemberType.value == "1") {
                    Village.focus();
                    swal("", "ગામ પસંદ કરો", "warning");
                    return false;
                }
                else if (Institute.value == "0" && MemberType.value == "1") {
                    Institute.focus();
                    swal("", "પિયત મંડળી પસંદ કરો", "warning");
                    return false;
                }
                else if (strUser != "મંડળીનો સભ્ય નથી" && MemDat.value == "" && MemberType.value == "1") {
                    MemDat.focus();
                    swal("", "સભ્યસ્પદની તારીખ પસંદ કરો", "warning");
                    return false;
                }
                else if (FName.value == "") {
                    FName.focus();
                    swal("", "પ્રથમ નામ દાખલ કરો", "warning");
                    return false;
                }
                else if (MName.value == "") {
                    MName.focus();
                    swal("", "પિતા/વાલી/પતિનું નામ દાખલ કરો", "warning");
                    return false;
                }
                else if (LName.value == "") {
                    LName.focus();
                    swal("", "અટક દાખલ કરો", "warning");
                    return false;
                }
                else if (FNameG.value == "") {
                    FNameG.focus();
                    swal("", "પ્રથમ નામ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (MNameG.value == "") {
                    MNameG.focus();
                    swal("", "પિતા/વાલી/પતિનું નામ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (LNameG.value == "") {
                    LNameG.focus();
                    swal("", "અટક દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (Add1.value == "") {
                    Add1.focus();
                    swal("", "સરનામુ ૧ દાખલ કરો", "warning");
                    return false;
                }
                else if (Add2.value == "") {
                    Add2.focus();
                    swal("", "સરનામુ ૨ દાખલ કરો", "warning");
                    return false;
                }
                else if (Add3.value == "") {
                    Add3.focus();
                    swal("", "સરનામુ ૩ દાખલ કરો", "warning");
                    return false;
                }
                else if (Add1G.value == "") {
                    Add1G.focus();
                    swal("", "સરનામુ ૧ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (Add2G.value == "") {
                    Add2G.focus();
                    swal("", "સરનામુ ૨ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (Add3G.value == "") {
                    Add3G.focus();
                    swal("", "સરનામુ ૩ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                  
                else if (Mobile1.value != "" && Mobile1.value.length < 10) {
                    Mobile1.focus();
                    swal("", "માન્ય મોબઈલ નંબર ૧ દાખલ કરો", "warning");
                    return false;
                }
                else if (Mobile1.value != "" && Mobile1G == "") {
                    Mobile1G.focus();
                    swal("", "મોબાઇલ ૧ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                   
                else if (Mobile1G.value != "" && Mobile1G.value.length < 10) {
                    Mobile1G.focus();
                    swal("", "માન્ય મોબઈલ નંબર ૧ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (Mobile2.value != "" && Mobile2.value.length < 10) {
                    Mobile2.focus();
                    swal("", "માન્ય મોબઈલ નંબર ૨ દાખલ કરો", "warning");
                    return false;
                }
                else if (Mobile2.value != "" && Mobile2G == "") {
                    Mobile2G.focus();
                    swal("", "મોબાઇલ ૨ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }

                else if (Mobile2G.value != "" && Mobile2G.value.length < 10) {
                    Mobile2G.focus();
                    swal("", "માન્ય મોબઈલ નંબર ૨ દાખલ કરો (ગુજરાતી)", "warning");
                    return false;
                }
                else if (rbtFeMale.checked == false && rbtMale.checked == false) {
                    swal("", "સ્ત્રી / પુરૂષ પસંદ કરો", "warning");
                    return false;
                }
                else if (rbtBusiness.checked == true && Business.value == "") {
                    swal("", "ધંધો દાખલ કરો", "warning");
                    return false;
                }
                else if (rbtJob.checked == true && Job.value == "") {
                    swal("", "નોકરી દાખલ કરો", "warning");
                    return false;
                }
                else if (chkBPL.checked == true && BPLNo.value == "" && MemberType.value == "1") {
                    swal("", "બી.પી.એલ નંબર દાખલ કરો", "warning");
                    return false;
                }
                    
                else if (Email.value != "" && Emailfilter.test(Email.value) == false) {
                    swal("", "માન્ય ઈ-મેલ દાખલ કરો", "warning");                
                    Email.focus();
                    return false;
                }
                else if (SubCaste.value == "0" && MemberType.value == "1") {
                    SubCaste.focus();
                    swal("", "જાતી પસંદ કરો", "warning");
                    return false;
                }
                else if (HouseType.value == "0" && MemberType.value == "1") {
                    HouseType.focus();
                    swal("", "મકાન પસંદ કરો", "warning");

                    return false;
                }
                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    var member = {};
                    member.MemberType = document.getElementById("<%=this.ddlMemberType.ClientID %>").value;

                    member.DistrictID = document.getElementById("<%=this.ddlDistrict.ClientID %>").value;
                    member.TalukaID = document.getElementById("<%=this.ddlTaluka.ClientID %>").value;
                    member.SectionVillageMappingID = document.getElementById("<%=this.ddlVillage.ClientID %>").value;

                    member.InstituteID = document.getElementById("<%=this.ddlInstitute.ClientID %>").value;

                    member.HouseholdNo = document.getElementById("<%=this.txtHouseholdNo.ClientID %>").value;
                    member.PersonCode = document.getElementById("<%=this.txtPersonCode.ClientID %>").value;
                    member.AccountNo = document.getElementById("<%=this.txtAccountNo.ClientID %>").value;
                    member.CurrentAccountNo = document.getElementById("<%=this.txtCurrentAccountNo.ClientID %>").value;

                    member.FName = document.getElementById("<%=this.txtFName.ClientID %>").value;
                    member.MName = document.getElementById("<%=this.txtMName.ClientID %>").value;
                    member.LName = document.getElementById("<%=this.txtLName.ClientID %>").value;

                    member.FNameG = document.getElementById("<%=this.txtFNameG.ClientID %>").value;
                    member.MNameG = document.getElementById("<%=this.txtMNameG.ClientID %>").value;
                    member.LNameG = document.getElementById("<%=this.txtLNameG.ClientID %>").value;

                    member.Add1 = document.getElementById("<%=this.txtAdd1.ClientID %>").value;
                    member.Add2 = document.getElementById("<%=this.txtAdd2.ClientID %>").value;
                    member.Add3 = document.getElementById("<%=this.txtAdd3.ClientID %>").value;

                    member.Add1G = document.getElementById("<%=this.txtAdd1G.ClientID %>").value;
                    member.Add2G = document.getElementById("<%=this.txtAdd2G.ClientID %>").value;
                    member.Add3G = document.getElementById("<%=this.txtAdd3G.ClientID %>").value;

                    member.Mobile1 = document.getElementById("<%=this.txtMobile1.ClientID %>").value;
                    member.Mobile1G = document.getElementById("<%=this.txtMobile1G.ClientID %>").value;
                    member.Mobile2 = document.getElementById("<%=this.txtMobile2.ClientID %>").value;
                    member.Mobile2G = document.getElementById("<%=this.txtMobile2G.ClientID %>").value;

                    member.rbtMale = document.getElementById("<%=this.rbtMale.ClientID %>").checked;
                    member.rbtFeMale = document.getElementById("<%=this.rbtFeMale.ClientID %>").checked;

                    member.BirthDate = document.getElementById("<%=this.txtBirthDate.ClientID %>").value;
                    //member.BirthDate = document.getElementById("txtBirthDate").value;

                    member.AadhaarNo = document.getElementById("<%=this.txtAadhaarNo.ClientID %>").value;
                    member.Email = document.getElementById("<%=this.txtEmail.ClientID %>").value;

                    member.chkBPL = document.getElementById("<%=this.chkBPL.ClientID %>").checked;
                    member.BPLNo = document.getElementById("<%=this.txtBPLNo.ClientID %>").value;

                    member.chkToilet = document.getElementById("<%=this.chkToilet.ClientID %>").checked;
                    member.chkBathroom = document.getElementById("<%=this.chkBathroom.ClientID %>").checked;

                    member.VoterID = document.getElementById("<%=this.txtVoterID.ClientID %>").value;

                    if (document.getElementById("<%=this.txtMonthlySaving.ClientID %>").value == 0) {
                        member.MonthlySaving = "0";
                    }
                    else {
                        member.MonthlySaving = document.getElementById("<%=this.txtMonthlySaving.ClientID %>").value;
                    }

                    if (document.getElementById("<%=this.txtSourceOfIncome.ClientID %>").value == 0) {
                        member.SourceOfIncome = "0";
                    }
                    else {
                        member.SourceOfIncome = document.getElementById("<%=this.txtSourceOfIncome.ClientID %>").value;
                    }

                    if (document.getElementById("<%=this.txtBalanceAmount.ClientID %>").value == 0) {
                        member.BalanceAmount = "0";
                    }
                    else {
                        member.BalanceAmount = document.getElementById("<%=this.txtBalanceAmount.ClientID %>").value;
                        }

                        if (document.getElementById("<%=this.txtPiyatYears.ClientID %>").value == 0) {
                        member.PiyatYears = "0";
                    }
                    else {
                        member.PiyatYears = document.getElementById("<%=this.txtPiyatYears.ClientID %>").value;
                        }

                        member.chkElectricMotor = document.getElementById("<%=this.chkElectricMotor.ClientID %>").checked;
                    member.chkKuvo = document.getElementById("<%=this.chkKuvo.ClientID %>").checked;
                    member.chkBorvel = document.getElementById("<%=this.chkBorvel.ClientID %>").checked;

                    member.TransferPlace = document.getElementById("<%=this.txtTransferPlace.ClientID %>").value;

                    if (document.getElementById("<%=this.txtNewSubCast.ClientID %>").value == 0) {
                        member.SubCasteID = document.getElementById("<%=this.ddlSubCaste.ClientID %>").value;
                    }
                    else {
                        member.NewSubCast = document.getElementById("<%=this.txtNewSubCast.ClientID %>").value;
                        member.NewSubCastG = document.getElementById("<%=this.txtNewSubCastG.ClientID %>").value;
                    }
                    member.Business = document.getElementById("<%=this.txtBusiness.ClientID %>").value;
                    member.Job = document.getElementById("<%=this.txtJob.ClientID %>").value;

                    member.TwoWheeler = document.getElementById("<%=this.txtTwoWheeler.ClientID %>").value;
                    member.CarJeep = document.getElementById("<%=this.txtCarJeep.ClientID %>").value;
                    member.Truck = document.getElementById("<%=this.txtTruck.ClientID %>").value;
                    member.Tractor = document.getElementById("<%=this.txtTractor.ClientID %>").value;

                    member.Cow = document.getElementById("<%=this.txtCow.ClientID %>").value;
                    member.Oxe = document.getElementById("<%=this.txtOxe.ClientID %>").value;
                    member.Buffelo = document.getElementById("<%=this.txtBuffelo.ClientID %>").value;
                    member.Other = document.getElementById("<%=this.txtOther.ClientID %>").value;

                    member.HouseType = document.getElementById("<%=this.ddlHouseType.ClientID %>").value;

                    member.RemarkOther = document.getElementById("<%=this.txtRemarkOther.ClientID %>").value;

                    member.VehicalOther = document.getElementById("<%=this.txtVehicalOther.ClientID %>").value;
                    member.VehicalRemarkOther = document.getElementById("<%=this.txtVehicalRemarkOther.ClientID %>").value;


                    var ddlMandali = document.getElementById("<%=this.ddlInstitute.ClientID %>");

                    var strUser = ddlMandali.options[ddlMandali.selectedIndex].text;

                    if (strUser != "મંડળીનો સભ્ય નથી") {
                        member.MembershipDate = document.getElementById("<%=this.txtMembershipDate.ClientID %>").value;
                    }
                    else {
                        member.MembershipDate = "";
                    }

                    var mid = document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value;
                    var midupdate = document.getElementById("<%=this.hdnMemberID.ClientID %>").value;

                    if (mid == "") {
                        member.MemberID = 0;
                    }
                    else {
                        member.MemberID = mid;
                    }

                    if (midupdate == "") {
                        member.IsEdit = 0;
                    }
                    else {
                        member.IsEdit = midupdate;
                    }

                    $.ajax({
                        type: "POST",
                        url: "MemberMaster.aspx/MemberManage",
                        data: '{member: ' + JSON.stringify(member) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                            }
                            else {

                                if ($("#hdnSubmitVal").val() == "1") {
                                    $("[id*=btnSave]").html("દાખલ કરો");
                                    $("[id*=btnSave]").removeAttr('disabled');
                                    $("#hdnSubmitVal").val(0);
                                }
                                if (member.MemberID == 0) {
                                    var PCodeNdAcNo = msg;
                                    var arr = PCodeNdAcNo.split(",");
                                    var pcode = arr[0];
                                    var acno = arr[1];
                                }
                                else {
                                    var personcode = msg;
                                }

                                if (member.MemberID == 0) {
                                    if (member.IsEdit == 0) {
                                        swal({
                                            title: "Done!",
                                            text: "સભ્યની માહિતી દાખલ થઇ છે.",
                                            type: "success",
                                            confirmButtonText: "Ok",
                                            closeOnConfirm: false
                                        },
                                                  function () {
                                                      swal("તમારો નવો વ્યક્તિકોડ અને ખાતાનંબર નીચે મુજબ છે.", 'વ્યક્તિ કોડ:' + ' ' + pcode + '\n' + 'ખાતા નંબર:' + ' ' + acno + "", "success");
                                                  });

                                    }
                                    else {

                                        swal("Done!", "સભ્યની માહિતી સુધારાઈ ગઇ છે.", "success");
                                    }
                                }
                                else {
                                    if (member.IsEdit == 0) {
                                        swal({
                                            title: "Done!",
                                            text: "કુટુંબના સભ્યની માહિતી દાખલ થઇ છે.",
                                            type: "success",
                                            confirmButtonText: "Ok",
                                            closeOnConfirm: false
                                        },
                                                      function () {
                                                          swal("", 'તમારો નવો વ્યક્તિકોડ નીચે મુજબ છે.' + '\n' + 'વ્યક્તિ કોડ:' + ' ' + personcode + '\n', "success");
                                                      });

                                    }
                                    else {

                                        swal("Done!", "કુટુંબના સભ્યની માહિતી સુધારાઈ ગઇ છે.", "success");
                                    }
                                }
                            }

                            //GridMemberMaster(1);
                            ClearAll();
                            ShowHideMemSrch();
                            return false;


                        }
                    });

                    return false;
                }
            });
        });

$(function () {
    $("#btnSearch").bind("click", function () {
        $("#divGrid").css({ 'display': "block" });
        $("[id*=btnSearch]").html("<i class='fa fa-spinner fa-spin'></i> Loading...");
        $("[id*=btnSearch]").attr('disabled', 'disabled');
        $("#hdnFindMember").val("1");
        GridMemberMaster(1);
        if ($("#hdnFindMember").val() == "1") {
            $("[id*=btnSearch]").html("સભ્ય શોધો");
            $("[id*=btnSearch]").removeAttr('disabled');
            $("#hdnFindMember").val(0);
        }
    })
});

function SearchMemberNameTerm() {
    return jQuery.trim($("[id=ContentPlaceHolder1_txtMemberNameSrch]").val());
};

function SearchHouseHoldNoTerm() {
    return jQuery.trim($("[id=ContentPlaceHolder1_txtHouseHoldNoSrch]").val());
};

function GridMemberMaster(pageIndex) {

    $.ajax({
        type: "POST",
        url: "MemberMaster.aspx/GetAllMember",
        data: '{SearchMemberNameTerm: "' + SearchMemberNameTerm() + '",SearchHouseHoldNoTerm: "' + SearchHouseHoldNoTerm() + '",pageIndex: ' + pageIndex + ',VillageID : ' + $("[id=ContentPlaceHolder1_ddlVillageSrch]").val() + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnGridSuccessMemberMaster,
        failure: function (response) {
            swal(response.d);
        },
        error: function (response) {
            swal(response.d);
        }
    });

}
var myrowl;
function OnGridSuccessMemberMaster(response) {
    
    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);

    var customers = xml.find("MemberMaster");

    if (myrowl == null) {
        myrowl = $("[id*=gvMember] tr:last-child").clone(true);
    }
    $("[id*=gvMember] tr").not($("[id*=gvMember] tr:first-child")).remove();

    if (customers.length > 0) {

        if ($("td", myrowl).length < 6) {
            $("td", myrowl).eq(0).removeAttr("colspan");
            myrowl.append('<td></td>');
            myrowl.append('<td></td>');
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
            $("td", myrowl).eq(1).html($('<a href="#" onclick="return GetBlockDetail(' + $(this).find("MemberID").text() + ',\'' + $(this).find("FullNameG").text() + '\',\'' + $(this).find("HouseholdNo").text() + '\');">' + $(this).find("HouseholdNo").text() + '</a>'));
            $("td", myrowl).eq(2).html($(this).find("PersonCode").text());
            $("td", myrowl).eq(3).html($(this).find("AccountNo").text());
            $("td", myrowl).eq(4).html($(this).find("FullNameG").text());
            $("td", myrowl).eq(5).html($(this).find("FullAddressG").text());
            $("td", myrowl).eq(6).html($(this).find("VillageNameG").text());
            $("td", myrowl).eq(7).html($(this).find("AadharNo").text());
            $("td", myrowl).eq(8).html($('<a class="btn btn-flat ink-reaction btn-default"  onclick="return GridMemberDetail(' + $(this).find("MemberID").text() + ');">કુટુંબ ની માહિતી</a>'));
            $("td", myrowl).eq(9).html($('<a class="btn btn-flat ink-reaction btn-default"  onclick="return BlockDetail(' + $(this).find("MemberID").text() + ');">બ્લોક ની માહિતી</a>'));
            if (jQuery.inArray("2", rights) != '-1') {
                $("td", myrowl).eq(10).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditMember(' + $(this).find("MemberID").text() + ');"><i class="fa fa-edit"></i></a>'));
            }
            else { $("td", myrowl).eq(10).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }


            if (jQuery.inArray("3", rights) != '-1') {
                $("td", myrowl).eq(11).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteMember(' + $(this).find("MemberID").text() + ');"><i class="fa fa-trash"></i></a>'));
            }
            else { $("td", myrowl).eq(11).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

            $("[id*=gvMember]").append(myrowl);
            myrowl = $("[id*=gvMember] tr:last-child").clone(true);
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
        $("[id*=gvMember]").append(empty_row);
    }
};
function GetBlockDetail(MemberId, Name, HouseholdNo) {

    //document.getElementById('ContentPlaceHolder1_lblpersonname').innerHTML = 'ઘરગથ્થુ નંબર: ' + HouseholdNo + '<br>   નામ: ' + Name;
    document.getElementById('ContentPlaceHolder1_lblpersonname').innerHTML = Name;
    document.getElementById('ContentPlaceHolder1_lblHouseHoldNo').innerHTML = HouseholdNo;

    $.ajax({
        type: "POST",
        url: "MemberMaster.aspx/GetPersonBlockDetail",
        data: '{MemberId: "' + MemberId + '"}',
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
var myrow;
function OnGridSuccessPopUpGrid(response) {

    $('#modalfollowup').modal('toggle');
    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);
    var BlockDe1 = xml.find("BD1");
    if (myrow == null) {
        myrow = $("[id*=gvBlockDetail] tr:last-child").clone(true);
    }
    $("[id*=gvBlockDetail] tr").not($("[id*=gvBlockDetail] tr:first-child")).remove();
    if (BlockDe1.length > 0) {

        $.each(BlockDe1, function () {
            var customer1 = $(this);

            $("td", myrow).eq(0).html($(this).find("RowNumber").text());
            $("td", myrow).eq(1).html($(this).find("BlockNo").text());
            $("td", myrow).eq(2).html($(this).find("Area").text());
            $("td", myrow).eq(3).html($(this).find("FarmerName").text());
            $("td", myrow).eq(4).html($(this).find("VillageNameG").text());
            $("td", myrow).eq(5).html($(this).find("CanalNameG").text());
            $("td", myrow).eq(6).html($(this).find("Outlet").text());

            $("[id*=gvBlockDetail]").append(myrow);
            myrow = $("[id*=gvBlockDetail] tr:last-child").clone(true);
        });
    }
    else {

        var empty_row1 = myrow.clone(true);

        $("td:first-child", empty_row1).attr("colspan", $("td", myrow).length);
        $("td:first-child", empty_row1).attr("align", "center");
        $("td:first-child", empty_row1).html("No records found.");
        $("td", empty_row1).not($("td:first-child", empty_row1)).remove();
        $("[id*=gvBlockDetail]").append(empty_row1);

    }

};
function BlockDetail(memberid) {
    window.open('MemberBlockDetail.aspx?Mid=' + memberid, '_blank');
}

function DeleteMember(memberid) {


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
            url: "MemberMaster.aspx/DeleteMemberMaster",
            data: '{MemberID : ' + memberid + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var msg = response.d;

                if (msg.indexOf("Error") > -1) {
                    swal(msg);
                }
                else {
                    swal("Deleted!", msg, "success");
                    GridMemberMaster(1);
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





function EditMember(memberid) {

    $.ajax({
        type: "POST",
        url: "MemberMaster.aspx/GetMemberMasterByID",
        data: '{MemberID: "' + JSON.stringify(memberid) + '"}',
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

    document.getElementById("<%=this.ddlMemberType.ClientID %>").value = 1;
    document.getElementById("<%=this.hdnMemberID.ClientID %>").value = res[0].MemberID;
    document.getElementById("<%=this.ddlDistrict.ClientID %>").value = res[0].DistrictID;
    document.getElementById("<%=this.txtPersonCode.ClientID %>").value = res[0].PersonCode;

    ListTaluka(res[0].DistrictID, res[0].TalukaID);
    ListVillage(res[0].TalukaID, res[0].SectionVillageMappingID);

    document.getElementById("<%=this.ddlInstitute.ClientID %>").value = res[0].InstituteID;

    $("[id=ContentPlaceHolder1_txtHouseholdNo]").attr('title', res[0].HouseholdNo);

    document.getElementById("<%=this.txtHouseholdNo.ClientID %>").value = res[0].HouseholdNo;
    document.getElementById("<%=this.txtPersonCode.ClientID %>").value = res[0].PersonCode;
    document.getElementById("<%=this.txtAccountNo.ClientID %>").value = res[0].AccountNo;

    $("[id=ContentPlaceHolder1_txtCurrentAccountNo]").attr('title', res[0].CurrentAccountNo);

    document.getElementById("<%=this.txtCurrentAccountNo.ClientID %>").value = res[0].CurrentAccountNo;

    document.getElementById("<%=this.txtMembershipDate.ClientID %>").value = res[0].MembershipDate;

    document.getElementById("<%=this.txtFName.ClientID %>").value = res[0].FName;
    document.getElementById("<%=this.txtMName.ClientID %>").value = res[0].MName;
    document.getElementById("<%=this.txtLName.ClientID %>").value = res[0].LName;

    document.getElementById("<%=this.txtFNameG.ClientID %>").value = res[0].FNameG;
    document.getElementById("<%=this.txtMNameG.ClientID %>").value = res[0].MNameG;
    document.getElementById("<%=this.txtLNameG.ClientID %>").value = res[0].LNameG;

    document.getElementById("<%=this.txtAdd1.ClientID %>").value = res[0].Add1;
    document.getElementById("<%=this.txtAdd2.ClientID %>").value = res[0].Add2;
    document.getElementById("<%=this.txtAdd3.ClientID %>").value = res[0].Add3;

    document.getElementById("<%=this.txtAdd1G.ClientID %>").value = res[0].Add1G;
    document.getElementById("<%=this.txtAdd2G.ClientID %>").value = res[0].Add2G;
    document.getElementById("<%=this.txtAdd3G.ClientID %>").value = res[0].Add3G;

    $("[id=ContentPlaceHolder1_txtMobile1]").attr('title', res[0].Mobile1);
    document.getElementById("<%=this.txtMobile1.ClientID %>").value = res[0].Mobile1;
    $("[id=ContentPlaceHolder1_txtMobile1G]").attr('title', res[0].Mobile1G);
    document.getElementById("<%=this.txtMobile1G.ClientID %>").value = res[0].Mobile1G;
    $("[id=ContentPlaceHolder1_txtMobile2]").attr('title', res[0].Mobile2);
    document.getElementById("<%=this.txtMobile2.ClientID %>").value = res[0].Mobile2;
    $("[id=ContentPlaceHolder1_txtMobile2G]").attr('title', res[0].Mobile2G);
    document.getElementById("<%=this.txtMobile2G.ClientID %>").value = res[0].Mobile2G;

    if (res[0].Gender == "M") {
        document.getElementById("<%=this.rbtMale.ClientID %>").checked = true;
    }
    else if (res[0].Gender == "F") {
        document.getElementById("<%=this.rbtFeMale.ClientID %>").checked = true;
    }

    document.getElementById("<%=this.txtBirthDate.ClientID %>").value = res[0].BirthDate;

    //document.getElementById("txtBirthDate").value = res[0].BirthDate;


    //$("[id*=txtBirthDate]").val(res[0].BirthDate);
    //alert(res[0].BirthDate);
    //alert($("[id=txtBirthDate]").val());


    $("[id=ContentPlaceHolder1_txtAadhaarNo]").attr('title', res[0].AadhaarNo);
    document.getElementById("<%=this.txtAadhaarNo.ClientID %>").value = res[0].AadhaarNo;

    $("[id=ContentPlaceHolder1_txtEmail]").attr('title', res[0].Email);
    document.getElementById("<%=this.txtEmail.ClientID %>").value = res[0].Email;

    document.getElementById("<%=this.chkBPL.ClientID %>").checked = res[0].chkBPL;
    document.getElementById("<%=this.txtBPLNo.ClientID %>").value = res[0].BPLNo;

    document.getElementById("<%=this.chkToilet.ClientID %>").checked = res[0].chkToilet;
    document.getElementById("<%=this.chkBathroom.ClientID %>").checked = res[0].chkBathroom;

    $("[id=ContentPlaceHolder1_txtVoterID]").attr('title', res[0].VoterID);
    document.getElementById("<%=this.txtVoterID.ClientID %>").value = res[0].VoterID;

    document.getElementById("<%=this.txtMonthlySaving.ClientID %>").value = res[0].MonthlySaving;
    document.getElementById("<%=this.txtSourceOfIncome.ClientID %>").value = res[0].SourceOfIncome;
    document.getElementById("<%=this.txtBalanceAmount.ClientID %>").value = res[0].BalanceAmount;
    document.getElementById("<%=this.txtPiyatYears.ClientID %>").value = res[0].PiyatYears;

    document.getElementById("<%=this.chkElectricMotor.ClientID %>").checked = res[0].chkElectricMotor;
    document.getElementById("<%=this.chkKuvo.ClientID %>").checked = res[0].chkKuvo;
    document.getElementById("<%=this.chkBorvel.ClientID %>").checked = res[0].chkBorvel;

    document.getElementById("<%=this.txtTransferPlace.ClientID %>").value = res[0].TransferPlace;

    document.getElementById("<%=this.ddlSubCaste.ClientID %>").value = res[0].SubCasteID;

    if (res[0].Business != "") {
        document.getElementById("<%=this.rbtBusiness.ClientID %>").checked = true;
        document.getElementById("<%=this.txtBusiness.ClientID %>").value = res[0].Business;
        document.getElementById("<%=this.txtBusiness.ClientID %>").disabled = false;
    }

    if (res[0].Job != "") {
        document.getElementById("<%=this.rbtJob.ClientID %>").checked = true;
        document.getElementById("<%=this.txtJob.ClientID %>").value = res[0].Job;
        document.getElementById("<%=this.txtJob.ClientID %>").disabled = false;
    }


    document.getElementById("<%=this.txtTwoWheeler.ClientID %>").value = res[0].TwoWheeler;
    document.getElementById("<%=this.txtCarJeep.ClientID %>").value = res[0].CarJeep;
    document.getElementById("<%=this.txtTruck.ClientID %>").value = res[0].Truck;
    document.getElementById("<%=this.txtTractor.ClientID %>").value = res[0].Tractor;
    document.getElementById("<%=this.txtCow.ClientID %>").value = res[0].Cow;
    document.getElementById("<%=this.txtOxe.ClientID %>").value = res[0].Oxe;
    document.getElementById("<%=this.txtBuffelo.ClientID %>").value = res[0].Buffelo;
    document.getElementById("<%=this.txtOther.ClientID %>").value = res[0].Other;
    document.getElementById("<%=this.ddlHouseType.ClientID %>").value = res[0].HouseType;
    document.getElementById("<%=this.txtRemarkOther.ClientID %>").value = res[0].RemarkOther;

    document.getElementById("<%=this.txtVehicalOther.ClientID %>").value = res[0].VehicalOther;
    document.getElementById("<%=this.txtVehicalRemarkOther.ClientID %>").value = res[0].VehicalRemarkOther;

    $("#divFirst").css({ 'display': "block" });
    $("#divSecond").css({ 'display': "none" });
    $("[id*=litab1]").attr('class', 'active');
    $("[id*=litab2]").removeAttr('class', 'active');

    ShowControls();
    ShowHideMemSrch();
    CheckMandali();

    document.getElementById("<%=this.ddlMemberType.ClientID %>").disabled = true;
   
    document.getElementById("<%=this.txtMemName.ClientID %>").disabled = true;

}


function GridMemberDetail(memberid, pageIndex) {

    $.ajax({
        type: "POST",
        url: "MemberMaster.aspx/GetMemberDetail",
        data: '{MemberID: "' + memberid + '",pageIndex: ' + 1 + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnGridSuccessMemberDetail,
        failure: function (response) {
            swal(response.d);
        },
        error: function (response) {
            swal(response.d);
        }
    });

}
var row;
function OnGridSuccessMemberDetail(response) {

    ViewDiv3();
    $("[id*=litab1]").removeAttr('class', 'active');
    $("[id*=litab2]").removeAttr('class', 'active');
    $("[id*=litab3]").attr('class', 'active');


    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);

    var customers = xml.find("MemberDetail");

    if (row == null) {
        row = $("[id*=GVXYZ] tr:last-child").clone(true);
    }
    $("[id*=GVXYZ] tr").not($("[id*=GVXYZ] tr:first-child")).remove();

    if (customers.length > 0) {

        if ($("td", row).length < 6) {
            $("td", row).eq(0).removeAttr("colspan");
            row.append('<td></td>');
            row.append('<td></td>');
            row.append('<td></td>');
            row.append('<td></td>');
            row.append('<td></td>');
            row.append('<td></td>');
            row.append('<td></td>');
        }

        $.each(customers, function () {
            var customer = $(this);

            $("td", row).eq(0).html($(this).find("RowNumber").text());
            $("td", row).eq(1).html($(this).find("FullNameG").text());
            $("td", row).eq(2).html($(this).find("FullAddressG").text());
            $("td", row).eq(3).html($(this).find("PersonCode").text());
            $("td", row).eq(4).html($(this).find("MobileNo1G").text());
            $("td", row).eq(5).html($(this).find("AadharNo").text());
            $("td", row).eq(6).html($(this).find("EmailID").text());


            if (jQuery.inArray("2", rights) != '-1') {
                $("td", row).eq(7).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditMemberDetail(' + $(this).find("MemberDetailID").text() + ');"><i class="fa fa-edit"></i></a>'));
            }
            else { $("td", row).eq(7).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

            if (jQuery.inArray("3", rights) != '-1') {
                $("td", row).eq(8).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteMemberDetail(' + $(this).find("MemberDetailID").text() + ',' + $(this).find("MemberID").text() + ');"><i class="fa fa-trash"></i></a>'));
            }
            else { $("td", row).eq(8).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }


            $("[id*=GVXYZ]").append(row);
            row = $("[id*=GVXYZ] tr:last-child").clone(true);
        });
        //var pager = xml.find("Pager");
        //$(".Pager").ASPSnippets_Pager({
        //    ActiveCssClass: "current",
        //    PagerCssClass: "pager",
        //    PageIndex: parseInt(pager.find("PageIndex").text()),
        //    PageSize: parseInt(pager.find("PageSize").text()),
        //    RecordCount: parseInt(pager.find("RecordCount").text())
        //});

        //$(".FirstName").each(function () {
        //    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
        //    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
        //});
    }
    else {
        var empty_row = row.clone(true);
        $("td:first-child", empty_row).attr("colspan", $("td", row).length);
        $("td:first-child", empty_row).attr("align", "center");
        $("td:first-child", empty_row).html("No records found for the search criteria.");
        $("td", empty_row).not($("td:first-child", empty_row)).remove();
        $("[id*=GVXYZ]").append(empty_row);
    }


};



function EditMemberDetail(memberdetailid) {

    $.ajax({
        type: "POST",
        url: "MemberMaster.aspx/GetMemberDetailByID",
        data: '{MemberDetailID: "' + JSON.stringify(memberdetailid) + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccessMemberDetail,
        failure: function (response) {
            swal(response.d);
        },
        error: function (response) {
            swal("error");
        }
    });
    return false;
}

function OnSuccessMemberDetail(response) {

    var res = response.d;
    document.getElementById("<%=this.ddlMemberType.ClientID %>").value = 2;
    ListVillageForSrchMem();
    document.getElementById("<%=this.ddlVillageForSrchMem.ClientID %>").value = res[0].SectionVillageMappingID;
    BindHouseHoldNo();
    document.getElementById("<%=this.ddlHouseHoldNo.ClientID %>").value = res[0].MemberID;

    document.getElementById("<%=this.hdnMemberID.ClientID %>").value = res[0].MemberDetailID;
    document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value = res[0].MemberID;
  
    document.getElementById("<%=this.txtPersonCode.ClientID %>").value = res[0].PersonCodeMD;

    document.getElementById("<%=this.txtMemName.ClientID %>").value = res[0].FullNameMM;

    document.getElementById("<%=this.txtFName.ClientID %>").value = res[0].FName;
    document.getElementById("<%=this.txtMName.ClientID %>").value = res[0].MName;
    document.getElementById("<%=this.txtLName.ClientID %>").value = res[0].LName;

    document.getElementById("<%=this.txtFNameG.ClientID %>").value = res[0].FNameG;
    document.getElementById("<%=this.txtMNameG.ClientID %>").value = res[0].MNameG;
    document.getElementById("<%=this.txtLNameG.ClientID %>").value = res[0].LNameG;

    document.getElementById("<%=this.txtAdd1.ClientID %>").value = res[0].Add1;
    document.getElementById("<%=this.txtAdd2.ClientID %>").value = res[0].Add2;
    document.getElementById("<%=this.txtAdd3.ClientID %>").value = res[0].Add3;

    document.getElementById("<%=this.txtAdd1G.ClientID %>").value = res[0].Add1G;
    document.getElementById("<%=this.txtAdd2G.ClientID %>").value = res[0].Add2G;
    document.getElementById("<%=this.txtAdd3G.ClientID %>").value = res[0].Add3G;

    document.getElementById("<%=this.txtMobile1.ClientID %>").value = res[0].Mobile1;
    document.getElementById("<%=this.txtMobile1G.ClientID %>").value = res[0].Mobile1G;
    document.getElementById("<%=this.txtMobile2.ClientID %>").value = res[0].Mobile2;
    document.getElementById("<%=this.txtMobile2G.ClientID %>").value = res[0].Mobile2G;

    if (res[0].Gender == "M") {
        document.getElementById("<%=this.rbtMale.ClientID %>").checked = true;
    }
    else if (res[0].Gender == "F") {
        document.getElementById("<%=this.rbtFeMale.ClientID %>").checked = true;
    }
    document.getElementById("<%=this.txtBirthDate.ClientID %>").value = res[0].BirthDate;

    document.getElementById("<%=this.txtAadhaarNo.ClientID %>").value = res[0].AadhaarNo;
    document.getElementById("<%=this.txtEmail.ClientID %>").value = res[0].Email;

    document.getElementById("<%=this.txtVoterID.ClientID %>").value = res[0].VoterID;


    if (res[0].Business != "") {
        document.getElementById("<%=this.rbtBusiness.ClientID %>").checked = true;
        document.getElementById("<%=this.txtBusiness.ClientID %>").value = res[0].Business;
        document.getElementById("<%=this.txtBusiness.ClientID %>").disabled = false;
    }

    if (res[0].Job != "") {
        document.getElementById("<%=this.rbtJob.ClientID %>").checked = true;
        document.getElementById("<%=this.txtJob.ClientID %>").value = res[0].Job;
        document.getElementById("<%=this.txtJob.ClientID %>").disabled = false;
    }

    $("#divFirst").css({ 'display': "block" });
    $("#divSecond").css({ 'display': "none" });
    $("#divThird").css({ 'display': "none" });
    $("[id*=litab1]").attr('class', 'active');
    $("[id*=litab2]").removeAttr('class', 'active');
    $("[id*=litab3]").removeAttr('class', 'active');


    ShowHideMemSrch();

    document.getElementById("<%=this.ddlMemberType.ClientID %>").disabled = true;
   
    document.getElementById("<%=this.txtMemName.ClientID %>").disabled = true;
}

function DeleteMemberDetail(memberdetailid, memberid) {


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
            url: "MemberMaster.aspx/DeleteMemberDetail",
            data: '{MemberDetailID : ' + memberdetailid + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var msg = response.d;

                if (msg.indexOf("Error") > -1) {
                    swal(msg);
                }
                else {
                    swal("Deleted!", msg, "success");

                    GridMemberDetail(memberid);
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

function CheckHouseHolNodAlreadyExists() {

    var HouseHoldNo = document.getElementById("ContentPlaceHolder1_txtHouseholdNo");
    var HouseHoldNotooltip = document.getElementById("ContentPlaceHolder1_txtHouseholdNo").title;

    if (HouseHoldNotooltip != "") {

        if (HouseHoldNo.value != HouseHoldNotooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckHouseHoldNo",
                data: '{HouseHoldNo: "' + HouseHoldNo.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        HouseHoldNo.focus();
                        swal("", "ઘરગથ્થું નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtHouseholdNo]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtHouseholdNo").value = "";
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
            url: "MemberMaster.aspx/CheckHouseHoldNo",
            data: '{HouseHoldNo: "' + HouseHoldNo.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    HouseHoldNo.focus();
                    swal("", "ઘરગથ્થું નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtHouseholdNo]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtHouseholdNo").value = "";
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

function CheckCurrAccNoAlreadyExists() {

    var CurrAccNo = document.getElementById("ContentPlaceHolder1_txtCurrentAccountNo");
    var CurrAccNotooltip = document.getElementById("ContentPlaceHolder1_txtCurrentAccountNo").title;

    if (CurrAccNotooltip != "") {

        if (CurrAccNo.value != CurrAccNotooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckCurrAccNo",
                data: '{CurrAccNo: "' + CurrAccNo.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        CurrAccNo.focus();
                        swal("", "હાલનો ખાતા નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtCurrentAccountNo]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtCurrentAccountNo").value = "";
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
            url: "MemberMaster.aspx/CheckCurrAccNo",
            data: '{CurrAccNo: "' + CurrAccNo.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    CurrAccNo.focus();
                    swal("", "હાલનો ખાતા નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtCurrentAccountNo]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtCurrentAccountNo").value = "";
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

function CheckPhoneNo1AlreadyExists() {

    var Phone = document.getElementById("ContentPlaceHolder1_txtMobile1");
    var Phonetooltip = document.getElementById("ContentPlaceHolder1_txtMobile1").title;

    if (Phonetooltip != "") {

        if (Phone.value != Phonetooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckPhone",
                data: '{Phone: "' + Phone.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        Phone.focus();
                        swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtMobile1]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtMobile1").value = "";
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
            url: "MemberMaster.aspx/CheckPhone",
            data: '{Phone: "' + Phone.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    Phone.focus();
                    swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtMobile1]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtMobile1").value = "";
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

function CheckPhoneNo2AlreadyExists() {

    var Phone = document.getElementById("ContentPlaceHolder1_txtMobile2");
    var Phonetooltip = document.getElementById("ContentPlaceHolder1_txtMobile2").title;

    if (Phonetooltip != "") {

        if (Phone.value != Phonetooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckPhone",
                data: '{Phone: "' + Phone.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        Phone.focus();
                        swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtMobile2]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtMobile2").value = "";
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
            url: "MemberMaster.aspx/CheckPhone",
            data: '{Phone: "' + Phone.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    Phone.focus();
                    swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtMobile2]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtMobile2").value = "";
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

function CheckPhoneNo1GAlreadyExists() {

    var Phone = document.getElementById("ContentPlaceHolder1_txtMobile1G");
    var Phonetooltip = document.getElementById("ContentPlaceHolder1_txtMobile1G").title;

    if (Phonetooltip != "") {

        if (Phone.value != Phonetooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckPhoneG",
                data: '{Phone: "' + Phone.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        Phone.focus();
                        swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.(ગુજરાતી)", "warning");
                        $("[id=ContentPlaceHolder1_txtMobile1G]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtMobile1G").value = "";
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
            url: "MemberMaster.aspx/CheckPhoneG",
            data: '{Phone: "' + Phone.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    Phone.focus();
                    swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.(ગુજરાતી)", "warning");
                    $("[id=ContentPlaceHolder1_txtMobile1G]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtMobile1G").value = "";
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

function CheckPhoneNo2GAlreadyExists() {

    var Phone = document.getElementById("ContentPlaceHolder1_txtMobile2G");
    var Phonetooltip = document.getElementById("ContentPlaceHolder1_txtMobile2G").title;

    if (Phonetooltip != "") {

        if (Phone.value != Phonetooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckPhoneG",
                data: '{Phone: "' + Phone.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        Phone.focus();
                        swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.(ગુજરાતી)", "warning");
                        $("[id=ContentPlaceHolder1_txtMobile2G]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtMobile2G").value = "";
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
            url: "MemberMaster.aspx/CheckPhoneG",
            data: '{Phone: "' + Phone.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    Phone.focus();
                    swal("", "મોબાઈલ નંબર પહેલેથી દાખલ કરેલ છે.(ગુજરાતી)", "warning");
                    $("[id=ContentPlaceHolder1_txtMobile2G]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtMobile2G").value = "";
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

function CheckAadhaarNoAlreadyExists() {

    var Adhar = document.getElementById("ContentPlaceHolder1_txtAadhaarNo");
    var Adhartooltip = document.getElementById("ContentPlaceHolder1_txtAadhaarNo").title;

    if (Adhartooltip != "") {

        if (Adhar.value != Adhartooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckAdhar",
                data: '{Adhar: "' + Adhar.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        Adhar.focus();
                        swal("", "આધાર નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtAadhaarNo]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtAadhaarNo").value = "";
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
            url: "MemberMaster.aspx/CheckAdhar",
            data: '{Adhar: "' + Adhar.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    Adhar.focus();
                    swal("", "આધાર નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtAadhaarNo]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtAadhaarNo").value = "";
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

function CheckEmailAlreadyExists() {

    var Email = document.getElementById("ContentPlaceHolder1_txtEmail");
    var Emailtooltip = document.getElementById("ContentPlaceHolder1_txtEmail").title;

    if (Emailtooltip != "") {

        if (Email.value != Emailtooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckEmail",
                data: '{Email: "' + Email.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        Email.focus();
                        swal("", "ઈ-મેઈલ પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtEmail]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtEmail").value = "";
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
            url: "MemberMaster.aspx/CheckEmail",
            data: '{Email: "' + Email.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    Email.focus();
                    swal("", "ઈ-મેઈલ પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtEmail]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtEmail").value = "";
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

function CheckVoterIDAlreadyExists() {

    var VoterID = document.getElementById("ContentPlaceHolder1_txtVoterID");
    var VoterIDtooltip = document.getElementById("ContentPlaceHolder1_txtVoterID").title;

    if (VoterIDtooltip != "") {

        if (VoterID.value != VoterIDtooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckVoterID",
                data: '{VoterID: "' + VoterID.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        VoterID.focus();
                        swal("", "ચુંટણી કાર્ડ નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtVoterID]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtVoterID").value = "";
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
            url: "MemberMaster.aspx/CheckVoterID",
            data: '{VoterID: "' + VoterID.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    VoterID.focus();
                    swal("", "ચુંટણી કાર્ડ નંબર પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtVoterID]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtVoterID").value = "";
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

function CheckCastGAlreadyExixt() {

    var NewSubCastG = document.getElementById("ContentPlaceHolder1_txtNewSubCastG");
    var NewSubCastGtooltip = document.getElementById("ContentPlaceHolder1_txtNewSubCastG").title;

    if (NewSubCastGtooltip != "") {

        if (NewSubCastG.value != NewSubCastGtooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckSubCastG",
                data: '{NewSubCastG: "' + NewSubCastG.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        NewSubCastG.focus();
                        swal("", "જાતી પહેલેથી દાખલ કરેલ છે.(ગુજરાતી)", "warning");
                        $("[id=ContentPlaceHolder1_txtNewSubCastG]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtNewSubCastG").value = "";
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
            url: "MemberMaster.aspx/CheckSubCastG",
            data: '{NewSubCastG: "' + NewSubCastG.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    NewSubCastG.focus();
                    swal("", "જાતી પહેલેથી દાખલ કરેલ છે.(ગુજરાતી)", "warning");
                    $("[id=ContentPlaceHolder1_txtNewSubCastG]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtNewSubCastG").value = "";
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

function CheckCastAlreadyExixt() {

    var NewSubCast = document.getElementById("ContentPlaceHolder1_txtNewSubCast");
    var NewSubCasttooltip = document.getElementById("ContentPlaceHolder1_txtNewSubCast").title;

    if (NewSubCasttooltip != "") {

        if (NewSubCast.value != NewSubCasttooltip) {
            $.ajax({
                type: "POST",
                url: "MemberMaster.aspx/CheckSubCast",
                data: '{NewSubCast: "' + NewSubCast.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == false) {
                        return true;
                    }
                    else {
                        NewSubCast.focus();
                        swal("", "જાતી પહેલેથી દાખલ કરેલ છે.", "warning");
                        $("[id=ContentPlaceHolder1_txtNewSubCast]").val('');
                        document.getElementById("#ContentPlaceHolder1_txtNewSubCast").value = "";
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
            url: "MemberMaster.aspx/CheckSubCast",
            data: '{NewSubCast: "' + NewSubCast.value + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == false) {
                    return true;
                }
                else {
                    NewSubCast.focus();
                    swal("", "જાતી પહેલેથી દાખલ કરેલ છે.", "warning");
                    $("[id=ContentPlaceHolder1_txtNewSubCast]").val('');
                    document.getElementById("#ContentPlaceHolder1_txtNewSubCast").value = "";
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

function ClearAll() {

    document.getElementById("<%=this.hdnMemberID.ClientID %>").value = "";
    document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value = "";

    document.getElementById("<%=this.ddlMemberType.ClientID %>").value = 0;

    document.getElementById("<%=this.ddlDistrict.ClientID %>").value = 0;
    document.getElementById("<%=this.txtPersonCode.ClientID %>").value = "";
    ListTaluka(0, 0);
    ListVillage(0, 0);
    document.getElementById("<%=this.ddlInstitute.ClientID %>").value = 0;

    document.getElementById("<%=this.txtHouseholdNo.ClientID %>").value = "";
    document.getElementById("<%=this.txtPersonCode.ClientID %>").value = "";
    document.getElementById("<%=this.txtAccountNo.ClientID %>").value = "";
    document.getElementById("<%=this.txtCurrentAccountNo.ClientID %>").value = "";

    document.getElementById("<%=this.txtFName.ClientID %>").value = "";
    document.getElementById("<%=this.txtMName.ClientID %>").value = "";
    document.getElementById("<%=this.txtLName.ClientID %>").value = "";

    document.getElementById("<%=this.txtFNameG.ClientID %>").value = "";
    document.getElementById("<%=this.txtMNameG.ClientID %>").value = "";
    document.getElementById("<%=this.txtLNameG.ClientID %>").value = "";

    document.getElementById("<%=this.txtAdd1.ClientID %>").value = "";
    document.getElementById("<%=this.txtAdd2.ClientID %>").value = "";
    document.getElementById("<%=this.txtAdd3.ClientID %>").value = "";

    document.getElementById("<%=this.txtAdd1G.ClientID %>").value = "";
    document.getElementById("<%=this.txtAdd2G.ClientID %>").value = "";
    document.getElementById("<%=this.txtAdd3G.ClientID %>").value = "";

    document.getElementById("<%=this.txtMobile1.ClientID %>").value = "";
    document.getElementById("<%=this.txtMobile1G.ClientID %>").value = "";
    document.getElementById("<%=this.txtMobile2.ClientID %>").value = "";
    document.getElementById("<%=this.txtMobile2G.ClientID %>").value = "";

    document.getElementById("<%=this.rbtMale.ClientID %>").checked = false;
    document.getElementById("<%=this.rbtFeMale.ClientID %>").checked = false;

    document.getElementById("<%=this.txtBirthDate.ClientID %>").value = "";

    document.getElementById("<%=this.txtAadhaarNo.ClientID %>").value = "";
    document.getElementById("<%=this.txtEmail.ClientID %>").value = "";

    document.getElementById("<%=this.chkBPL.ClientID %>").checked = false;
    document.getElementById("<%=this.txtBPLNo.ClientID %>").value = "";

    document.getElementById("<%=this.chkToilet.ClientID %>").checked = false;
    document.getElementById("<%=this.chkBathroom.ClientID %>").checked = false;

    document.getElementById("<%=this.txtVoterID.ClientID %>").value = "";

    document.getElementById("<%=this.txtMonthlySaving.ClientID %>").value = "";
    document.getElementById("<%=this.txtSourceOfIncome.ClientID %>").value = "";
    document.getElementById("<%=this.txtBalanceAmount.ClientID %>").value = "";
    document.getElementById("<%=this.txtPiyatYears.ClientID %>").value = "";

    document.getElementById("<%=this.chkElectricMotor.ClientID %>").checked = false;
    document.getElementById("<%=this.chkKuvo.ClientID %>").checked = false;
    document.getElementById("<%=this.chkBorvel.ClientID %>").checked = false;

    document.getElementById("<%=this.txtTransferPlace.ClientID %>").value = "";

    document.getElementById("<%=this.ddlSubCaste.ClientID %>").value = 0;

    document.getElementById("<%=this.rbtBusiness.ClientID %>").checked = false;
    document.getElementById("<%=this.txtBusiness.ClientID %>").value = "";
    document.getElementById("<%=this.txtBusiness.ClientID %>").disabled = false;

    document.getElementById("<%=this.rbtJob.ClientID %>").checked = false;
    document.getElementById("<%=this.txtJob.ClientID %>").value = "";
    document.getElementById("<%=this.txtJob.ClientID %>").disabled = false;

    document.getElementById("<%=this.txtTwoWheeler.ClientID %>").value = "";
    document.getElementById("<%=this.txtCarJeep.ClientID %>").value = "";
    document.getElementById("<%=this.txtTruck.ClientID %>").value = "";
    document.getElementById("<%=this.txtTractor.ClientID %>").value = "";
    document.getElementById("<%=this.txtCow.ClientID %>").value = "";
    document.getElementById("<%=this.txtOxe.ClientID %>").value = "";
    document.getElementById("<%=this.txtBuffelo.ClientID %>").value = "";
    document.getElementById("<%=this.txtOther.ClientID %>").value = "";
    document.getElementById("<%=this.ddlHouseType.ClientID %>").value = 0;
    document.getElementById("<%=this.txtRemarkOther.ClientID %>").value = "";

    document.getElementById("<%=this.txtNewSubCast.ClientID %>").value = "";
    document.getElementById("<%=this.txtNewSubCastG.ClientID %>").value = "";
    document.getElementById("<%=this.txtNewSubCast.ClientID %>").disabled = true;
    document.getElementById("<%=this.txtNewSubCastG.ClientID %>").disabled = true;

    document.getElementById("<%=this.txtVehicalOther.ClientID %>").value = "";
    document.getElementById("<%=this.txtVehicalRemarkOther.ClientID %>").value = "";

    document.getElementById("<%=this.ddlMemberType.ClientID %>").disabled = false;

    document.getElementById("<%=this.ddlVillageForSrchMem.ClientID %>").value = 0;
    document.getElementById("<%=this.ddlHouseHoldNo.ClientID %>").value = 0;
    document.getElementById("<%=this.txtMemName.ClientID %>").value = "";
    document.getElementById("<%=this.hdnMemberIDForFamily.ClientID %>").value = "";
    BindHouseHoldNo();
    ShowHideMemSrch();
}


    </script>
</asp:Content>

