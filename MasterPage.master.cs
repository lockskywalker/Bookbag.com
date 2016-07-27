using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        logLabel.Text = (String)Session["userNamelabel"];

        if (Request.Cookies["id"] == null|| Request.Cookies["id"].Value=="")
        {
           
            loginBut.Visible = true;
            logoffBut.Visible = false;
            logLabel.Text = "Guest";
            loginBut.Visible = true;
        }
        else
        {
            logoffBut.Visible = true; loginBut.Visible = false;
        }
    }

    protected void logoff_click(object sender, EventArgs e)
    {

        if (Request.Cookies["id"] != null)
        {
            HttpCookie myCookie = new HttpCookie("id");
            myCookie.Value="";
            myCookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(myCookie);
            loginBut.Visible = true;
            logoffBut.Visible = false;
        }
        Session["userNamelabel"] = "Guest";
        Response.Redirect("default.aspx");
        

    }

}