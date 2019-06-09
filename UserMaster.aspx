<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">વપરાશકર્તા</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">વપરાશકર્તા ઉમેરો/સુધારો</a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>
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
                                                    <asp:DropDownList ID="ddlUserType" onchange="ShowHideCluster();" runat="server" CssClass="form-control" DataSourceID="dsUserType" DataTextField="UserType" DataValueField="UserTypeID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="dsUserType" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>' SelectCommand="ListUserType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    <label>વપરાશકર્તા લેવલ</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" id="divCluster">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlCluster" runat="server" CssClass="form-control" DataSourceID="dsCluster" DataTextField="ClusterName" DataValueField="ClusterID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="dsCluster" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>' SelectCommand="ListAllCluster" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:SessionParameter SessionField="ClusterID" Name="ClusterID" Type="Int64"></asp:SessionParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <label>ક્લસ્ટર</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtFullName" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                                    <label>પૂરું નામ</label>
                                                </div>
                                                <asp:HiddenField ID="hdnUserID" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtAddress" class="form-control" MaxLength="150" runat="server"></asp:TextBox>
                                                    <label>સરનામું</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtMobNo" class="form-control" MaxLength="10" onkeypress="return isNumberKey(event);"  runat="server"></asp:TextBox>
                                                    <label>મોબાઈલ નંબર (E)</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtUserName" class="form-control" MaxLength="20" runat="server"></asp:TextBox>
                                                    <label>વપરાશકર્તા નામ (E)</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtPassword" class="form-control" MaxLength="30" runat="server"></asp:TextBox>
                                                    <label>પાસવર્ડ (E)</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtEmailID" class="form-control" MaxLength="50" runat="server"></asp:TextBox>
                                                    <label>ઈ-મેઈલ (E)</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtShortCode" class="form-control" MaxLength="30" runat="server"></asp:TextBox>
                                                    <label>શોર્ટ કોડ (E)</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divCircles"></div>
                                                    <label>-- વર્તુળ પસંદ કરો --</label>
                                                </div>
                                                <input type="hidden" id="hdncircles" runat="server"/>
                                                <input type="hidden" id="checkedcircle" runat="server"/>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divDivisions"></div>
                                                    <label id="lbldiv">-- વિભાગ પસંદ કરો --</label>
                                                </div>
                                                <input type="hidden" id="hdndivs" runat="server" />
                                                <input type="hidden" id="checkeddivision" runat="server"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divSubDivisions"></div>
                                                    <label id="lblsubdiv">-- પેટા વિભાગ પસંદ કરો --</label>
                                                </div>
                                                <input type="hidden" id="hdnsubdivs" runat="server"/>
                                                <input type="hidden" id="checkedsubdivision" runat="server"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divSections"></div>
                                                    <label id="lblsec">-- સેક્સન પસંદ કરો --</label>
                                                </div>
                                                <input type="hidden" id="hdnsections" runat="server"/>
                                                <input type="hidden" id="checkedsection" runat="server" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <div id="divBeats"></div>
                                                    <label id="lblbeat">-- બીટ પસંદ કરો --</label>
                                                </div>
                                                <input type="hidden" id="hdnbeats" runat="server" />
                                                <input type="hidden" id="checkedbeat" runat="server"/>
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

                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchCircle" runat="server" CssClass="form-control" onchange="BindDivision()" DataSourceID="dsSrchCircle" DataTextField="CircleName" DataValueField="CircleID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="dsSrchCircle" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>' SelectCommand="ListCircleByUserID" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter SessionField="UserID" Name="UserID" Type="Int64"></asp:SessionParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <label>વર્તુળ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchDivision" onchange="BindSubDivision()" runat="server" class="form-control"></asp:DropDownList>
                                            <label>વિભાગ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchSubDivision" onchange="BindSection()" runat="server" class="form-control"></asp:DropDownList>
                                            <label>પેટા વિભાગ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchSubSection" onchange="BindBeat()" runat="server" class="form-control"></asp:DropDownList>
                                            <label>સેક્સન</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSrchBeat" runat="server" class="form-control"></asp:DropDownList>
                                            <label>બીટ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:TextBox ID="txtSearch" class="form-control" runat="server"></asp:TextBox>
                                            <label>વપરાશકર્તા નામ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <button id="btnFindUser" type="button" class="btn ink-reaction btn-raised btn-primary"
                                            data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો">
                                            વપરાશકર્તા શોધો</button>
                                        <input type="hidden" id="hdnFindUser" value="0" />
                                    </div>
                                </div>

                                <div class="row" id="divGrid" style="display:none ;">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">

                                            <asp:GridView ID="gvUser" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                    <asp:BoundField DataField="FullName" HeaderText="પૂરું નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="FullName"></asp:BoundField>
                                                    <asp:BoundField DataField="Address" HeaderText="સરનામું" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="Address"></asp:BoundField>
                                                    <asp:BoundField DataField="CircleName" HeaderText="વર્તુળ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="CircleName"></asp:BoundField>
                                                    <asp:BoundField DataField="DivisionName" HeaderText="વિભાગ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="DivisionName"></asp:BoundField>
                                                    <asp:BoundField DataField="SubDivisionName" HeaderText="પેટા વિભાગ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="SubDivisionName"></asp:BoundField>
                                                    <asp:BoundField DataField="SectionName" HeaderText="સેક્સન" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="SectionName"></asp:BoundField>
                                                    <asp:BoundField DataField="BeatName" HeaderText="બીટ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="BeatName"></asp:BoundField>
                                                    <asp:BoundField DataField="UserType" HeaderText="વપરાશકર્તા પ્રકાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="UserType"></asp:BoundField>
                                                    <asp:BoundField DataField="UserName" HeaderText="વપરાશકર્તા નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="UserName"></asp:BoundField>

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
    <script type="text/javascript">
        var rights = "";
        $(function () {
            SetMenu("liUtility", "ulUtility", "liuser", "aUserMaster", "", "");

            var userid = '<%= Session["UserID"].ToString() %>';
            var logintype = '<%= Session["LoginType"].ToString() %>';
            var formnameid = "aUserMaster";
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
            $("[id*=litab1]").attr('class', 'active');
            $("#divCluster").css({ 'display': "none" });

            FillCircle();

            //BEGIN - For Filteration in Grid 
            BindDivision(0);
            BindSubDivision(0);
            BindSection(0);
            BindBeat(0);
            //BEGIN - For Filteration in Grid
        })

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
        }

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            
        }

        function ShowHideCluster() {
            var UserType = document.getElementById("<%=this.ddlUserType.ClientID %>");

            if (UserType.value == "2") {
                $("#divCluster").css({ 'display': "block" });
            }
            else 
                {
                $("#divCluster").css({ 'display': "none" });
            }
        }

        function FillCircle() {
            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListCircles",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if (r.d.length > 0) {

                        $.each(r.d, function () {
                            if (r.d.length % 2 == 0) {
                                strGroups += " <div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chk" + this['Value'] + "' type='checkbox' onclick='ListDivison(this.id,this.value);' name='circles' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                            }
                            else
                                strGroups += " <div class='col-sm-6'><div class='checkbox checkbox-styled'><label><input id='chk" + this['Value'] + "' type='checkbox' onclick='ListDivison(this.id,this.value);' name='circles' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                        });

                        $("#divCircles").html(strGroups);
                    }
                }
            });
        }

        function ListDivison(cir, circles) {

            var c = "";
            if ($("[id*=checkedcircle]").val() != "") {
                var AllCheckedSubDivs = $("[id*=checkedcircle]").val();
                divs = AllCheckedSubDivs.split(',');
            }
            else {
                divs = circles;
            }

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListDivisionByCircle",
                data: '{ CircleID: "' + circles + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if ($("[id*=hdnUserID]").val() != "") {

                        var AllCheckedDivs = $("[id*=checkeddivision]").val();
                        var DivSeparate = AllCheckedDivs.split(',');

                        if (r.d.length > 0) {

                            $.each(r.d, function () {
                                if ($("[id*=checkeddivision]").val() != "") {

                                    if (jQuery.inArray(this['Value'], DivSeparate) != '-1') {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true' id='chk" + this['Value'] + "' onchange='ListSubDivison(this.id,this.value);' name='divisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                    else {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' onchange='ListSubDivison(this.id,this.value);' name='divisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                }
                                else {
                                    if ($("#" + cir).is(':checked') == true) {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'><div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' checked='true' onchange='ListSubDivison(this.id,this.value);' name='divisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                        ListSubDivison('chk' + this['Value'] + '', this['Value']);
                                    }
                                    else {
                                        RemoveDivision(this['Value']);
                                        $('#divDivisions').find('#abc' + this['Value']).remove();
                                    }
                                }
                            })

                            if ($('input[name="circles"]:checked').length == 0)
                                $('#divDivisions').find('#lbldiv').attr("style", "display:block");

                            else {

                                $('#divDivisions').find('#lbldiv').attr("style", "display:none");
                                $("#divDivisions").append(strGroups);

                                ListSubDivison();

                            }

                        }
                    }
                    else {
                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                if ($("#" + cir).is(':checked') == true) {


                                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' ><div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true' id='chk" + this['Value'] + "'  onchange='ListSubDivison(this.id,this.value);' name='divisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    ListSubDivison('chk' + this['Value'] + '', this['Value']);

                                }
                                else {

                                    RemoveDivision(this['Value']);
                                    $('#divDivisions').find('#abc' + this['Value']).remove();


                                }

                            });

                            if ($('input[name="circles"]:checked').length == 0)
                                $('#divDivisions').find('#lbldiv').attr("style", "display:block");

                            else {

                                $('#divDivisions').find('#lbldiv').attr("style", "display:none");
                                $("#divDivisions").append(strGroups);
                                ListSubDivison();

                            }
                        }
                        else {
                            if ($('input[name="circles"]:checked').length == 0)
                                $('#divDivisions').find('#lbldiv').attr("style", "display:block");
                        }
                    }
                }
            })

        }

        function ListSubDivison(div, seldiv) {

            var divs = "";

            if ($("[id*=checkeddivision]").val() != "") {
                var AllCheckedSubDivs = $("[id*=checkeddivision]").val();
                divs = AllCheckedSubDivs.split(',');
            }
            else {
                divs = seldiv;
            }

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListSubDivisionByDivision",
                data: '{ DivisionID: "' + divs + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if ($("[id*=hdnUserID]").val() != "") {

                        var AllCheckedSubDivs = $("[id*=checkedsubdivision]").val();
                        var SubDivSeparate = AllCheckedSubDivs.split(',');

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                if ($("[id*=checkedsubdivision]").val() != "") {

                                    if (jQuery.inArray(this['Value'], SubDivSeparate) != '-1') {

                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' checked='true' onchange='ListSection(this.id,this.value);' name='subdivisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                    else {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'><div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' onchange='ListSection(this.id,this.value);' name='subdivisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                }
                                else {

                                    if ($("#" + div).is(':checked') == true) {

                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true' id='chk" + this['Value'] + "' onchange='ListSection(this.id,this.value);' name='subdivisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                        ListSection('chk' + this['Value'] + '', this['Value']);

                                    }

                                    else {

                                        RemoveSubDivision(this['Value']);
                                        $('#divSubDivisions').find('#abc' + this['Value']).remove();
                                    }
                                }
                            })
                            if ($('input[name="divisions"]:checked').length == 0)
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                            else {

                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:none");
                                $("#divSubDivisions").append(strGroups);
                                ListSection();


                            }

                        }
                    }
                    else {

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                if ($("#" + div).is(':checked') == true) {

                                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true' id='chk" + this['Value'] + "' onchange='ListSection(this.id,this.value);' name='subdivisions' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    ListSection('chk' + this['Value'] + '', this['Value']);
                                }
                                else {

                                    $('#divSubDivisions').find('#abc' + this['Value']).remove();
                                    RemoveSubDivision(this['Value']);
                                    // ListSection();
                                }
                            });
                            if ($('input[name="divisions"]:checked').length == 0)
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                            else {
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:none");
                                $("#divSubDivisions").append(strGroups);
                                ListSection();

                            }
                        }
                        else {

                            if ($('input[name="divisions"]:checked').length == 0)
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                            else {
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:none");
                                $("#divSubDivisions").append(strGroups);
                                ListSection();

                            }
                        }
                    }
                }
            })

        }

        function ListSection(sub, selsubdiv) {

            var subdivs = "";
            if ($("[id*=checkedsubdivision]").val() != "") {
                var AllCheckedSubDivs = $("[id*=checkedsubdivision]").val();
                subdivs = AllCheckedSubDivs.split(',');
            }
            else {
                subdivs = selsubdiv;
            }


            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListSectionBySubDivision",
                data: '{ SubDivisionID: "' + subdivs + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if ($("[id*=hdnUserID]").val() != "") {

                        var AllCheckedSubDivs = $("[id*=checkedsection]").val();
                        var SubDivSeparate = AllCheckedSubDivs.split(',');

                        if (r.d.length > 0) {

                            $.each(r.d, function () {
                                if ($("[id*=checkedsection]").val() != "") {

                                    if (jQuery.inArray(this['Value'], SubDivSeparate) != '-1') {

                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' checked='true' onchange='ListBits(this.id,this.value);' name='sections' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                    else {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'><div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' onchange='ListBits(this.id,this.value);' name='sections' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                }
                                else {

                                    if ($("#" + sub).is(':checked') == true) {

                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'><div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' checked='true' onchange='ListBits(this.id,this.value);' name='sections' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                        ListBits('chk' + this['Value'] + '', this['Value']);

                                    }
                                    else {

                                        RemoveBeats(this['Value']);
                                        $('#divSections').find('#abc' + this['Value']).remove();
                                    }
                                }
                            })
                            if ($('input[name="subdivisions"]:checked').length == 0)
                                $('#divSections').find('#lblsec').attr("style", "display:block");
                            else {
                                $('#divSections').find('#lblsec').attr("style", "display:none");
                                $("#divSections").append(strGroups);
                                ListBits();

                            }

                        }
                    }
                    else {
                        if (r.d.length > 0) {

                            $.each(r.d, function () {
                                if ($("#" + sub).is(':checked') == true) {


                                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'><div class='checkbox checkbox-styled'><label><input type='checkbox' id='chk" + this['Value'] + "' checked='true' onchange='ListBits(this.id,this.value);' name='sections' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    ListBits('chk' + this['Value'] + '', this['Value']);

                                }

                                else {

                                    RemoveBeats(this['Value']);
                                    $('#divSections').find('#abc' + this['Value']).remove();

                                }
                            });

                            if ($('input[name="subdivisions"]:checked').length == 0)
                                $('#divSections').find('#lblsec').attr("style", "display:block");
                            else {
                                $('#divSections').find('#lblsec').attr("style", "display:none");
                                $("#divSections").append(strGroups);
                                ListBits();
                            }
                        }
                        else {

                            if ($('input[name="subdivisions"]:checked').length == 0)
                                $('#divSections').find('#lblsec').attr("style", "display:block");
                            else {
                                $('#divSections').find('#lblsec').attr("style", "display:none");
                                $("#divSections").append(strGroups);
                                ListBits();
                            }
                        }
                    }
                }
            })



        }

        function ListBits(sec, selsections) {

            var sections = "";
            if ($("[id*=checkedsection]").val() != "") {
                var AllCheckedSubDivs = $("[id*=checkedsection]").val();
                sections = AllCheckedSubDivs.split(',');
            }
            else {
                sections = selsections;
            }

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListBeatBySection",
                data: '{ SectionID: "' + sections + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var strGroups = "";
                    if ($("[id*=hdnUserID]").val() != "") {

                        var AllCheckedSections = $("[id*=checkedbeat]").val();
                        var SectionSeparate = AllCheckedSections.split(',');

                        if (r.d.length > 0) {

                            $.each(r.d, function () {
                                if ($("[id*=checkedbeat]").val() != "") {
                                    if (jQuery.inArray(this['Value'], SectionSeparate) != '-1') {

                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true' name='beats' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                    else {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' name='beats' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                }
                                else {
                                    if ($("#" + sec).is(':checked') == true) {
                                        strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "'> <div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true'  name='beats' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                    }
                                    else {
                                        $('#divBeats').find('#abc' + this['Value']).remove();
                                    }
                                }
                            })
                            if ($('input[name="sections"]:checked').length == 0)
                                $('#divBeats').find('#lblbeat').attr("style", "display:block");
                            else {
                                $('#divBeats').find('#lblbeat').attr("style", "display:none");
                                $("#divBeats").append(strGroups);
                                $("[id*=checkedbeat]").val('');
                                $("[id*=checkedsection]").val('');
                                $("[id*=checkedsubdivision]").val('');
                                $("[id*=checkeddivision]").val('');
                                $("[id*=checkedcircle]").val('');
                            }
                        }
                    }
                    else {
                        if (r.d.length > 0) {

                            $.each(r.d, function () {
                                if ($("#" + sec).is(':checked') == true) {
                                    strGroups += "<div class='col-sm-6' id='abc" + this['Value'] + "' > <div class='checkbox checkbox-styled'><label><input type='checkbox' checked='true' name='beats' text='" + this['Text'] + "' value='" + this['Value'] + "' /><span class='lbl'>&nbsp;&nbsp;" + this['Text'] + "</span></label></div></div>";
                                }
                                else {
                                    $('#divBeats').find('#abc' + this['Value']).remove();
                                }
                            });
                            if ($('input[name="sections"]:checked').length == 0)
                                $('#divBeats').find('#lblbeat').attr("style", "display:block");
                            else {
                                $('#divBeats').find('#lblbeat').attr("style", "display:none");
                                $("#divBeats").append(strGroups);
                            }
                        }
                        else {
                            if ($('input[name="sections"]:checked').length == 0)
                                $('#divBeats').find('#lblbeat').attr("style", "display:block");
                            else {
                                $('#divBeats').find('#lblbeat').attr("style", "display:none");
                                $("#divBeats").append(strGroups);
                            }
                        }
                    }
                }
            })


        }



        function RemoveDivision(CircleID) {

            if ($('input[name="circles"]:checked').length == 0) {
                $('#divDivisions').find('div').remove();
                $('#divDivisions').find('#lbldiv').attr("style", "display:block");
                $('#divSubDivisions').find('div').remove();
                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                $('#divSections').find('div').remove();
                $('#divBeats').find('div').remove();
                $('#divSections').find('#lblsec').attr("style", "display:block");
                $('#divBeats').find('#lblbeat').attr("style", "display:block");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "UserMaster.aspx/ListDivisionByCircle",
                    data: '{ CircleID: "' + CircleID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                $('#divDivisions').find('#abc' + this['Value']).remove();

                            });
                            if ($('input[name="circles"]:checked').length == 0)
                                $('#divDivisions').find('#lbldiv').attr("style", "display:block");

                        }
                        else {
                            if ($('input[name="circles"]:checked').length == 0)
                                $('#divDivisions').find('#lbldiv').attr("style", "display:block");
                            else {
                                $('#divDivisions').find('#lbldiv').attr("style", "display:none");
                                RemoveSubDivision(CircleID);
                            }
                        }
                    }
                })
            }
        }

        function RemoveSubDivision(DivisionID) {


            if ($('input[name="divisions"]:checked').length == 0) {


                $('#divSubDivisions').find('div').remove();

                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                $('#divSections').find('div').remove();
                $('#divBeats').find('div').remove();
                $('#divSections').find('#lblsec').attr("style", "display:block");
                $('#divBeats').find('#lblbeat').attr("style", "display:block");

            }
            else {
                $.ajax({
                    type: "POST",
                    url: "UserMaster.aspx/ListSubDivisionByDivision",
                    data: '{ DivisionID: "' + DivisionID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                $('#divSubDivisions').find('#abc' + this['Value']).remove();

                                RemoveSection(this['Value']);
                            });
                            if ($('input[name="divisions"]:checked').length == 0)
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                        }
                        else {

                            if ($('input[name="divisions"]:checked').length == 0)
                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
                            else {

                                $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:none");
                                RemoveSection(DivisionID);
                            }
                        }
                    }
                })
            }
        }

        function RemoveSection(SubDivisionID) {

            if ($('input[name="subdivisions"]:checked').length == 0) {

                $('#divSections').find('div').remove();
                $('#divBeats').find('div').remove();
                $('#divSections').find('#lblsec').attr("style", "display:block");
                $('#divBeats').find('#lblbeat').attr("style", "display:block");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "UserMaster.aspx/ListSectionBySubDivision",
                    data: '{ SubDivisionID: "' + SubDivisionID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {


                            $.each(r.d, function () {

                                $('#divSections').find('#abc' + this['Value']).remove();

                                RemoveBeats(this['Value']);
                            });

                            if ($('input[name="subdivisions"]:checked').length == 0)
                                $('#divSections').find('#lblsec').attr("style", "display:block");
                        }
                        else {
                            if ($('input[name="subdivisions"]:checked').length == 0)
                                $('#divSections').find('#lblsec').attr("style", "display:block");
                            else {
                                $('#divSections').find('#lblsec').attr("style", "display:none");
                                RemoveBeats(SubDivisionID);
                            }
                        }
                    }
                })
            }
        }

        function RemoveBeats(SectionID) {
            if ($('input[name="sections"]:checked').length == 0) {

                $('#divSections').find('div').remove();
                $('#divBeats').find('div').remove();

                $('#divSections').find('#lblsec').attr("style", "display:block");
                $('#divBeats').find('#lblbeat').attr("style", "display:block");

            }
            else {
                $.ajax({
                    type: "POST",
                    url: "UserMaster.aspx/ListBeatBySection",
                    data: '{ SectionID: "' + SectionID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var strGroups = "";

                        if (r.d.length > 0) {

                            $.each(r.d, function () {

                                $('#divBeats').find('#abc' + this['Value']).remove();

                            });

                            if ($('input[name="sections"]:checked').length == 0)
                                $('#divBeats').find('#lblbeat').attr("style", "display:block");

                        }
                        else {

                            if ($('input[name="sections"]:checked').length == 0)
                                $('#divBeats').find('#lblbeat').attr("style", "display:block");
                            else
                                $('#divBeats').find('#lblbeat').attr("style", "display:none");
                        }
                    }
                })
            }
        }


        function BindDivision() {

            var circleid = $("[id*=ddlSrchCircle]").val();

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListDivisionByCircleSimple",
                data: '{ CircleID: ' + circleid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlDivision = $("[id*=ddlSrchDivision]");
                    $("[id*=ddlSrchDivision]").empty();
                    $.each(r.d, function () {
                        ddlDivision.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        function BindSubDivision() {
            var divisionid = $("#ContentPlaceHolder1_ddlSrchDivision").val();

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListSubDivisionByDivisionSimple",
                data: '{ DivisionID: ' + divisionid + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSubDivision = $("#ContentPlaceHolder1_ddlSrchSubDivision");
                    $("#ContentPlaceHolder1_ddlSrchSubDivision").empty();
                    $.each(r.d, function () {
                        ddlSubDivision.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        function BindSection() {
            var subdivisionid = $("#ContentPlaceHolder1_ddlSrchSubDivision").val();

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListSectionBySubDivisionSimple",
                data: '{ SubDivisionID: ' + subdivisionid + '}',
                contentType: "application/json; subdivisionid=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlSection = $("[id*=ddlSrchSubSection]");
                    $("[id*=ddlSrchSubSection]").empty();
                    $.each(r.d, function () {
                        ddlSection.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        function BindBeat() {
            var sectionid = $("[id*=ddlSrchSubSection]").val();

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/ListBeatBySectionSimple",
                data: '{ SectionID: ' + sectionid + '}',
                contentType: "application/json; subdivisionid=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlBeat = $("[id*=ddlSrchBeat]");
                    $("[id*=ddlSrchBeat]").empty();
                    $.each(r.d, function () {
                        ddlBeat.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }

        $(function () {

            $("#btnSave").bind("click", function () {

                var uid = $("[id*=hdnUserID]").val();

                var usertype = document.getElementById("<%=this.ddlUserType.ClientID %>");
                var cluster = document.getElementById("<%=this.ddlCluster.ClientID %>");
                var fullname = document.getElementById("<%=this.txtFullName.ClientID %>");
                var mno = document.getElementById("<%=this.txtMobNo.ClientID %>");
                var username = document.getElementById("<%=this.txtUserName.ClientID %>");
                var password = document.getElementById("<%=this.txtPassword.ClientID %>");
                var email = document.getElementById("<%=this.txtEmailID.ClientID %>");
                var shortcode = document.getElementById("<%=this.txtShortCode.ClientID %>");

                var Emailfilter = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

                if (usertype.value == "0") {
                    usertype.focus();
                    swal("", "વપરાશકર્તા પ્રકાર પસંદ કરો", "warning");

                    return false;
                }
                else if (fullname.value == "") {
                    fullname.focus();
                    swal("", "પૂરું નામ દાખલ કરો", "warning");

                    return false;
                }
                else if (mno.value == "") {
                    mno.focus();
                    swal("", "મોબઈલ નંબર દાખલ કરો", "warning");

                    return false;
                }
                else if (mno.value != "" && mno.value.length < 10) {
                    mno.focus();
                    swal("", "માન્ય મોબઈલ નંબર દાખલ કરો", "warning");

                    return false;
                }
                else if (username.value == "") {
                    username.focus();
                    swal("", "વપરાશકર્તા દાખલ કરો", "warning");

                    return false;
                }
                else if (password.value == "") {
                    password.focus();
                    swal("", "પાસવર્ડ દાખલ કરો", "warning");

                    return false;
                }

                else if (email.value != "" && Emailfilter.test(email.value) == false) {
                    email.focus();
                    swal("", "માન્ય ઈ-મેલ દાખલ કરો", "warning");

                    return false;
                }
                else if (shortcode.value == "") {
                    shortcode.focus();
                    swal("", "શોર્ટ કોડ દાખલ કરો", "warning");

                    return false;
                }
                else if ($("input[name='circles']:checked").length == 0) {
                    swal("", "કોઈ એક વર્તુળ પસંદ કરો", "warning");
                    return false;
                }
                    //else if ($('input[name="circles"]:checked').length > 1 && usertype.value != "3" && usertype.value != "11" && usertype.value != "10") {
                    //    swal("", "કોઈ પણ એક વર્તુળ પસંદ  કરો", "warning");
                    //    return false;
                    //}
                    //else if ($('input[name="divisions"]:checked').length > 1 && (usertype.value == "9" || usertype.value == "12" || usertype.value == "13" || usertype.value == "14")) {
                    //    swal("", "કોઈ પણ એક વિભાગ પસંદ  કરો", "warning");

                    //}
                    //else if ($('input[name="subdivisions"]:checked').length > 1 && (usertype.value == "12" || usertype.value == "13" || usertype.value == "14")) {
                    //    swal("", "કોઈ પણ એક પેટા વિભાગ પસંદ  કરો", "warning");
                    //    return false;
                    //}
                    //else if ($('input[name="sections"]:checked').length > 1 && usertype.value == "13") {
                    //    swal("", "કોઈ પણ એક સેક્સન પસંદ  કરો", "warning");
                    //    return false;
                    //}
                //else if ($("input[name='circles']:checked").length > 0 && $("input[name='divisions']:checked").length == 0) {
                //    swal("", "કોઈ એક વિભાગ પસંદ કરો", "warning");

                //    return false;
                //}
                //else if ($("input[name='divisions']:checked").length > 0 && $("input[name='subdivisions']:checked").length == 0) {
                //    swal("", "કોઈ એક પેટાવિભાગપસંદ કરો", "warning");

                //    return false;
                //}
                //else if ($("input[name='subdivisions']:checked").length > 0 && $("input[name='sections']:checked").length == 0) {
                //    swal("", "કોઈ એક સેક્સન પસંદ કરો", "warning");

                //    return false;
                //}
                //else if ($("input[name='sections']:checked").length > 0 && $("input[name='beats']:checked").length == 0) {
                //    swal("", "કોઈ એક બીટ પસંદ કરો", "warning");

                //    return false;
                //}


                else {


                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Wait");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");

                    $(this).html('<i class="ace-icon fa fa-spinner fa-spin bigger-125"></i>પ્રતિક્ષા કરો');
                    $(this).attr("disabled", "disabled");
                    $(this).attr("style", "color: #121212 !important");

                    var user = {};

                    user.UserTypeID = document.getElementById("<%=this.ddlUserType.ClientID %>").value;

                    user.Cluster = document.getElementById("<%=this.ddlCluster.ClientID %>").value;

                    user.FullName = document.getElementById("<%=this.txtFullName.ClientID %>").value;
                    user.Address = document.getElementById("<%=this.txtAddress.ClientID %>").value;
                    user.MobileNo = document.getElementById("<%=this.txtMobNo.ClientID %>").value;
                    user.UserName = document.getElementById("<%=this.txtUserName.ClientID %>").value;
                    user.Password = document.getElementById("<%=this.txtPassword.ClientID %>").value;
                    user.EmailID = document.getElementById("<%=this.txtEmailID.ClientID %>").value;
                    user.ShortCode = document.getElementById("<%=this.txtShortCode.ClientID %>").value;

                    var circle = "";
                    var division = "";
                    var subdivision = "";
                    var section = "";
                    var beat = "";

                    $('input[name="circles"]:checked').each(function () {
                        circle += $(this).val() + ",";
                    });

                    $('input[name="divisions"]:checked').each(function () {
                        division += $(this).val() + ",";
                    });

                    $('input[name="subdivisions"]:checked').each(function () {
                        subdivision += $(this).val() + ",";
                    });

                    $('input[name="sections"]:checked').each(function () {
                        section += $(this).val() + ",";
                    });

                    $('input[name="beats"]:checked').each(function () {
                        beat += $(this).val() + ",";
                    });

                    user.CircleID = circle;
                    user.Division = division;
                    user.SubDivision = subdivision;
                    user.Section = section;
                    user.Beat = beat

                    if (uid == "")
                        user.UserID = 0
                    else
                        user.UserID = uid;

                    $.ajax({
                        type: "POST",
                        url: "UserMaster.aspx/UserManage",
                        data: '{user: ' + JSON.stringify(user) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                            }
                            else {
                                if ($("[id*=hdnUserID]").val() != "") {
                                    swal({
                                        title: "વપરાશકર્તાની વિગત સુધારાઇ ગઇ છે",
                                        type: "success",
                                        showCancelButton: false,
                                        confirmButtonColor: "#5cb85c",
                                        confirmButtonText: "OK",
                                        closeOnConfirm: true
                                    },
                                  function (isConfirm) {
                                      if (isConfirm) {
                                          GridUserMaster(1);
                                          $("#btnSave").html('<i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
                                          $("#btnSave").attr("style", "color: #FFF !important");
                                          $("#btnSave").removeAttr("disabled");
                                          $("#btnClear").removeAttr("disabled");
                                          clearall();
                                      }
                                  });
                                }
                                else {
                                    swal({
                                        title: "વપરાશકર્તાની વિગત દાખલ થઇ ગઈ છે",
                                        type: "success",
                                        showCancelButton: false,
                                        confirmButtonColor: "#5cb85c",
                                        confirmButtonText: "OK",
                                        closeOnConfirm: true
                                    },
                               function (isConfirm) {
                                   if (isConfirm) {
                                       GridUserMaster(1);
                                       $("#btnSave").html('<i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
                                       $("#btnSave").attr("style", "color: #FFF !important");
                                       $("#btnSave").removeAttr("disabled");
                                       $("#btnClear").removeAttr("disabled");
                                       clearall();
                                   }
                               });
                                }
                            }
                        }
                    });
                    $(this).html('<i class="ace-icon fa fa-check bigger-110"></i>દાખલ કરો');
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
            $("#btnFindUser").bind("click", function () {
                $("[id*=btnFindUser]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                $("[id*=btnFindUser]").attr('disabled', 'disabled');
                $("#hdnFindUser").val("1");
                $("#divGrid").css({ 'display': "block" });
                GridUserMaster(1);
                if ($("#hdnFindUser").val() == "1") {
                    $("[id*=btnFindUser]").html("વપરાશકર્તા શોધો");
                    $("[id*=btnFindUser]").removeAttr('disabled');
                    $("#hdnFindUser").val(0);
                }
            })
        });


        function SearchCircleWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchCircle]").val());
        };

        function SearchDivisionWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchDivision]").val());
        };

        function SearchSubDivisionWiseTerm() {
            return jQuery.trim($("[id*=ddlSrchSubDivision]").val());
        };

        function SearchSectionTerm() {
            return jQuery.trim($("[id*=ddlSrchSubSection]").val());
        };

        function SearchBeatTerm() {
            return jQuery.trim($("[id*=ddlSrchBeat]").val());
        };

        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };

        function GridUserMaster(pageIndex) {

            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/GetAllUser",
                data: '{SearchCircleWiseTerm: "' + SearchCircleWiseTerm() + '",SearchDivisionWiseTerm: "' + SearchDivisionWiseTerm() + '",SearchSubDivisionWiseTerm: "' + SearchSubDivisionWiseTerm() + '",SearchSectionTerm: "' + SearchSectionTerm() + '",SearchBeatTerm: "' + SearchBeatTerm() + '",searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
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

            var customers = xml.find("UserMaster");

            if (myrowl == null) {
                myrowl = $("[id*=gvUser] tr:last-child").clone(true);
            }
            $("[id*=gvUser] tr").not($("[id*=gvUser] tr:first-child")).remove();

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
                    $("td", myrowl).eq(1).html($(this).find("FullName").text());
                    $("td", myrowl).eq(2).html($(this).find("Address").text());
                    $("td", myrowl).eq(3).html($(this).find("CircleName").text());
                    $("td", myrowl).eq(4).html($(this).find("DivisionName").text());
                    $("td", myrowl).eq(5).html($(this).find("SubDivisionName").text());
                    $("td", myrowl).eq(6).html($(this).find("SectionName").text());
                    $("td", myrowl).eq(7).html($(this).find("BeatName").text());
                    $("td", myrowl).eq(8).html($(this).find("UserType").text());
                    $("td", myrowl).eq(9).html($(this).find("UserName").text());

                    if (jQuery.inArray("2", rights) != '-1') {
                        $("td", myrowl).eq(10).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditUser(' + $(this).find("UserID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    }
                    else { $("td", myrowl).eq(10).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-edit"></i></a>')); }

                    if (jQuery.inArray("3", rights) != '-1') {
                        $("td", myrowl).eq(11).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteUser(' + $(this).find("UserID").text() + ');"><i class="fa fa-trash"></i></a>'));
                    }
                    else { $("td", myrowl).eq(11).html($('<a disabled="true" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a>')); }

                    $("[id*=gvUser]").append(myrowl);
                    myrowl = $("[id*=gvUser] tr:last-child").clone(true);
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
                var empty_row = myrowl.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", myrowl).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvUser]").append(empty_row);
            }
        };


        function EditUser(userid) {
            $.ajax({
                type: "POST",
                url: "UserMaster.aspx/GetUserDetail",
                data: '{UserID: "' + JSON.stringify(userid) + '"}',
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

            $('input[name="circles"]:checked').removeAttr('checked');
            $('input[name="divisions"]:checked').removeAttr('checked');
            $('input[name="subdivisions"]:checked').removeAttr('checked');
            $('input[name="sections"]:checked').removeAttr('checked');
            $('input[name="beats"]:checked').removeAttr('checked');

            $('#divDivisions').find('div').remove();
            $('#divSubDivisions').find('div').remove();
            $('#divSections').find('div').remove();
            $('#divBeats').find('div').remove();
        
            document.getElementById("<%=this.txtFullName.ClientID %>").value = res[0].FullName;
            document.getElementById("<%=this.txtAddress.ClientID %>").value = res[0].Address;
            document.getElementById("<%=this.txtMobNo.ClientID %>").value = res[0].MobileNo;
            document.getElementById("<%=this.txtUserName.ClientID %>").value = res[0].UserName;
            $("[id=ContentPlaceHolder1_txtUserName]").attr('title', res[0].UserName);
            document.getElementById("<%=this.txtPassword.ClientID %>").value = res[0].Password;
            document.getElementById("<%=this.txtEmailID.ClientID %>").value = res[0].EmailID;
            document.getElementById("<%=this.txtShortCode.ClientID %>").value = res[0].ShortCode;
            document.getElementById("<%=this.ddlUserType.ClientID %>").value = res[0].UserTypeID;
            document.getElementById("<%=this.ddlCluster.ClientID %>").value = res[0].Cluster;
            document.getElementById("<%=this.hdnUserID.ClientID %>").value = res[0].UserID;

            ShowHideCluster();

            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });

            var dataStype = res[0].CircleID;
            var valSTArr = dataStype.split(",");
            $("[id*=checkedcircle]").val(valSTArr);
            var j = 0, sizeST = valSTArr.length;
            var selected = [];
            var strGroups = "";
            for (j; j < sizeST; j++) {

                $('input[name="circles"]').each(function () {
                    if ($(this).val() == valSTArr[j]) {
                        $(this).prop("checked", true);
                    }
                });
            }

            var dataStyped = res[0].DivisionID;
            var valSTArrd = dataStyped.split(",");
            $("[id*=checkeddivision]").val(valSTArrd);
            ListDivison(valSTArrd, valSTArr);


            var dataStypesd = res[0].SubDivisionID;
            var valSTArrsd = dataStypesd.split(",");
            $("[id*=checkedsubdivision]").val(valSTArrsd);

            var dataStypesec = res[0].SectionID;
            var valSTArrsec = dataStypesec.split(",");
            $("[id*=checkedsection]").val(valSTArrsec);

            var dataStypeb = res[0].BeatID;
            var valSTArrb = dataStypeb.split(",");
            $("[id*=checkedbeat]").val(valSTArrb);


            $('#divDivisions').find('#lbldiv').attr("style", "display:block");
            $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
            $('#divSections').find('#lblsec').attr("style", "display:block");
            $('#divBeats').find('#lblbeat').attr("style", "display:block");

            $("[id*=litab1]").attr('class', 'active');
            $("[id*=litab2]").removeAttr('class', 'active');
        }


        function DeleteUser(lnk) {
            swal({
                title: "વપરાશકર્તા રદ કરવા માંગો છો?",
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
                            url: "UserMaster.aspx/DeleteUser",
                            data: '{UserID: "' + JSON.stringify(lnk) + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var msg = response.d;
                                
                                if (msg.indexOf("ALREADY") > -1) {

                                    swal("", msg, "warning");
                                }
                                else if (msg.indexOf("Error") > -1) {

                                    swal(msg);
                                }
                                else {
                                    GridUserMaster(1);

                                    swal("", msg, "success");
                                    clearall();
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
                })
        }

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
    
    document.getElementById("<%=this.hdndivs.ClientID %>").value = "";
    document.getElementById("<%=this.hdnsubdivs.ClientID %>").value = "";
    document.getElementById("<%=this.hdnsections.ClientID %>").value = "";
    document.getElementById("<%=this.hdnbeats.ClientID %>").value = "";
    document.getElementById("<%=this.checkedcircle.ClientID %>").value = "";
    document.getElementById("<%=this.checkeddivision.ClientID %>").value = "";
    document.getElementById("<%=this.checkedsubdivision.ClientID %>").value = "";
    document.getElementById("<%=this.checkedsection.ClientID %>").value = "";
    document.getElementById("<%=this.checkedbeat.ClientID %>").value = "";
    document.getElementById("<%=this.txtFullName.ClientID %>").value = "";
    document.getElementById("<%=this.txtAddress.ClientID %>").value = "";
    document.getElementById("<%=this.txtMobNo.ClientID %>").value = "";
    document.getElementById("<%=this.txtUserName.ClientID %>").value = "";
    document.getElementById("<%=this.txtPassword.ClientID %>").value = "";
    document.getElementById("<%=this.txtEmailID.ClientID %>").value = "";
    document.getElementById("<%=this.txtShortCode.ClientID %>").value = "";
    document.getElementById("<%=this.ddlUserType.ClientID %>").value =0;
    document.getElementById("<%=this.ddlCluster.ClientID %>").value = 0;
    document.getElementById("<%=this.hdnUserID.ClientID %>").value = "";

    $('input[name="circles"]:checked').removeAttr('checked');
    $('input[name="divisions"]:checked').removeAttr('checked');
    $('input[name="subdivisions"]:checked').removeAttr('checked');
    $('input[name="sections"]:checked').removeAttr('checked');
    $('input[name="beats"]:checked').removeAttr('checked');

    document.getElementById("<%=this.ddlUserType.ClientID %>").focus();

    $('#divDivisions').find('#lbldiv').attr("style", "display:block");
    $('#divSubDivisions').find('#lblsubdiv').attr("style", "display:block");
    $('#divSections').find('#lblsec').attr("style", "display:block");
    $('#divBeats').find('#lblbeat').attr("style", "display:block");

    $('#divDivisions').find('div').remove();
    $('#divSubDivisions').find('div').remove();
    $('#divSections').find('div').remove();
    $('#divBeats').find('div').remove();
    
}

    </script>
</asp:Content>

