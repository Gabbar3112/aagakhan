<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PiyatMandliMapFitToScreen.aspx.cs" Inherits="PiyatMandliMapFitToScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="assets/js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scm" runat="server" EnablePageMethods="true" />
        
        <div class="container">
            <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1" style="shape-rendering: geometricPrecision; text-rendering: geometricPrecision; image-rendering: optimizeQuality; fill-rule: evenodd; clip-rule: evenodd"
                viewBox="0 0 45535 35693" xmlns:xlink="http://www.w3.org/1999/xlink" id="svgMap">

                <g id="G1" stroke="black" stroke-width="10" fill="none" style="padding-left: 1px;">
                </g>

                <script type="text/javascript">
                    $(document).ready(function () {

                        var width = $(window).width();
                        var height = $(window).height();

                        $(".container").css("width", width - 50);
                        $(".container").css("height", height - 50);

                        var InstId = GetParameterValues('InstituteID');
                        var Orient = GetParameterValues('Ori');
                        if (Orient != undefined) {
                            if (Orient == "V") {
                                $("#svgMap").css("max-width", width - 50);
                                $("#svgMap").css("overflow-y", "hidden");
                            }
                            else {
                                $("#svgMap").css("max-width", width - 50);
                                $("#svgMap").css("max-height", height - 50);
                            }
                        }

                        $.ajax({
                            type: "POST",
                            url: "PiyatMandliMap.aspx/BindMapBlockPoints",
                            data: '{InstituteID:' + InstId + '}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data1) {

                                if (data1.d.length > 0) {
                                    for (var a = 0; a < data1.d.length; a++) {
                                        var points1 = data1.d[a].MapPoints;
                                        var MapPointID1 = data1.d[a].MapPointIDs;
                                        var Color1 = data1.d[a].MapColor;

                                        var newpath1 = document.createElementNS("http://www.w3.org/2000/svg", "path");

                                        newpath1.setAttribute("id", MapPointID1);
                                        newpath1.setAttribute("d", points1);
                                        newpath1.setAttribute("fill", Color1);

                                        document.getElementById("G1").appendChild(newpath1);
                                    }
                                }

                            }
                        });
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
            </script>
            </svg>
        </div>
    </form>
</body>
</html>
