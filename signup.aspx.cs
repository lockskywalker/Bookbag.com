using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signup : System.Web.UI.Page
{
    bool cookieExists;
    /*
     Custom Drop down list boxes that generate and fill in regular drom down list boxes
    */
    customDDL monthCustDLL = new customDDL();
    customDDL dayCustDLL = new customDDL();
    customDDL yearCustDLL = new customDDL();
    customDDL stateCustDLL = new customDDL();
    customDDL cityCustDLL = new customDDL();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsSecureConnection)
        {
            Response.Redirect(Request.Url.ToString().Replace("http", "https"));
        }
        if (!IsPostBack)
        {
            //Static Labels
            emailAddressLbl2.Text = "Email Address:";
            usrNmeLbl1.Text = "Username:";
            passwordChngLbl1.Text = "Enter Password:";
            passwordChngLbl2.Text = "Confirm Password:";
            BdayLbl1.Text = "Birthday:";
            strAddLbl1.Text = "Street Address:";
            CtyLbl1.Text = "City:";
            StateLbl1.Text = "State:";
            ZipCodeLbl1.Text = "Zip Code:";
            phoneNumLbl1.Text = "Phone Number:";
            phoneNumLbl1.Text = phoneNumLbl1.Text + "*";

            //Dynamic Labels
            error1.Visible = error2.Visible = false;
            StateDDL = stateCustDLL.setStates(StateDDL);
            monthDDL = monthCustDLL.setMonth(monthDDL);
            YearDDL = yearCustDLL.setYearRange(YearDDL);
            newUser.SelectCommand = "SELECT [City] FROM [City] WHERE [State] = 'AK'";


        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        Name newName = new Name();
        string username, emailAddr, password, birthday, state, city, zip,
            joinDate, accountNumber;
        newUser.SelectCommand = "SELECT * FROM [Account]";
        if (IsValid)
        {
            DataView userTbl = (DataView)newUser.Select(DataSourceSelectArguments.Empty);
            if (userTbl.Count != 0)
            {
                for (int i = 0; i < userTbl.Count; i++)
                {
                    DataRowView check = (DataRowView)userTbl[i];
                    if (string.Compare(check["username"].ToString(), userNameTxtBox.Text) == 0)
                    {
                        error1.Text = "This username is taken";
                        error1.ForeColor = System.Drawing.Color.Red;
                        error1.Visible = true;
                        break;
                    }
                    else
                    {
                        error1.Text = "This username is available";
                        error1.ForeColor = System.Drawing.Color.Green;
                        error1.Visible = true;
                    }
                    if (string.Compare(check["emailAddress"].ToString(), emailAddressTxtBox.Text) == 0)
                    {
                        error3.Text = "This email address is being used by another account";
                        error3.ForeColor = System.Drawing.Color.Red;
                        error3.Visible = true;
                        break;
                    }
                }
                DataRowView row = (DataRowView)userTbl[userTbl.Count - 1];
                int x = Convert.ToInt32(row["accountNumber"].ToString());
                x++;
                username = userNameTxtBox.Text;
                newName.firstName = firstNameTxtBox.Text;
                newName.middleInt = MidInt.Text;
                newName.lastName = lastNameTxtBox.Text;
                emailAddr = emailAddressTxtBox.Text;
                password = changePasswordTxtBox1.Text;
                birthday = monthDDL.SelectedItem.Text + " " + dayDDL.SelectedItem.Text + ", " + YearDDL.SelectedItem.Text;
                state = StateDDL.SelectedItem.Text;
                city = CityDDL.SelectedItem.Text;
                zip = zipCodeTxtBox.Text;
                joinDate = DateTime.Now.Month.ToString() + " " + DateTime.Now.Day.ToString() + ", " + DateTime.Now.Year.ToString();
                accountNumber = x.ToString();

                newUser.InsertParameters["accountNumber"].DefaultValue = accountNumber;
                newUser.InsertParameters["JoinDate"].DefaultValue = joinDate;
                newUser.InsertParameters["ZipCode"].DefaultValue = zip;
                newUser.InsertParameters["City"].DefaultValue = city;
                newUser.InsertParameters["state"].DefaultValue = state;
                newUser.InsertParameters["Birthday"].DefaultValue = birthday;
                newUser.InsertParameters["Password"].DefaultValue = password;
                newUser.InsertParameters["EmailAddress"].DefaultValue = emailAddr;
                newUser.InsertParameters["Name"].DefaultValue = newName.ToString();
                

                try
                {
                    newUser.Insert();

                }
                catch
                {

                }


            }

        }
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
    protected void StateDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        newUser.SelectCommand = "SELECT * FROM [City]";
        CityDDL.Items.Clear();
        DataView cityTbl = (DataView)newUser.Select(DataSourceSelectArguments.Empty);
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
    protected void Unnamed_Click(object sender, EventArgs e)
    {

    }

    
}