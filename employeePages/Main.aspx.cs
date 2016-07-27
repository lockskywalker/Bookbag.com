using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeePages_Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            dateTime.Text = (DateTime.Now.Month).ToString() +"/" +(DateTime.Now.Day - 8).ToString() +"/" +DateTime.Now.Year.ToString();
        }
    }
}