<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RptCanalDetail.aspx.cs" EnableEventValidation="false" Inherits="RptCanalDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="section-header">
        <ol class="breadcrumb">
            <li class="active">નહેરની માહિતી</li>
        </ol>
    </div>

    <div class="section-body contain-lg">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body tab-content">
                        <div id="divFirst">
                            <div class="tab-pane active" id="Div2">
                                  
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlSubDiv" runat="server" SelectedValue='<%# Eval("SubDivisionID") %>' class="form-control">
                                            </asp:DropDownList>
                                            <cc1:CascadingDropDown ID="cdlSubDiv" TargetControlID="ddlSubDiv" BehaviorID="myCircle"
                                                PromptValue="" ServicePath="~/WebService.asmx" ServiceMethod="GetSubDivision" runat="server"
                                                Category="SubDivisionID" LoadingText="Loading..." />
                                            <label>પેટા વિભાગ</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <asp:DropDownList ID="ddlDivision" runat="server" SelectedValue='<%# Eval("SectionID") %>' class="form-control">
                                            </asp:DropDownList>
                                            <cc1:CascadingDropDown ID="cdlDivision" TargetControlID="ddlDivision" BehaviorID="myDivision"
                                                PromptValue="" ServicePath="~/WebService.asmx" ServiceMethod="GetSectionBySubDivision" runat="server"
                                                Category="SectionID" ParentControlID="ddlSubDiv" LoadingText="Loading..." />
                                            <label>સેક્સન</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <asp:Button ID="btnPrint" runat="server" CssClass="btn ink-reaction btn-raised btn-primary" Text="અહેવાલ જુઓ" OnClick="btnPrint_Click" Style="margin-left: 95px;" />
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
            SetMenu("liReport", "ulReport", "lirptcanaldetail", "aRptCanalDetail", "", "");
        });

        </script> 
</asp:Content>

