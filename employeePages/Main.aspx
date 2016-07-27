<%@ Page Title="Main" Language="C#" MasterPageFile="~/employeePages/employeeMasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="employeePages_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <asp:SqlDataSource ID="memo" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" 
        SelectCommand="SELECT [From], [dateSent], [Subject] FROM [Memos] WHERE (([dateSent] &gt;= ?) AND (CONTAINS([To], ?)))">
        <SelectParameters>
        <asp:ControlParameter ControlID="dateTime" Name="dateSent" PropertyName="Text" Type="DateTime" />
        <asp:CookieParameter CookieName="empUserName" Name="To" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="dateTime" runat="server" Visible="false"></asp:Label>
    <asp:GridView ID="memoView" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="memo"
         EmptyDataText="No New messages" >
        <Columns>
            <asp:BoundField DataField="From" HeaderText="From" SortExpression="From"  />
            <asp:BoundField DataField="dateSent" HeaderText="dateSent" SortExpression="dateSent" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
        </Columns>
    </asp:GridView>
 </asp:Content>
