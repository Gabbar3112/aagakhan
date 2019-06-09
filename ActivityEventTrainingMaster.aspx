<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityEventTrainingMaster.aspx.cs" Inherits="ActivityEventTrainingMaster" %>

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
            <li class="active">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <ul class="nav nav-tabs" data-toggle="tabs">
                            <li id="litab1"><a href="#first1" onclick="ViewDiv1();">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમની માહિતી ઉમેરો/સુધારો </a></li>
                            <li id="litab2"><a href="#second1" onclick="ViewDiv2();">યાદી</a></li>                           
                        </ul>
                    </div>
                    <div class="card-body tab-content">

                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <div class="row" padding-top: 20px; border-radius: 8px;">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlAET" CssClass="form-control" runat="server" onChange="BindType()">     
                                                        <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="પ્રવૃત્તિ" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="ઇવેન્ટ" Value="2"></asp:ListItem> 
                                                        <asp:ListItem Text="તાલીમ" Value="3"></asp:ListItem>                                                 
                                                    </asp:DropDownList>
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ</label>
                                                </div>
                                            </div>
                                            
                                        </div>

                                       

                                        <div class="row" id="divDisTalVilInst">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlAETtype" runat="server" CssClass="form-control" onChange="ProgramType()"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdnIsEdit" runat="server" />
                                                    <asp:HiddenField ID="hdnID" runat="server" />
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtNewProgramType" runat="server" CssClass="form-control" onChange="CheckNewType()"></asp:TextBox>
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર નુ નામ</label>
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
                                                    <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server" onChange="CheckNewSubject()"></asp:TextBox>
                                                    <label>વિષય</label>
                                                </div>
                                            </div>
                                            <div id="divAcNo">
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtSubjectG" class="form-control" runat="server" onChange="CheckNewSubjectG()"></asp:TextBox>
                                                        <label>વિષય(ગુજરાતી)</label>
                                                    </div>
                                                </div>
                                              <%--  <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtPlace" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>સ્થળ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtPlaceG" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>સ્થળ(ગુજરાતી)</label>
                                                    </div>
                                                </div>--%>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group ">
                                                    <asp:TextBox ID="txtProgram" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <label>પ્રોગ્રામ</label>
                                                </div>
                                            </div>
                                            <div id="div1">
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtProgramG" class="form-control" runat="server"></asp:TextBox>
                                                        <label>પ્રોગ્રામ(ગુજરાતી)</label>
                                                    </div>
                                                </div>
                                             <%--   <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtFromDate" CssClass="form-control cssdate" runat="server"></asp:TextBox>
                                                        <label>શરૂઆત થવાની તારીખ</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group ">
                                                        <asp:TextBox ID="txtToDate" CssClass="form-control cssdate" runat="server"></asp:TextBox>
                                                        <label>પૂરું થવાની તારીખ</label>
                                                    </div>
                                                </div>--%>
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

                                            <asp:GridView ID="gvMember" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Columns>                                                    
                                                    <asp:BoundField HeaderStyle-CssClass="GridHeader" DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="RowNumber"></asp:BoundField>
                                                    <asp:BoundField DataField="TypeName" HeaderText="પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="TypeName"></asp:BoundField>
                                                    <asp:BoundField DataField="SubjectG" HeaderText="વિષય" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="SubjectG"></asp:BoundField>
                                                    
                                                    <asp:BoundField DataField="ProgramNameG" HeaderText="પ્રોગ્રામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray" SortExpression="ProgramNameG"></asp:BoundField>
                                                    
                                                                                                       
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
                </div>
            </div>
        </div>
    </div>

    <script>

        $(".Pager").on("click", '.page', function () {
            LoadGrid(parseInt($(this).attr('page')));
        });

        $(function () {
            SetMenu("liMaster", "ulMaster", "liactivityeventtrainingmaster", "aActivityEventTrainingMaster", "", "");
            $("#divFirst").css({ 'display': "block" });
            $("#divGrid").css({ 'display': "none" });
            $("#divGrid2").css({ 'display': "none" });

            $("[id*=litab1]").attr('class', 'active');

            document.getElementById("<%=this.ddlAET.ClientID %>").focus();
           
            ListTypes(0, 0);
           
        });

        function ViewDiv2() {
            $("#divFirst").css({ 'display': "none" });
            $("#divSecond").css({ 'display': "block" });
            $("#divThird").css({ 'display': "none" });
            $("#divGrid").css({ 'display': "none" });
        }

        function ViewDiv1() {
            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
            $("#divThird").css({ 'display': "none" });
            document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value = 0;
        }

        function DeleteMember(id) {
            var AETid = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;
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
                    url: "ActivityEventTrainingMaster.aspx/DeleteActivity",
                    data: '{ID: "' + id + '",ProgramID: ' + AETid + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var msg = response.d;

                        if (msg.indexOf("Error") > -1) {
                            swal(msg);
                        }
                        else {
                            swal("Deleted!", msg, "success");
                            LoadGrid(1);
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

        function EditMember(id) {
           
            var AETid = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;
            document.getElementById("<%=this.hdnID.ClientID%>").value = id;
            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingMaster.aspx/GetActivityByID",
                data: '{ID: "' + id + '",AETid: ' + AETid + '}',
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
            var ID;
            var AETid = document.getElementById("<%=this.ddlSrchProgram.ClientID%>").value;
            if (AETid == 1) {
               document.getElementById("<%=this.ddlAET.ClientID %>").value = 1;
                ID = 1;
            }
            else if (AETid == 2) {
                document.getElementById("<%=this.ddlAET.ClientID %>").value = 2;
                ID = 2;
            }
            else {
                document.getElementById("<%=this.ddlAET.ClientID %>").value = 3;
                ID = 3;
            }

            document.getElementById("<%=this.ddlAETtype.ClientID %>").value = res[0].ProgramTypeID;
            ListTypes(ID, res[0].ProgramTypeID);
            document.getElementById("<%=this.txtSubject.ClientID %>").value = res[0].Subject;
            document.getElementById("<%=this.txtSubjectG.ClientID %>").value = res[0].SubjectG;         
       
            document.getElementById("<%=this.txtProgram.ClientID %>").value = res[0].Program;
            document.getElementById("<%=this.txtProgramG.ClientID %>").value = res[0].ProgramG;          
          
            

            $("#divFirst").css({ 'display': "block" });
            $("#divSecond").css({ 'display': "none" });
           
            $("#divGrid").css({ 'display': "none" });
            $("[id*=litab1]").attr('class', 'active');
            $("[id*=litab2]").removeAttr('class', 'active');

            document.getElementById("<%=this.ddlSrchProgram.ClientID %>").value = 0;
            document.getElementById("<%=this.ddlAET.ClientID %>").disabled = true;
            document.getElementById("<%=this.txtNewProgramType.ClientID %>").disabled = true;
            document.getElementById("<%=this.hdnIsEdit.ClientID %>").value = 1;
            

}


        function SearchTerm() {
            return jQuery.trim($("[id*=ddlSrchProgram]").val());
            
        };

        function LoadGrid(pageIndex) {         
            if (SearchTerm() != 0) {
                $("#divGrid").css({ 'display': "block" });
                $.ajax({
                    type: "POST",
                    url: "ActivityEventTrainingMaster.aspx/LoadGrid",
                    data: '{searchTerm: ' + JSON.stringify(SearchTerm()) + ',pageIndex: ' + pageIndex + '}',
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
            $("#divGrid").css({ 'display': "block" });
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var customers = xml.find("ActivityEventTrainingMaster");

            if (myrowl == null) {
                myrowl = $("[id*=gvMember] tr:last-child").clone(true);
            }
            $("[id*=gvMember] tr").not($("[id*=gvMember] tr:first-child")).remove();

            if (customers.length > 0) {

              

                $.each(customers, function () {
                    var customer = $(this);

                    $("td", myrowl).eq(0).html($(this).find("RowNumber").text());
                    $("td", myrowl).eq(1).html($(this).find("TypeName").text());
                    $("td", myrowl).eq(2).html($(this).find("SubjectG").text());
 
                    $("td", myrowl).eq(3).html($(this).find("ProgramNameG").text());
                          
                    $("td", myrowl).eq(4).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return EditMember(' + $(this).find("ID").text() + ');"><i class="fa fa-edit"></i></a>'));
                    $("td", myrowl).eq(5).html($('<a class="btn btn-flat ink-reaction btn-default" onclick="return DeleteMember(' + $(this).find("ID").text() + ');"><i class="fa fa-trash"></i></a>'));


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
                $("[id*=gvMember]").append(empty_row);
            }
        };


        $(function () {

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

            $("#btnSave").bind("click", function () {
             
                var ProgramID = document.getElementById("<%=this.ddlAET.ClientID %>");
                var ProgramTypeID = document.getElementById("<%=this.ddlAETtype.ClientID %>");
                var NewProgramType = document.getElementById("<%=this.txtNewProgramType.ClientID %>");
                var Subject = document.getElementById("<%=this.txtSubject.ClientID %>");
                var SubjectG = document.getElementById("<%=this.txtSubjectG.ClientID %>");
            
                var Program = document.getElementById("<%=this.txtProgram.ClientID %>");
                var ProgramG = document.getElementById("<%=this.txtProgramG.ClientID %>");
        
                var IsEdit = document.getElementById("<%=this.hdnIsEdit.ClientID %>");
                var ID = document.getElementById("<%=this.hdnID.ClientID%>");
              
               
                    if (ProgramID.value == "0") {
                        ProgramID.focus();
                        swal("", "પ્રોગ્રામ પસંદ કરો", "warning");
                        return false;
                    }
                    else if (ProgramTypeID.value == "0" && NewProgramType.value == "") {
                        NewProgramType.focus();
                        swal("", "નવો પ્રકાર દાખલ કરો અથવા જુનો પસંદ કરો", "warning");
                        return false;
                    }
                    else if (Subject.value == "") {
                        Subject.focus();
                        swal("", "વિષય દાખલ કરો.", "warning");
                        return false;
                    }
                    else if (SubjectG.value == "") {
                        SubjectG.focus();
                        swal("", "વિષય દાખલ કરો.(ગુજરાતી)", "warning");
                        return false;
                    }
          
                    //else if (Program.value == "") {
                    //    Program.focus();
                    //    swal("", "પ્રોગ્રામ દાખલ કરો.", "warning");
                    //    return false;
                    //}
                    //else if (ProgramG.value == "") {
                    //    ProgramG.focus();
                    //    swal("", "પ્રોગ્રામ દાખલ કરો.(ગુજરાતી)", "warning");
                    //    return false;
                    //}
               
                    else {
                    $("[id*=btnSave]").html("<i class='fa fa-spinner fa-spin'></i> Loading.....");
                    $("[id*=btnSave]").attr('disabled', 'disabled');
                    $("#hdnSubmitVal").val("1");
                        var member = {};
                        member.ProgramID = document.getElementById("<%=this.ddlAET.ClientID %>").value;

                         if (document.getElementById("<%=this.txtNewProgramType.ClientID %>").value == "") {
                            member.ProgramTypeID = document.getElementById("<%=this.ddlAETtype.ClientID %>").value;
                    }
                    else {
                        member.NewProgramType = document.getElementById("<%=this.txtNewProgramType.ClientID %>").value;
                    }
                    member.Subject = document.getElementById("<%=this.txtSubject.ClientID %>").value;
                        member.SubjectG = document.getElementById("<%=this.txtSubjectG.ClientID %>").value;
                
                        member.Program = document.getElementById("<%=this.txtProgram.ClientID %>").value;
                        member.ProgramG = document.getElementById("<%=this.txtProgramG.ClientID %>").value;
                     
                        if (document.getElementById("<%=this.hdnIsEdit.ClientID %>").value == "") {
                            member.IsEdit = 0;
                        }
                        else {
                            member.IsEdit = document.getElementById("<%=this.hdnIsEdit.ClientID %>").value;
                    }
                    if (document.getElementById("<%=this.hdnID.ClientID %>").value == "") {
                            member.ID = 0;
                        }
                        else {
                            member.ID = document.getElementById("<%=this.hdnID.ClientID%>").value;
                    }


                    $.ajax({
                        type: "POST",
                        url: "ActivityEventTrainingMaster.aspx/RecordsManage",
                        data: '{member: ' + JSON.stringify(member) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var msg = response.d;

                            if (msg.indexOf("Error") > -1) {
                                swal(msg);
                            }
                            else {
                                swal({
                                    title: "Done!",
                                    text: msg,
                                    type: "success"
                                });
                            }

                            LoadGrid(1);
                            ClearAll();
                            if ($("#hdnSubmitVal").val() == "1") {
                                $("[id*=btnSave]").html("દાખલ કરો");
                                $("[id*=btnSave]").removeAttr('disabled');
                                $("#hdnSubmitVal").val(0);
                            }
                            return false;
                        }
                    });
                    
                }
            })

            });

        function ClearAll()
        {
            document.getElementById("<%=this.ddlAET.ClientID %>").value = 0;
            document.getElementById("<%=this.ddlAETtype.ClientID %>").value = 0;
            document.getElementById("<%=this.txtNewProgramType.ClientID %>").value = "";
            document.getElementById("<%=this.txtSubject.ClientID %>").value = "";
            document.getElementById("<%=this.txtSubjectG.ClientID %>").value = "";
            document.getElementById("<%=this.ddlAET.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtNewProgramType.ClientID %>").disabled = false;
            document.getElementById("<%=this.txtProgram.ClientID %>").value = "";
            document.getElementById("<%=this.txtProgramG.ClientID %>").value = "";

            ListTypes(0, 0);
        }

        function CheckNewSubjectG() {

            var PrgSubG = document.getElementById("<%=this.txtSubjectG.ClientID %>");
            var AETid = document.getElementById("<%=this.ddlAET.ClientID %>");
            var ID = document.getElementById("<%=this.ddlAETtype.ClientID %>");
            var PrgSubtooltip = document.getElementById("ContentPlaceHolder1_txtSubjectG").title;

           
            if (PrgSubtooltip != "") {

                if (PrgSubG.value != PrgSubtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "ActivityEventTrainingMaster.aspx/CheckProgramSubjectG",
                        data: '{PrgSubG: "' + PrgSubG.value + '",AETid: "' + AETid.value + '",ID: "' + ID.value + '"}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                PrgSubG.focus();
                                swal("", "વિષય પહેલેથી દાખલ કરેલ છે.", "warning");
                                document.getElementById("<%=this.txtSubjectG.ClientID %>").value = "";
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
                    url: "ActivityEventTrainingMaster.aspx/CheckProgramSubjectG",
                    data: '{PrgSubG: "' + PrgSubG.value + '",AETid: "' + AETid.value + '",ID: "' + ID.value + '"}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            PrgSubG.focus();
                            swal("", "વિષય પહેલેથી દાખલ કરેલ છે.", "warning");
                            document.getElementById("<%=this.txtSubjectG.ClientID %>").value = "";
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


        function CheckNewSubject() {

            var PrgSub = document.getElementById("<%=this.txtSubject.ClientID %>");
            var AETid = document.getElementById("<%=this.ddlAET.ClientID %>");
            var ID = document.getElementById("<%=this.ddlAETtype.ClientID %>");
            var PrgSubtooltip = document.getElementById("ContentPlaceHolder1_txtSubject").title;

          
            if (PrgSubtooltip != "") {

                if (PrgSub.value != PrgSubtooltip) {
                    $.ajax({
                        type: "POST",
                        url: "ActivityEventTrainingMaster.aspx/CheckProgramSubject",
                        data: '{PrgSub: "' + PrgSub.value + '",AETid: "' + AETid.value + '",ID: "' + ID.value + '"}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                PrgSub.focus();
                                swal("", "વિષય પહેલેથી દાખલ કરેલ છે.", "warning");
                                document.getElementById("<%=this.txtSubject.ClientID %>").value = "";
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
                    url: "ActivityEventTrainingMaster.aspx/CheckProgramSubject",
                    data: '{PrgSub: "' + PrgSub.value + '",AETid: "' + AETid.value + '",ID: "' + ID.value + '"}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            PrgSub.focus();
                            swal("", "વિષય પહેલેથી દાખલ કરેલ છે.", "warning");
                            document.getElementById("<%=this.txtSubject.ClientID %>").value = "";
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


        function CheckNewType() {
            var PrgTy = document.getElementById("<%=this.txtNewProgramType.ClientID %>");
            var AETid = document.getElementById("<%=this.ddlAET.ClientID %>");
            var PrgTytooltip = document.getElementById("ContentPlaceHolder1_txtNewProgramType").title;
           
            if (PrgTytooltip != "") {

                if (PrgTy.value != PrgTytooltip) {
                    $.ajax({
                        type: "POST",
                        url: "ActivityEventTrainingMaster.aspx/CheckNewProgramType",
                        data: '{PrgTy: "' + PrgTy.value + '",AETid: ' + AETid.value + '}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == false) {
                                return true;
                            }
                            else {
                                PrgTy.focus();
                                swal("", "પ્રકાર પહેલેથી દાખલ કરેલ છે.", "warning");
                                document.getElementById("<%=this.txtNewProgramType.ClientID %>").value = "";
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
                    url: "ActivityEventTrainingMaster.aspx/CheckNewProgramType",
                    data: '{PrgTy: "' + PrgTy.value + '",AETid: ' + AETid.value + '}',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            return true;
                        }
                        else {
                            PrgTy.focus();
                            swal("", "પ્રકાર પહેલેથી દાખલ કરેલ છે.", "warning");
                            document.getElementById("<%=this.txtNewProgramType.ClientID %>").value = "";
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
            if (PrgTy != "") {
                document.getElementById("<%=this.ddlAETtype.ClientID %>").value = 0;
            }
         }

        function ProgramType() {
            var PrgTy = document.getElementById("<%=this.txtNewProgramType.ClientID %>").value;
            if (PrgTy != "") {
                document.getElementById("<%=this.txtNewProgramType.ClientID %>").value = "";
            }
        }

        function BindType() {
            ListTypes(document.getElementById("<%=this.ddlAET.ClientID %>").value, 0);
        }

        function ListTypes(ProgramID, selectedProgramID) {         
            $.ajax({
                type: "POST",
                url: "ActivityEventTrainingMaster.aspx/ListTypes",
                data: '{ ProgramID: ' + ProgramID + '}',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddlAETtype = $("[id*=ddlAETtype]");
                    $("[id*=ddlAETtype]").empty();
                    $.each(r.d, function () {
                        if (selectedProgramID == this['Value'])
                            ddlAETtype.append($("<option selected></option>").val(this['Value']).html(this['Text']));
                        else
                            ddlAETtype.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
            return false;
        }

    </script>
</asp:Content>

