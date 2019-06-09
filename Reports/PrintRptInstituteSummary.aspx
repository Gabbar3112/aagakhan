<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintRptInstituteSummary.aspx.cs" Inherits="PrintRptInstituteSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <style>
        table, tr, td {
            padding: 1px;
            margin: 0;
            border-collapse: collapse;
            border-color:silver;
            border-width:0.5pt;

        }

        /*td {
            border: 1px solid silver;
        }*/
    </style>
    <script>
        function hello() {
            alert("No Records Found....!");
            window.close();
      }
    
            //Window.opener.location.reload();
    </script>
</head>
        <body>
    <form id="form1" runat="server">
        <div id="divRpt" runat="server">
        </div>
    </form>
</body>
</html>
