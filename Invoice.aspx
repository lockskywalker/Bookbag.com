<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>
    <link href="Style/General.css" rel="stylesheet" />
    <link href="Style/invoice.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="invoiceSource" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" 
                SelectCommand="SELECT * FROM [Invoices] WHERE ([invoiceID] = @invoiceID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="invoiceID" QueryStringField="invoiceID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="lineItem" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" 
                SelectCommand="SELECT * FROM [Line Items] WHERE ([invoiceID] = @invoiceID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="invoiceID" QueryStringField="invoiceID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <h1><asp:Label runat="server" Text="You are trying to view someone elses invoice" ForeColor="Red" ID="warningLbl" Visible="false"></asp:Label></h1>
            <asp:Panel ID="invoicePnl" runat="server" Width="500px" CssClass="invoicePnl"  >
                
               <asp:Image ID="logo" runat="server" AlternateText="comapnyLogo" Width="499px" Height="100px" 
                   CssClass="logo" ImageUrl="~/Images/text4697.png"   />
                
                <div class="comapnyInfo">
                    BookBag LLC.
                </div>
                <hr />
                <asp:GridView ID="lineItemsView" runat="server" AutoGenerateColumns="false" GridLines="None"
                      ShowHeader="false" CssClass="lineItemsView">
                    <Columns>
                        <asp:BoundField DataField="productID" />
                        <asp:BoundField DataField="productName" />
                        <asp:BoundField DataField="Quantity" />
                        <asp:BoundField DataField="Price" DataFormatString="{0:c}" />
                    </Columns>
                </asp:GridView>
                <hr />
                <div>
                <table class="priceTbl">
                    <tr>
                        <td style="text-align:right">Subtotal:
                        </td>
                        <td>
                            <asp:Label ID="subLbl" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right">Tax:
                        </td>
                        <td>
                            <asp:Label ID="taxLbl" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right">
                            Selected Shipping Method:
                        </td>
                        <td>
                            <asp:Label ID="methodLbl" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right">
                            Shipping Price:
                        </td>
                        <td>
                            <asp:Label ID="shipLbl" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right">Total:
                        </td>
                        <td>
                            <asp:Label ID="totLbl" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
                </div>
                <div>
                    
                </div>
            </asp:Panel>
            <asp:Button ID="homeBttn" runat="server" Text="Home" OnClick="homeBttn_Click" />
            <asp:Button ID="accountBttn" runat="server" Text="To Account" OnClick="accountBttn_Click" />

        </div>
    </form>
</body>
</html>
