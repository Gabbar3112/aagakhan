<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintMassEventDetailsReport.aspx.cs" Inherits="Reports_PrintMassEventDetailsReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        table, tr, td {
            padding: 1px;
            margin: 0;
            border-collapse: collapse;
            border-color:silver;
            border-width:0.5pt;

        }
    </style>
    <script>
        function hello() {
            alert("No Records Found....!");
            window.close();
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div id="divRpt" runat="server">
        </div>
    </form>
</body>
</html>
