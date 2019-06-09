<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintMangnaForm7.aspx.cs" Inherits="Reports_PrintMangnaForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Magana Patarak Report</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divMagana" runat="server">
        <table align="center">
            <tr>
                <td>
                    <table style="width:770px">
                        <tr>
                            <td style="text-align: center; font-size: 12px" colspan="3">
                                નમુનો - ૭
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="font-size: 10px; text-align: left">
                                          <%--  ફોર્મ નંબર:--%>
                                        </td>
                                        <td>
                                            <%--<span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px;
                                                padding-top: 1px">
                                                <asp:Label ID="lblFormNumber" runat="server" Width="50px"></asp:Label></span>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px; text-align: left">
                                         <%--   ફોર્મ તારીખ:--%>
                                        </td>
                                        <td>
                                       <%--     <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px;
                                                padding-top: 1px">
                                                <asp:Label ID="lblFormDate" runat="server" Width="50px"></asp:Label></span>--%>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: center; padding-left: 100px">
                                <span style="font-size: 20px; font-weight: bolder; padding-bottom: 0px">સિંચાઈ માટે
                                    જોઇતા પાણીની અરજીનો નમુનો </span>
                                <br />
                                <span style="font-size: 15px; font-weight: bolder; padding-bottom: 0px">રજી.નં.<asp:Label ID="lblRegNo" runat="server" Width="80px"></asp:Label>
                                </span>
                            </td>
                            <td style="font-size: 10px; text-align: left; padding-left: 20px;">
                                <table>
                                    <tr>
                                        <td>
                                            માંગણા તારીખ :
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                            <asp:Label ID="lblMDate" runat="server" Width="80px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            ખાતા નંબર:
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                            <asp:Label ID="lblAcNo" runat="server" Width="80px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            માંગણા નંબર:
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                            <asp:Label ID="lblMNumber" runat="server" Width="80px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="font-size: 12px">
                                પ્રતિ પ્રમુખ શ્રી, <span style="text-align: center; padding-left: 20px"><asp:Label ID="lblInstiNameG" runat="server"></asp:Label>

                                                   </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 50px; font-size: 12px;" colspan="3">
                                હું નીચે સહી કરનાર માલિકશ્રી <span style="font-size: 10px; border-bottom-width: 1px;
                                    border-bottom-style: solid; padding-left: 5px; padding-top: 1px">
                                    <asp:Label ID="lblMalik" runat="server" Width="150px"></asp:Label></span>ગામ<span
                                        style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px;
                                        padding-top: 1px">
                                        <asp:Label ID="lblGam" runat="server" Width="110px"></asp:Label></span>
                                તાલુકો <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid;
                                    border-bottom-width: 1px; padding-top: 1px">
                                    <asp:Label ID="lblTaluko" runat="server" Width="110px"></asp:Label></span>ફોન
                                નં.<span style="font-size: 10px; border-bottom-width: 1px; border-bottom-style: solid;
                                    padding-left: 5px; padding-top: 1px">
                                    <asp:Label ID="lblMPhone" runat="server" Width="80px"></asp:Label></span>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 107px; font-size: 12px;" colspan="3">
                                વહીવટદારશ્રી <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid;
                                    border-bottom-width: 1px; padding-top: 1px">
                                    <asp:Label ID="lblfrmer" runat="server" Width="150px"></asp:Label></span>
                                ગામ <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid;
                                    border-bottom-width: 1px; padding-top: 1px">
                                    <asp:Label ID="lblfgam" runat="server" Width="110px"></asp:Label></span>
                                તાલુકો<span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px;
                                    padding-top: 1px">
                                    <asp:Label ID="lblftaluko" runat="server" Width="110px"></asp:Label></span>
                                ફોન નં.<span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px;
                                    padding-top: 1px">
                                    <asp:Label ID="lblfphoneno" runat="server" Width="80px"></asp:Label></span>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px;" colspan="3">
                                જી.સુરતનો રહીશ અને આપની સંસ્થાનો સભાસદ છું / નથી. નીચે લખેલી જમીનની સિંચાઈ કરવાના હેતુસર
                                પાણીની જરૂરિયાત છે. મને આપની સંસ્થાના નિયમો - પેટા નિયમો અને વખતો વખત ફેરફાર થતાં
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px;" colspan="3">
                                નિયમો અને શરતો કબુલ મંજુર છે અને તેનો પિયાવો સમયસર ભરવા લેખિત કબુલાતનામું આપું છું.
                                સંજોગવશાત હું બીલની રકમ ભરપાઈ કરવામાં નિષ્ફળ જાઉ તો સંસ્થા મારી મિલ્કતમાંથી કાયદેસર વસુલ કરવાનો હક ધરાવે છે.
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px;" colspan="3">
                               
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px;" colspan="3">
                                મેં ચાલુ વષે ............. સુગર ફેક્ટરી ............. માં ............ સભાસદ/ખેડૂત
                                ના નામે <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid;
                                    border-bottom-width: 1px; padding-top: 1px">
                                    <asp:Label ID="lblCropName" runat="server" Width="50px"></asp:Label></span>નું
                                રોપાણ હે.આર............. કરેલ છે.
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="font-size: 10px">
                                <asp:GridView ID="dgvShrdi" runat="server" AutoGenerateColumns="False" DataSourceID="dsShrdiDetail"
                                    Width="770px" BorderColor="Gray" >
                                    <Columns>
                                        <asp:BoundField DataField="BlockVillage" HeaderText="જમીનના ગામનુ નામ" SortExpression="BlockVillage"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:BoundField>
                                       <%-- <asp:BoundField DataField="Outlet" HeaderText="નહેર તથા બારીનુ નામ" SortExpression="Outlet"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle Font-Size="6px" />
                                        </asp:BoundField>--%>
                                        <asp:BoundField DataField="WaterType" HeaderText="ઉદવહન ડાયરેકટ" ReadOnly="True"
                                            SortExpression="WaterType" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BlockNo" HeaderText="બ્લોક નબર" SortExpression="BlockNo"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="ખેતર નું નામ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblKhater" Text="--" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="BlockArea" HeaderText="કુલ વિસ્તાર હે.આર" SortExpression="BlockArea">
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="પાકનુ નામ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCrop" Text='<%# Bind("PakNameG") %>' runat="server"></asp:Label>
                                                <%--<asp:Label ID="Label1" Text='<%# Bind("ShardiType") %>' runat="server"></asp:Label>--%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PiyatArea" HeaderText="માંગણી વિસ્તાર હે.આર" SortExpression="PiyatArea"
                                            ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="ShardiSeason" HeaderText="સીઝન મુદ્ત" ReadOnly="True"
                                            SortExpression="ShardiSeason">
                                            <HeaderStyle Font-Size="6px" />
                                        </asp:BoundField>--%>
                                        <asp:BoundField DataField="SeasonNdYear" HeaderText="સીઝન મુદ્ત" ReadOnly="True"
                                            SortExpression="SeasonNdYear">
                                            <HeaderStyle Font-Size="10px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="વિગત">
                                            <HeaderStyle Font-Size="10px" />
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="font-size: 7px">
                                                            ૧) મંડળીનો સભાસદ છે/નથી.
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-size: 7px">
                                                            ૨) ૭ + ૧૨ સાથે સરખાવ્યું છે.
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-size: 7px">
                                                            ૩) પાછલી બાકી છે/નથી.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsShrdiDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AagakhanConnectionString %>"
                                    SelectCommand="RptMangnaForm7" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="MangnaPatrakID" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td style="text-align: center">
                                            પ્રમાણપત્ર
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px">
                                            આથી પ્રમાણપત્ર આપવામાં આવે છે કે
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px">
                                            શ્રી <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px; padding-top: 1px">
                                                <asp:Label ID="lblShree" runat="server" Width="135px"></asp:Label></span>
                                           <%-- <span style="border-top-width: 1px; border-top-style: solid;">
                                                <asp:Label ID="lblShree" runat="server" Width="135px"></asp:Label></span>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px">
                                            ખાતા નં. <span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px; padding-top: 1px">
                                                <asp:Label ID="lblKhataNo" runat="server" Width="40px"></asp:Label></span>
                                           <%-- <span style="border-top-width: 1px; border-top-style: solid;">
                                                <asp:Label ID="lblKhataNo" runat="server" Width="40px"></asp:Label></span>--%>
                                            ગામ<span style="font-size: 10px; padding-left: 5px; border-bottom-style: solid; border-bottom-width: 1px; padding-top: 1px">
                                                <asp:Label ID="lblVillage" runat="server" Width="47px"></asp:Label></span>
                                            <%--<span style="border-top-width: 1px; border-top-style: solid;">
                                                <asp:Label ID="lblVillage" runat="server" Width="47px"></asp:Label></span>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px">
                                            ખાતે સિંચાઈ પિયાવો બાકી છે/નથી
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px">
                                            પા.બા. :-<span style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center">
                                                <asp:Label ID="lblOutstanding" runat="server"></asp:Label></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px;">
                                            ચા.બા. :-<span style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center"><asp:Label
                                                ID="lblChBaki" runat="server"></asp:Label></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="padding-left: 10px" valign="top">
                                <table id="tblLam" runat="server" visible="false">
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="text-align: center; font-size: 10px">
                                            <asp:Label ID="Label2" runat="server" Text="રવિ" Width="60px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; font-size: 10px">
                                            હે. આર.
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center">
                                            <asp:Label ID="Label3" runat="server" Width="60px" Text="-----"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; font-size: 10px;">
                                            દર
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center">
                                            <asp:Label ID="Label4" runat="server" Width="60px" Text="-----"> </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; font-size: 10px">
                                            પિયાવો
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center">
                                            <asp:Label ID="Label5" runat="server" Width="60px" Text="-----"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; font-size: 10px">
                                            લો.ફંડ
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center">
                                            <asp:Label ID="Label6" runat="server" Width="60px" Text="-----"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; font-size: 10px">
                                            કુલ રકમ
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; text-align: center">
                                            <asp:Label ID="Label7" runat="server" Width="60px" Text="-----"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="font-size: 10px; padding-left: 20px">
                                <asp:DataList ID="dlSeson" runat="server" DataSourceID="dsSeasonDetail" RepeatColumns="4">
                                    <ItemTemplate>
                                        <table cellpadding="2" cellspacing="2" width="115px">
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblSeason" runat="server" Text='<%# Bind("SeasonNameG")%>'></asp:Label>
                                                </td>
                                                <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                                    <asp:Label ID="lblYear" runat="server" Text='<%# Bind("FinYear")%>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    હે. આર.
                                                </td>
                                                <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                                    <asp:Label ID="lblarea" runat="server" Text='<%# Bind("PiyatArea") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    દર
                                                </td>
                                                <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                                    <asp:Label ID="lblDar" runat="server" Text='<%# Bind("Dar") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    પિયાવો
                                                </td>
                                                <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("VTotalAmt") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    લો.ફંડ
                                                </td>
                                                <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("LocalFund") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    કુલ રકમ
                                                </td>
                                                <td style="border-bottom-style: solid; border-bottom-width: 1px">
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TotalAmount") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="dsSeasonDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AagakhanConnectionString %>"
                                    SelectCommand="RptMangnaForm7" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="MangnaPatrakID" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="font-size: 10px; border-bottom-style: solid; border-bottom-width: 1px;
                                            padding-top: 10px">
                                            એકંદર કુલ
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; font-size: 10px;
                                            height: 18px">
                                            <asp:Label ID="Label8" runat="server" Width="60px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; font-size: 10px;
                                            height: 18px">
                                            <asp:Label ID="Label9" runat="server" Width="60px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; font-size: 10px;
                                            height: 18px">
                                            <asp:Label ID="lbltotalPiyavo" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; font-size: 10px;
                                            height: 18px">
                                            <asp:Label ID="lblTotalLocAmt" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 10px">
                                            કુલ રકમ
                                        </td>
                                        <td style="border-bottom-style: solid; border-bottom-width: 1px; font-size: 10px;
                                            height: 18px; padding-left: 3px">
                                            <asp:Label ID="lblFinalTotal" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="770px">
                        <tr>
                            <td style="font-size: 10px">
                                તારીખ :
                            </td>
                            <td colspan="2" style="font-size: 10px; text-align: right">
                                સાક્ષી ની સહી <span style="border-bottom-style: solid; border-bottom-width: 1px">
                                    <asp:Label runat="server" ID="lblSahi" Width="150px"></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 10px" colspan="3">
                                તારીખ:
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 10px" colspan="3">
                                મંજુરી મુદ્ત <span style="border-bottom-style: solid; border-bottom-width: 1px">
                                    <asp:Label ID="lblFromDate" runat="server"></asp:Label></span> થી <span style="border-bottom-style: solid;
                                        border-bottom-width: 1px">
                                        <asp:Label ID="lblToDate" runat="server"></asp:Label></span> <span style="padding-left: 145px">
                                            તારીખ સુધી </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 10px" colspan="3">
                                મંજુરી આપવામાં આવી છે/નથી.
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 10px;padding-bottom:10px" colspan="3">
                                નોંધ <span style="border-bottom-style: solid; border-bottom-width: 1px">
                                    <asp:Label ID="lblRemark" runat="server"></asp:Label></span>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                          <tr></tr>
                        <tr></tr>
                        <table style="border:dotted;  border-width:thin;width:770px" >
                        <tr >
                            <td style="font-size: 10px;width: 33.3%; text-align:center; padding-top:50px; border-right-style:dotted; border-width:thin"> <span style="font-size: 10px; padding-left: 100px; border-bottom-style: dotted; border-bottom-width: 1px"></span></td>
                            <td style="font-size: 10px;width: 33.3%; text-align:center; padding-top:50px; border-right-style:dotted; border-width:thin"> <span style="font-size: 10px; padding-left: 100px; border-bottom-style: dotted; border-bottom-width: 1px"></span></td>
                            <td style="font-size: 10px;width: 33.3%; text-align:center; padding-top:50px;"> <span style="font-size: 10px; padding-left: 170px; border-bottom-style: dotted; border-bottom-width: 1px"></span></td>
                        </tr>
                        <tr>                        
                           <td style="font-size: 10px;  text-align:center; border-right-style:dotted; border-width:thin">
                                મંત્રીશ્રી
                            </td>
                            <td style="font-size: 10px; text-align:center; border-right-style:dotted; border-width:thin" >
                                પ્રમુખશ્રી
                            </td>
                            <td style="font-size: 10px; text-align: center">
                                અરજદાર/ વહીવટીદાર ની સહી અથવા
                                <br />
                                અંગુઠા નું નિશાન
                            </td>
                        </tr>
                            </table>                      
                         <tr>
                            <td style="padding-top:20px;font-size: 10px;text-align:right;color:gray" colspan="3">
                                  *નોંધ: આ ફોર્મ સિસ્ટમ જનરેટેડ છે.
                            </td>
                        </tr>                     
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
