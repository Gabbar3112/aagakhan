<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintRptAgriCultureActivityVillageWise.aspx.cs" Inherits="Reports_PrintRptAgriCultureActivityVillageWise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
     <div id="divRpt" runat="server">
        </div>
    </form>
</body>
</html>
