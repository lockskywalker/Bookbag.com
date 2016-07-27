<%@ Page Title="Shop" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/products.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">

    <div class="listviewdiv">

    <asp:ListView ID="books" runat="server" 
        DataKeyNames="productID"
        DataSourceID="productsSource"
        GroupItemCount="3" Style="width:900px ; margin-left:auto; margin-right:auto; height:500px" >
        <EmptyDataTemplate>
          
              <table  runat="server">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>

        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>

        </GroupTemplate>
        <ItemTemplate>
            <td runat="server">

                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell Width="300px" HorizontalAlign="Center">
                      <div class="productcell">
                            <div>
                                <asp:Image ID="productImage" runat="server" ImageUrl=' <%# "Images/Products/" + Eval("imageUrl") %>' CssClass="image" />                      
                            </div>
                            <div>
                                <asp:LinkButton ID="linkbut" runat="server"
                                    Text='<%# Eval("productName") %>' CausesValidation="false"
                                    PostBackUrl='<%# "SingleProduct.aspx?productID=" + Eval("productID") %>'></asp:LinkButton>
                            </div>
                            <span class="ProductListItem">
                                <b>Price: </b><%# Eval("price", "{0:c}")%>
                            </span>
                            <br />
                            <!--<a href='AddToCart.aspx?productID=<%# Eval("productID") %>'>
               <span class="ProductListItem"><b>Add To Cart<b></font></span>
            </a>-->
                     </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server">
                            <tr id="groupPlaceholder" runat="server"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server"></td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
   </div>


    <asp:SqlDataSource ID="productsSource" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="bookssearch" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT productID, productName, Author, Quantity, Price, shortDescription, longDescription, imageUrl, subCategoryID FROM Products WHERE (subCategoryID LIKE '%101%') OR (subCategoryID LIKE '%201%') OR (subCategoryID LIKE '%201%') OR (subCategoryID LIKE '%301%') OR (subCategoryID LIKE '%401%')"></asp:SqlDataSource>

        <asp:SqlDataSource ID="moviesearch" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT productID, productName, Author, Quantity, Price, shortDescription, longDescription, imageUrl, subCategoryID FROM Products WHERE (subCategoryID LIKE '%102%') OR (subCategoryID LIKE '%202%') OR (subCategoryID LIKE '%302%') OR (subCategoryID LIKE '%402%') OR (subCategoryID LIKE '%502%') OR (subCategoryID LIKE '%602%')"></asp:SqlDataSource>

        <asp:SqlDataSource ID="collectablesearch" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT productID, productName, Author, Quantity, Price, shortDescription, longDescription, imageUrl, subCategoryID FROM Products WHERE (subCategoryID LIKE '%103%') OR (subCategoryID LIKE '%403%') OR (subCategoryID LIKE '%603%') OR (subCategoryID LIKE '%104%') OR (subCategoryID LIKE '%204%') OR (subCategoryID LIKE '%304%') OR (subCategoryID LIKE '%404%') OR (subCategoryID LIKE '%504%')"></asp:SqlDataSource>

            <asp:SqlDataSource ID="clothessearch" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT productID, productName, Author, Quantity, Price, shortDescription, longDescription, imageUrl, subCategoryID FROM Products WHERE (subCategoryID LIKE '%203%') OR (subCategoryID LIKE '%303%') OR (subCategoryID LIKE '%503%')"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

