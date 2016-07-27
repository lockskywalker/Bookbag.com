<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="aboutUs.aspx.cs" Inherits="aboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div>

            <asp:Label ID="Label1" runat="server" Text="About Us"></asp:Label>

            <p>
                BookBag is a company that that was founded to address what is absent in the internet based bookstore today. We have listened to the customer and know what it is they want. Customers from students, collectors, and just the average reader need more than what is offered in today's world. Consumers still want physical books as well as ebooks, they want collectables that are worth searching for and not available at every department store on the block. Here at BookBag we want to create these relationships as well as keep them.
            </p>

            <asp:Table ID="tblEmail" runat="server">

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="aaron" runat="server" Text="Aaron Jackson:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="aaronEmail" runat="server" Text="aaron@BookBag.com"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="anthony" runat="server" Text="Anthony Jones:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="anthonyEmail" runat="server" Text="anthony@BookBag.com"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="brianna" runat="server" Text="Brianna Hatch:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="briannaEmail" runat="server" Text="brianna@BookBag.com"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="nigel" runat="server" Text="Nigel Smith:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="nigelEmail" runat="server" Text="nigel@BookBag.com"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="steven" runat="server" Text="Steven Maret:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="stevenMaret" runat="server" Text="steven@BookBag.com"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
        </div>
</asp:Content>


