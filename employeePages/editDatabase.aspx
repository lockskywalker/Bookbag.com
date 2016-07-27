<%@ Page Title="Edit Database" Language="C#" MasterPageFile="~/employeePages/employeeMasterPage.master" AutoEventWireup="true" CodeFile="editDatabase.aspx.cs" Inherits="employeePages_editDatabase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <asp:DropDownList ID="editddl" runat="server" Height="16px" Width="120px" OnSelectedIndexChanged="editddl_SelectedIndexChanged">
        <asp:ListItem>Products</asp:ListItem>
        <asp:ListItem>Accounts</asp:ListItem>
        <asp:ListItem>Invoices</asp:ListItem>
    </asp:DropDownList>

    <asp:Button ID="refresh" Text="Go" runat="server" OnClick="refresh_Click"></asp:Button>

    <asp:AccessDataSource id="accoutsource" runat="server" DataFile="~/App_Data/BookbagDB.mdb" SelectCommand="SELECT * FROM [Account]" DeleteCommand="DELETE FROM [Account] WHERE [accountNumber] = ?" InsertCommand="INSERT INTO [Account] ([accountNumber], [joinDate], [Name], [Username], [Password], [emailAddress], [Birthday], [streetAddress], [City], [State], [zipCode], [Phone], [lastLogin], [subscriptionID], [securityQuestion], [securityAnswer], [billingAddress], [billingCity], [billingState], [billingZipCode]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Account] SET [joinDate] = ?, [Name] = ?, [Username] = ?, [Password] = ?, [emailAddress] = ?, [Birthday] = ?, [streetAddress] = ?, [City] = ?, [State] = ?, [zipCode] = ?, [Phone] = ?, [lastLogin] = ?, [subscriptionID] = ?, [securityQuestion] = ?, [securityAnswer] = ?, [billingAddress] = ?, [billingCity] = ?, [billingState] = ?, [billingZipCode] = ? WHERE [accountNumber] = ?">
        <DeleteParameters>
            <asp:Parameter Name="accountNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="accountNumber" Type="Int32" />
            <asp:Parameter Name="joinDate" Type="DateTime" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="Birthday" Type="DateTime" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="zipCode" Type="Int32" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="lastLogin" Type="DateTime" />
            <asp:Parameter Name="subscriptionID" Type="Int32" />
            <asp:Parameter Name="securityQuestion" Type="String" />
            <asp:Parameter Name="securityAnswer" Type="String" />
            <asp:Parameter Name="billingAddress" Type="String" />
            <asp:Parameter Name="billingCity" Type="String" />
            <asp:Parameter Name="billingState" Type="String" />
            <asp:Parameter Name="billingZipCode" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="joinDate" Type="DateTime" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="Birthday" Type="DateTime" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="zipCode" Type="Int32" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="lastLogin" Type="DateTime" />
            <asp:Parameter Name="subscriptionID" Type="Int32" />
            <asp:Parameter Name="securityQuestion" Type="String" />
            <asp:Parameter Name="securityAnswer" Type="String" />
            <asp:Parameter Name="billingAddress" Type="String" />
            <asp:Parameter Name="billingCity" Type="String" />
            <asp:Parameter Name="billingState" Type="String" />
            <asp:Parameter Name="billingZipCode" Type="Int32" />
            <asp:Parameter Name="accountNumber" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource id="productsource" runat="server" DataFile="~/App_Data/BookbagDB.mdb" SelectCommand="SELECT * FROM [Products]" DeleteCommand="DELETE FROM [Products] WHERE [productID] = ?" InsertCommand="INSERT INTO [Products] ([productID], [productName], [Author], [Quantity], [Price], [shortDescription], [longDescription], [imageUrl], [subCategoryID]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Products] SET [productName] = ?, [Author] = ?, [Quantity] = ?, [Price] = ?, [shortDescription] = ?, [longDescription] = ?, [imageUrl] = ?, [subCategoryID] = ? WHERE [productID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="productID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productID" Type="String" />
            <asp:Parameter Name="productName" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="shortDescription" Type="String" />
            <asp:Parameter Name="longDescription" Type="String" />
            <asp:Parameter Name="imageUrl" Type="String" />
            <asp:Parameter Name="subCategoryID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="productName" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="shortDescription" Type="String" />
            <asp:Parameter Name="longDescription" Type="String" />
            <asp:Parameter Name="imageUrl" Type="String" />
            <asp:Parameter Name="subCategoryID" Type="Int32" />
            <asp:Parameter Name="productID" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>


    <asp:AccessDataSource id="invoicesource" runat="server" DataFile="~/App_Data/BookbagDB.mdb" SelectCommand="SELECT * FROM [Invoices]" DeleteCommand="DELETE FROM [Invoices] WHERE [Invoices_ID] = ?" InsertCommand="INSERT INTO [Invoices] ([Invoices_ID], [UserID], [Order_Date], [Subtotal], [Shipping_Method], [Shipping Price], [tax], [Total], [Card_number]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Invoices] SET [UserID] = ?, [Order_Date] = ?, [Subtotal] = ?, [Shipping_Method] = ?, [Shipping Price] = ?, [tax] = ?, [Total] = ?, [Card_number] = ? WHERE [Invoices_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Invoices_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Invoices_ID" Type="Int32" />
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="Order_Date" Type="DateTime" />
            <asp:Parameter Name="Subtotal" Type="Decimal" />
            <asp:Parameter Name="Shipping_Method" Type="String" />
            <asp:Parameter Name="Shipping_Price" Type="Decimal" />
            <asp:Parameter Name="tax" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="Card_number" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="Order_Date" Type="DateTime" />
            <asp:Parameter Name="Subtotal" Type="Decimal" />
            <asp:Parameter Name="Shipping_Method" Type="String" />
            <asp:Parameter Name="Shipping_Price" Type="Decimal" />
            <asp:Parameter Name="tax" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="Card_number" Type="Int32" />
            <asp:Parameter Name="Invoices_ID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>

    <%-- Listview begin for products table  --%>
    <asp:ListView ID="ProductsGrid" oniteminserted="ListView1_ItemInserted"  runat="server" DataKeyNames="productID" DataSourceID="productsource" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="productIDLabel" runat="server" Text='<%# Eval("productID") %>' />
                </td>
                <td>
                    <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                </td>
                <td>
                    <asp:Label ID="shortDescriptionLabel" runat="server" Text='<%# Eval("shortDescription") %>' />
                </td>
                <td>
                    <asp:Label ID="longDescriptionLabel" runat="server" Text='<%# Eval("longDescription") %>' />
                </td>
                <td>
                    <asp:Label ID="imageUrlLabel" runat="server" Text='<%# Eval("imageUrl") %>' />
                </td>
                <td>
                    <asp:Label ID="subCategoryIDLabel" runat="server" Text='<%# Eval("subCategoryID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="productIDLabel1" runat="server" Text='<%# Eval("productID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="shortDescriptionTextBox" runat="server" Text='<%# Bind("shortDescription") %>' />
                </td>
                <td>
                    <asp:TextBox ID="longDescriptionTextBox" runat="server" Text='<%# Bind("longDescription") %>' />
                </td>
                <td>
                    <asp:TextBox ID="imageUrlTextBox" runat="server" Text='<%# Bind("imageUrl") %>' />
                </td>
                <td>
                    <asp:TextBox ID="subCategoryIDTextBox" runat="server" Text='<%# Bind("subCategoryID") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <%--<div><%=pid%></div>--%>
                    <asp:TextBox ID="productIDTextBox" runat="server" Text='<%# Bind("productID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="Product ID is a required field." Text="*" 
                                ControlToValidate="productIDTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Product name is a required field." Text="*" 
                                ControlToValidate="productNameTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Author/Creator is a required field." Text="*" 
                                ControlToValidate="AuthorTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Quantity is a required field." Text="*" 
                                ControlToValidate="QuantityTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="Price is a required field." Text="*" 
                                ControlToValidate="PriceTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="shortDescriptionTextBox" runat="server" Text='<%# Bind("shortDescription") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Short description is a required field." Text="*" 
                                ControlToValidate="shortDescriptionTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="longDescriptionTextBox" runat="server" Text='<%# Bind("longDescription") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ErrorMessage="Long description is a required field." Text="*" 
                                ControlToValidate="longDescriptionTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="imageUrlTextBox" runat="server" Text='<%# Bind("imageUrl") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="Image url is a required field." Text="*" 
                                ControlToValidate="imageUrlTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="subCategoryIDTextBox" runat="server" Text='<%# Bind("subCategoryID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage="Sub Category is a required field." Text="*" 
                                ControlToValidate="subCategoryIDTextBox" ValidationGroup="Insert" ForeColor="White">
                            </asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="productIDLabel" runat="server" Text='<%# Eval("productID") %>' />
                </td>
                <td>
                    <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                </td>
                <td>
                    <asp:Label ID="shortDescriptionLabel" runat="server" Text='<%# Eval("shortDescription") %>' />
                </td>
                <td>
                    <asp:Label ID="longDescriptionLabel" runat="server" Text='<%# Eval("longDescription") %>' />
                </td>
                <td>
                    <asp:Label ID="imageUrlLabel" runat="server" Text='<%# Eval("imageUrl") %>' />
                </td>
                <td>
                    <asp:Label ID="subCategoryIDLabel" runat="server" Text='<%# Eval("subCategoryID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">productID</th>
                                <th runat="server">productName</th>
                                <th runat="server">Author</th>
                                <th runat="server">Quantity</th>
                                <th runat="server">Price</th>
                                <th runat="server">shortDescription</th>
                                <th runat="server">longDescription</th>
                                <th runat="server">imageUrl</th>
                                <th runat="server">subCategoryID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="productIDLabel" runat="server" Text='<%# Eval("productID") %>' />
                </td>
                <td>
                    <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
                </td>
                <td>
                    <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                </td>
                <td>
                    <asp:Label ID="shortDescriptionLabel" runat="server" Text='<%# Eval("shortDescription") %>' />
                </td>
                <td>
                    <asp:Label ID="longDescriptionLabel" runat="server" Text='<%# Eval("longDescription") %>' />
                </td>
                <td>
                    <asp:Label ID="imageUrlLabel" runat="server" Text='<%# Eval("imageUrl") %>' />
                </td>
                <td>
                    <asp:Label ID="subCategoryIDLabel" runat="server" Text='<%# Eval("subCategoryID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <div>

        <%-- Listview for Accounts --%>
       
        <asp:ListView ID="AccountsGrid" runat="server" oniteminserted="AccountsGrid_ItemInserted" DataKeyNames="accountNumber" DataSourceID="accoutsource" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="accountNumberLabel" runat="server" Text='<%# Eval("accountNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="joinDateLabel" runat="server" Text='<%# Eval("joinDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailAddressLabel" runat="server" Text='<%# Eval("emailAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BirthdayLabel" runat="server" Text='<%# Eval("Birthday") %>' />
                    </td>
                    <td>
                        <asp:Label ID="streetAddressLabel" runat="server" Text='<%# Eval("streetAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="zipCodeLabel" runat="server" Text='<%# Eval("zipCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lastLoginLabel" runat="server" Text='<%# Eval("lastLogin") %>' />
                    </td>
                    <td>
                        <asp:Label ID="subscriptionIDLabel" runat="server" Text='<%# Eval("subscriptionID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityQuestionLabel" runat="server" Text='<%# Eval("securityQuestion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityAnswerLabel" runat="server" Text='<%# Eval("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingAddressLabel" runat="server" Text='<%# Eval("billingAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingCityLabel" runat="server" Text='<%# Eval("billingCity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingStateLabel" runat="server" Text='<%# Eval("billingState") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingZipCodeLabel" runat="server" Text='<%# Eval("billingZipCode") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="accountNumberLabel1" runat="server" Text='<%# Eval("accountNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="joinDateTextBox" runat="server" Text='<%# Bind("joinDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailAddressTextBox" runat="server" Text='<%# Bind("emailAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BirthdayTextBox" runat="server" Text='<%# Bind("Birthday") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="streetAddressTextBox" runat="server" Text='<%# Bind("streetAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="zipCodeTextBox" runat="server" Text='<%# Bind("zipCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="lastLoginTextBox" runat="server" Text='<%# Bind("lastLogin") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="subscriptionIDTextBox" runat="server" Text='<%# Bind("subscriptionID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="securityQuestionTextBox" runat="server" Text='<%# Bind("securityQuestion") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="securityAnswerTextBox" runat="server" Text='<%# Bind("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="billingAddressTextBox" runat="server" Text='<%# Bind("billingAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="billingCityTextBox" runat="server" Text='<%# Bind("billingCity") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="billingStateTextBox" runat="server" Text='<%# Bind("billingState") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="billingZipCodeTextBox" runat="server" Text='<%# Bind("billingZipCode") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="accountNumberTextBox" runat="server" Text='<%# Bind("accountNumber") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="accountNumber is a required field." Text="*" 
                                ControlToValidate="accountNumberTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="joinDateTextBox" runat="server" Text='<%# Bind("joinDate") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage="joinDate is a required field." Text="*" 
                                ControlToValidate="joinDateTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ErrorMessage="Name is a required field." Text="*" 
                                ControlToValidate="NameTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ErrorMessage="Username is a required field." Text="*" 
                                ControlToValidate="UsernameTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ErrorMessage="Password is a required field." Text="*" 
                                ControlToValidate="PasswordTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="emailAddressTextBox" runat="server" Text='<%# Bind("emailAddress") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                ErrorMessage="emailAddress is a required field." Text="*" 
                                ControlToValidate="emailAddressTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="BirthdayTextBox" runat="server" Text='<%# Bind("Birthday") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                ErrorMessage="Birthday is a required field." Text="*" 
                                ControlToValidate="BirthdayTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="streetAddressTextBox" runat="server" Text='<%# Bind("streetAddress") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                ErrorMessage="Product ID is a required field." Text="*" 
                                ControlToValidate="streetAddressTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                ErrorMessage="streetAddress is a required field." Text="*" 
                                ControlToValidate="CityTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                ErrorMessage="State is a required field." Text="*" 
                                ControlToValidate="StateTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="zipCodeTextBox" runat="server" Text='<%# Bind("zipCode") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                ErrorMessage="zipCode is a required field." Text="*" 
                                ControlToValidate="zipCodeTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                ErrorMessage="Phone is a required field." Text="*" 
                                ControlToValidate="PhoneTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="lastLoginTextBox" runat="server" Text='<%# Bind("lastLogin") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                ErrorMessage="lastLogin is a required field." Text="*" 
                                ControlToValidate="lastLoginTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="subscriptionIDTextBox" runat="server" Text='<%# Bind("subscriptionID") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                ErrorMessage="subscriptionID is a required field." Text="*" 
                                ControlToValidate="subscriptionIDTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="securityQuestionTextBox" runat="server" Text='<%# Bind("securityQuestion") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                ErrorMessage="securityQuestion is a required field." Text="*" 
                                ControlToValidate="securityQuestionTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="securityAnswerTextBox" runat="server" Text='<%# Bind("securityAnswer") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                ErrorMessage="securityAnswer is a required field." Text="*" 
                                ControlToValidate="securityAnswerTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="billingAddressTextBox" runat="server" Text='<%# Bind("billingAddress") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                ErrorMessage="billingAddress is a required field." Text="*" 
                                ControlToValidate="billingAddressTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="billingCityTextBox" runat="server" Text='<%# Bind("billingCity") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                ErrorMessage="billingCity is a required field." Text="*" 
                                ControlToValidate="billingCityTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="billingStateTextBox" runat="server" Text='<%# Bind("billingState") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                ErrorMessage="billingState is a required field." Text="*" 
                                ControlToValidate="billingStateTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="billingZipCodeTextBox" runat="server" Text='<%# Bind("billingZipCode") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                ErrorMessage="billingZipCode is a required field." Text="*" 
                                ControlToValidate="billingZipCodeTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="accountNumberLabel" runat="server" Text='<%# Eval("accountNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="joinDateLabel" runat="server" Text='<%# Eval("joinDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailAddressLabel" runat="server" Text='<%# Eval("emailAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BirthdayLabel" runat="server" Text='<%# Eval("Birthday") %>' />
                    </td>
                    <td>
                        <asp:Label ID="streetAddressLabel" runat="server" Text='<%# Eval("streetAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="zipCodeLabel" runat="server" Text='<%# Eval("zipCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lastLoginLabel" runat="server" Text='<%# Eval("lastLogin") %>' />
                    </td>
                    <td>
                        <asp:Label ID="subscriptionIDLabel" runat="server" Text='<%# Eval("subscriptionID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityQuestionLabel" runat="server" Text='<%# Eval("securityQuestion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityAnswerLabel" runat="server" Text='<%# Eval("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingAddressLabel" runat="server" Text='<%# Eval("billingAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingCityLabel" runat="server" Text='<%# Eval("billingCity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingStateLabel" runat="server" Text='<%# Eval("billingState") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingZipCodeLabel" runat="server" Text='<%# Eval("billingZipCode") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">accountNumber</th>
                                    <th runat="server">joinDate</th>
                                    <th runat="server">Name</th>
                                    <th runat="server">Username</th>
                                    <th runat="server">Password</th>
                                    <th runat="server">emailAddress</th>
                                    <th runat="server">Birthday</th>
                                    <th runat="server">streetAddress</th>
                                    <th runat="server">City</th>
                                    <th runat="server">State</th>
                                    <th runat="server">zipCode</th>
                                    <th runat="server">Phone</th>
                                    <th runat="server">lastLogin</th>
                                    <th runat="server">subscriptionID</th>
                                    <th runat="server">securityQuestion</th>
                                    <th runat="server">securityAnswer</th>
                                    <th runat="server">billingAddress</th>
                                    <th runat="server">billingCity</th>
                                    <th runat="server">billingState</th>
                                    <th runat="server">billingZipCode</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="accountNumberLabel" runat="server" Text='<%# Eval("accountNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="joinDateLabel" runat="server" Text='<%# Eval("joinDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailAddressLabel" runat="server" Text='<%# Eval("emailAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BirthdayLabel" runat="server" Text='<%# Eval("Birthday") %>' />
                    </td>
                    <td>
                        <asp:Label ID="streetAddressLabel" runat="server" Text='<%# Eval("streetAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="zipCodeLabel" runat="server" Text='<%# Eval("zipCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lastLoginLabel" runat="server" Text='<%# Eval("lastLogin") %>' />
                    </td>
                    <td>
                        <asp:Label ID="subscriptionIDLabel" runat="server" Text='<%# Eval("subscriptionID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityQuestionLabel" runat="server" Text='<%# Eval("securityQuestion") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityAnswerLabel" runat="server" Text='<%# Eval("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingAddressLabel" runat="server" Text='<%# Eval("billingAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingCityLabel" runat="server" Text='<%# Eval("billingCity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingStateLabel" runat="server" Text='<%# Eval("billingState") %>' />
                    </td>
                    <td>
                        <asp:Label ID="billingZipCodeLabel" runat="server" Text='<%# Eval("billingZipCode") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>

    <%-- Invoices Listview --%>

    <asp:ListView ID="InvoicesGrid" runat="server" OnItemInserted="InvoicesGrid_ItemInserted" DataSourceID="invoicesource" DataKeyNames="Invoices_ID" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="Invoices_IDLabel" runat="server" Text='<%# Eval("Invoices_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                </td>
                <td>
                    <asp:Label ID="Order_DateLabel" runat="server" Text='<%# Eval("Order_Date") %>' />
                </td>
                <td>
                    <asp:Label ID="SubtotalLabel" runat="server" Text='<%# Eval("Subtotal") %>' />
                </td>
                <td>
                    <asp:Label ID="Shipping_MethodLabel" runat="server" Text='<%# Eval("Shipping_Method") %>' />
                </td>
                <td>
                    <asp:Label ID="Shipping_PriceLabel" runat="server" Text='<%# Eval("[Shipping Price]") %>' />
                </td>
                <td>
                    <asp:Label ID="taxLabel" runat="server" Text='<%# Eval("tax") %>' />
                </td>
                <td>
                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                </td>
                <td>
                    <asp:Label ID="Card_numberLabel" runat="server" Text='<%# Eval("Card_number") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="Invoices_IDLabel1" runat="server" Text='<%# Eval("Invoices_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Order_DateTextBox" runat="server" Text='<%# Bind("Order_Date") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SubtotalTextBox" runat="server" Text='<%# Bind("Subtotal") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Shipping_MethodTextBox" runat="server" Text='<%# Bind("Shipping_Method") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Shipping_PriceTextBox" runat="server" Text='<%# Bind("[Shipping Price]") %>' />
                </td>
                <td>
                    <asp:TextBox ID="taxTextBox" runat="server" Text='<%# Bind("tax") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Card_numberTextBox" runat="server" Text='<%# Bind("Card_number") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="UserID is a required field." Text="*" 
                                ControlToValidate="UserIDTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Order_DateTextBox" runat="server" Text='<%# Bind("Order_Date") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                ErrorMessage="Order_Date is a required field." Text="*" 
                                ControlToValidate="Order_DateTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="SubtotalTextBox" runat="server" Text='<%# Bind("Subtotal") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                ErrorMessage="Subtotal is a required field." Text="*" 
                                ControlToValidate="SubtotalTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Shipping_MethodTextBox" runat="server" Text='<%# Bind("Shipping_Method") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                ErrorMessage="Shipping_Method is a required field." Text="*" 
                                ControlToValidate="Shipping_MethodTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Shipping_PriceTextBox" runat="server" Text='<%# Bind("[Shipping Price]") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                ErrorMessage="Shipping Price is a required field." Text="*" 
                                ControlToValidate="Shipping_PriceTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="taxTextBox" runat="server" Text='<%# Bind("tax") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                ErrorMessage="tax is a required field." Text="*" 
                                ControlToValidate="taxTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                ErrorMessage="Total is a required field." Text="*" 
                                ControlToValidate="TotalTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Card_numberTextBox" runat="server" Text='<%# Bind("Card_number") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                ErrorMessage="Card_number is a required field." Text="*" 
                                ControlToValidate="Card_numberTextBox" ValidationGroup="Insert" ForeColor="White">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="Invoices_IDLabel" runat="server" Text='<%# Eval("Invoices_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                </td>
                <td>
                    <asp:Label ID="Order_DateLabel" runat="server" Text='<%# Eval("Order_Date") %>' />
                </td>
                <td>
                    <asp:Label ID="SubtotalLabel" runat="server" Text='<%# Eval("Subtotal") %>' />
                </td>
                <td>
                    <asp:Label ID="Shipping_MethodLabel" runat="server" Text='<%# Eval("Shipping_Method") %>' />
                </td>
                <td>
                    <asp:Label ID="Shipping_PriceLabel" runat="server" Text='<%# Eval("[Shipping Price]") %>' />
                </td>
                <td>
                    <asp:Label ID="taxLabel" runat="server" Text='<%# Eval("tax") %>' />
                </td>
                <td>
                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                </td>
                <td>
                    <asp:Label ID="Card_numberLabel" runat="server" Text='<%# Eval("Card_number") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Invoices_ID</th>
                                <th runat="server">UserID</th>
                                <th runat="server">Order_Date</th>
                                <th runat="server">Subtotal</th>
                                <th runat="server">Shipping_Method</th>
                                <th runat="server">Shipping Price</th>
                                <th runat="server">tax</th>
                                <th runat="server">Total</th>
                                <th runat="server">Card_number</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="Invoices_IDLabel" runat="server" Text='<%# Eval("Invoices_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                </td>
                <td>
                    <asp:Label ID="Order_DateLabel" runat="server" Text='<%# Eval("Order_Date") %>' />
                </td>
                <td>
                    <asp:Label ID="SubtotalLabel" runat="server" Text='<%# Eval("Subtotal") %>' />
                </td>
                <td>
                    <asp:Label ID="Shipping_MethodLabel" runat="server" Text='<%# Eval("Shipping_Method") %>' />
                </td>
                <td>
                    <asp:Label ID="Shipping_PriceLabel" runat="server" Text='<%# Eval("[Shipping Price]") %>' />
                </td>
                <td>
                    <asp:Label ID="taxLabel" runat="server" Text='<%# Eval("tax") %>' />
                </td>
                <td>
                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                </td>
                <td>
                    <asp:Label ID="Card_numberLabel" runat="server" Text='<%# Eval("Card_number") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <!-- Label that displays entry errors -->
     <asp:Label ID="lblError" runat="server" 
                    EnableViewState="False" ForeColor="Red" CssClass="error"></asp:Label>

    </asp:Content>

