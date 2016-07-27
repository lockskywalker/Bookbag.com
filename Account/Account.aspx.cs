using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Account2 : System.Web.UI.Page
{
    bool cookieExists;
    /*
     Custom Drop down list boxes that generate and fill in regular drom down list boxes
    */
    Name nameOnAccount = new Name();
    Date dateOfBirth = new Date();
    customDDL monthCustDLL = new customDDL();
    customDDL dayCustDLL = new customDDL();
    customDDL yearCustDLL = new customDDL();
    customDDL stateCustDLL = new customDDL();
    customDDL cityCustDLL = new customDDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if not logged in redirect to login page.
        //Response.Redirect("../login.aspx");
        if ((Request.Cookies["id"] == null)|| (Request.Cookies["id"].Value==""))
        {
            Request.Url.ToString().Replace("http", "https");
            Response.Redirect("../login.aspx");
        }

        if (!IsPostBack)
        {

            HttpCookie account = Request.Cookies["id"];
            userDataSource.SelectCommand = "SELECT * FROM[Account]";
            int id = Convert.ToInt32(account.Value.ToString());
            DataView userTable = (DataView)userDataSource.Select(DataSourceSelectArguments.Empty);
            userTable.RowFilter = "accountNumber = '" +id + "'";

            //Static Labels
            acctNumLbl1.Text = acctNumLbl.Text = "Account Number:";
            emailAddressLbl1.Text = emailAddressLbl2.Text = "Email Address:";
            NameLbl.Text = "Name:";
            usrNmeLbl.Text = usrNmeLbl1.Text = "Username:";
            passwordChngLbl1.Text = "Enter Password:";
            passwordChngLbl2.Text = "Confirm Password:";
            JoinDtLbl1.Text = JoinDtLbl.Text = "Join Date:";
            BdayLbl1.Text = BdayLbl.Text = "Birthday:";
            strAddLbl1.Text = strAddLbl.Text = "Street Address:";
            CtyLbl1.Text = CtyLbl.Text = "City:";
            StateLbl1.Text = StateLbl.Text = "State:";
            ZipCodeLbl1.Text = ZipCodeLbl.Text = "Zip Code:";
            phoneNumLbl1.Text = phoneNumLbl.Text = "Phone Number:";
            phoneNumLbl1.Text = phoneNumLbl1.Text + "*";
            lastLoginLbl.Text = "Last Logged in:";
            //Dynamic Labels
            if (userTable.Count != 0)
            {
                DataRowView row = (DataRowView)userTable[0];
                NumLbl.Text = accountNumber.Text = row["accountNumber"].ToString();
                name.Text = row["Name"].ToString();
                nameOnAccount.toName(name.Text);
                userNameUET.Text = row["Username"].ToString();
                emailAddress.Text = row["emailAddress"].ToString();
                JoinDate.Text = row["joinDate"].ToString();
                bDay.Text = row["Birthday"].ToString();
                dateOfBirth.ToString();
                strAddr.Text = row["streetAddress"].ToString();
                city.Text = row["City"].ToString();
                State.Text = row["State"].ToString();
                zipCode.Text = row["zipCode"].ToString();
                phoneNumbers.Text = row["Phone"].ToString();
                LastLogin.Text = row["lastLogin"].ToString();

            }
        }
    }
    protected void edit_Click(object sender, EventArgs e)
    {
        Name customerName = new Name();
        customerName = customerName.toName(name.Text);
        firstNameTxtBox.Text = customerName.firstName;
        MidInt.Text = customerName.middleInt;
        lastNameTxtBox.Text = customerName.lastName;
        userNameTxtBox.Text = userNameUET.Text;
        joinDate2.Text = JoinDate.Text;
        emailAddressTxtBox.Text = emailAddress.Text;
        StateDDL = stateCustDLL.setStates(StateDDL);
        monthDDL = monthCustDLL.setMonth(monthDDL);
        YearDDL = yearCustDLL.setYearRange(YearDDL);
        strAddrTxtBox.Text = strAddr.Text;
        zipCodeTxtBox.Text = zipCode.Text;
        phoneNumber z = new phoneNumber();
        z.toPhoneNumber(phoneNumbers.Text);
        UET.Visible = false;
        EDT.Visible = true;

    }
    protected void save_Click(object sender, EventArgs e)
    {

    }
    protected void userNameTxtBox_TextChanged(object sender, EventArgs e)
    {

        if (userNameTxtBox.Text.Length == 8)
        {
            char[] d = userNameTxtBox.Text.ToCharArray();
            for (int z = 0; z == 8; z++)
            {
                int chars = 0;
                int nums = 0;

                if (char.IsLetter(d[z]))
                {
                    chars++;
                    if (chars > 6)
                    {
                        error1.Text = "You have entered to many letters";
                        error1.Visible = true;
                        break;
                    }
                }
                if (char.IsNumber(d[z]))
                {
                    nums++;
                    if (nums > 2)
                    {
                        error1.Text = "You have entered to many numbers";
                        error1.Visible = true;
                        break;
                    }
                }
                else
                {
                    error1.Text = "You have entered an invalid character please try again";
                    error1.Visible = true;
                    break;
                }
            }
            if (error1.Visible == true)
            {
                error1.Text = error1.Text + "A user name is made up of 6 letters A-Z and 2 numbers 0-9";

            }
        }
    }
    protected void changePasswordTxtBox1_TextChanged(object sender, EventArgs e)
    {
        char[] pass = changePasswordTxtBox1.Text.ToCharArray();
        for (int z = 0; z <= 11; z++)
        {
            int chars = 0;
            int nums = 0;
            int specChar = 0;

            if (Char.IsLetter(pass[z]))
            {
                chars++;
                if (chars > 8)
                {
                    error2.Text = "You have entered to many letters";
                    error2.Visible = true;
                    break;
                }
            }
            if (Char.IsNumber(pass[z]))
            {
                nums++;
                if (nums > 2)
                {
                    error2.Text = "You have entered to many numbers";
                    error2.Visible = true;
                    break;
                }
            }
            if ((pass[z] == '#') || (pass[z] == '@') || (pass[z] == '$') || (pass[z] == '%') ||
                (pass[z] == '-') || (pass[z] == '_') || (pass[z] == '*'))
            {
                specChar++;
                if (specChar > 1)
                {
                    error2.Text = "You have enter to many special charaters";
                }
            }

        }
        if (error2.Visible == true)
        {
            error2.Text = error1.Text + "Passowrds are made up of 8 letters A-Z, 2 numbers 0-9, and 1 special character #,$,%,-,_ , *, @";

        }
    }
    protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        dayDDL.Items.Clear();
        string x = monthDDL.SelectedItem.Text;
        string y = YearDDL.SelectedItem.Text;
        int mh, yr;
        mh = Convert.ToInt32(x.Substring(0, 2));
        yr = Convert.ToInt32(y);
        dayDDL = dayCustDLL.setDays(mh, yr, dayDDL);
    }
    protected void emailAddressTxtBox_TextChanged(object sender, EventArgs e)
    {
        char at = '@', period = '.';
        int pos1, pos2;
        pos1 = emailAddressTxtBox.Text.IndexOf(at);
        pos2 = emailAddressTxtBox.Text.IndexOf(period);
        if ((pos1 < 0) || (pos2 < 0))
        {
            error3.Text = "Please enter a valid email address";
        }
        else
        {
            if (pos1 > pos2)
            {
                error3.Text = "Please enter a valid email address";
            }
        }


    }
    //17 @students.ecu.edu
    protected void StateDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        CityDDL.Items.Clear();
        DataView cityTbl = (DataView)cityData.Select(DataSourceSelectArguments.Empty);
        cityTbl.RowFilter = "State = '" + StateDDL.SelectedItem.Text + "'";
        DataRowView row;
        string cityName;
        if (cityTbl.Count != 0)
        {
            for (int i = 0; i < cityTbl.Count; i++)
            {
                row = (DataRowView)cityTbl[i];
                cityName = row["City"].ToString();
                CityDDL.Items.Add(cityName);
            }
            CityDDL.DataBind();

        }

    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        EDT.Visible = false;
        UET.Visible = true;
    }

    protected void changeBttn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../subscriptionPage.aspx");
    }

    protected void addCard_Click(object sender, EventArgs e)
    {
        UET.Visible = false;
        cardTable.Visible = true;
    }

    protected void invoiceBtnn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../invoice.aspx?page=account");
    }

    protected void savecard_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {

        }
    }

    protected void cardNumTxtBox_TextChanged(object sender, EventArgs e)
    {

    }

    protected void cardNumHidden_TextChanged(object sender, EventArgs e)
    {

    }
}

