<%@ Page Title="Account" Language="C#" MasterPageFile="AccountMasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account_Account2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Account.css" rel="stylesheet" />
    <link href="../Style/General.css" rel="stylesheet" />
    <script type="text/javascript">
        function refeshUpdatePanel() {
            __doPostBack('<%= cardNumTxtBox.ClientID %>', '')
        };
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [Account] WHERE ([accountNumber] = @accountNumber)">
        <SelectParameters>
            <asp:CookieParameter CookieName="id" DefaultValue="0" Name="accountNumber" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="cityData" runat="server" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>" SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
    <asp:Table class="uneditableTableUET" runat="server" GridLines="Both" ID="UET">
        <asp:TableRow ID="accountNumberRowUET">
            <asp:TableCell>
                <asp:Label ID="acctNumLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="NumLbl" runat="server"></asp:Label>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow ID="nameRowUET">
            <asp:TableCell>
                <asp:Label ID="NameLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="name" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="usernameRowUET">
            <asp:TableCell>
                <asp:Label ID="usrNmeLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="userNameUET" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="emailAddressRowUET">
            <asp:TableCell>
                <asp:Label ID="emailAddressLbl1" runat="server" Text="Email Address"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="emailAddress" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="joinDateRowUET">
            <asp:TableCell>
                <asp:Label ID="JoinDtLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="JoinDate" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="birthdayRowUET">
            <asp:TableCell>
                <asp:Label ID="BdayLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="bDay" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="streetAddressRowUET">
            <asp:TableCell>
                <asp:Label ID="strAddLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="strAddr" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="cityRowUET">
            <asp:TableCell>
                <asp:Label ID="CtyLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="city" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="stateRowUET">
            <asp:TableCell>
                <asp:Label ID="StateLbl" runat="server">

                </asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="State" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="zipCodeRowUET">
            <asp:TableCell>
                <asp:Label ID="ZipCodeLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="zipCode" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="phoneNumberRowUET">
            <asp:TableCell>
                <asp:Label ID="phoneNumLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="phoneNumbers" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="lastLoginRow">
            <asp:TableCell>
                <asp:Label ID="lastLoginLbl" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LastLogin" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="subNameLbl" runat="server" Text="Subscription"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="changeBttn" runat="server" Text="Change" OnClick="changeBttn_Click" CssClass="updateBttns" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableFooterRow ID="ButtonRowsUET">
            <asp:TableCell CssClass="tblBttns" ColumnSpan="2" HorizontalAlign="Center">
                <asp:Button class="editBttn" ID="editBttn" runat="server" Text="Edit" OnClick="edit_Click" />
                <asp:Button CssClass="editBttn" ID="addCard" runat="server" Text="Add card" OnClick="addCard_Click" />
                <asp:Button CssClass="editBttn" ID="invoiceBtnn" runat="server" Text="View Invoices" OnClick="invoiceBtnn_Click" />
            </asp:TableCell>
        </asp:TableFooterRow>
    </asp:Table>
    <!--table to be copied to Employee account page -->
    <!--This is the table that they use to edit the information that is editable -->

    <asp:Table class="editableTable" runat="server" Visible="False" GridLines="Both" HorizontalAlign="Center" ID="EDT">
        <asp:TableRow ID="accountNumberRow">
            <asp:TableCell>
                <asp:Label ID="acctNumLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="accountNumber" runat="server"></asp:Label>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow ID="firstNameRow">
            <asp:TableCell>
                <asp:Label ID="fstNameLbl" runat="server" Text="First Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="firstNameTxtBox" runat="server" MaxLength="10"></asp:TextBox>
                *
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="midIntRow">
            <asp:TableCell>
                <asp:Label ID="midintLbl" runat="server" Text="Middle Initial:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="MidInt" runat="server" MaxLength="2"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="lastNameRow">
            <asp:TableCell>
                <asp:Label ID="LstNameLbl" runat="server" Text="Last Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="lastNameTxtBox" runat="server" MaxLength="10"></asp:TextBox>
                *
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow CssClass="hiddenRow" ID="validatorsNameRow">
            <asp:TableCell ColumnSpan="2">
                <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ValidationGroup="nameValidationGroup"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="firstNameTxtBox" CssClass="errorMsg"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ControlToValidate="lastNameTxtBox"
                    ErrorMessage="RequiredFieldValidator" CssClass="errorMsg" ValidationGroup="nameValidationGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="userNameRow">
            <asp:TableCell>
                <asp:Label ID="usrNmeLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <!--username should be made up of 6 characters A-Z and 2 numbers  
                         validator to ensure that usernames follows guide lines-->
                <asp:TextBox ID="userNameTxtBox" runat="server" MaxLength="8" OnTextChanged="userNameTxtBox_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ControlToValidate="userNameTxtBox"
                    ErrorMessage="RequiredFieldValidator" CssClass="errorMsg">*</asp:RequiredFieldValidator>
                <asp:Label ID="error1" runat="server"></asp:Label>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="emailAddressRow">
            <asp:TableCell>
                <asp:Label ID="emailAddressLbl2" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="error3" runat="server"></asp:Label>
                <asp:TextBox ID="emailAddressTxtBox" runat="server" OnTextChanged="emailAddressTxtBox_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailAddressTxtBox"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="passwordRow1">
            <asp:TableCell>
                <asp:Label ID="passwordChngLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <!-- The password should be made up of 8 characters A-Z, 2 numbers, and a special character  
                         use a validator to ensure that password follows guide lines -->
                <asp:TextBox ID="changePasswordTxtBox1" runat="server" MaxLength="11" TextMode="Password"
                    OnTextChanged="changePasswordTxtBox1_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="changePasswordTxtBox1"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                <asp:Label ID="error2" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="passwordRow2">
            <asp:TableCell>
                <asp:Label ID="passwordChngLbl2" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="changePasswordTxtBox2" runat="server" MaxLength="11" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="changePaswordValidator" runat="server" ControlToValidate="changePasswordTxtBox2"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                <!--Ensures that the both the passwords entered are the same -->
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="changePasswordTxtBox1"
                    ControlToCompare="changePasswordTxtBox2" ErrorMessage="CompareValidator" CssClass="errorMsg"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="joinDateRow">
            <asp:TableCell>
                <asp:Label ID="JoinDtLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="joinDate2" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="birthdayMonthRow">
            <asp:TableCell>
                <asp:Label ID="BdayLbl1" runat="server"></asp:Label>
                <asp:Label ID="monthLbl" runat="server" Text="Month: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="monthDDL" runat="server" CssClass="editableTableDDL"
                    OnSelectedIndexChanged="DDL_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="DayRow">
            <asp:TableCell>
                <asp:Label ID="dayLbl" runat="server" Text="Day: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="dayDDL" runat="server" CssClass="editableTableDDL"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="YearRow">
            <asp:TableCell>
                <asp:Label ID="yearLbl" runat="server" Text="Year:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="YearDDL" runat="server" CssClass="editableTableDDL"
                    OnSelectedIndexChanged="DDL_SelectedIndexChanged">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="stateRow">
            <asp:TableCell>
                <asp:Label ID="StateLbl1" runat="server">
                </asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="StateDDL" runat="server" CssClass="editableTableDDL"
                    OnSelectedIndexChanged="StateDDL_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="cityRow">
            <asp:TableCell>
                <asp:Label ID="CtyLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="CityDDL" runat="server" CssClass="editableTableDDL"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="streetAddressRow">
            <asp:TableCell>
                <asp:Label ID="strAddLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="strAddrTxtBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="strAddrValidator" runat="server" ControlToValidate="strAddrTxtBox"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="zipCodeRow">
            <asp:TableCell>
                <asp:Label ID="ZipCodeLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="zipCodeTxtBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="zipCodeTxtBox"
                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="zipCodeTxtBox"
                    MinimumValue="500" MaximumValue="99999" ErrorMessage="RangeValidator" Visible="False"></asp:RangeValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="phoneNumberRow">
            <asp:TableCell>
                <asp:Label ID="phoneNumLbl1" runat="server"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>

                <p>
                    (<asp:TextBox ID="areaCodeTxtBox" runat="server" TextMode="SingleLine" MaxLength="3"></asp:TextBox>
                    ) - 
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="areaCodeTxtBox"
                        MinimumValue="100" MaximumValue="999" ErrorMessage="RangeValidator" Visible="False"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="areaCodeTxtBox"
                        ErrorMessage="RequiredFieldValidator" Visible="False"></asp:RequiredFieldValidator>

                    <asp:Label ID="firstThreeLbl" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="firstThreeTxtBox" runat="server" MaxLength="3"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="firstThreeTxtBox"
                        MinimumValue="0" MaximumValue="999" ErrorMessage="RangeValidator"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="firstThreeTxtBox"
                        ErrorMessage="RequiredFieldValidator" Visible="False"></asp:RequiredFieldValidator>

                    <asp:Label ID="lastFourLbl" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="lastFourTxtBox" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="lastFourTxtBox"
                        MinimumValue="0" MaximumValue="9999" ErrorMessage="RangeValidator" Visible="False"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="lastFourTxtBox"
                        ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="requiredRow">
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                <asp:Label runat="server" ID="requiredLbl"> * Required field</asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableFooterRow ID="buttonRows">
            <asp:TableCell CssClass="tblBttns" ColumnSpan="2" HorizontalAlign="Center">
                <asp:Button class="saveBttn" runat="server" Text="Save" OnClick="save_Click" />
                <asp:Button class="cancelBttn" ID="cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="cancel_Click" />
            </asp:TableCell>

        </asp:TableFooterRow>
    </asp:Table>
    <!-- end table coppy -->

    <asp:Table CssClass="cardTbl" ID="cardTable" runat="server" Visible="false" GridLines="Horizontal">
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="cardNumLbl" runat="server" Text="Enter Card Number:"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell ColumnSpan="2">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="txtCount" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="cardNumTxtBox" runat="server" MaxLength="16"
                             OnTextChanged="cardNumTxtBox_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="Card number is required" ControlToValidate="cardNumTxtBox">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ErrorMessage="Invalid Card Number"
                            ControlToValidate="cardNumTxtBox" Type="Integer" Display="Dynamic"
                            MinimumValue="1000000000000000" MaximumValue="9999999999999999"></asp:RangeValidator>
                        <asp:TextBox ID="cardNumHidden" runat="server" TextMode="Password" MaxLength="16" Visible="false"
                            onkeydown="refeshUpdatePanel();" OnTextChanged="cardNumHidden_TextChanged"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="cardNumTxtBox" />
                        <asp:PostBackTrigger ControlID="cardNumHidden" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="CVSLbl" runat="server" Text="Enter Security Number (CVS):"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="CVS" runat="server" MaxLength="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CVS"
                    ErrorMessage="Code is required" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator6" runat="server" MinimumValue="10" ControlToValidate="CVS"
                    ErrorMessage="Invalid code" Display="Dynamic" MaximumValue="9999"></asp:RangeValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="expirLbl" runat="server" Text="Enter Expreation Date:"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="cardTypeLbl" runat="server" Text="Select Cart Type"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell ColumnSpan="2">
                <asp:DropDownList ID="cardTypeDDL" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell HorizontalAlign="Left">
                <asp:Label ID="Label2" runat="server" Text="Enter Name on Card:"></asp:Label>
            </asp:TableHeaderCell>
            <asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="nameTxtBox" runat="server" TextMode="SingleLine" MaxLength="24"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nameTxtBox"
                    ErrorMessage="Name is Required">*</asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Right" ColumnSpan="3">
                <asp:Button ID="savecard" runat="server" Text="Add Card" OnClick="savecard_Click" ToolTip="Don't click if your card is already saved or your a guest" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>


