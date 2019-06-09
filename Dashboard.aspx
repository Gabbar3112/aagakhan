<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section-header">
                    <ol class="breadcrumb">
                        <%--<li><a href="dashboard.html">home</a></li>--%>
                        <li class="active">Dashboard</li>
                    </ol>

                </div>
                <!--end .section-header -->
                <div class="section-body">
                </div>
                <!--end .section-body -->

    <script>
        $(function () {
            //SetMenu("liDashboard", "", "liuserrights", "aUserRights", "", "");
        });
    </script>
</asp:Content>

