<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign-up Page</title>
    <link href="Style/General.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <!--  --->
            <asp:SqlDataSource ID="newUser" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group4ConnectionString %>"
                InsertCommand="INSERT INTO [Account] ([accountNumber], [joinDate], [Name], [Username], [Password], [emailAddress], [Birthday], [streetAddress], [City], [State], [zipCode], [Phone], [lastLogin],  [billingAddress], [billingCity], [billingState], [billingZipCode]) VALUES (@accountNumber, @joinDate, @Name, @Username, @Password, @emailAddress, @Birthday, @streetAddress, @City, @State, @zipCode, @Phone, @lastLogin,  @billingAddress, @billingCity, @billingState, @billingZipCode)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Account]">
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
                    <asp:Parameter Name="billingAddress" Type="String" />
                    <asp:Parameter Name="billingCity" Type="String" />
                    <asp:Parameter Name="billingState" Type="String" />
                    <asp:Parameter Name="billingZipCode" Type="Int32" />
                </InsertParameters>

            </asp:SqlDataSource>
            <asp:Table class="editableTable" runat="server" GridLines="Both" HorizontalAlign="NotSet" ID="EDT">
                <asp:TableRow ID="firstNameRow">
                    <asp:TableCell>
                        <asp:Label ID="fstNameLbl" runat="server" Text="First Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="firstNameTxtBox" runat="server" MaxLength="10" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" Text="You must enter your first name"
                            ControlToValidate="firstNameTxtBox" CssClass="errorMsg"
                            Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="midIntRow">
                    <asp:TableCell>
                        <asp:Label ID="midintLbl" runat="server" Text="Middle Initial:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="MidInt" runat="server" MaxLength="2" CssClass="txtBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="lastNameRow">
                    <asp:TableCell>
                        <asp:Label ID="LstNameLbl" runat="server" Text="Last Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="lastNameTxtBox" runat="server" MaxLength="10" CssClass="txtBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ControlToValidate="lastNameTxtBox"
                            Text="You must enter your last name" CssClass="errorMsg"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="userNameRow">
                    <asp:TableCell>
                        <asp:Label ID="usrNmeLbl1" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <!--username should be made up of 6 characters A-Z and 2 numbers  
                         validator to ensure that usernames follows guide lines-->
                        <asp:TextBox ID="userNameTxtBox" runat="server" CssClass="txtBox"
                            MaxLength="8" OnTextChanged="userNameTxtBox_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ControlToValidate="userNameTxtBox"
                            Text="Username required" CssClass="errorMsg"></asp:RequiredFieldValidator>
                        <asp:Label ID="error1" runat="server" CssClass="errorMsg"></asp:Label>
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
                            Text="email address is required"></asp:RequiredFieldValidator>
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
                            Text="RequiredFieldValidator"></asp:RequiredFieldValidator>
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
                            Text="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <!--Ensures that the both the passwords entered are the same -->
                        <asp:CompareValidator ID="passwordCompare" runat="server" ControlToValidate="changePasswordTxtBox1"
                            ControlToCompare="changePasswordTxtBox2" Text="CompareValidator" CssClass="errorMsg"></asp:CompareValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="birthdayMonthRow">
                    <asp:TableCell>
                        <asp:Label ID="BdayLbl1" runat="server"></asp:Label>
                        <asp:Label ID="monthLbl" runat="server" Text=" Month: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="monthDDL" runat="server" CssClass="editableTableDDL"
                            OnSelectedIndexChanged="DDL_SelectedIndexChanged" AutoPostBack="true">
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
                            OnSelectedIndexChanged="DDL_SelectedIndexChanged" AutoPostBack="true">
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
                            Text="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="zipCodeRow">
                    <asp:TableCell>
                        <asp:Label ID="ZipCodeLbl1" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="zipCodeTxtBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="zipCodeTxtBox"
                            Text="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="zipCodeTxtBox"
                            MinimumValue="500" MaximumValue="99999" Text="RangeValidator" Visible="False"></asp:RangeValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="phoneNumberRow">
                    <asp:TableCell>
                        <asp:Label ID="phoneNumLbl1" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>

                        <p>
                            (<asp:TextBox ID="areaCodeTxtBox" runat="server" TextMode="SingleLine" MaxLength="3" CssClass="txtBox"></asp:TextBox>
                            ) - 
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="areaCodeTxtBox"
                        MinimumValue="100" MaximumValue="999" Text="RangeValidator" Display="Dynamic"> </asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="areaCodeTxtBox"
                                Text="RequiredFieldValidator" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="firstThreeTxtBox" runat="server" MaxLength="3" CssClass="txtBox"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="firstThreeTxtBox"
                                MinimumValue="0" MaximumValue="999" Text="RangeValidator" Type="Integer" Display="Dynamic"> </asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="firstThreeTxtBox"
                                Text="RequiredFieldValidator" Display="Dynamic"></asp:RequiredFieldValidator>
                            -
                            <asp:TextBox ID="lastFourTxtBox" runat="server" CssClass="txtBox"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="lastFourTxtBox"
                                MinimumValue="0" MaximumValue="9999" Text="RangeValidator" Type="Integer" Display="Dynamic"> </asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="lastFourTxtBox"
                                Text="RequiredFieldValidator" Display="Dynamic"></asp:RequiredFieldValidator>
                        </p>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="requiredRow">
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label runat="server" ID="requiredLbl" ForeColor="Red">  Required field</asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableFooterRow ID="buttonRows">
                    <asp:TableCell CssClass="tblBttns" ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Button class="submitBttn" runat="server" Text="Submit" OnClick="submit_Click" />
                    <asp:Button class="cancelBttn" runat="server" Text="Cancel" OnClick="Unnamed_Click" />
                    </asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>

            <!--place holder-->

        </div>
    </form>
</body>
</html>
