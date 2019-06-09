<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityEventTrainingVigat.aspx.cs" Inherits="ActivityEventTrainingVigat" %>

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
            <li class="active">પ્રવૃત્તિ/ઇવેન્ટ/તાલીમની વિગત ની માહિતી</li>
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
                                                <asp:GridView ID="gvVigat" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                                    <%--<PagerStyle CssClass="Pager" />--%>

                                                    <Columns>
                                                        <asp:BoundField DataField="RowNumber" HeaderText="અનું. નં" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="SubjectG" SortExpression="SubjectG" HeaderText="વિષય" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="PlaceG" SortExpression="PlaceG" HeaderText="સ્થળ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="FromDate" SortExpression="FromDate" HeaderText="શરૂઆતની તારીખ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="ToDate" SortExpression="ToDate" HeaderText="અંતિમ તારીખ" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
                                                        <asp:BoundField DataField="Time" SortExpression="Time" HeaderText="સમય" HeaderStyle-BackColor="#0aa89e" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="LightGray"></asp:BoundField>
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
    </div>

      <script>

          $(".Pager").on("click", '.page', function () {
              GetData(parseInt($(this).attr('page')));
          });

          $(function () {
              SetMenu("liMaster", "ulMaster", "liactivityeventtrainingvigat", "aActivityEventTrainingVigat", "", "");
          });

          function GetData(pageIndex) {
              var AETid = $("[id*=ddlType]").val();

              if (AETid == "0") {
                  $("[id*=divSecond]").css({ 'display': 'none' });
              }
              else {
                  $.ajax({
                      method: "POST",
                      url: "ActivityEventTrainingVigat.aspx/GetVigat",
                      data: '{AETid:' + AETid + ',pageIndex:'+pageIndex+'}',
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

          var myrowl;
          function OnSuccess(response) {
              $("[id*=divSecond]").css({ 'display': 'block' });

              var xmlDoc = $.parseXML(response.d);
              var xml = $(xmlDoc);
              var customers = xml.find("Vigat");
              if (myrowl == null) {
                  myrowl = $("[id*=gvVigat] tr:last-child").clone(true);
              }
              $("[id*=gvVigat] tr").not($("[id*=gvVigat] tr:first-child")).remove();
              if (customers.length > 0) {
                  var i = 0;
                  $.each(customers, function () {
                      
                      var customer = $(this);
                      $("td", myrowl).eq(0).html($(this).find("RowNumber").text());
                      $("td", myrowl).eq(1).html($(this).find("SubjectG").text());
                      $("td", myrowl).eq(2).html($('<label id="lblPlace' + i + '">' + $(this).find("PlaceG").text() + '</label><input class="form-control" type="text" id="txtPlace' + i + '" value="' + $(this).find("PlaceG").text() + '" style="display:none;">'));                  
                      $("td", myrowl).eq(3).html($('<label id="lblFromDate' + i + '">' + $(this).find("FromDate").text() + '</label><input class="form-control" type="text" id="txtFromDate' + i + '" value="' + $(this).find("FromDate").text() + '" style="display:none;">'));                    
                      $("td", myrowl).eq(4).html($('<label id="lblToDate' + i + '">' + $(this).find("ToDate").text() + '</label><input class="form-control" type="text" id="txtToDate' + i + '" value="' + $(this).find("ToDate").text() + '" style="display:none;">'));                    
                      $("td", myrowl).eq(5).html($('<label id="lblTime' + i + '">' + $(this).find("Time").text() + '</label><input class="form-control" type="text" id="txtTime' + i + '" value="' + $(this).find("Time").text() + '" style="display:none;">'));                      
                      $("td", myrowl).eq(6).html($('<a id="edit' + i + '" class="btn btn-flat ink-reaction btn-default" onclick="EditType(' + $(this).find("DetailID").text() + ',' + i + ')"><i class="fa fa-edit"></i></a><a href="#" onclick="UpdateType(' + $(this).find("DetailID").text() + ',' + i + ')" id="update' + i + '" style="display:none">Update</a>'));                     
                      $("td", myrowl).eq(7).html($('<a id="delete' + i + '" onclick="DeleteType(' + $(this).find("DetailID").text() + ',' + i + ')" class="btn btn-flat ink-reaction btn-default"><i class="fa fa-trash"></i></a><a href="#" id="cancel' + i + '" onclick="CancelChanges(' + i + ')" style="display:none">Cancel</a>'));

                    
                      $("[id*=gvVigat]").append(myrowl);
                      myrowl = $("[id*=gvVigat] tr:last-child").clone(true);
                      
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
                  var empty_row = myrowl.clone(true);
                  $("td:first-child", empty_row).attr("colspan", $("td", myrowl).length);
                  $("td:first-child", empty_row).attr("align", "center");
                  $("td:first-child", empty_row).html("No records found for the search criteria.");
                  $("td", empty_row).not($("td:first-child", empty_row)).remove();
                  $("[id*=gvVigat]").append(empty_row);
              }
          }

          function EditType(TypeID, i) {
              
              $("[id=lblPlace" + i + "]").css({ 'display': 'none' });
              $("[id=lblFromDate" + i + "]").css({ 'display': 'none' });
              $("[id=lblToDate" + i + "]").css({ 'display': 'none' });
              $("[id=lblTime" + i + "]").css({ 'display': 'none' });

              $("[id=txtPlace" + i + "]").css({ 'display': 'block' });
              $("[id=txtFromDate" + i + "]").css({ 'display': 'block' });
              $("[id=txtToDate" + i + "]").css({ 'display': 'block' });
              $("[id=txtTime" + i + "]").css({ 'display': 'block' });

              $("[id=edit" + i + "]").css({ 'display': 'none' });
              $("[id=delete" + i + "]").css({ 'display': 'none' });

              $("[id=update" + i + "]").css({ 'display': 'block' });
              $("[id=cancel" + i + "]").css({ 'display': 'block' });
          }

          function UpdateType(TypeID, i) {
              var AETid = $("[id*=ddlType]").val();
              var Place = $("[id=txtPlace" + i + "]");
              var FromDate = $("[id=txtFromDate" + i + "]");
              var ToDate = $("[id=txtToDate" + i + "]");
              var Time = $("[id=txtTime" + i + "]");
              var DetailID = TypeID;

              if (Place.val() == "") {
                  Place.focus();
                  swal("સ્થળ દાખલ કરો.");
                  return false;
              }
              else if(FromDate.val() == "") {
                  FromDate.focus();
                  swal("શરૂઆતની તારીખ દાખલ કરો.");
                  return false;
              }
              else if (ToDate.val() == "") {
                  ToDate.focus();
                  swal("અંતિમ તારીખ દાખલ કરો.");
                  return false;
              }
              else if (Time.val() == "") {
                  Time.focus();
                  swal("સમય દાખલ કરો.");
                  return false;
              }
              else {
                  var data = {};
                  data.AETid = AETid;
                  data.Place = Place.val();
                  data.FromDate = FromDate.val();
                  data.ToDate = ToDate.val();
                  data.Time = Time.val();
                  data.DetailID = TypeID;

                  $.ajax({
                      method: "POST",
                      url: "ActivityEventTrainingVigat.aspx/ManageType",
                      data: '{Data:' + JSON.stringify(data) + '}',
                      async: false,
                      dataType: "json",
                      contentType: "application/json; charset=utf-8",
                      success: function (response) {
                          swal("", response.d, "success");
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
              var AETid = $("[id*=ddlType]").val();

              
              $.ajax({
                  method: "POST",
                  url: "ActivityEventTrainingVigat.aspx/CheckTypeID",
                  data: '{AETid:' + AETid + ',DetailID:' + TypeID + '}',
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
                                  url: "ActivityEventTrainingVigat.aspx/DeleteType",
                                  data: '{AETid:' + AETid + ',DetailID:' + TypeID + '}',
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
              $("[id=lblPlace" + i + "]").css({ 'display': 'block   ' });
              $("[id=lblFromDate" + i + "]").css({ 'display': 'block' });
              $("[id=lblToDate" + i + "]").css({ 'display': 'block' });
              $("[id=lblTime" + i + "]").css({ 'display': 'block' });

              $("[id=txtPlace" + i + "]").css({ 'display': 'none' });
              $("[id=txtFromDate" + i + "]").css({ 'display': 'none' });
              $("[id=txtToDate" + i + "]").css({ 'display': 'none' });
              $("[id=txtTime" + i + "]").css({ 'display': 'none' });

              $("[id=edit" + i + "]").css({ 'display': 'block' });
              $("[id=delete" + i + "]").css({ 'display': 'block' });

              $("[id=update" + i + "]").css({ 'display': 'none' });
              $("[id=cancel" + i + "]").css({ 'display': 'none' });
          }

    </script>
</asp:Content>

