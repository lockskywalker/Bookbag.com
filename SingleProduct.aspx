<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SingleProduct.aspx.cs" Inherits="SingleProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <link href="Style/item.css" rel="stylesheet" />
    <div>
        <div>
            <asp:Label ID="lbl" Text="" runat="server"></asp:Label>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:SqlDataSource ID="singleProductSource" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([productID] = @productID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="productID" QueryStringField="productID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="subDB" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [subCategories]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="book" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Books] ORDER BY [productId], [TypeID]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="types" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [TypeOfBook]"></asp:SqlDataSource>
        <div style="height: 800px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 5%;">
            <div style="float: right; width: 700px">
                <h1 style="padding-bottom: 0px; margin-bottom: 0px">
                    <asp:Label ID="namelbl" runat="server" Text=""></asp:Label></h1>
                <div style="float: left">
                    <asp:Image ID="productImage" runat="server" CssClass="itemImage" /><br />
                </div>
                <div style=" float:right;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="pricelbl" runat="server" Text="" Font-Size="Larger" Font-Bold="true"></asp:Label>
                            <br />
                            <asp:Label ID="outofstocklbl" Visible="false" runat="server" Text="Out of Stock"></asp:Label>
                            <asp:Label ID="qtyLbl" runat="server" Text="Label">Qty:</asp:Label>
                            <asp:DropDownList ID="qtyddl" Visible="true" runat="server"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="typeDDL" />
                        </Triggers>
                    </asp:UpdatePanel>


                    <div>
                        <asp:Label ID="typeLbl" runat="server" Text="Label" Visible=" false">Select Book Type:</asp:Label>

                        <asp:DropDownList ID="typeDDL" OnSelectedIndexChanged="typeDDL_SelectedIndexChanged" AutoPostBack="true" runat="server" Visible="False"></asp:DropDownList>
                        <div>
                            <asp:Button CssClass="basicbut" Text="Add to Cart" ID="btnAdd" OnClick="btnAdd_Click" runat="server" Width="107px" CausesValidation="False" />
                        </div>
                    </div>

                </div>
            </div>

            <div style="float: left">
                <asp:Label ID="arthorlbl" runat="server" Text="" Visible="false"></asp:Label><br />
                <asp:Label ID="shortlbl" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="longlbl" runat="server" Text=""></asp:Label><br />
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

