using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeePages_Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            
        }
    }

    protected void memoMessage_TextChanged(object sender, EventArgs e)
    {
        string counterString = txtCounter.Text;
        const int MAXCHARS = 250;
        string countertxt;
        countertxt = counterString.Substring(counterString.IndexOf(' ')+1);   
        int charsUsed = memoMessage.Text.ToString().Length;
        int charsRemaining=MAXCHARS - charsUsed;
        txtCounter.Text = charsRemaining.ToString() + " " + countertxt;

    }
    public void delete()
    {
        
    }

    protected void sendBttn_Click(object sender, EventArgs e)
    {

    }
}