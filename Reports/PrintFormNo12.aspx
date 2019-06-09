<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintFormNo12.aspx.cs" Inherits="Reports_PrintFormNo12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Form No. 12 Report</title>
    <style>
        table
        {
            border-collapse: collapse;
        }
        td, th
        {
            padding: 0;
            border-color: Gray;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div1" runat="server" style="padding-left: 120px">
        <table style="width: 2000px">
            <thead>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Label Style="font-size: 10px" ID="lblGP" Text="G.P., Rjt. sr. 41 Std-36 10-2009 5,00,000 pa3* Pieces Oblong"
                                        runat="server"></asp:Label>
                                </td>
                                <td style="text-align: right">
                                    <asp:Label Style="font-size: 10px" ID="lblBV" Text="બા.વિ. ૧૬૬. જી." runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label Style="font-size: 10px" ID="lblSA" Text="સ. ઠ., બાં. વિ., નાં. એસ. ૬૩/૧૯૨૦, તા. ૬-૫-૩૩]"
                                        runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label Style="font-size: 10px" ID="lnlNA" Text="નાં. સી. એમ. ઈ. ૧૦૮૯-૫૮-પી., તા. ૧૦-૬-૯૧]"
                                        runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="text-align: center">
                                <td colspan="2">
                                    <b>
                                        <asp:Label Style="font-size: 18px;" ID="lblFormNo12" Text="ફોર્મ નંબર-૧૨" runat="server"></asp:Label>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td style="font-size: 14px">
                                                નંબર
                                                <asp:Label ID="Label10" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: right; font-size: 14px; padding-left: 5px; padding-right: 5px;
                                                padding-top: 1px">
                                                <b>
                                                    <asp:Label ID="lblDistrict" runat="server" Width="150px"></asp:Label>
                                                </b>
                                            </td>
                                            <td style="font-size: 14px">
                                                જીલ્લાના
                                                <asp:Label ID="lblD" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: right; font-size: 14px; padding-left: 5px; padding-right: 5px;
                                                padding-top: 1px">
                                                <b>
                                                    <asp:Label ID="lblTaluka" runat="server" Width="150px"></asp:Label>
                                                </b>
                                            </td>
                                            <td style="font-size: 14px">
                                                તાલુકાના
                                                <asp:Label ID="lblT" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: center; font-size: 14px; padding-left: 5px; padding-top: 1px">
                                                <b>
                                                    <asp:Label ID="lblVillage" runat="server" Width="120px"></asp:Label>
                                                </b>
                                            </td>
                                            <td style="font-size: 14px">
                                                ગામ જેને નહેરમાંથી પાણી આપવામાં આવતું હોય તેવી ક્યારી જમીનની માપણી તથા જમાબંધી સન
                                                <asp:Label ID="lblV" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: center; font-size: 14px; padding-left: 5px; padding-top: 1px">
                                                <b>
                                                    <asp:Label ID="lblYear" runat="server" Width="120px"></asp:Label>
                                                </b>
                                            </td>
                                            <td id="Td1" style="text-align: center; font-size: 14px" colspan="5" runat="server"
                                                width="150px">
                                                ની મોસમમાં સિંચાઇ
                                            </td>
                                            <td>
                                                <span style="font-size: 12px; padding-left: 5px; padding-top: 1px">
                                                    <asp:Label ID="lblNaher" runat="server" Width="150px"></asp:Label></span>
                                            </td>
                                            <td id="Td2" style="font-size: 14px; text-align: right" runat="server">
                                                નહેર
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                <span style="width:150px"></span>
                    <td>
                        <table width="100%">
                            <tr>
                                <td colspan="11">
                                    <asp:GridView ID="dgvDetail" runat="server" AutoGenerateColumns="False" PageSize="10"
                                        OnRowDataBound="dgvDetail_RowDataBound" DataKeyNames="Remark">
                                        <Columns>
                                            <asp:TemplateField HeaderText="નંબર">
                                                <HeaderTemplate>
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblNumber" runat="server" Text="નંબર" Width="70px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px">
                                                                    <asp:Label ID="lbl1" runat="server" Text="૧" Width="70px" style="padding-bottom:87px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label Style="text-align: center" ID="lblNo1" runat="server" Width="70px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblServerNo" runat="server" Text="સર્વે નંબર અથવા પોતે નંબર" Width="100px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px;">
                                                                    <asp:Label ID="lbl2" runat="server" Text="૨" Width="100px" style="padding-bottom:28px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Style="padding-left: 10px" ID="lblBlockNo" runat="server" Text='<%# Bind("BlockNo") %>'
                                                                    Width="90px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr >
                                                            <td colspan="2">
                                                                <asp:Label ID="lblSelfNo" runat="server" Text="સર્વે નંબર અથવા પોતે નંબરનો ક્રમ"
                                                                    Width="130px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="border-bottom-style: solid; border-bottom-width: 1px; width: 130px">
                                                                <asp:Label ID="lbl2A" runat="server" Text="૨-અ" Width="130px" style="padding-bottom:87px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 66px;">
                                                                <div style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                   ">
                                                                    હેક્ટર
                                                                </div>
                                                            </td>
                                                            <td>
                                                                આર
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="border-color: Gray; border-right-style: solid; padding-top: 6px; border-right-width: 1px;
                                                                    padding: 0ex; width: 65px ">
                                                                    <asp:Label ID="lblArea" runat="server" Text='<%# Bind("Area") %>' Width="65px"
                                                                        Style="padding:7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label156" runat="server" Text="" Width="65px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        <%--<tr>
                                                            <td>
                                                                <div style="text-align: center; padding-top: 6px; border-right-style: solid; border-right-width: 1px;
                                                                    width: 65px;  border-color: Gray;">
                                                                    <asp:Label ID="lblArea" runat="server" Text='<%# Bind("Area") %>' Width="65px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label156" runat="server" Text="" Width="55px"></asp:Label>
                                                            </td>
                                                        </tr>--%>
                                                       
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr >
                                                            <td colspan="2">
                                                                <asp:Label ID="Label6" runat="server" Text="ઘર ગથ્થું નંબર"
                                                                    Width="130px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="border-bottom-style: solid; border-bottom-width: 1px; width: 130px">
                                                                <asp:Label ID="lbl2A" runat="server" Text="૩" Width="130px" style="padding-bottom:87px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                       <%-- <tr>
                                                            <td colspan="2" style="border-bottom-style: solid; border-bottom-width: 1px">
                                                                <asp:Label ID="Label6" runat="server" Text="ઘર ગથ્થું નંબર" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr style="height: 115px">
                                                            <td style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid;
                                                                border-bottom-width: 1px">
                                                                <div style="padding-top: 12px">
                                                                    
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    3
                                                                </div>
                                                            </td>                                                           
                                                        </tr>
                                                        <tr>
                                                            <%--<td style="width: 70px">
                                                                <div style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                    width: 70px; height: 28px">
                                                                    હેક્ટર
                                                                </div>
                                                            </td>--%>
                                                          <%--  <td style="border-top-style: solid; border-top-width: 1px;">
                                                                આર
                                                            </td>--%>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                            <td>
                                                                <div style=" text-align: center; 
                                                                    padding-top: 6px;  width: 70px">
                                                               <asp:Label ID="lblHouseholdNo" runat="server" Text='<%# Bind("HouseholdNo") %>' Width="65px"></asp:Label>
                                                                    <%--<asp:Label ID="Label3" runat="server" Text="10.pp" Width="60px"></asp:Label>--%>
                                                            </td>
                                                            <%--<td>
                                                                <div style="vertical-align: top;">
                                                                    <asp:Label ID="Label4" Text="" runat="server" Width="50px"></asp:Label>
                                                                </div>
                                                            </td>--%>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table >
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label11" runat="server" Text="માલિકનું નામ" Width="350px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="vertical-align: bottom; border-bottom-style: solid; padding-bottom:87px; border-bottom-width: 1px">
                                                                <asp:Label ID="Label2" runat="server" Text="૪"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Style="padding-left: 10px" ID="lblPersonName" runat="server" Text='<%# Bind("PersonName") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblFarmer" runat="server" Text="ખેડૂતનું નામ" Width="350px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px">
                                                                <asp:Label ID="lbl6" runat="server" Text="૫" Width="70px" style="padding-bottom:87px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td style="padding-left: 10px">
                                                                <asp:Label ID="lblFarmerName" runat="server" Text='<%# Bind("FarmerName") %>' Width="100%"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr >
                                                            <td colspan="2">
                                                                <asp:Label ID="lblmanjur" runat="server" Text="મંજુર કરેલું ક્ષેત્રફળ" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <div style="border-bottom-style: solid; border-bottom-width: 1px; width: 120px; border-color: Gray;">
                                                                    <asp:Label ID="lbl6A" runat="server" Text="૫-અ" Width="120px" style="padding-bottom:116px"></asp:Label>
                                                                </div>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 60px">
                                                                <div style="border-color: Gray; border-right-style: solid;  border-right-width: 1px;
                                                                    width: 60px">
                                                                    હેક્ટર
                                                                </div>
                                                            </td>
                                                            <td style="text-align: center; width: 60px">
                                                                આર
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="border-color: Gray; border-right-style: solid; padding-top: 6px; border-right-width: 1px;
                                                                    padding: 0ex; width: 60px; ">
                                                                    <asp:Label ID="lblPiyatArea1" runat="server" Text='<%# Bind("PiyatArea") %>' Width="60px"
                                                                        Style="padding:7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label111" runat="server" Text="" Width="60px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td colspan="2" style="border-bottom-style: solid; border-bottom-width: 1px;">
                                                                <asp:Label ID="Label5" runat="server" Text="ખેતરની માપણી" Width="240px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="border-bottom-style: solid; border-bottom-width: 1px;">
                                                                <asp:Label ID="Label6" runat="server" Text="ક્ષેત્રફળ/હેક્ટર" Width="240px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-right-style: solid; border-right-width: 1px;">
                                                                <asp:Label ID="lblmanjur" runat="server" Text="વહેતા પાણીથી" Width="120px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label7" runat="server" Text="ઉદવહનથી" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td colspan="2" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid;
                                                                            border-bottom-width: 1px;">
                                                                            <asp:Label ID="Label9" runat="server" Text="૬" Width="120px" style="padding-bottom:56px;"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style=" width: 60px">
                                                                            <div style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                                width: 60px">
                                                                                હે.આર
                                                                            </div>
                                                                        </td>
                                                                        <td style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                            text-align: center; width: 60px">
                                                                            પાણી
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <div style="border-color: Gray; border-bottom-style: solid; border-bottom-width: 1px;
                                                                    width: 120px">
                                                                    <asp:Label ID="Label8" runat="server" Text="૭" Width="120px" style="padding-bottom:56px;"></asp:Label>
                                                                </div>
                                                                <table>
                                                                    <tr>
                                                                        <td style=" width: 60px">
                                                                            <div style="border-color: Gray; border-right-style: solid;  border-right-width: 1px;
                                                                                width: 60px">
                                                                                હે.આર
                                                                            </div>
                                                                        </td>
                                                                        <td style="text-align: center; width: 60px">
                                                                           પાણી
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                    padding: 0ex; width: 60px; ">
                                                                    <asp:Label ID="lblVPiyatArea" runat="server" Text='<%# Bind("VPiyatArea") %>' Width="60px"
                                                                        Style="padding: 7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                text-align: center">
                                                                <asp:Label ID="Label23" runat="server" Width="60px" Text='<%# Bind("vWater") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <div style="border-color: Gray; border-right-style: solid; border-right-width: 1px;
                                                                    padding: 0ex; width: 60px;">
                                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("UPiyatArea")  %>' Width="60px"
                                                                        Style="padding: 7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td style="text-align: center">
                                                                <asp:Label ID="Label11" runat="server" Width="60px" Text='<%# Bind("UWater") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td >
                                                                <asp:Label ID="lblpak" runat="server" Text="પાક" Width="90px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px">
                                                                <asp:Label ID="lbl1" runat="server" Text="૮" Width="90px" style="margin-bottom:87px;" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label Style="padding-left: 10px" ID="lblCrop" runat="server" Text='<%# Bind("PakNameG") %>'
                                                                    Width="80px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="lblDith" runat="server" Text="હેક્ટર દીઠ પાણી પીવાનો દર(ઉદવહન એટલે સામાન્ય દરનો ત્રીજો ભાગ)" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px;
                                                                ">
                                                                <asp:Label ID="lbl10" runat="server" Text="૯" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="">
                                                                <asp:Label ID="lbl2A" runat="server" Text=" રૂ." Width="130px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                                            <td style="height: 27px; width: 80px">
                                                                <div style="border-color: Gray; border-right-style: solid; height: 28px; border-right-width: 1px;
                                                                    width: 80px">
                                                                    રૂ.
                                                                </div>
                                                            </td>
                                                           <%-- <td style="text-align: center; width: 40px">
                                                                પૈ.
                                                            </td>
                                                        </tr>--%>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="
                                                                    width: 80px; ">
                                                                    <asp:Label ID="lblRate" runat="server" Text='<%# Bind("VRate") %>' Width="80px" Style="padding: 7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label100" runat="server" Text="" Width="40px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="lblDith" runat="server" Text="ખેતર દીઠ પાણીનો આકાર" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px;
                                                                ">
                                                                <asp:Label ID="lbl11" runat="server" Text="૧૦" Width="120px" style="padding-bottom:87px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                             <tr>
                                                            <td colspan="2" style="">
                                                                <asp:Label ID="lbl2A" runat="server" Text=" રૂ." Width="130px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                                            <td style="height: 27px; width: 80px">
                                                                <div style="border-color: Gray; border-right-style: solid; height: 28px; border-right-width: 1px;
                                                                    width: 80px">
                                                                    રૂ.
                                                                </div>
                                                            </td>
                                                           <%-- <td style="text-align: center; width: 40px">
                                                                પૈ.
                                                            </td>
                                                        </tr>--%>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="
                                                                    padding: 0ex; width: 80px; ">
                                                                    <asp:Label ID="lblTotalPiyat" runat="server" Text='<%# Bind("TotalPiyat") %>' Width="80px"
                                                                        Style="padding: 7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label25" runat="server" Text="" Width="40px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="lblLocalFund" runat="server" Text="લોકલ ફંડ" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px;
                                                                ">
                                                                <asp:Label ID="lbl13" runat="server" Text="૧૧" Width="120px" style="padding-bottom:116px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                             <tr>
                                                            <td colspan="2" style="">
                                                                <asp:Label ID="lbl2A" runat="server" Text=" રૂ." Width="130px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                       <%-- <tr>
                                                            <td style="height: 27px; width: 80px">
                                                                <div style="border-color: Gray; border-right-style: solid; height: 28px; border-right-width: 1px;
                                                                    width: 80px">
                                                                    રૂ.
                                                                </div>
                                                            </td>
                                                           <%-- <td style="text-align: center; width: 40px">
                                                                પૈ.
                                                            </td>
                                                        </tr>--%>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="
                                                                    width: 80px;">
                                                                    <asp:Label ID="lblAmtLocalFund" runat="server" Text='<%# Bind("LocalFundAmt") %>'
                                                                        Width="80px" Style="padding: 7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label26" runat="server" Text="" Width="40px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="lblDith" runat="server" Text="દરેક ખેડૂત પાસે લેણી થતી રકમ" Width="120px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px;
                                                                ">
                                                                <asp:Label ID="lbl11" runat="server" Text="૧૨" Width="120px" style="padding-bottom:87px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                             <tr>
                                                            <td colspan="2" style="">
                                                                <asp:Label ID="lbl2A" runat="server" Text=" રૂ." Width="130px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                       <%-- <tr>
                                                            <td style="height: 27px; width: 80px">
                                                                <div style="border-color: Gray; border-right-style: solid; height: 28px; border-right-width: 1px;
                                                                    width: 80px">
                                                                    રૂ.
                                                                </div>
                                                            </td>
                                                           <%-- <td style="text-align: center; width: 40px">
                                                                પૈ.
                                                            </td>
                                                        </tr>--%>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="
                                                                    width: 80px;">
                                                                    <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("NetTotal") %>' Width="80px"
                                                                        Style="padding: 7px"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label27" runat="server" Text="" Width="40px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNumber" runat="server" Text="વિશેષ નોંધ" Width="180px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="vertical-align: bottom; border-bottom-style: solid; border-bottom-width: 1px">
                                                                <asp:Label ID="lbl1" runat="server" Text="૧૩" Width="180px" style="padding-bottom:87px"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label Style="padding-left: 10px" ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="dsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AagakhanConnectionString %>"
                                        SelectCommand="RptForm12" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="VillageID" QueryStringField="VillageID" 
                                                Type="String" />
                                            <asp:QueryStringParameter DefaultValue="" Name="SectionID" 
                                                QueryStringField="SectionID" Type="Int64" />
                                            <asp:QueryStringParameter DefaultValue="" Name="SeasonID" 
                                                QueryStringField="SeasonID" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Label Style="font-size: 12px" ID="Label3" Text="માપણી અંગેનું કાર્યપાલક ઈજનેરનું પ્રમાણપત્ર"
                                        runat="server" Width="900px"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label Style="font-size: 12px" ID="Label12" Text="માપણીદાર:" runat="server" Width="870px"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label Style="font-size: 12px" ID="Label16" Text="ઓવરશીયર" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label Style="font-size: 12px" ID="Label13" Text="તા. &nbsp &nbsp &nbsp &nbsp &nbsp - &nbsp &nbsp &nbsp &nbsp &nbsp - &nbsp ૨૦ &nbsp &nbsp &nbsp &nbsp &nbsp."
                                        runat="server" Width="350px"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label Style="font-size: 12px" ID="Label14" Text="કાર્યપાલક ઈજનેર" runat="server"
                                        Width="250px"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label Style="font-size: 12px" ID="Label15" Text="ડીવીઝન" runat="server" Width="250px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    </form>
</body>
</html>
