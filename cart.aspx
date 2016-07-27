<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Style/Cart.css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div style="height: 303px">
        <div style="float:left; width:1000px; margin-top:5%">
            
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="cartUP" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div>
                    <div class="cartListView" style="margin-left:5%">
                        <asp:GridView ID="CartList" runat="server" EmptyDataText="There are no items in your cart."
                            Width="600px" DataKeyNames="productID" GridLines="Horizontal" CellPadding="4" AutoGenerateColumns="False">
                            <HeaderStyle CssClass="header" />
                            <FooterStyle />
                            <AlternatingRowStyle BackColor="WhiteSmoke" />
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Select 
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="selectCheckBox" runat="server" Text="Select"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="productName" HeaderText="Name" />
                                <asp:BoundField DataField="price" HeaderText="Price (each)" DataFormatString="{0:c}" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Quantity
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="qtyLbl" runat="server" Text='<%# Eval("qty")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="productTotal" HeaderText="Product Total" DataFormatString="{0:c}" />
                            </Columns>
                        </asp:GridView>
                        

                    </div>
                    <div class="priceInfo">
                        <div>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                            <asp:Label runat="server" Text="Subtotal"></asp:Label>
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="subtotalLbl"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                <asp:Label runat="server" Text="Tax"></asp:Label>
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                        <asp:Label ID="taxLbl" runat="server" ></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                <asp:Label runat="server" Text="Total"></asp:Label>
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                        <asp:Label ID="totalLbl" runat="server"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>

                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="deleteSelectedBttn" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="deleteAllBttn" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
        <div style="float:left; margin-top:1%; margin-left:5%">
                <asp:Button runat="server" ID="deleteSelectedBttn" Text="Delete Selected" OnClick="deleteSelectedBttn_Click" />
                <asp:Button ID="deleteAllBttn" runat="server" Text="Delete All" OnClick="deleteAllBttn_Click" />
                <asp:Button ID="continShopBttn" runat="server" Text="Continue Shopping" OnClick="continShopBttn_Click" />
                <asp:Button ID="orderBttn" runat="server" Text="Order" OnClick="orderBttn_Click" />
            </div>



        </div>
    
</asp:Content>


