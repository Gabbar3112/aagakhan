<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
     <style>
        input {
            font-family: monospace;
        }

        label {
            display: block;
        }

        div {
            margin: 0 0 1rem 0;
        }

    </style>

    <script>
        function pageLoad() {
            $(":input").inputmask();

            $("#phone").inputmask({ "mask": "(999) 999-9999" });

        }

       
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<div>
        <label for="cc">Credit Card</label>
        <!-- Set via HTML -->
        <input id="cc" type="text" data-inputmask="'mask': '9999 9999 9999 9999'" />
    </div>

    <div>
        <label for="date">Date</label>
        <input id="date" data-inputmask="'alias': 'date'" />
    </div>

    <div>
        <label for="phone">Phone</label>
        <!-- or set via JS -->
        <input id="phone" type="text" />
    </div>--%>
      <div class="form-group">
                                            <input type="text" class="form-control" data-inputmask="'alias': 'date'">
                                            <label>Date mask</label>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" data-inputmask="'mask': 'y/m/d'">
                                            <label>Date mask alt</label>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control time-mask">
                                            <label>Time masks</label>
                                            <p class="help-block">Time: 24h</p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control time12-mask">
                                            <label>Time masks alt</label>
                                            <p class="help-block">Time: am/pm</p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" data-inputmask="'mask': '(999) 999-9999'">
                                            <label>Phone mask</label>
                                            <p class="help-block">US Telephone: (999) 999-9999</p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control dollar-mask">
                                            <label>Dollar mask</label>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control euro-mask">
                                            <label>Euro masks</label>
                                        </div>
    <%--<script src="assets/js/DemoFormComponents.js"></script>--%>
</asp:Content>

