using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!Request.IsSecureConnection)
            {
               //Response.Redirect( Request.Url.ToString().Replace("http", "https"));
            }

        }

    }
    
    private void remeber( string id)
    {
        HttpCookie y = new HttpCookie("id");
        y.Expires = DateTime.Now.AddYears(2);
        y.Value = id;
        Response.Cookies.Add(y);
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        int compareValue;
        DataView tbl = (DataView)loginVerification.Select(DataSourceSelectArguments.Empty);
        tbl.RowFilter = "Username = '" + userlogin.UserName + "'";
        if (tbl.Count != 0)
        {

            DataRowView row = (DataRowView)tbl[0];
            compareValue = string.Compare(userlogin.Password, row["Password"].ToString());
            if (compareValue == 0)
            {
                
                remeber( row["accountNumber"].ToString());
                Session["userNamelabel"] = userlogin.UserName;
                Response.Redirect("Account/Account.aspx");
            }
        }
       
    }
}