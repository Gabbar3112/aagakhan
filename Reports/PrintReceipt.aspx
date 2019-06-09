<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintReceipt.aspx.cs" Inherits="Reports_PrintReceipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>રસીદ પત્રક</title>
    <style type="text/css">
        .line {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td style="font-size: 35px; font-weight: bold; text-align:center;" colspan="3">
                    <asp:Label ID="lblInstituteName" runat="server" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: Black">રજી.નં.               
                    <asp:Label ID="lbrRegNo" runat="server" Width="100px"></asp:Label>               
                </td>
                <td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: Black">
                    <asp:Label ID="lbrAddress" runat="server" Width="100%"></asp:Label>               
                </td>

                <td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: Black; text-align: right">ફોન : 
                     <asp:Label ID="lblPhoneNo" runat="server" Width="100px"></asp:Label> 
                </td>
            </tr>
            
        </table>
        <table style="width:100%">
            <tr>
                <td style="text-align: left; font-size: 12px">રસીદ તારીખ :
                </td>
                 <td style="text-align: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: Black; font-size: 12px">
                    <asp:Label ID="lblDate" runat="server" Width="100px"></asp:Label>
                </td>
             
                <td style="text-align: right; font-size: 12px">રસીદ નંબર:
                </td>
                 <td style="text-align: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: Black; font-size: 12px">
                    <asp:Label ID="lblRceipt" runat="server" Width="100px"></asp:Label>
                </td>
              
                <td style="text-align: right; font-size: 12px">માંગણા તારીખ :
                </td>
                <td style="text-align: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: Black; font-size: 12px">
                    <asp:Label ID="lblMagnaDate" runat="server" Width="100px"></asp:Label>
                </td>
             
                
            </tr>
           
            <tr>
                <td style="text-align: left; font-size: 12px">ખાતેદારનું નામ :
                </td>
                <td style="text-align: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: Black; font-size: 12px">
                    <asp:Label ID="lblPerson" runat="server" Width="100px"></asp:Label>
                </td>
            
                <td style="text-align: right; font-size: 12px">ગામ :
                </td>
                  <td style="text-align: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: Black; font-size: 12px">
                    <asp:Label ID="lblPersonGam" runat="server" Width="100px"></asp:Label>
                </td>
              
                <td style="text-align: right; font-size: 12px; padding-left: 40px">માંગણા નંબર:
                </td>
                <td style="text-align: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: Black; font-size: 12px">
                    <asp:Label ID="lblMagnaNo" runat="server" Width="100px"></asp:Label>
                </td>
              
            </tr>
            <tr><td>&nbsp;</td></tr>
           
        </table>
        <table style="width:100%">
            <tr>
                <td>
                    <asp:GridView ID="dgvSeasonDetail" runat="server" AutoGenerateColumns="False" DataSourceID="dsSeasonDetail"
                        CellPadding="3" CellSpacing="3" Width="100%" ShowFooter="True" OnRowDataBound="dgvSeasonDetail_RowDataBound"
                        HorizontalAlign="Center" Font-Size="12px">
                        <Columns>
                            <asp:BoundField DataField="BlockNo" HeaderText="બ્લોક નંબર" SortExpression="BlockNo"
                                ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="BlockArea" HeaderText="કુલ વિસ્તાર" SortExpression="BlockArea"
                                ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="PiyatVistar" HeaderText="પિયત વિસ્તાર" SortExpression="PiyatVistar"
                                ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="WaterType" HeaderText="ઉદવહન ડાયરેકટ" ReadOnly="True"
                                SortExpression="WaterType" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="સિઝન - વર્ષ" SortExpression="FinYear">
                                <FooterStyle HorizontalAlign="Right"  Font-Bold="true"/>
                                <FooterTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="કુલ"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FinYear") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="પાછલી રકમ">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastRakam" runat="server" Text="-"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="પિયાવો" SortExpression="Piyavo">
                                <FooterTemplate>
                                    <asp:Label ID="lblKulPiyavo" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalPiyavo" runat="server" Text='<%# Bind("Piyavo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterStyle HorizontalAlign="Center" Font-Bold="true" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="લો.ફંડ" SortExpression="LocalFund">
                                <FooterTemplate>
                                    <asp:Label ID="lblKulFund" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalLocalFund" runat="server" Text='<%# Bind("LocalFund") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterStyle HorizontalAlign="Center" Font-Bold="true"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="રકમ" SortExpression="Total">
                                <FooterTemplate>
                                    <asp:Label ID="lblKulRakam" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalRakam" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterStyle HorizontalAlign="Center" Font-Bold="true" />
                            </asp:TemplateField>
                     
                            <asp:TemplateField HeaderText="ચુકવવા પાત્ર" SortExpression="AmountPaid">
                                <FooterTemplate>
                                    <asp:Label ID="lblCRakam" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFinalAmt" runat="server" Text='<%# Bind("AmountPaid") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterStyle HorizontalAlign="Center" Font-Bold="true"/>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSeasonDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AagakhanConnectionString %>"
                        SelectCommand="ReceiptReport" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                      
                            <asp:QueryStringParameter Name="ReceiptID" QueryStringField="RID" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr >
                <td>
                    <table>
                        <tr>
                            <td style="font-size: 12px; text-align: left;">પ્રાપ્ત રકમ:
                            </td>
                            <td style="font-size: 12px;text-align: right;"  valign="top" colspan="3">
                                <asp:Label ID="lblReceiveRs" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px; text-align: left;">શબ્દોમાં અંકે રૂપિયા:
                            </td>
                            <td style="font-size: 12px;text-align: right;" valign="top" colspan="3">
                                <asp:Label ID="lblRsWord" runat="server" CssClass="line"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px; text-align: left;">બેંક નું નામ :
                            </td>
                            <td style="font-size: 12px;text-align: right;" colspan="3">
                                <asp:Label ID="lblBankName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 12px; text-align: left;">ચેક તારીખ :
                            </td>
                            <td style="font-size: 12px;text-align: right;">
                                <asp:Label ID="lblChequeDate" runat="server"></asp:Label>
                            </td>
                            <td style="font-size: 12px; text-align: left;">ચેક નંબર :
                            </td>
                            <td style="font-size: 12px;text-align: right;">
                                <asp:Label ID="lblChequeNo" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="float:right">
                        <tr>
                            <td style="font-size: 12px;text-align:center">
                                મેનેજર/કલાર્ક<br />
                                એરથાણ વડદલા પિયત સહકારી મંડળી લી.<br />
                                મુ.એરથાણ, તા.પલસાણા, જી.સુરત.<br />
                                પીનકોડ - ૩૯૪ ૩૧૭
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr runat="server" visible="false" id="trPrevRecptHeading">
                <td id="Td1" runat="server" style="font-size: 13px;">
                    <asp:Label ID="lblOldReceipt" runat="server" Text="જૂની રસીદ ની માહિતી:" Style="border-bottom: 1px dashed;margin-left:50px;"></asp:Label>
                </td>
            </tr>
            <tr runat="server" visible="false" id="trPrevRecptNo">
                <td style="font-size: 12px;">
                    <asp:Label ID="Label2" runat="server" Text="રસીદ નંબર: " style="margin-left:50px;"></asp:Label>
                    <asp:Label ID="lblPrevReceiptNumbers" runat="server" ></asp:Label>
                </td>
            </tr>

        </table>

    </form>
</body>
</html>
