<%@ Page Title="Employee Login" Language="C#" MasterPageFile="~/employeePages/employeeMasterPage.master" AutoEventWireup="true" CodeFile="employeeLogin.aspx.cs" Inherits="employeeLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Style/emplyLogin.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="body">
<%--        <asp:SqlDataSource ID="employeeLogin" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>--%>
    <h1> Authorize Access Only</h1>
        <h2>If you are viewing this page and you are not an employee please exit this page</h2>
        <div>
            <asp:SqlDataSource ID="employLogin" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
            <asp:Login ID="emLoginBox" runat="server" OnAuthenticate="Login1_Authenticate" PasswordRecoveryText="Forgot Password?" >
                
            </asp:Login>
        </div>
        
    </div>
</asp:Content>

