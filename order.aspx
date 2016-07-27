<%@ Page Title="order" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function refeshUpdatePanel() {
            __doPostBack('<%= cardNumHidden.ClientID %>', '')
        };
    </script>
    <link rel="stylesheet" href="Style/order.css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div style="height: 500px; margin-top: 5%; float: left">
        <asp:SqlDataSource ID="invoices" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" 
            InsertCommand="INSERT INTO [Invoices] ([invoiceID], [userID], [orderDate], [subtotal], [shippingMethod], [shippingPrice], [tax], [total], [cardNumber]) VALUES (@invoiceID, @userID, @orderDate, @subtotal, @shippingMethod, @shippingPrice, @tax, @total, @cardNumber)"
             SelectCommand="SELECT * FROM [Invoices]" >
            <InsertParameters>
                <asp:Parameter Name="invoiceID" Type="Int32" />
                <asp:Parameter Name="userID" Type="Int32" />
                <asp:Parameter Name="orderDate" Type="DateTime" />
                <asp:Parameter Name="subtotal" Type="Decimal" />
                <asp:Parameter Name="shippingMethod" Type="String" />
                <asp:Parameter Name="shippingPrice" Type="Decimal" />
                <asp:Parameter Name="tax" Type="Decimal" />
                <asp:Parameter Name="total" Type="Decimal" />
                <asp:Parameter Name="cardNumber" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="lineItems" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Line Items]" 
            InsertCommand="INSERT INTO [Line Items] (invoiceID, lineNumber, productID, productName, quantity, price) VALUES (@invoiceID, @lineNumber, @productID, @productName, @quantity, @price)">
            <InsertParameters>
                <asp:Parameter Name="invoiceID" Type="Int32" />
                <asp:Parameter Name="lineNumber" Type="Int32" />
                <asp:Parameter Name="productID" Type="String" />
                <asp:Parameter Name="productName" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="price" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="card" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" DeleteCommand="DELETE FROM [Customer Card Information] WHERE [CardNumber] = @CardNumber" InsertCommand="INSERT INTO [Customer Card Information] ([userID], [CardNumber], [cardName], [CVS], [Exp_Date], [Card_Type]) VALUES (@userID, @CardNumber, @cardName, @CVS, @Exp_Date, @Card_Type)" SelectCommand="SELECT * FROM [Customer Card Information]" UpdateCommand="UPDATE [Customer Card Information] SET [userID] = @userID, [cardName] = @cardName, [CVS] = @CVS, [Exp_Date] = @Exp_Date, [Card_Type] = @Card_Type WHERE [CardNumber] = @CardNumber">
            <DeleteParameters>
                <asp:Parameter Name="CardNumber" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userID" Type="Int32" />
                <asp:Parameter Name="CardNumber" Type="String" />
                <asp:Parameter Name="cardName" Type="String" />
                <asp:Parameter Name="CVS" Type="Int32" />
                <asp:Parameter Name="Exp_Date" Type="DateTime" />
                <asp:Parameter Name="Card_Type" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="userID" Type="Int32" />
                <asp:Parameter Name="cardName" Type="String" />
                <asp:Parameter Name="CVS" Type="Int32" />
                <asp:Parameter Name="Exp_Date" Type="DateTime" />
                <asp:Parameter Name="Card_Type" Type="String" />
                <asp:Parameter Name="CardNumber" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            <div style="width: 1000px">
                <asp:Label ID="err1" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Label ID="err2" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Table ID="orderTbl" runat="server">
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:GridView ID="orderView" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="productName" HeaderText="Name" />
                                    <asp:BoundField DataField="price" HeaderText="Price (each)" DataFormatString="{0:c}" />
                                    <asp:BoundField DataField="qty" HeaderText="Quantity" />
                                    <asp:BoundField DataField="productTotal" HeaderText="Product Total" DataFormatString="{0:c}" />
                                </Columns>
                            </asp:GridView>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                    Subtotal:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="subTotalLbl" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                    Tax:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="taxLbl" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                    Total:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="totalLbl" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table1" runat="server" CssClass="shipTbl">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Shipping Method</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Shipping Price</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:DropDownList ID="shipMthodDDL" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="shipMthodDDL_SelectedIndexChanged">
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="shippingPriceLbl" runat="server"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="shipMthodDDL" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div style="width:1000px">
                <div class="cardTbl">
                    <asp:DropDownList ID="cardSelectDDL" runat="server" Visible="false" AutoPostBack="true"
                        OnSelectedIndexChanged="cardSelectDDL_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="savedBttn" runat="server" Text="Use saved card" OnClick="savedBttn_Click" />
                    <asp:Table ID="cardTable" runat="server" GridLines="Horizontal">
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Left">
                                <asp:Label ID="cardNumLbl" runat="server" Text="Enter Card Number:"></asp:Label>
                            </asp:TableHeaderCell>
                            <asp:TableCell ColumnSpan="2">

                                <asp:UpdatePanel ID="txtCount" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="cardNumTxtBox" runat="server" MaxLength="16" AutoPostBack="true"
                                            OnTextChanged="cardNumTxtBox_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                            ErrorMessage="Card number is required" ControlToValidate="cardNumTxtBox">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="cardNumHidden" runat="server" TextMode="Password" MaxLength="16" Visible="false"
                                            onkeydown="refeshUpdatePanel();" OnTextChanged="cardNumHidden_TextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="cardNumTxtBox" />
                                        <asp:PostBackTrigger ControlID="cardNumHidden" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Left">
                                <asp:Label ID="CVSLbl" runat="server" Text="Enter Security Number (CVS):"></asp:Label>
                            </asp:TableHeaderCell>
                            <asp:TableCell ColumnSpan="2">
                                <asp:TextBox ID="CVS" runat="server" MaxLength="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CVS"
                                    ErrorMessage="Code is required" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" MinimumValue="10" ControlToValidate="CVS"
                                    ErrorMessage="Invalid code" Display="Dynamic" MaximumValue="9999"></asp:RangeValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Left">
                                <asp:Label ID="expirLbl" runat="server" Text="Enter Expreation Date:"></asp:Label>
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="monthDDL" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="yearDDL" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Left">
                                <asp:Label ID="cardTypeLbl" runat="server" Text="Select Cart Type"></asp:Label>
                            </asp:TableHeaderCell>
                            <asp:TableCell ColumnSpan="2">
                                <asp:DropDownList ID="cardTypeDDL" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Left">
                                <asp:Label ID="nameLbl" runat="server" Text="Enter Name on Card:"></asp:Label>
                            </asp:TableHeaderCell>
                            <asp:TableCell ColumnSpan="2">
                                <asp:TextBox ID="nameTxtBox" runat="server" TextMode="SingleLine" MaxLength="24"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nameTxtBox"
                                    ErrorMessage="Name is Required">*</asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right" ColumnSpan="3">
                                <asp:Button ID="addCard" runat="server" Text="Add Card" OnClick="addCard_Click" ToolTip="Don't click if your card is already saved or you are a guest" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>

        </div>
        <div class="orderBttns">
            <asp:Button ID="confrimBttn" runat="server" Text="Confirm" OnClick="confrimBttn_Click" />
            <asp:Button ID="cancelBttn" runat="server" Text="Cancel" OnClick="cancelBttn_Click" CausesValidation="false" />
        </div>
    </div>
</asp:Content>


