<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityEventTrainingDataEntry.aspx.cs" Inherits="ActivityEventTrainingDataEntry" %>

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
            <li class="active">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ની ડેટા એન્ટ્રી </li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના ડેટા ની માહિતી ઉમેરો/સુધારો </a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>
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
                                                <h4>
                                                    <asp:Label ID="txtText" runat="server"></asp:Label>:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label ID="txtTypeText" runat="server"></asp:Label>
                                                </h4>
                                            </div>

                                            <div class="col-lg-1">
                                                <h4>વિષય :</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label ID="txtSubject" runat="server"></asp:Label>
                                                </h4>
                                            </div>

                                            <div class="col-lg-1">
                                                <h4>સ્થળ :</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label ID="txtPlace" runat="server"></asp:Label>
                                                </h4>
                                            </div>
                                            <div class="col-lg-1">
                                            </div>
                                            <div class="col-lg-3">
                                            </div>

                                            <div class="col-lg-1">
                                                <h4>તારીખ:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label ID="txtFromDate" runat="server"></asp:Label>
                                                    થી
                                                    <asp:Label ID="txtToDate" runat="server"></asp:Label>
                                                </h4>
                                            </div>
                                            <div class="col-lg-1">
                                                <h4>સમય:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label ID="txtTime" runat="server"></asp:Label>
                                                </h4>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-1">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div id="div1">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlDistrict" CssClass="form-control" runat="server" onChange="BindTaluka()"></asp:DropDownList>
                                                        <label>જીલ્લો</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlTaluka" class="form-control" runat="server" onChange="BindVillage()"></asp:DropDownList>
                                                        <label>તાલુકો</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlVillage" CssClass="form-control" runat="server" onChange="return Validate()"></asp:DropDownList>
                                                        <label>ગામ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <label style="padding-top: 37px; padding-left: 26px">અથવા</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlInstitute" class="form-control" runat="server" onChange="return Validate1()"></asp:DropDownList>
                                                        <label>મંડળીનું નામ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <label style="padding-top: 37px; padding-left: 26px">અથવા</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlFilter" CssClass="form-control" runat="server" onChange="return Validate2()">
                                                            <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="ઘરગથ્થું નંબર" Value="1"></asp:ListItem>
                                                            <%--   <asp:ListItem Text="કુટંબનો સભ્ય" Value="2"></asp:ListItem>--%>
                                                        </asp:DropDownList>
                                                        <label></label>

                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtSearchField" class="form-control" runat="server" ></asp:TextBox>
                                                        <label></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group ">
                                                        <button id="btnFindMember" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                            સભ્યો શોધો</button>
                                                         <input type="hidden" id="hdnFindMember" value="0" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <div id="divCircles"></div>
                                                        <label>-- સભ્યો પસંદ કરો --</label>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <input type="hidden" id="checkedcircle" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-1" id="divSave">
                                                <button id="btnSave" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    સભ્યો ઉમેરો</button>
                                                 <input type="hidden" id="hdnSubmitVal" value="0" />
                                            </div>
                                             <div class="col-sm-2">
                                                <button id="btnBenificaryMember" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    Add Benificary Member</button>
                                                  <input type="hidden" id="hdnBenificaryMember" value="0" />
                                            </div>
                                            <div class="col-sm-1">
                                                <button id="btnReset" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    રદ કરો</button>
                                                 <input type="hidden" id="hdnReset" value="0" />
                                            </div>                                           
                                        </div>

                                        <div id="div2" style="display: none">
                                            <div class="row">
                                                <div class="col-sm-1">
                                                    &nbsp;
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlDistrict1" CssClass="form-control" runat="server" onChange="BindTalukaOther()"></asp:DropDownList>
                                                        <label>જીલ્લો</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlTaluka1" class="form-control" runat="server" onChange="BindVillageOther()"></asp:DropDownList>
                                                        <label>તાલુકો</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:DropDownList ID="ddlVillage1" CssClass="form-control" runat="server"></asp:DropDownList>
                                                        <label>ગામ</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>પુરું નામ</label>
                                                    </div>
                                                </div>
                                                <%--<div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="DropDownList5" class="form-control" runat="server"></asp:TextBox>
                                                        <label>પિતા/વાલી/પતિનું નામ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="DropDownList6" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>અટક</label>
                                                    </div>
                                                </div>--%>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtAge" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>ઉમર</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtMobileNo" class="form-control" runat="server"></asp:TextBox>
                                                        <label>મોબાઈલ નં.</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <label class="radio-inline radio-styled">
                                                        <asp:RadioButton ID="rbtMale" GroupName="Gender" Text="પુરૂષ" runat="server" />
                                                    </label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label class="radio-inline radio-styled">
                                                        <asp:RadioButton ID="rbtFeMale" GroupName="Gender" Text="સ્ત્રી" runat="server" />
                                                    </label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtRemarks" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>Remark</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-1">
                                                    <button id="btnAddBenificaryMember" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                        data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                        સભ્યો ઉમેરો</button>
                                                    <input type="hidden" id="hdnAddBenificaryMember" value="0" />
                                                </div>
                                                <div class="col-sm-1">
                                                <button id="btnReset1" type="button" class="btn ink-reaction btn-raised btn-primary"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                                    રદ કરો</button>
                                                    <input type="hidden" id="hdnReset1" value="0" />
                                            </div> 
                                            </div>
                                             <div class="row">
                                                <div class="col-sm-1">
                                                    &nbsp;
                                                </div>
                                            </div>
                                            <div class="row">
                                                <asp:GridView ID="gvBenificaryDetail" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" SortExpression="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="FullName" SortExpression="FullName" HeaderText="સભ્યનું નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Gender" SortExpression="Gender" HeaderText="સ્ત્રી/પુરુષ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Age" SortExpression="Age" HeaderText="ઉમર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Mobileno" SortExpression="Mobileno" HeaderText="મોબાઈલ નં." HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="DistrictName" SortExpression="DistrictName" HeaderText="જીલ્લાનુ નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="TalukaName" SortExpression="TalukaName" HeaderText="તાલુકાનુ નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="VillageName" SortExpression="VillageName" HeaderText="ગામનુ નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>                                                        
                                                        <asp:BoundField DataField="Remark" SortExpression="Remark" HeaderText="Remarks" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>                                                      

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
                        </div>



                        <div id="divSecond" style="display: none;">
                            <div class="tab-pane" id="second1">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchProgram" CssClass="form-control" runat="server" onChange="LoadGrid(1)">
                                                <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="પ્રવૃત્તિ" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="ઇવેન્ટ" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="તાલીમ" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" id="divGrid">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">

                                            <asp:GridView ID="gvEvents" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" SortExpression="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                    <asp:BoundField DataField="TypeOfEvent" SortExpression="TypeOfEvent" HeaderText="પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                    <asp:BoundField DataField="Program" SortExpression="Program" HeaderText="પ્રોગામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                    <asp:BoundField DataField="Subject" SortExpression="Subject" HeaderText="વિષય" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                    <asp:BoundField DataField="Place" SortExpression="Place" HeaderText="સ્થળ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                    <asp:BoundField DataField="VillageCode" SortExpression="VillageCode" HeaderText="ગામનો કોડ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                    <asp:BoundField DataField="VillageName" SortExpression="VillageName" HeaderText="ગામનું નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>

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
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>સભ્યો ઉમેરો</HeaderTemplate>
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="3%" />
                                                        <HeaderStyle BackColor="#0aa89e" BorderColor="LightGray" ForeColor="White" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:HiddenField ID="hdnISEdit" runat="server" />
                                            <asp:HiddenField ID="hdnISEdit1" runat="server" />
                                            <asp:HiddenField ID="hdnOtherParticipateID" runat="server" />
                                            <asp:HiddenField ID="hdnDetailID" runat="server" />
                                            <asp:HiddenField ID="hdnAETid" runat="server" />
                                             <asp:HiddenField ID="hdnAETTypeid" runat="server" />
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
            LoadGrid(parseInt($(this).attr('page')));
            LoadBenificaryGrid(parseInt($(this).attr('page')));
        });

        $(function () {
            $("#divFirst").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            $("#divGrid2").css({ 'display': "none" });

            $("[id*=litab1]").attr('class', 'active');
          

            var DetailID = GetParameterValues('DetailID');
            var AETid = GetParameterValues('AETid');
            var AETtype = GetParameterValues('AETtype');
          
            var isedit;
            var valSTArr;

            Subject(AETtype, AETid, DetailID);
            

            document.getElementById("<%=this.hdnDetailID.ClientID%>").value = DetailID;
            document.getElementById("<%=this.hdnAETid.ClientID%>").value = AETid;
            document.getElementById("<%=this.hdnAETTypeid.ClientID%>").value = AETtype;
            LoadBenificaryGrid(1);
            ListDistrict();
            ListTaluka(0, 0);
            ListVillage(0, 0);
            ListInstitute(0, 0);
            LoadGrid(1);

        });

        $("#btnBenificaryMember").bind("click", function () {
            $("[id*=btnBenificaryMember]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnBenificaryMember]").attr('disabled', 'disabled');
            $("#hdnBenificaryMember").val("1");

            $("#div2").css({ 'display': "block" });            
            $("#div1").css({ 'display': "none" });
            $("#divSave").css({ 'display': "none" });
            $("[id*=btnBenificaryMember]").attr('disabled', 'disabled');

            if ($("#hdnBenificaryMember").val() == "1") {
                $("[id*=btnBenificaryMember]").html("Add Benificary Member");
                $("[id*=btnBenificaryMember]").removeAttr('disabled');
                $("#hdnBenificaryMember").val(0);
                $("[id*=btnBenificaryMember]").attr('disabled', 'disabled');
            }
        
        });

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

            $("#btnFindMember").bind("click", function () {

                var village = document.getElementById("<%=this.ddlVillage.ClientID%>");
                var institute = document.getElementById("<%=this.ddlInstitute.ClientID%>");
                var searchtearm = document.getElementById("<%=this.txtSearchField.ClientID%>");
                var searchType = document.getElementById("<%=this.ddlFilter.ClientID%>");
                debugger;
                if (village.value == "0" && institute.value == "0" && searchType.value == "0") {
                    village.focus();
                    swal("", "ગામ અથવા મંડળી અથવા સર્ચ ટાઇપ પસંદ કરો", "warning");
                    return false;
                }
                else {
                    $("[id*=btnFindMember]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnFindMember]").attr('disabled', 'disabled');
                    $("#hdnFindMember").val("1");

                    if (village.value != 0) {
                        FillMember(village.value, 0, '', 0);
                    }
                    else if (institute.value != 0) {
                        FillMember(0, institute.value, '', 0);
                    }
                    else if (searchType.value != 0) {

                        if (searchtearm.value == "") {
                            searchtearm.focus();
                            swal("", "ઘરગથ્થું નંબર દાખલ કરો", "warning");
                            //return false;
                        }
                        FillMember(0, 0, searchtearm.value, searchType.value);
                    }
                    if ($("#hdnFindMember").val() == "1") {
                        $("[id*=btnFindMember]").html("સભ્યો શોધો");
                        $("[id*=btnFindMember]").removeAttr('disabled');
                        $("#hdnFindMember").val(0);
                    }
                }
            });

        });

        $("#btnReset1").bind("click", function () {
            $("[id*=btnReset1]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset1]").attr('disabled', 'disabled');
            $("#hdnReset1").val("1");

            document.getElementById("<%=this.ddlDistrict1.ClientID %>").value=0;
            document.getElementById("<%=this.ddlTaluka1.ClientID %>").value = 0;
            document.getElementById("<%=this.ddlVillage1.ClientID %>").value = 0;
            document.getElementById("<%=this.txtFullName.ClientID %>").value = "";
            document.getElementById("<%=this.txtMobileNo.ClientID %>").value = "";
            document.getElementById("<%=this.txtAge.ClientID %>").value = "";
            document.getElementById("<%=this.txtRemarks.ClientID %>").value = "";
            document.getElementById("<%=this.rbtMale.ClientID %>").checked = false;
            document.getElementById("<%=this.rbtFeMale.ClientID %>").checked = false;
            document.getElementById("<%=this.hdnISEdit1.ClientID %>").value = 0;

            if ($("#hdnReset1").val() == "1") {
                $("[id*=btnReset1]").html("રદ કરો");
                $("[id*=btnReset1]").removeAttr('disabled');
                $("#hdnReset1").val(0);
            }

        })


        $(function () {

            $("#btnAddBenificaryMember").bind("click", function () {

                var District = document.getElementById("<%=this.ddlDistrict1.ClientID %>");
                var Taluka = document.getElementById("<%=this.ddlTaluka1.ClientID %>");
                var Village = document.getElementById("<%=this.ddlVillage1.ClientID %>");
                var FullName = document.getElementById("<%=this.txtFullName.ClientID %>");
                var Age = document.getElementById("<%=this.txtAge.ClientID %>");
                var MobileNo = document.getElementById("<%=this.txtMobileNo.ClientID %>");
                var Male = document.getElementById("<%=this.rbtMale.ClientID %>");
                var FeMale = document.getElementById("<%=this.rbtFeMale.ClientID %>");
                var IsEdit;

                if (District.value == "0" ) {
                    District.focus();
                    swal("", "જીલ્લો પસંદ કરો", "warning");

                    return false;
                }
                else if (Taluka.value == "0" ) {
                    Taluka.focus();
                    swal("", "તાલુકો પસંદ કરો", "warning");

                    return false;
                }
                else if (Village.value == "0") {
                    Village.focus();
                    swal("", "ગામ પસંદ કરો", "warning");

                    return false;
                }
                else if (FullName.value == "") {
                    FullName.focus();
                    swal("", "પૂરું નામ દાખલ કરો", "warning");

                    return false;
                }
                //else if (Age.value == "") {
                //    Age.focus();
                //    swal("", "ઉમર દાખલ કરો", "warning");

                //    return false;
                //}
                else if (MobileNo.value != "" && MobileNo.value.length != 10) {
                    MobileNo.focus();
                    swal("", "માન્ય મોબાઈલ નંબર દાખલ કરો", "warning");

                    return false;
                }
                else if (Male.checked == false && FeMale.checked == false) {
                    Male.focus();
                    swal("", "સ્ત્રી / પુરૂષ પસંદ કરો", "warning");

                    return false;
                }
                else {
                    $("[id*=btnAddBenificaryMember]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnAddBenificaryMember]").attr('disabled', 'disabled');
                    $("#hdnAddBenificaryMember").val("1");

                    var BenificaryDetail = {};

                    
                    BenificaryDetail.AETDetailID = document.getElementById("<%=this.hdnDetailID.ClientID %>").value;                 
                    BenificaryDetail.AETid = document.getElementById("<%=this.hdnAETid.ClientID %>").value;
                    BenificaryDetail.AETTypeID = document.getElementById("<%=this.hdnAETTypeid.ClientID %>").value;
                    BenificaryDetail.DistrictID = document.getElementById("<%=this.ddlDistrict1.ClientID %>").value;
                    BenificaryDetail.TalukaID = document.getElementById("<%=this.ddlTaluka1.ClientID %>").value;
                    BenificaryDetail.VillageID = document.getElementById("<%=this.ddlVillage1.ClientID %>").value;
                    BenificaryDetail.FullName = document.getElementById("<%=this.txtFullName.ClientID %>").value;
                    BenificaryDetail.Age = document.getElementById("<%=this.txtAge.ClientID %>").value;
                    BenificaryDetail.MobileNo = document.getElementById("<%=this.txtMobileNo.ClientID %>").value;
                    if (Male.checked == true) {
                        BenificaryDetail.Gender = 'M';
                    }
                    else {
                        BenificaryDetail.Gender = 'F';
                    }
                    BenificaryDetail.Remarks = document.getElementById("<%=this.txtRemarks.ClientID %>").value;
                    var edit = document.getElementById("<%=this.hdnISEdit1.ClientID %>").value;
                    if(edit == "1"){
                        BenificaryDetail.IsEdit = document.getElementById("<%=this.hdnISEdit1.ClientID %>").value;
                    }
                    else {
                        BenificaryDetail.IsEdit = 0;
                    }
                    if (BenificaryDetail.IsEdit == "1") {
                        BenificaryDetail.OtherParticipateID = document.getElementById("<%=this.hdnOtherParticipateID.ClientID %>").value;
                    }
                      
                                $.ajax({
                                    type: "POST",
                                    url: "ActivityEventTrainingDataEntry.aspx/ManageBanificaryDetail",
                                    data: '{BenificaryDetail: ' + JSON.stringify(BenificaryDetail) + '}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        swal("Done!", response.d, "success");
                                    },
                                    failure: function (response) {
                                        swal(response.d);
                                    },
                                    error: function (response) {
                                        swal(response.d);
                                    }
                                });                           
                }
                
                LoadBenificaryGrid(1);
                ClearAll();
                document.getElementById("<%=this.hdnISEdit1.ClientID %>").value = 0;
                if ($("#hdnAddBenificaryMember").val() == "1") {
                    $("[id*=btnAddBenificaryMember]").html("સભ્યો ઉમેરો");
                    $("[id*=btnAddBenificaryMember]").removeAttr('disabled');
                    $("#hdnAddBenificaryMember").val(0);
                }
            });
        });



        function LoadBenificaryGrid(pageIndex) {

            var DetailID = document.getElementById("<%=this.hdnDetailID.ClientID%>").value;
            var AETid = document.getElementById("<%=this.hdnAETid.ClientID%>").value ;
            var AETtype= document.getElementById("<%=this.hdnAETTypeid.ClientID%>").value;

            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingDataEntry.aspx/LoadBenificaryGrid",
                data: '{AETtype: "' + AETtype + '",AETid: "' + AETid + '",DetailID: "' + DetailID + '",pageIndex:"' + pageIndex + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: BanificaryDetails,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        var myrow;
        function BanificaryDetails(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var customers = xml.find("BenificaryDetails");

            if (myrow == null) {
                myrow = $("[id*=gvBenificaryDetail] tr:last-child").clone(true);
            }
            $("[id*=gvBenificaryDetail] tr").not($("[id*=gvBenificaryDetail] tr:first-child")).remove();

            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrow).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrow).eq(1).html($(this).find("FullName").text());
                    $("td", myrow).eq(2).html($(this).find("Gender").text());
                    $("td", myrow).eq(3).html($(this).find("Age").text());
                    $("td", myrow).eq(4).html($(this).find("Mobileno").text());
                    $("td", myrow).eq(5).html($(this).find("DistrictName").text());
                    $("td", myrow).eq(6).html($(this).find("TalukaName").text());
                    $("td", myrow).eq(7).html($(this).find("VillageName").text());
                    $("td", myrow).eq(8).html($(this).find("Remark").text());
                    $("td", myrow).eq(9).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditBenificaryDetail(' + $(this).find("OtherParticipantID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    $("td", myrow).eq(10).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteBenificaryDetail(' + $(this).find("OtherParticipantID").text() + ');"><i class="fa fa-trash"></i></a>'));
                   


                    $("[id*=gvBenificaryDetail]").append(myrow);
                    myrow = $("[id*=gvBenificaryDetail] tr:last-child").clone(true);
                });

                var pager = xml.find("PagerBenificary");

                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

              
            }
            else {
                var empty_row = myrow.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", myrow).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvBenificaryDetail]").append(empty_row);
            }
        };

        function EditBenificaryDetail(OtherParticipateID) {
            document.getElementById("<%=this.hdnOtherParticipateID.ClientID %>").value = OtherParticipateID;
            
             $.ajax({
                 type: "POST",
                 url: "ActivityEventTrainingDataEntry.aspx/GetBenificaryDetail",
                 data: '{OtherParticipateID: ' + JSON.stringify(OtherParticipateID) + '}',
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnCircleSuccess2,
                 failure: function (response) {
                     swal(response.d);
                 },
                 error: function (response) {
                     swal("error");
                 }
             });
             return false;
         }

        function OnCircleSuccess2(response) {
             var res = response.d;

             

             document.getElementById("<%=this.ddlDistrict1.ClientID %>").value = res[0].DistrictID;
            ListTaluka(res[0].DistrictID, 0);
            document.getElementById("<%=this.ddlTaluka1.ClientID %>").value = res[0].TalukaID;
            ListVillage(res[0].TalukaID, 0);
            document.getElementById("<%=this.ddlVillage1.ClientID %>").value = res[0].VillageID;
            
            document.getElementById("<%=this.txtFullName.ClientID %>").value = res[0].FullName;
            document.getElementById("<%=this.txtAge.ClientID %>").value = res[0].Age;
            document.getElementById("<%=this.txtMobileNo.ClientID %>").value = res[0].MobileNo;
            document.getElementById("<%=this.txtRemarks.ClientID %>").value = res[0].Remarks;
            if (res[0].Gender == 'M') {
                document.getElementById("<%=this.rbtMale.ClientID %>").checked = true;
            }
            else {
                document.getElementById("<%=this.rbtFeMale.ClientID %>").checked = true;
            }
            document.getElementById("<%=this.hdnISEdit1.ClientID %>").value = 1;


        }

        function DeleteBenificaryDetail(OtherParticipateID) {
           
            swal({
                title: "રદ કરવા માંગો છો?",
                type: "warning",
                showCancelButton: true,
                showConfirmButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "હા",
                cancelButtonText: "ના",
                closeOnConfirm: false
            },
                function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "POST",
                            url: "ActivityEventTrainingDataEntry.aspx/DeleteBanificaryDetail",
                            data: '{OtherParticipateID: ' + JSON.stringify(OtherParticipateID) +'}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var msg = response.d;
                                swal("Delete", msg, "success");
                                LoadGrid(1);
                                ClearAll();
                            },
                            failure: function (response) {
                                swal(response.d);
                            },
                            error: function (response) {
                                swal("error");
                            }

                        });
                        LoadBenificaryGrid(1);
                    }
                })
            
        }





        function Subject(AETtype, AETid, DetailID) {

            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingDataEntry.aspx/GetDetailsFromSubject",
                data: '{AETtype: "' + AETtype + '",AETid: "' + AETid + '",DetailID: "' + DetailID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: SubjectDetails,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function SubjectDetails(response) {
            var res = response.d;

            document.getElementById("<%=this.txtText.ClientID %>").innerHTML = res[0].HeadText;
            document.getElementById("<%=this.txtTypeText.ClientID %>").innerHTML = res[0].TypeText;
            document.getElementById("<%=this.txtSubject.ClientID %>").innerHTML = res[0].Subject;
            document.getElementById("<%=this.txtFromDate.ClientID %>").innerHTML = res[0].FromDate;
            document.getElementById("<%=this.txtPlace.ClientID %>").innerHTML = res[0].Place;
            document.getElementById("<%=this.txtToDate.ClientID %>").innerHTML = res[0].ToDate;
            document.getElementById("<%=this.txtTime.ClientID %>").innerHTML = res[0].Time;
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divThird").css({ 'display': "none" });
            $("#divGrid").css({ 'display': "none" });
            $("[id*=litab1]").attr('class', 'deactive');
            $("[id*=litab2]").attr('class', 'active');
        }

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("[id*=litab2]").attr('class', 'deactive');
            $("[id*=litab1]").attr('class', 'active');
            $("#divSecond").css({ 'display': "none" });
            $("#divThird").css({ 'display': "none" });
            document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value = 0;
            }

            function ClearAll() {

                document.getElementById("<%=this.ddlDistrict.ClientID%>").value = 0;
            document.getElementById("<%=this.ddlTaluka.ClientID%>").value = 0;
            document.getElementById("<%=this.ddlVillage.ClientID%>").value = 0;
            document.getElementById("<%=this.ddlInstitute.ClientID%>").value = 0;
            document.getElementById("<%=this.ddlFilter.ClientID%>").value = 0;
            document.getElementById("<%=this.txtSearchField.ClientID%>").value = "";
            $("#divCircles").css({ 'display': "none" });
        }

        function FillMember(vilg, insti, SearchTerm, SearchType) {
            var DetailID = document.getElementById("<%=this.hdnDetailID.ClientID%>").value;
            var AETid = document.getElementById("<%=this.hdnAETid.ClientID%>").value;

            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingDataEntry.aspx/ListMember",
                data: '{Village: ' + JSON.stringify(vilg) + ',Institute: ' + JSON.stringify(insti) + ',DetailID: ' + JSON.stringify(DetailID) + ',AETid: ' + JSON.stringify(AETid) + ',SearchTerm: ' + JSON.stringify(SearchTerm) + ',SearchType: ' + JSON.stringify(SearchType) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if (r.d.length > 0) {
                        $("#divCircles").css({ 'display': "block" });
                        $.each(r.d, function () {
                            //if (r.d.length % 2 == 0) {
                            strGroups += "<div class='col-sm-6' id='divCircles" + this['ID'] + "' ><div class='checkbox checkbox-styled' ><label><input type='checkbox' name='Members' text='" + this['Name'] + "' value='" + this['ID'] + '-' + this['MemberType'] + '-' + this['VillageID'] + "' /><span class='lbl'>" + this['Name'] + "</span></label></div></div>";
                        });
                        $("#divCircles").html(strGroups);

                    }
                    else {
                        $("#divCircles").css({ 'display': "none" });
                    }
                }
            });
            isedit = 0;
        }

        function AddMember(EventID, VillageID) {
            var ddlprogm = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;

            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingDataEntry.aspx/GetEventDetail",
                data: '{EventID: "' + JSON.stringify(EventID) + '",VillageID: "' + JSON.stringify(VillageID) + '",ProgmID: "' + ddlprogm + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessAddMember,
                failure: function (response) {
                    swal(response.d);
                },
                error: function (response) {
                    swal("error");
                }
            });
            return false;
        }

        function OnSuccessAddMember(response) {

            var res = response.d;

            var ddl = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;

            document.getElementById("<%=this.ddlDistrict.ClientID %>").value = res[0].DistrictID;
            ListTaluka(document.getElementById("<%=this.ddlDistrict.ClientID %>").value, 0);
            document.getElementById("<%=this.ddlTaluka.ClientID %>").value = res[0].TalukaID;
            ListVillage(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            document.getElementById("<%=this.ddlVillage.ClientID %>").value = res[0].VillageID;
            document.getElementById("<%=this.hdnDetailID.ClientID %>").value = res[0].DetailID;
            document.getElementById("<%=this.hdnAETid.ClientID %>").value = ddl;
            var type = res[0].EventTypeID;
            FillMember(res[0].VillageID, 0, '', 0);
            ViewDiv1();

            document.getElementById("<%=this.hdnISEdit.ClientID %>").value = 0;

            document.getElementById("<%=this.hdnISEdit.ClientID %>").value = 1;
           // FillMember(res[0].VillageID, 0, 0, 0);
           // FillMember(res[0].VillageID, 0,0);

            document.getElementById("<%=this.hdnISEdit.ClientID %>").value = 0;
            Subject(type, ddl, res[0].DetailID);
            $("#btnSave").attr('Text', 'સભ્યો ઉમેરો');
        }

        function EditEvent(EventID, VillageID) {
            var ddlprogm = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;

            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingDataEntry.aspx/GetEventDetail",
                data: '{EventID: "' + JSON.stringify(EventID) + '",VillageID: "' + JSON.stringify(VillageID) + '",ProgmID: "' + ddlprogm + '"}',
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

            var ddl = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;

            document.getElementById("<%=this.ddlDistrict.ClientID %>").value = res[0].DistrictID;
            ListTaluka(document.getElementById("<%=this.ddlDistrict.ClientID %>").value, 0);
            document.getElementById("<%=this.ddlTaluka.ClientID %>").value = res[0].TalukaID;
            ListVillage(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            document.getElementById("<%=this.ddlVillage.ClientID %>").value = res[0].VillageID;
            document.getElementById("<%=this.hdnDetailID.ClientID %>").value = res[0].DetailID;
            document.getElementById("<%=this.hdnAETid.ClientID %>").value = ddl;
            var type = res[0].EventTypeID;
            ViewDiv1();

            document.getElementById("<%=this.hdnISEdit.ClientID %>").value = 0;

            document.getElementById("<%=this.hdnISEdit.ClientID %>").value = 1;


            //  var dataStype = res[1].Members;

            //valSTArr = dataStype.split(",");         

            var strGroups = "";
            if (response.d.length > 0) {
                $("#divCircles").css({ 'display': "block" });
                $.each(response.d, function () {
                    //if (r.d.length % 2 == 0) {
                    strGroups += "<div class='col-sm-6' id='divCircles" + this['ID'] + "' ><div class='checkbox checkbox-styled' ><label><input type='checkbox' checked='true' name='Members' text='" + this['Name'] + "' value='" + this['ID'] + '-' + this['MemberType'] + '-' + this['VillageID'] + "' /><span class='lbl'>" + this['Name'] + "</span></label></div></div>";
                });
                $("#divCircles").html(strGroups);
            }
            else {
                $("#divCircles").css({ 'display': "none" });
            }
            Subject(type, ddl, res[0].DetailID);
        }


        function DeleteEvent(EventID, VillageID) {
            var ddlprogm = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;
            swal({
                title: "રદ કરવા માંગો છો?",
                type: "warning",
                showCancelButton: true,
                showConfirmButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "હા",
                cancelButtonText: "ના",
                closeOnConfirm: false
            },
                function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "POST",
                            url: "ActivityEventTrainingDataEntry.aspx/DeleteEvents",
                            data: '{EventID: "' + JSON.stringify(EventID) + '",VillageID: "' + JSON.stringify(VillageID) + '",AETid: "' + ddlprogm + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var msg = response.d;
                                swal("", msg, "success");
                                LoadGrid(1);
                                ClearAll();
                            },
                            failure: function (response) {
                                swal(response.d);
                            },
                            error: function (response) {
                                swal("error");
                            }
                        });
                    }
                })
        }

        $("#btnReset").bind("click", function () {
            $("[id*=btnReset]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
            $("[id*=btnReset]").attr('disabled', 'disabled');
            $("#hdnReset").val("1");

            $("#div2").css({ 'display': "none" });

            $("#div1").css({ 'display': "block" });
            $("#divSave").css({ 'display': "block" });
            ClearAll();

            $("[id*=btnBenificaryMember]").removeAttr('disabled');

            if ($("#hdnReset").val() == "1") {
                $("[id*=btnReset]").html("રદ કરો");
                $("[id*=btnReset]").removeAttr('disabled');
                $("#hdnReset").val(0);
            }

        });


        function SearchTerm() {
            return jQuery.trim($("[id*=ddlSrchProgram]").val());

        };

        function LoadGrid(pageIndex) {
            if (SearchTerm() != 0) {
                $("#divGrid").css({ 'display': "block" });
                $.ajax({
                    type: "POST",
                    url: "ActivityEventTrainingDataEntry.aspx/LoadGrid",
                    data: '{searchTerm: "' + SearchTerm() + '",pageIndex: ' + pageIndex + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnGridSuccessActivityGrid,
                    failure: function (response) {
                        swal(response.d);
                    },
                    error: function (response) {
                        swal(response.d);
                    }
                });
            }
            else {
                $("#divGrid").css({ 'display': "none" });
            }
        }

        var myrowl;
        function OnGridSuccessActivityGrid(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var customers = xml.find("EventDetails");

            if (myrowl == null) {
                myrowl = $("[id*=gvEvents] tr:last-child").clone(true);
            }
            $("[id*=gvEvents] tr").not($("[id*=gvEvents] tr:first-child")).remove();

            if (customers.length > 0) {

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrowl).eq(0).html($(this).find("RowNumber").text());

                    if ($(this).prev().find("TypeOfEvent").text() == $(this).find("TypeOfEvent").text()) {
                        $("td", myrowl).eq(1).html("");
                    }
                    else {
                        $("td", myrowl).eq(1).html($(this).find("TypeOfEvent").text());
                    }


                    if ($(this).prev().find("Program").text() == $(this).find("Program").text()) {
                        $("td", myrowl).eq(2).html("");
                    }
                    else {
                        $("td", myrowl).eq(2).html($(this).find("Program").text());
                    }
                    if ($(this).prev().find("Subject").text() == $(this).find("Subject").text()) {
                        $("td", myrowl).eq(3).html("");
                    }
                    else {
                        $("td", myrowl).eq(3).html($(this).find("Subject").text());
                    }
                    if ($(this).prev().find("Place").text() == $(this).find("Place").text()) {
                        $("td", myrowl).eq(4).html("");
                    }
                    else {
                        $("td", myrowl).eq(4).html($(this).find("Place").text());
                    }


               
                    $("td", myrowl).eq(5).html($(this).find("VillageCode").text());
                    $("td", myrowl).eq(6).html($(this).find("VillageName").text());
                    $("td", myrowl).eq(7).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditEvent(' + $(this).find("EventID").text() + ',' + $(this).find("VillageCode").text() + ');"><i class="fa fa-edit"></i></a>'));
                    $("td", myrowl).eq(8).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteEvent(' + $(this).find("EventID").text() + ',' + $(this).find("VillageCode").text() + ');"><i class="fa fa-trash"></i></a>'));
                    $("td", myrowl).eq(9).html($('<a class="btn btn-flat ink-reaction btn-default"  onclick="return AddMember(' + $(this).find("EventID").text() + ',' + $(this).find("VillageCode").text() + ');">સભ્યો ઉમેરો</a>'));


                    $("[id*=gvEvents]").append(myrowl);
                    myrowl = $("[id*=gvEvents] tr:last-child").clone(true);
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
                $("[id*=gvEvents]").append(empty_row);
            }
        };

        $(function () {

            $("#btnSave").bind("click", function () {

                var EventID = document.getElementById("<%=this.txtSubject.ClientID %>");
                var Village = document.getElementById("<%=this.ddlVillage.ClientID %>");
                var Insti = document.getElementById("<%=this.ddlInstitute.ClientID %>");
                var searchtype = document.getElementById("<%=this.ddlFilter.ClientID %>");
                var ProgramID;
                var EventDetailID;
                var IsEdit;
                var Members = "";

                if (Village.value == "0" && Insti.value == "0" && searchtype.value == "0") {
                    Village.focus();
                    swal("", "ગામ અથવા મંડળી અથવા સર્ચ ટાઇપ પસંદ કરો", "warning");

                    return false;
                }               
                else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                    var Event = {};
                    $('input[name="Members"]:checked').each(function () {
                        Members += $(this).val() + ",";
                    });

                   // var DetailID1 = GetParameterValues('DetailID');
                    Event.EventDetailID = document.getElementById("<%=this.hdnDetailID.ClientID %>").value;
                   // var ProgramID = GetParameterValues('AETid');
                    Event.ProgramID = document.getElementById("<%=this.hdnAETid.ClientID %>").value;

                  //  Event.EventID = document.getElementById("<%=this.txtSubject.ClientID %>").value;
                    Event.Members = Members;

                    Event.IsEdit = document.getElementById("<%=this.hdnISEdit.ClientID %>").value;

                    if (Event.IsEdit == "1") {
                        var AETid = document.getElementById("<%=this.hdnAETid.ClientID %>").value;
                        var village = document.getElementById("<%=this.ddlVillage.ClientID %>").value;
                        var DeailID = document.getElementById("<%=this.hdnDetailID.ClientID %>").value;
                        $.ajax({
                            type: "POST",
                            url: "ActivityEventTrainingDataEntry.aspx/DeleteParticipateDetails",
                            data: '{village: ' + JSON.stringify(village) + ',DeailID: ' + JSON.stringify(DeailID) + ',AETid: ' + JSON.stringify(AETid) + '}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                swal("Done!", response.d, "success");
                                Event.IsEdit = 0;

                                $.ajax({
                                    type: "POST",
                                    url: "ActivityEventTrainingDataEntry.aspx/ManageEvent",
                                    data: '{Events: ' + JSON.stringify(Event) + '}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        swal("Done!", response.d, "success");
                                    },
                                    failure: function (response) {
                                        swal(response.d);
                                    },
                                    error: function (response) {
                                        swal(response.d);
                                    }
                                });
                            },
                            failure: function (response) {
                                swal(response.d);
                            },
                            error: function (response) {
                                swal(response.d);
                            }
                        });
                    }
                    else {
                        Event.IsEdit = 0;
                        $.ajax({
                            type: "POST",
                            url: "ActivityEventTrainingDataEntry.aspx/ManageEvent",
                            data: '{Events: ' + JSON.stringify(Event) + '}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                swal("Done!", response.d, "success");
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

                if ($("#hdnSubmitVal").val() == "1") {
                    $("[id*=btnSave]").html("ભાગ લેનાર સભ્યો (લાભાર્થી) દાખલ કરો");
                    $("[id*=btnSave]").removeAttr('disabled');
                    $("#hdnSubmitVal").val(0);
                }
                ClearAll();
            });
        });



    function BindMember() {

    }


    function Validate() {

        var ddlVillage = document.getElementById("<%=this.ddlVillage.ClientID %>").value;
            var institute = document.getElementById("<%=this.ddlInstitute.ClientID %>").value;
            if (ddlVillage != 0) {
                document.getElementById("<%=this.txtSearchField.ClientID %>").value = "";
                document.getElementById("<%=this.ddlInstitute.ClientID %>").value = 0;
                document.getElementById("<%=this.ddlFilter.ClientID %>").value = 0;

            }
          //  FillMember(ddlVillage,0,0);
        }
        function Validate1() {

            var ddlVillage = document.getElementById("<%=this.ddlVillage.ClientID %>").value;
            var institute = document.getElementById("<%=this.ddlInstitute.ClientID %>").value;
            if (institute != 0) {
                document.getElementById("<%=this.txtSearchField.ClientID %>").value = "";
                document.getElementById("<%=this.ddlVillage.ClientID %>").value = 0;
                document.getElementById("<%=this.ddlFilter.ClientID %>").value = 0;

            }
          //  FillMember(0,institute,0);
        }
        function Validate2() {
            
            var txtHouseHold = document.getElementById("<%=this.txtSearchField.ClientID %>").value;
            var institute = document.getElementById("<%=this.ddlInstitute.ClientID %>").value;
            var Filter = document.getElementById("<%=this.ddlFilter.ClientID %>").value;
            if (Filter != 0) {
                document.getElementById("<%=this.ddlVillage.ClientID %>").value = 0;
                document.getElementById("<%=this.ddlInstitute.ClientID %>").value = 0;
            }
            else {
                document.getElementById("<%=this.txtSearchField.ClientID %>").value = "";
            }
          //  FillMember(0,0,txtHouseHold);
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
                    var ddlTaluka = $("[id*=ddlTaluka]");
                    $("[id*=ddlTaluka]").empty();
                    $.each(r.d, function () {
                        if (selectedDistrictID == this['Value'])
                            ddlTaluka.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlTaluka.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

        function BindVillage() {
            ListVillage(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            ListInstitute(document.getElementById("<%=this.ddlTaluka.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlTaluka.ClientID %>").value == 0) {
                ListVillage(0, 0);
                ListInstitute(0, 0);
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

                    var ddlVillage = $("[id*=ddlVillage]");
                    $("[id*=ddlVillage]").empty();
                    $.each(r.d, function () {
                        if (selectedVillageID == this['Value'])
                            ddlVillage.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlVillage.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });

                  
                }
            });
            return false;
        }

        function ListInstitute(TalukaID, selectedVillageID) {

            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingDataEntry.aspx/ListInstitute",
                data: '{TalukaID: ' + TalukaID + '}',
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

    function ListDistrict() {

        $.ajax({
            type: "POST",
            url: "CommonMethods.aspx/ListDistrict",
            data: '{}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                var ddlDistrict = $("[id*=ddlDistrict]");

                $("[id*=ddlDistrict]").empty();
                $.each(r.d, function () {
                    ddlDistrict.append($("<option></option>").val(this['Value']).html(this['Text']));
                });

                var ddlDistrict = $("[id*=ddlDistrict1]");

                $("[id*=ddlDistrict1]").empty();
                $.each(r.d, function () {
                    ddlDistrict.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
        });
        return false;
    }

    function BindTalukaOther() {
        ListTalukaOther(document.getElementById("<%=this.ddlDistrict1.ClientID %>").value, 0);
            if (document.getElementById("<%=this.ddlDistrict1.ClientID %>").value == 0) {
                ListTalukaOther(0, 0);
                ListVillageOther(0, 0);
            }
            else {
                ListVillageOther(0, 0);
            }
        }

        function ListTalukaOther(DistrictID, selectedDistrictID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListTaluka",
                data: '{ DistrictID: ' + DistrictID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlTaluka = $("[id*=ddlTaluka1]");
                    $("[id*=ddlTaluka1]").empty();
                    $.each(r.d, function () {
                        if (selectedDistrictID == this['Value'])
                            ddlTaluka.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlTaluka.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });

                   
                }
            });
            return false;
        }

        function BindVillageOther() {
            ListVillageOther(document.getElementById("<%=this.ddlTaluka1.ClientID %>").value, 0);            
            if (document.getElementById("<%=this.ddlTaluka1.ClientID %>").value == 0) {
                ListVillageOther(0, 0);
              
            }
        }

        function ListVillageOther(TalukaID, selectedVillageID) {

            $.ajax({
                type: "POST",
                url: "CommonMethods.aspx/ListVillage",
                data: '{TalukaID: ' + TalukaID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var ddlVillage = $("[id*=ddlVillage1]");
                    $("[id*=ddlVillage1]").empty();
                    $.each(r.d, function () {
                        if (selectedVillageID == this['Value'])
                            ddlVillage.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlVillage.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });


                }
            });
            return false;
        }

    </script>

</asp:Content>

