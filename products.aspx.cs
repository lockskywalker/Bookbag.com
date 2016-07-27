using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["source"] == null)
        {
            books.DataSourceID = "productsSource";
        }
        else if (Request.QueryString["source"] != null)
        {
            string a = Request.QueryString["source"].ToString();
            // Response.Redirect("productsSource");
            if (a == "\"bookssearch\"")
            {
                books.DataSourceID = "bookssearch";
            }
            else if (a == "\"moviesearch\"")
            {
                books.DataSourceID = "moviesearch";
            }
            else if (a == "\"collectablesearch\"")
            {
                books.DataSourceID = "collectablesearch";
            }
            else if (a == "\"clothessearch\"")
            {
                books.DataSourceID = "clothessearch";
            }
        }
    }

    protected void productsSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void ListView_Products_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


}
