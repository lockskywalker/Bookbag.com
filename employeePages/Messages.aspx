<%@ Page Title="" Language="C#" MasterPageFile="~/employeePages/employeeMasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="employeePages_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function refeshUpdatePanel() {
            __doPostBack('<%= memoMessage.ClientID %>','')
        };
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="dateTimeLbl" runat="server" Visible="false" ></asp:Label>
    <asp:SqlDataSource ID="memos" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" 
        SelectCommand="SELECT * FROM [Memos] WHERE ((CONTAINS([To], @To)) OR ([To] = @To2))"
         DeleteCommand="DELETE FROM [Memos] WHERE [Subject] = @original_Subject AND [To] = @original_To AND [From] = @original_From AND [Message] = @original_Message AND [dateSent] = @original_dateSent" ConflictDetection="CompareAllValues" InsertCommand="INSERT INTO [Memos] ([To], [From], [Subject], [Message], [dateSent]) VALUES (@To, @From, @Subject, @Message, @dateSent)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Memos] SET [To] = @To, [From] = @From, [Message] = @Message, [dateSent] = @dateSent WHERE [Subject] = @original_Subject AND [To] = @original_To AND [From] = @original_From AND [Message] = @original_Message AND [dateSent] = @original_dateSent">
        <DeleteParameters>
            <asp:Parameter Name="original_Subject" Type="String" />
            <asp:Parameter Name="original_To" Type="String" />
            <asp:Parameter Name="original_From" Type="String" />
            <asp:Parameter Name="original_Message" Type="String" />
            <asp:Parameter Name="original_dateSent" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="To" Type="String" />
            <asp:Parameter Name="From" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Message" Type="String" />
            <asp:Parameter Name="dateSent" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="userName" Name="To" Type="String" />
            <asp:Parameter DefaultValue="All" Name="To2" Type="String" />
        </SelectParameters>
        
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="memos">
        <EmptyDataTemplate>
            <asp:Label ID="emptyLbl" runat="server" Text="There are no new messages for you"></asp:Label>
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="dateSent" HeaderText="dateSent" SortExpression="dateSent" />
            <asp:BoundField DataField="From" HeaderText="From" SortExpression="From" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
        </Columns>
    </asp:GridView>
    <asp:Table ID="Table1" runat="server" BorderStyle="Solid" GridLines="Horizontal">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell ColumnSpan="2">
                Send Memo
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="to" runat="server" Text="To:"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <asp:TextBox ID="toTxtBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please enter a person or persons to send to" ControlToValidate="toTxtBox"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="from" runat="server" Text="From:"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <asp:Label ID="fromLbl" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="subject" runat="server" Text="Subject:"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <asp:TextBox ID="subjectTxtBox" runat="server" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Subject is required to send message" 
                    ControlToValidate="subjectTxtBox">*</asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell ColumnSpan="2" HorizontalAlign="Left">
                <asp:Label ID="msg" runat="server" Text="Memo:"></asp:Label>
            </asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="memoMessage" runat="server" Height="250px" MaxLength="250" Width="400px" onkeydown="refeshUpdatePanel();"
                    Wrap="true" TextMode="MultiLine" OnTextChanged="memoMessage_TextChanged" ></asp:TextBox>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="txtCount" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="txtCounter" runat="server" Text="250 charcters left"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="memoMessage" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="sendBttn" runat="server" Text="Send" OnClick="sendBttn_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
