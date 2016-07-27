<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="subscriptionPage.aspx.cs" Inherits="subscriptionPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Style/Subscription.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <asp:SqlDataSource ID="subscriptions" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT [subscriptionName], [rate], [discount], [Description] FROM [SubscriptionType]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Account] WHERE ([accountNumber] = @accountNumber)" DeleteCommand="DELETE FROM [Account] WHERE [accountNumber] = @accountNumber" InsertCommand="INSERT INTO [Account] ([accountNumber], [joinDate], [Name], [Username], [Password], [emailAddress], [Birthday], [streetAddress], [City], [State], [zipCode], [Phone], [lastLogin], [securityQuestion], [securityAnswer], [billingAddress], [billingCity], [billingState], [billingZipCode], [subscriptionID]) VALUES (@accountNumber, @joinDate, @Name, @Username, @Password, @emailAddress, @Birthday, @streetAddress, @City, @State, @zipCode, @Phone, @lastLogin, @securityQuestion, @securityAnswer, @billingAddress, @billingCity, @billingState, @billingZipCode, @subscriptionID)" UpdateCommand="UPDATE [Account] SET [joinDate] = @joinDate, [Name] = @Name, [Username] = @Username, [Password] = @Password, [emailAddress] = @emailAddress, [Birthday] = @Birthday, [streetAddress] = @streetAddress, [City] = @City, [State] = @State, [zipCode] = @zipCode, [Phone] = @Phone, [lastLogin] = @lastLogin, [securityQuestion] = @securityQuestion, [securityAnswer] = @securityAnswer, [billingAddress] = @billingAddress, [billingCity] = @billingCity, [billingState] = @billingState, [billingZipCode] = @billingZipCode, [subscriptionID] = @subscriptionID WHERE [accountNumber] = @accountNumber">
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
            <asp:Parameter Name="securityQuestion" Type="String" />
            <asp:Parameter Name="securityAnswer" Type="String" />
            <asp:Parameter Name="billingAddress" Type="String" />
            <asp:Parameter Name="billingCity" Type="String" />
            <asp:Parameter Name="billingState" Type="String" />
            <asp:Parameter Name="billingZipCode" Type="Int32" />
            <asp:Parameter Name="subscriptionID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="id" Name="accountNumber" Type="Int32" />
        </SelectParameters>
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
            <asp:Parameter Name="securityQuestion" Type="String" />
            <asp:Parameter Name="securityAnswer" Type="String" />
            <asp:Parameter Name="billingAddress" Type="String" />
            <asp:Parameter Name="billingCity" Type="String" />
            <asp:Parameter Name="billingState" Type="String" />
            <asp:Parameter Name="billingZipCode" Type="Int32" />
            <asp:Parameter Name="subscriptionID" Type="Int32" />
            <asp:Parameter Name="accountNumber" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="subscriptionsView" runat="server" >
         <ItemTemplate>
            <asp:Table ID="Table1" runat="server" CssClass="subTbl">
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="float:left">
                            <asp:Image ID="subIcon" ImageUrl="~/Images/Icons/subbagbasic.png" runat="server" />
                        </div>
                        <div style="float:right">
                            <h2>
                           <asp:LinkButton ID="subName" runat="server" Text='<%# Eval("subscriptionName") %>' 
                               OnClick="subName_Click" CssClass="subName"></asp:LinkButton> 
                        </h2>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Label CssClass="rate" ID="rateLbl" runat="server" Text='<%# Eval("rate") %>'></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label CssClass="description" ID="description" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </asp:TableCell>
                </asp:TableRow> 
            </asp:Table>

        </ItemTemplate>
    </asp:ListView>
    
    <h1>
     </h1>
        <asp:Table CssClass="subtable" runat="server">
           
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">
            <h1>
            <asp:Label ID="warningLbl" runat="server" Text="The Page You are trying to view Requires you to be a registered user" Visible="false" Font-Bold="true" ForeColor="Red"></asp:Label>
            <br />
            <br />
        <asp:Label runat="server" ForeColor="#000049" Text="To Subscibe To Get A Monthly Bookback Please Login or Create a Free Account"></asp:Label>
        <br /></h1>
        <asp:Image ID="basicicon" Width="50px" ImageUrl="~/Images/Icons/subbagbasic.png" runat="server" />
        <asp:Image ID="bronzeicon" Width="50px" ImageUrl="~/Images/Icons/subbagbronze.png" runat="server" />
        <asp:Image ID="silvericon" Width="50px" ImageUrl="~/Images/Icons/subbagsilver.png" runat="server" />
        <asp:Image ID="goldicon" Width="50px" ImageUrl="~/Images/Icons/subbaggold.png" runat="server" />
        </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
</asp:Content>




