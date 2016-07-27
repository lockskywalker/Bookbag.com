using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeeLogin : System.Web.UI.Page
{
    HttpCookie empCoockie = new HttpCookie("employeeVerified");
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

        int compareValue;
        Session["idlabel"] = emLoginBox.UserName;
        DataView tbl = (DataView)employLogin.Select(DataSourceSelectArguments.Empty);
        string username = emLoginBox.UserName;
        tbl.RowFilter = "Username = '" + username.Substring(0, 3) + "'";
        if (tbl.Count != 0)
        {
            DataRowView row = (DataRowView)tbl[0];
            if (username.Substring(3) == row["departmentCode"].ToString())
            {
                compareValue = string.Compare(emLoginBox.Password, row["Password"].ToString());
                if (compareValue == 0)
                {
                    empCoockie.Value = emLoginBox.UserName;
                    empCoockie.Expires = DateTime.Now.AddMonths(2);
                    Response.Cookies.Add(empCoockie);
                    Response.Redirect("employeePages/Main.aspx");
                }
            }

        }
    }
}