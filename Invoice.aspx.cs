using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string myID;
            DataView tbl = (DataView)invoiceSource.Select(DataSourceSelectArguments.Empty);
            if (tbl.Count != 0)
            {
                DataRowView row = (DataRowView)tbl[0];
                if ((string)Session["userNameLabel"] == "Guest" || Request.Cookies["id"] == null || Request.Cookies["id"].Value == "")
                {
                    myID = "0";
                    accountBttn.Visible = false;

                }
                else {
                    myID = Request.Cookies["id"].Value;
                }
                if (row["userID"].ToString() != myID)
                {
                    warningLbl.Visible = true;
                }
                else
                {
                    lineItemsView.DataSource = lineItem;
                    lineItemsView.DataBind();
                    subLbl.Text = row["subtotal"].ToString();
                    taxLbl.Text = row["tax"].ToString();
                    totLbl.Text = row["total"].ToString();
                    methodLbl.Text = row["shippingMethod"].ToString();
                    shipLbl.Text = row["shippingPrice"].ToString();

                }
                
            }
            
        }
    }

    protected void accountBttn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Account/Account.aspx");
    }

    protected void homeBttn_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }
}