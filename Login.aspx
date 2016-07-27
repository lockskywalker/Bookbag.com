<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Login</title>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <asp:SqlDataSource ID="loginVerification" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Account]"></asp:SqlDataSource>
    <div>
        <div style="height:500px;">
            <asp:Login ID="userlogin" runat="server" OnAuthenticate="Login1_Authenticate" CssClass="userLogin"
                 CreateUserUrl="~/signup.aspx" CreateUserText="Create New User">
            </asp:Login>
            
        </div>
         
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

