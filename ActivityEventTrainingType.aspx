<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityEventTrainingType.aspx.cs" Inherits="ActivityEventTrainingType" %>

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
            <li class="active">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર ની માહિતી</li>
        </ol>
    </div>
    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="first1">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group ">
                                                    <asp:DropDownList ID="ddlTypes" runat="server" CssClass="form-control" onchange="GetData(1)">
                                                        <asp:ListItem Text="-- પસંદ કરો --" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="પ્રવૃત્તિ" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="ઇવેન્ટ" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="તાલીમ" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:HiddenField ID="hdnTypeID" runat="server" />
                                                    <label>પ્રવૃત્તિ/ઇવેન્ટ/તાલીમ ના પ્રકાર <span style="color: red">*</span></label>
                                                </div>
                                            </div>
                                        </div>
<%--                                        <div class="row">
                                            <div class="col-sm-2">
                                                <button id="btnSave" onclick="GetData()" type="button" class="btn ink-reaction btn-raised btn-primary btn-loading-state"
                                                    data-loading-text="<i class='fa fa-spinner fa-spin'></i> પ્રતિક્ષા કરો" value="value">
                                                    શોધો</button>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="divSecond" style="display: none">
                            <div class="tab-pane" id="second1">
                                <div class="row">

                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table id="datatable1" class="table table-striped table-hover">
                                                <asp:GridView ID="gvType" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <%--<PagerStyle CssClass="Pager" />--%>

                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="TypeName" HeaderText="પ્રકાર નુ નામ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="TypeNameG" HeaderText="પ્રકાર નુ નામ (ગુજરાતી)" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
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
    <script>

        $(".Pager").on("click", '.page', function () {
            GetData(parseInt($(this).attr('page')));
        });

        $(function () {
            SetMenu("liMaster", "ulMaster", "liactivityeventtrainingtype", "aActivityEventTrainingType", "", "");
        });

        function GetData(pageIndex) {
            var TypeMasterID = $("[id*=ddlType]").val();

            if (TypeMasterID == "0") {
                $("[id*=divSecond]").css({ 'display': 'none' });
            }
            else {
                $.ajax({
                    method: "POST",
                    url: "ActivityEventTrainingType.aspx/GetTypes",
                    data: '{TypeMasterID:' + TypeMasterID + ',pageIndex:'+ pageIndex +'}',
                    async: false,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: OnSuccess,
                    error: function (response) {
                        swal(response.d);
                    },
                    failure: function (response) {
                        swal(response.d);
                    },
                });
            }
        }

        var row;
        function OnSuccess(response) {
            $("[id*=divSecond]").css({ 'display': 'block' });

            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Types");
            if (row == null) {
                row = $("[id*=gvType] tr:last-child").clone(true);
            }
            $("[id*=gvType] tr").not($("[id*=gvType] tr:first-child")).remove();
            if (customers.length > 0) {
                var i = 0;
                $.each(customers, function () {
                    var customer = $(this);
                    $("td", row).eq(0).html($(this).find("RowNumber").text());
                    $("td", row).eq(1).html($('<label id="lblName' + i + '">' + $(this).find("TypeName").text() + '</label><input class="form-control" type="text" id="txtName' + i + '" value="' + $(this).find("TypeName").text() + '" style="display:none;">'));
                    $("td", row).eq(2).html($('<label id="lblName' + i + '">' + $(this).find("TypeNameG").text() + '</label><input class="form-control" type="text" id="txtNameG' + i + '" value="' + $(this).find("TypeNameG").text() + '" style="display:none;">'));

                    $("td", row).eq(3).html($('<a id="edit' + i + '" class="btn btn-flat ink-reaction btn-default" onclick="EditType(' + $(this).find("TypeID").text() + ',' + i + ')"><i class="fa fa-edit"></i></a><a href="#" onclick="UpdateType(' + $(this).find("TypeID").text() + ',' + i + ')" id="update' + i + '" style="display:none">Update</a>'));
                    $("td", row).eq(4).html($('<a id="delete' + i + '" onclick="DeleteType(' + $(this).find("TypeID").text() + ',' + i + ')" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a><a href="#" id="cancel' + i + '" onclick="CancelChanges(' + i + ')" style="display:none">Cancel</a>'));
                    //$("td", row).eq(1).html($(this).find("TypeName").text());
                    //$("td", row).eq(2).html($(this).find("TypeNameG").text());
                    
                    $("[id*=gvType]").append(row);
                    row = $("[id*=gvType] tr:last-child").clone(true);

                    i++;
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
                $("[id*=gvType]").append(empty_row);
            }
        }

        function EditType(TypeID, i) {
          
            $("[id=lblName" + i + "]").css({ 'display': 'none' });
            $("[id=lblNameG" + i + "]").css({ 'display': 'none' });

            $("[id=txtName" + i + "]").css({ 'display': 'block' });
            $("[id=txtNameG" + i + "]").css({ 'display': 'block' });

            $("[id=edit" + i + "]").css({ 'display': 'none' });
            $("[id=delete" + i + "]").css({ 'display': 'none' });

            $("[id=update" + i + "]").css({ 'display': 'block' });
            $("[id=cancel" + i + "]").css({ 'display': 'block' });
        }

        function UpdateType(TypeID, i) {
            var TypeMasterID = $("[id*=ddlType]").val();
            var Name = $("[id=txtName" + i + "]");
            var NameG = $("[id=txtNameG" + i + "]");

            if (Name.val() == "") {
                Name.focus();
                swal("નામ દાખલ કરો.");
                return false;
            }
            else if (NameG.val() == "") {
                NameG.focus();
                swal("નામ (ગુજરાતી) દાખલ કરો.");
                return false;
            }
            else {
                var data = {};
                data.TypeMasterID = TypeMasterID;
                data.TypeID = TypeID;
                data.Name = Name.val();
                data.NameG = NameG.val();

                $.ajax({
                    method: "POST",
                    url: "ActivityEventTrainingType.aspx/ManageType",
                    data: '{data:' + JSON.stringify(data) + '}',
                    async: false,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        swal("",response.d,"success");
                        GetData(1);
                    },
                    error: function (response) {
                        swal(response.d);
                    },
                    failure: function (response) {
                        swal(response.d);
                    },
                });
            }
        }

        function DeleteType(TypeID, i) {
            var TypeMasterID = $("[id*=ddlType]").val();

           
            $.ajax({
                method: "POST",
                url: "ActivityEventTrainingType.aspx/CheckTypeID",
                data: '{TypeMasterID:' + TypeMasterID + ',TypeID:' + TypeID + '}',
                async: false,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var msg = response.d;
                    if (msg == "1") {
                        swal("", "ઉપયોગ માં છે", "warning");
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
                                url: "ActivityEventTrainingType.aspx/DeleteType",
                                data: '{TypeMasterID:' + TypeMasterID + ',TypeID:' + TypeID + '}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    var msg = response.d;
                                    if (msg.indexOf("Error") > -1) {
                                        swal(msg);
                                    }
                                    else {
                                        swal("Done!", msg, "success");
                                        GetData(1);
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
        }

        function CancelChanges(i) {
            $("[id=lblName" + i + "]").css({ 'display': 'block' });
            $("[id=lblNameG" + i + "]").css({ 'display': 'block' });

            $("[id=txtName" + i + "]").css({ 'display': 'none' });
            $("[id=txtNameG" + i + "]").css({ 'display': 'none' });

            $("[id=edit" + i + "]").css({ 'display': 'block' });
            $("[id=delete" + i + "]").css({ 'display': 'block' });

            $("[id=update" + i + "]").css({ 'display': 'none' });
            $("[id=cancel" + i + "]").css({ 'display': 'none' });
        }
    </script>
</asp:Content>

