<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>A K R S P (INDIA)</title>

    <!-- BEGIN META -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="your,keywords" />
    <meta name="description" content="Short explanation about this website" />
    <!-- END META -->

    <!-- BEGIN STYLESHEETS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900' rel='stylesheet' type='text/css' />
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/materialadmin.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/material-design-iconic-font.min.css" />
    <link href="assets/css/sweetalert.css" rel="stylesheet" />
    <!-- END STYLESHEETS -->
</head>
<body class="menubar-hoverable header-fixed ">
    <form id="form1" runat="server" class="form floating-label">
        <!-- BEGIN LOGIN SECTION -->
        <section class="section-account">
            <div class="img-backdrop" style="background-image: url('assets/img/img16.jpg')"></div>
            <div class="spacer"></div>
            <div class="card contain-sm style-transparent">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-8">
                            <br />
                            <span class="text-lg text-bold text-primary">AGAKHAN RURAL SUPPORT PROGRAMME (INDIA)</span>
                            <br />
                            <br />
                            
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="txtUserName" runat="server"></asp:TextBox>
                                <label for="username">Username</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <label for="password">Password</label>
                            </div>
                            
                            <div class="form-group">
                                <asp:DropDownList ID="ddlYear" runat="server" class="form-control" DataSourceID="dsYear" DataTextField="Year" DataValueField="YearID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="dsYear" ConnectionString='<%$ ConnectionStrings:AagakhanConnectionString %>'
                                    SelectCommand="ListFinYear" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                <label for="select1">Select Year</label>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-xs-6 text-left">
                                    <button class="btn btn-primary btn-raised" type="button" id="btnLogin">Login</button>
                                </div>
                                
                            </div>
                            <!--end .row -->
                            
                        </div>
                        <!--end .col -->

                        <!--end .col -->
                    </div>
                    <!--end .row -->
                </div>
                <!--end .card-body -->
            </div>
            <!--end .card -->
        </section>
        <!-- END LOGIN SECTION -->
         <script src="assets/js/sweetalert.min.js"></script>
        <!-- BEGIN JAVASCRIPT -->
        <script src="assets/js/jquery-1.11.2.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/spin.min.js"></script>
        <script src="assets/js/jquery.autosize.min.js"></script>
        <script src="assets/js/jquery.nanoscroller.min.js"></script>
        <script src="assets/js/63d0445130d69b2868a8d28c93309746.js"></script>
        <script src="assets/js/Demo.js"></script>
        <!-- END JAVASCRIPT -->
    </form>

    <script type="text/javascript">
        jQuery(function ($) {
            $(document).on('click', '.toolbar a[data-target]', function (e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible');//hide others
                $(target).addClass('visible');//show target
            });
        });

        function GetQueryStringByParameter(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }


        $(function () {
            document.getElementById("<%=this.txtUserName.ClientID %>").focus();
        });

        $(function () {
            $("#btnLogin").bind("click", function () {

                
                var username = document.getElementById("<%=this.txtUserName.ClientID %>");
                var password = document.getElementById("<%=this.txtPassword.ClientID %>");
                var year = document.getElementById("<%=this.ddlYear.ClientID %>");
          
                if (username.value == "") {
                    swal("", "Enter Username", "warning");
                    username.focus();
                    return false;
                }
                else if (password.value == "") {
                    swal("", "Enter Password", "warning");
                    password.focus();
                    return false;
                }
                else if (year.value == "0") {
                    swal("", "Select Year", "warning");
                    year.focus();
                    return false;
                }
                else {
                    var user = {};
                    user.UserName = document.getElementById("<%=this.txtUserName.ClientID %>").value;
                    user.Password = document.getElementById("<%=this.txtPassword.ClientID %>").value;
                    user.YearID = document.getElementById("<%=this.ddlYear.ClientID %>").value;
                    

                    $.ajax({
                        type: "POST",
                        url: "Index.aspx/CheckUserNamePasssword",
                        data: '{user : ' + JSON.stringify(user) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == "0")
                                swal("", "Invalid Username or Password.", "warning");
                            else if (response.d == "1") {
                                window.location = "Dashboard.aspx";
                            }
                            
                        }
                    });
                }
            })
        });
    </script>
</body>
</html>
