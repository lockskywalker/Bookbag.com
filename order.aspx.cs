using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order : System.Web.UI.Page
{
    Cart items = new Cart();
    public invoice newInvoice = new invoice();
    customDDL custom = new customDDL();

    protected void Page_Load(object sender, EventArgs e)
    {

        string user = (string)Session["userNamelabel"];
        string[] shipping = { "Select Sipping Method", "Standered 5-7 days", "ExpressShipping 2-3 days", "OverNight" };
        string[] cardType = { "Select Card Type", "MasterCard", "American Express", "Visa", "Discover" };
        HttpCookie myID = Request.Cookies["id"];
        if (!Request.IsSecureConnection)
        {
           //Response.Redirect(Request.Url.ToString().Replace("http", "https"));
        }
        if (!IsPostBack)
        {
            items.getCart(user);
            if (items.Count == 0)
            {
               // Response.Redirect("cart.aspx");
            }
            if (myID == null || myID.Value == "")
            {
                savedBttn.Visible = false;
                addCard.Visible = false;
            }
            else
            {
                card.SelectCommand = "SELECT * FROM [Customer Card Information] WHERE [userID] = '" +
                        Request.Cookies["id"].Value.ToString() + "'";
                DataView tbl = (DataView)card.Select(DataSourceSelectArguments.Empty);
                if (tbl.Count == 0)
                {
                    savedBttn.Visible = false;
                }
            }
            orderView.DataSource = items.Items;
            orderView.DataBind();
            cardTypeDDL.DataSource = cardType;
            cardTypeDDL.DataBind();
            shipMthodDDL.DataSource = shipping;
            shipMthodDDL.DataBind();
            subTotalLbl.Text = items.prices.subtotal.ToString("c");
            taxLbl.Text = items.prices.tax.ToString("c");
            totalLbl.Text = items.prices.total.ToString("c");
            yearDDL = custom.setCardYear(yearDDL);
            monthDDL = custom.setCardMonth(monthDDL);
            yearDDL.DataBind();
            monthDDL.DataBind();
        }
    }

    protected void confrimBttn_Click(object sender, EventArgs e)
    {
        if (cardTypeDDL.SelectedIndex != 0 && shipMthodDDL.SelectedIndex != 0)
        {
            newInvoice.kart = items;
            newInvoice.pricing = new Pricing();
            newInvoice.pricing.subtotal = Convert.ToDecimal(subTotalLbl.Text.Substring(1));
            newInvoice.pricing.tax = Convert.ToDecimal(taxLbl.Text.Substring(1));
            newInvoice.pricing.total = Convert.ToDecimal(totalLbl.Text.Substring(1));
            if (shipMthodDDL.SelectedIndex == 0)
            {
                shipMthodDDL.SelectedIndex = 1;
            }
           int invoice= generateNewInvoice(newInvoice);
            if (err1.Visible == false & err2.Visible == false)
            {
                Response.Redirect("Invoice.aspx?invoiceID="+invoice.ToString());
            }

        }
    }

    protected void cancelBttn_Click(object sender, EventArgs e)
    {
        Response.Redirect("cart.aspx");
    }

    private int generateNewInvoice(invoice Invoice )
    {
        int invoiceNum;
        string user = (string)Session["userNamelabel"];
        items.getCart(user);
        DataView tbl = (DataView)invoices.Select(DataSourceSelectArguments.Empty);
        if (tbl.Count != 0)
        {
            DataRowView row = (DataRowView)tbl[tbl.Count - 1];
            invoiceNum = Convert.ToInt32(row["invoiceID"]) + 1;
        }
        else
            invoiceNum = 1;
        int lineNumber = 1;
        string id;
        invoices.InsertParameters["invoiceID"].DefaultValue = invoiceNum.ToString();
        if (user == "Guest"|| Request.Cookies["id"]==null|| Request.Cookies["id"].Value=="")
        {
            id = "0";
        }
        else
        {
            id = Request.Cookies["id"].Value;
        }
        invoices.InsertParameters["userID"].DefaultValue = id.ToString();
        invoices.InsertParameters["orderDate"].DefaultValue = DateTime.Now.ToString();
        invoices.InsertParameters["subtotal"].DefaultValue = Invoice.pricing.subtotal.ToString();
        invoices.InsertParameters["shippingMethod"].DefaultValue = shipMthodDDL.SelectedItem.Text;
        invoices.InsertParameters["shippingPrice"].DefaultValue = shippingPriceLbl.Text.Substring(1);
        invoices.InsertParameters["tax"].DefaultValue = Invoice.pricing.tax.ToString();
        invoices.InsertParameters["total"].DefaultValue = Invoice.pricing.total.ToString();
        invoices.InsertParameters["cardNumber"].DefaultValue = cardNumTxtBox.Text;
        try
        {
            invoices.Insert();
        }
        catch
        {
            err1.Visible = true;
            err1.Text = "error 1";
            err1.ForeColor = System.Drawing.Color.Red;
        }
        for (int i = 0; i < items.Count; i++)
        {
            lineItems.InsertParameters["invoiceID"].DefaultValue = invoiceNum.ToString();
            lineItems.InsertParameters["lineNumber"].DefaultValue = lineNumber.ToString();
            lineItems.InsertParameters["productID"].DefaultValue = items.Items[i].productId;
            lineItems.InsertParameters["productName"].DefaultValue = items.Items[i].productName;
            lineItems.InsertParameters["quantity"].DefaultValue = items.Items[i].qty.ToString();
            lineItems.InsertParameters["price"].DefaultValue = items.Items[i].productTotal.ToString();
            try
            {
                lineItems.Insert();
            }
            catch
            {
                err2.Visible = true;
                err2.Text = "error 2";
                err2.ForeColor = System.Drawing.Color.Blue;
            }
            lineNumber++;
        }

        return invoiceNum;
    }

    protected void savedBttn_Click(object sender, EventArgs e)
    {
        cardSelectDDL.Visible = true;
        card.SelectCommand = "SELECT * FROM [Customer Card Information] WHERE [userID] = '" +
           Convert.ToInt32(Request.Cookies["id"].Value.ToString()) + "'";
        DataView tbl = (DataView)card.Select(DataSourceSelectArguments.Empty);
        DataRowView row;
        string num;
        cardSelectDDL.Items[0].Text = " ";
        for (int i = 0; i < tbl.Count; i++)
        {
            row = (DataRowView)tbl[i];
            num = row["CardNumber"].ToString();
            cardSelectDDL.Items.Add(num.Substring(num.Length - 5));
        }



    }

    protected void cardNumHidden_TextChanged(object sender, EventArgs e)
    {

    }

    protected void cardNumTxtBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void shipMthodDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = shipMthodDDL.SelectedIndex;
        decimal price=0;
        if (index == 1)
            price = Convert.ToDecimal(WebConfigurationManager.AppSettings["StanderdShipping"]);
        if(index ==2)
            price = Convert.ToDecimal(WebConfigurationManager.AppSettings["ExpressShipping"]);
        if(index==3)
            price = Convert.ToDecimal(WebConfigurationManager.AppSettings["NextDayShipping"]);
        shippingPriceLbl.Text = price.ToString("c");
    }

    protected void addCard_Click(object sender, EventArgs e)
    {

    }

    protected void cardSelectDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataView tbl = (DataView)card.Select(DataSourceSelectArguments.Empty);
        tbl.RowFilter = "CardNumber = '" + Convert.ToInt32(cardSelectDDL.SelectedItem) + "'";
        if (tbl.Count != 0)
        {
            DataRowView row = tbl[0];
            cardNumTxtBox.Visible = false;
            cardNumHidden.Visible = true;
            cardNumHidden.Text = row["CardNumber"].ToString();
            CVS.Text = row["CVS"].ToString();
            cardTypeDDL.Items.FindByText(row["cardType"].ToString()).Selected = true;
            string date = row["expDate"].ToString();
            int pos = date.IndexOf('/');
            monthDDL.Items.FindByText(date.Substring(0, pos)).Selected = true;
            yearDDL.Items.FindByText(date.Substring(pos + 1)).Selected = true;
        }

    }
}