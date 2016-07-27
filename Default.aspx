<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
        <link href="Style/Home.css" rel="stylesheet" type="text/css" runat="server" />
</asp:Content>
<asp:Content ID="homeBody" ContentPlaceHolderID="body" Runat="Server">
     <div class="bodydiv">

                <div class="header">
                <asp:Label CssClass="homeheader" runat="server" text="Top 4"></asp:Label>
                     </div>

               <!-- Update the table to be linked to home, shop, Subscription, and Account pages-->
                <asp:Table runat="server" Style="width:45%; height:500px" CssClass="homeTbl" GridLines="Both">
                    <asp:TableRow>
                        <asp:TableCell  CssClass="tblCell" HorizontalAlign="Center">
                            <div class="cell">
                                <asp:ImageButton runat="server" ImageUrl="~/Images/Products/HoggardBook.jpg" class="imageBttn"
                                    ID="shopButton" PostBackUrl='~/SingleProduct.aspx?productID=0747532802' OnClick="shopButton_Click" />
                            </div>
                            <div class="link">
                            <asp:Hyperlink CssClass="links" NavigateUrl='~/SingleProduct.aspx?productID=0747532802' runat="server">How To Do Anything With Computers. Ever. </br> By: Robert Hoggard </asp:Hyperlink>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell CssClass="tblCell" HorizontalAlign="Center">
                             <div class="cell">
                                <asp:ImageButton runat="server" ImageUrl="~/Images/Products/DEADPOP.jpeg" class="imageBttn"
                                    ID="ImageButton1" PostBackUrl='~/SingleProduct.aspx?productID=0747532856' OnClick="shopButton_Click" />
                            </div>
                            <div class="link">
                            <asp:Hyperlink CssClass="links" NavigateUrl='~/SingleProduct.aspx?productID=0747532856' runat="server">Deadpool Pop Figure</asp:Hyperlink>
                                </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell CssClass="tblCell" HorizontalAlign="Center">
                             <div class="cell">
                                <asp:ImageButton runat="server" ImageUrl="~/Images/Products/GOT.jpeg" class="imageBttn"
                                    ID="ImageButton2" PostBackUrl='~/SingleProduct.aspx?productID=0747532808' OnClick="shopButton_Click" />
                            </div>
                            <div class="link">
                            <asp:Hyperlink CssClass="links" NavigateUrl='~/SingleProduct.aspx?productID=0747532808' runat="server">Game Of Thrones Box Set</asp:Hyperlink>
                                </div>
                        </asp:TableCell>
                        <asp:TableCell CssClass="tblCell" HorizontalAlign="Center">
                             <div class="cell">
                                <asp:ImageButton runat="server" ImageUrl="~/Images/Products/AHPB.jpeg" class="imageBttn"
                                    ID="ImageButton3" PostBackUrl='~/SingleProduct.aspx?productID=0747532706' OnClick="shopButton_Click" />
                            </div>
                            <div class="link">
                            <asp:Hyperlink CssClass="links" NavigateUrl='~/SingleProduct.aspx?productID=0747532706' runat="server">Harry Potter Box Set</asp:Hyperlink>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>    

</asp:Content>